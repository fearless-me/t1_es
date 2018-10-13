/*

* ==============================================================================
*
* Description:  from google protobuff 
* Author: mwh
*
* ==============================================================================
*/

using System;
using System.Text;
/// <summary>
/// au
/// </summary>
namespace ConsoleApp1
{
    /// <summary>
    /// author mwh
    /// </summary>
    public sealed class IntegerZigZag_Util
    {
        /// <summary>
        /// Writes an sint32 value, without a tag, to the stream.
        /// </summary>
        /// <param name="value">The value to write</param>
        public void WriteInt32(int value, byte[] buf)
        {
            WriteRawVarint32(EncodeZigZag32(value), buf);
        }

        /// <summary>
        /// Writes an sint64 value, without a tag, to the stream.
        /// </summary>
        /// <param name="value">The value to write</param>
        public void WriteInt64(long value, byte[] buf)
        {
            WriteRawVarint64(EncodeZigZag64(value), buf);
        }

        /// <summary>
        /// Writes a uint32 value, without a tag, to the stream.
        /// </summary>
        /// <param name="value">The value to write</param>
        public void WriteUInt32(uint value, byte[] buf)
        {
            WriteRawVarint32(value, buf);
        }

        /// <summary>
        /// Writes a uint64 field value, without a tag, to the stream.
        /// </summary>
        /// <param name="value">The value to write</param>
        public void WriteUInt64(ulong value, byte[] buf)
        {
            WriteRawVarint64(value, buf);
        }

        /// <summary>
        /// Reads an sint32 field value from the stream.
        /// </summary>   
        public int ReadInt32(byte[] buf)
        {
            return DecodeZigZag32(ReadRawVarint32(buf));
        }

        /// <summary>
        /// Reads an sint64 field value from the stream.
        /// </summary>   
        public long ReadInt64(byte[] buf)
        {
            return DecodeZigZag64(ReadRawVarint64(buf));
        }

        /// <summary>
        /// Reads an uint field from the stream.
        /// </summary>
        public uint ReadUInt32(byte[] buf)
        {
            return (uint)ReadRawVarint32(buf);
        }

        /// <summary>
        /// Reads a uint64 field from the stream.
        /// </summary>
        public ulong ReadUInt64(byte[] buf)
        {
            return ReadRawVarint64(buf);
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
        internal static void WriteRawVarint32(uint value, byte[] buffer)
        {
            int position = 0;
            int limit = 10;
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
                buffer[position++] = ((byte)((value & 0x7F) | 0x80));
                value >>= 7;
            }
            if (position < limit)
            {
                buffer[position++] = (byte)value;
            }
            else
            {
                throw new Exception("error int32 value" + value);
            }
        }

        internal static void WriteRawVarint64(ulong value, byte[] buffer)
        {
            int position = 0;
            int limit = 10;
            while (value > 127 && position < limit)
            {
                buffer[position++] = (byte)((value & 0x7F) | 0x80);
                value >>= 7;
            }
            while (value > 127)
            {
                buffer[position++] = ((byte)((value & 0x7F) | 0x80));
                value >>= 7;
            }
            if (position < limit)
            {
                buffer[position++] = (byte)value;
            }
            else
            {
                throw new Exception("error int64 value" + value);
            }
        }


        /// <summary>
        /// Reads a raw Varint from the stream.  If larger than 32 bits, discard the upper bits.
        /// This method is optimised for the case where we've got lots of data in the buffer.
        /// That means we can check the size just once, then just read directly from the buffer
        /// without constant rechecking of the buffer length.
        /// </summary>
        internal static uint ReadRawVarint32(byte[] buffer)
        {
            int bufferPos = 0;

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
                                if (buffer[bufferPos++] < 128)
                                {
                                    return (uint)result;
                                }
                            }
                            throw new Exception("ErrorMalformedVarint");
                        }
                    }
                }
            }
            return (uint)result;
        }

        /// <summary>
        /// Reads a raw varint from the stream.
        /// </summary>
        internal static ulong ReadRawVarint64(byte[] buffer)
        {
            int shift = 0;
            ulong result = 0;
            int bufferPos = 0;

            while (shift < 64)
            {
                byte b = buffer[bufferPos++];
                result |= (ulong)(b & 0x7F) << shift;
                if ((b & 0x80) == 0)
                {
                    return result;
                }
                shift += 7;
            }
            throw new Exception("ErrorMalformedVarint");
        }


        public static void Test()
        {
            int[] listint = {
                -2147483648, -32768, -128, -256, -1,
                0, 1, 100, 127, 128, 255, 256, 2147483647,
                0x4000 -1, 0x4000, 0x200000 - 1, 0x200000, 0x10000000 - 1,0x10000000, 2147483647};
            long[] listlong =
            {
                -9223372036854775808, -2147483648, -32768, -128, -256, -1,
                0, 1, 100, 127, 128, 255, 256, 2147483647,
                0x4000 -1, 0x4000, 0x200000 - 1, 0x200000, 0x10000000 - 1,0x10000000, 2147483647, 9223372036854775807
            };

            uint[] listuint =
            {
                0, 1, 100, 127, 128, 255, 256, 0x4000-1, 0x4000, 0x200000 - 1, 0x200000, 0x10000000 - 1, 0x10000000, 0xffffffff,
            };

            ulong[] listulong =
            {
                0, 1, 100, 127, 128, 255, 256, 0x4000-1, 0x4000, 0x200000 - 1, 0x200000, 0x10000000 - 1, 0x10000000, 0xffffffff,
                0xFFFFFFFFFFFFFFFF
            };

            IntegerZigZag_Util zz = new IntegerZigZag_Util();


            foreach (int value in listint)
            {
                try
                {
                    byte[] buffer = new byte[10];
                    zz.WriteInt32(value, buffer);
                    int deValue = zz.ReadInt32(buffer);
                    string res = deValue == value ? " True " : " False ";
                    System.Console.WriteLine("encode int32 [" + ToHexString(buffer) + "] decode " + value + " = " + deValue + res);
                }
                catch (Exception e)
                {
                    System.Console.WriteLine("*decode* " + value + "=" + e.ToString());
                }

            }


            foreach (long value_long in listlong)
            {
                try
                {
                    byte[] buffer = new byte[10];
                    zz.WriteInt64(value_long, buffer);
                    long deValue = zz.ReadInt64(buffer);
                    string res = deValue == value_long ? " True " : " False ";
                    System.Console.WriteLine("encode int64 [" + ToHexString(buffer) + "] decode " + value_long + " = " + deValue + res);
                }
                catch (Exception e)
                {
                    System.Console.WriteLine("*decode* " + value_long + "=", e.ToString());
                }

            }

            foreach (uint value_uint in listuint)
            {
                try
                {
                    byte[] buffer = new byte[10];
                    zz.WriteUInt32(value_uint, buffer);
                    uint deValue = zz.ReadUInt32(buffer);
                    string res = deValue == value_uint ? " True " : " False ";
                    System.Console.WriteLine("encode uint32 [" + ToHexString(buffer) + "] decode " + value_uint + " = " + deValue + res);
                }
                catch (Exception e)
                {
                    System.Console.WriteLine("*decode* " + value_uint + "=" + e.ToString());
                }

            }


            foreach (ulong value_ulong in listulong)
            {
                try
                {
                    byte[] buffer = new byte[10];
                    zz.WriteUInt64(value_ulong, buffer);
                    ulong deValue = zz.ReadUInt64(buffer);
                    string res = deValue == value_ulong ? " True " : " False ";
                    System.Console.WriteLine("encode uint64 [" + ToHexString(buffer) + "] decode " +  value_ulong + " = " + deValue + res);
                }
                catch (Exception e)
                {
                    System.Console.WriteLine("*decode* " + value_ulong + "=", e.ToString());
                }

            }
        }

        internal static string ToHexString(byte[] bytes) // 0xae00cf => "AE00CF "

        {
            string hexString = string.Empty;

            if (bytes != null)

            {

                StringBuilder strB = new StringBuilder();

                for (int i = 0; i < bytes.Length; i++)

                {

                    strB.Append(bytes[i].ToString("X"));

                }

                hexString = strB.ToString();

            }
            hexString = hexString.TrimEnd('0');
            return hexString.Length == 0 ? "0" : hexString;

        }

    }
};