
public sealed class CodedInputStream {
/// <summary>
/// Writes an sint32 value, without a tag, to the stream.
/// </summary>
/// <param name="value">The value to write</param>
public void WriteSInt32(int value)
{
    WriteRawVarint32(EncodeZigZag32(value));
}

/// <summary>
/// Writes an sint64 value, without a tag, to the stream.
/// </summary>
/// <param name="value">The value to write</param>
public void WriteSInt64(long value)
{
    WriteRawVarint64(EncodeZigZag64(value));
}

/// <summary>
/// Writes a uint32 value, without a tag, to the stream.
/// </summary>
/// <param name="value">The value to write</param>
public void WriteUInt32(uint value)
{
    WriteRawVarint32(value);
}

/// <summary>
/// Writes a uint64 field value, without a tag, to the stream.
/// </summary>
/// <param name="value">The value to write</param>
public void WriteUInt64(ulong value)
{
    WriteRawVarint64(value);
}

/// <summary>
/// Reads an sint32 field value from the stream.
/// </summary>   
public int ReadSInt32()
{
    return DecodeZigZag32(ReadRawVarint32());
}

/// <summary>
/// Reads an sint64 field value from the stream.
/// </summary>   
public long ReadSInt64()
{
    return DecodeZigZag64(ReadRawVarint64());
}

/// <summary>
/// Reads a uint64 field from the stream.
/// </summary>
public ulong ReadUInt64()
{
    return ReadRawVarint64();
}

/// <summary>
/// Reads an int64 field from the stream.
/// </summary>
public long ReadInt64()
{
    return (long)ReadRawVarint64();
}

/// <summary>
/// Encode a 32-bit value with ZigZag encoding.
/// </summary>
/// <remarks>
/// ZigZag encodes signed integers into values that can be efficiently
/// encoded with varint.  (Otherwise, negative values must be 
/// sign-extended to 64 bits to be varint encoded, thus always taking
/// 10 bytes on the wire.)
/// </remarks>
internal static uint EncodeZigZag32(int n)
{
    // Note:  the right-shift must be arithmetic
    return (uint)((n << 1) ^ (n >> 31));
}

/// <summary>
/// Encode a 64-bit value with ZigZag encoding.
/// </summary>
/// <remarks>
/// ZigZag encodes signed integers into values that can be efficiently
/// encoded with varint.  (Otherwise, negative values must be 
/// sign-extended to 64 bits to be varint encoded, thus always taking
/// 10 bytes on the wire.)
/// </remarks>
internal static ulong EncodeZigZag64(long n)
{
    return (ulong)((n << 1) ^ (n >> 63));
}

/// <summary>
/// Decode a 32-bit value with ZigZag encoding.
/// </summary>
/// <remarks>
/// ZigZag encodes signed integers into values that can be efficiently
/// encoded with varint.  (Otherwise, negative values must be 
/// sign-extended to 64 bits to be varint encoded, thus always taking
/// 10 bytes on the wire.)
/// </remarks>
internal static int DecodeZigZag32(uint n)
{
    return (int)(n >> 1) ^ -(int)(n & 1);
}

/// <summary>
/// Decode a 32-bit value with ZigZag encoding.
/// </summary>
/// <remarks>
/// ZigZag encodes signed integers into values that can be efficiently
/// encoded with varint.  (Otherwise, negative values must be 
/// sign-extended to 64 bits to be varint encoded, thus always taking
/// 10 bytes on the wire.)
/// </remarks>
internal static long DecodeZigZag64(ulong n)
{
    return (long)(n >> 1) ^ -(long)(n & 1);
}

/// <summary>
/// Writes a 32 bit value as a varint. The fast route is taken when
/// there's enough buffer space left to whizz through without checking
/// for each byte; otherwise, we resort to calling WriteRawByte each time.
/// </summary>
internal void WriteRawVarint32(uint value)
{
    // Optimize for the common case of a single byte value
    if (value < 128 && position < limit)
    {
        buffer[position++] = (byte)value;
        return;
    }

    while (value > 127 && position < limit)
    {
        buffer[position++] = (byte)((value & 0x7F) | 0x80);
        value >>= 7;
    }
    while (value > 127)
    {
        WriteRawByte((byte)((value & 0x7F) | 0x80));
        value >>= 7;
    }
    if (position < limit)
    {
        buffer[position++] = (byte)value;
    }
    else
    {
        WriteRawByte((byte)value);
    }
}

internal void WriteRawVarint64(ulong value)
{
    while (value > 127 && position < limit)
    {
        buffer[position++] = (byte)((value & 0x7F) | 0x80);
        value >>= 7;
    }
    while (value > 127)
    {
        WriteRawByte((byte)((value & 0x7F) | 0x80));
        value >>= 7;
    }
    if (position < limit)
    {
        buffer[position++] = (byte)value;
    }
    else
    {
        WriteRawByte((byte)value);
    }
}

internal void WriteRawByte(byte value)
{
    if (position == limit)
    {
        RefreshBuffer();
    }

    buffer[position++] = value;
}

internal void WriteRawByte(uint value)
{
    WriteRawByte((byte)value);
}
/// <summary>
/// Same code as ReadRawVarint32, but read each byte individually, checking for
/// buffer overflow.
/// </summary>
private uint SlowReadRawVarint32()
{
    int tmp = ReadRawByte();

    if (tmp < 128)
    {
        return (uint)tmp;
    }

    int result = tmp & 0x7f;

    if ((tmp = ReadRawByte()) < 128)
    {
        result |= tmp << 7;
    }
    else
    {
        result |= (tmp & 0x7f) << 7;
        if ((tmp = ReadRawByte()) < 128)
        {
            result |= tmp << 14;
        }
        else
        {
            result |= (tmp & 0x7f) << 14;
            if ((tmp = ReadRawByte()) < 128)
            {
                result |= tmp << 21;
            }
            else
            {
                result |= (tmp & 0x7f) << 21;
                result |= (tmp = ReadRawByte()) << 28;
                if (tmp >= 128)
                {
                    // Discard upper 32 bits.
                    for (int i = 0; i < 5; i++)
                    {
                        if (ReadRawByte() < 128)
                        {
                            return (uint)result;
                        }
                    }
                    throw InvalidProtocolBufferException.MalformedVarint();
                }
            }
        }
    }
    return (uint)result;
}

/// <summary>
/// Reads a raw Varint from the stream.  If larger than 32 bits, discard the upper bits.
/// This method is optimised for the case where we've got lots of data in the buffer.
/// That means we can check the size just once, then just read directly from the buffer
/// without constant rechecking of the buffer length.
/// </summary>
internal uint ReadRawVarint32()
{
    if (bufferPos + 5 > bufferSize)
    {
        return SlowReadRawVarint32();
    }

    int tmp = buffer[bufferPos++];

    if (tmp < 128)
    {
        return (uint)tmp;
    }

    int result = tmp & 0x7f;

    if ((tmp = buffer[bufferPos++]) < 128)
    {
        result |= tmp << 7;
    }
    else
    {
        result |= (tmp & 0x7f) << 7;
        if ((tmp = buffer[bufferPos++]) < 128)
        {
            result |= tmp << 14;
        }
        else
        {
            result |= (tmp & 0x7f) << 14;
            if ((tmp = buffer[bufferPos++]) < 128)
            {
                result |= tmp << 21;
            }
            else
            {
                result |= (tmp & 0x7f) << 21;
                result |= (tmp = buffer[bufferPos++]) << 28;
                if (tmp >= 128)
                {
                    // Discard upper 32 bits.
                    // Note that this has to use ReadRawByte() as we only ensure we've
                    // got at least 5 bytes at the start of the method. This lets us
                    // use the fast path in more cases, and we rarely hit this section of code.
                    for (int i = 0; i < 5; i++)
                    {
                        if (ReadRawByte() < 128)
                        {
                            return (uint)result;
                        }
                    }
                    throw InvalidProtocolBufferException.MalformedVarint();
                }
            }
        }
    }
    return (uint)result;
}

/// <summary>
/// Reads a varint from the input one byte at a time, so that it does not
/// read any bytes after the end of the varint. If you simply wrapped the
/// stream in a CodedInputStream and used ReadRawVarint32(Stream)
/// then you would probably end up reading past the end of the varint since
/// CodedInputStream buffers its input.
/// </summary>
/// <param name="input"></param>
/// <returns></returns>
internal static uint ReadRawVarint32(Stream input)
{
    int result = 0;
    int offset = 0;

    for (; offset < 32; offset += 7)
    {
        int b = input.ReadByte();

        if (b == -1)
        {
            throw InvalidProtocolBufferException.TruncatedMessage();
        }
        result |= (b & 0x7f) << offset;
        if ((b & 0x80) == 0)
        {
            return (uint)result;
        }
    }
    // Keep reading up to 64 bits.
    for (; offset < 64; offset += 7)
    {
        int b = input.ReadByte();

        if (b == -1)
        {
            throw InvalidProtocolBufferException.TruncatedMessage();
        }
        if ((b & 0x80) == 0)
        {
            return (uint)result;
        }
    }
    throw InvalidProtocolBufferException.MalformedVarint();
}

/// <summary>
/// Reads a raw varint from the stream.
/// </summary>
internal ulong ReadRawVarint64()
{
    int shift = 0;
    ulong result = 0;

    while (shift < 64)
    {
        byte b = ReadRawByte();
        result |= (ulong)(b & 0x7F) << shift;
        if ((b & 0x80) == 0)
        {
            return result;
        }
        shift += 7;
    }
    throw InvalidProtocolBufferException.MalformedVarint();
}

}