#include "Parser.h"
#include "Gen2Erlang.h"
#include "GenLuaDescTable.h"

#include <set>
std::map< std::string, std::string > MetaInfo::typeNamesAlias;
std::map< std::string, std::string > MetaInfo::containerTypeNames;

regex_t* Patterns[ _countof( PatternSource ) ];

int TypeSizeTable[] = {
	-1,//EFDT_unknown,
	1,//EFDT_bool,
	1,//EFDT_int8,
	1,//EFDT_uint8,
	2,//EFDT_int16,
	2,//EFDT_uint16,
	4,//EFDT_int32,
	4,//EFDT_uint32,
	8,//EFDT_int64,
	8,//EFDT_uint64,
	4,//EFDT_float,
	8,//EFDT_double,
	-1//EFDT_string,
	-1//EFDT_custom,
};

MetaInfo::MetaInfo()
{
	static bool first = true;
	if ( first ) {
		first = false;
		typeNamesAlias["bool"] = "Boolean";
		typeNamesAlias["int8"] = "SByte";
		typeNamesAlias["int16"] = "Int16";
		typeNamesAlias["int32"] = "Int32";
		typeNamesAlias["int64"] = "Int64";
		typeNamesAlias["uint8"] = "Byte";
		typeNamesAlias["uint16"] = "UInt16";
		typeNamesAlias["uint32"] = "UInt32";
		typeNamesAlias["uint64"] = "UInt64";
		typeNamesAlias["string"] = "String";
		typeNamesAlias["float"] = "Single";
		typeNamesAlias["double"] = "Double";
		// Alias
		typeNamesAlias["int"] = "Int32";
		typeNamesAlias["uint"] = "UInt32";

		containerTypeNames["vector"] = "List";
	}
}

const std::string& MetaInfo::getContainerTypeName( FieldContainerType type )
{
	const static std::string names[] = {
		"",
		"List",
	};
	return names[ type ];
}

FieldContainerType MetaInfo::getContainerTypeByName( const std::string& name ) {
	if ( name == "List" ) {
		return FCT_Array;
	} else {
		return name.empty() ? FCT_Scalar : FCT_Invalid;
	}
}

#define WAIT_MILIISECONDS 15000
bool MetaInfo::cache( const MsgDefine& md ) {
	//for ( const Field& f : md.fields ) {
	//	bool validType = false;
	//	auto it = typeNamesAlias.find( f.typeName );
	//	if ( it != typeNamesAlias.end() ) {
	//		// base type
	//		validType = true;
	//	} else {
	//		auto it = cachedMsgDefine.find( f.typeName );
	//		if ( it != cachedMsgDefine.end() ) {
	//			// msg type
	//			validType = true;
	//		}
	//	}
	//	if ( !validType ) {
	//		return false;
	//	}
	//}
	MsgDefine msgInfo;
	msgInfo.comment = md.comment;
	msgInfo.name = md.name;
	msgInfo.type = md.type;
	msgInfo.msgId = md.msgId;
	msgInfo.optmized = md.optmized;
	msgInfo.fields.reserve( md.fields.size() );
	for ( const Field& f : md.fields ) {
		Field df;
		df.comment = f.comment;
		df.msgType = f.msgType;
		df.name = f.name;
		df.type = f.type;
		df.originalTypeName = f.typeName;
		// C -> C#
		bool customType = false;
		auto alias = typeNamesAlias.find( f.typeName );
		if ( alias != typeNamesAlias.end() ) {
			df.typeName = alias->second;
		} else {
			auto alias = cachedMsgDefine.find( f.typeName );
			if ( alias == cachedMsgDefine.end() ) {
				printf("\n***********************************************\n");
				printf("WARNING unknown type %s.%s\n", md.name.c_str(), f.typeName.c_str() );
				printf("WARNING unknown type %s.%s\n", md.name.c_str(), f.typeName.c_str());
				printf("WARNING unknown type %s.%s\n", md.name.c_str(), f.typeName.c_str());
				printf("WARNING unknown type %s.%s\n", md.name.c_str(), f.typeName.c_str());
				printf("***********************************************\n");
				printf("wait %d seconds continue\n", WAIT_MILIISECONDS/1000);
				Sleep(WAIT_MILIISECONDS);
				//continue;
			}
			df.typeName = f.typeName;
			customType = true;
		}
		if ( !customType ) {
			if ( df.originalTypeName == "string" ) {
				df.kind = FC_String;
				df.fdtype = EFDT_string;
			} else if ( df.originalTypeName == "float" ) {
				df.kind = FC_Single;
				df.fdtype = EFDT_float;
			} else if ( df.originalTypeName == "double" ) {
				df.kind = FC_Double;
				df.fdtype = EFDT_double;
			} else if ( df.originalTypeName == "bool" ) {
				df.kind = FC_Boolean;
				df.fdtype = EFDT_bool;
			} else {
				if( df.originalTypeName == "int8" )
					df.fdtype = EFDT_int8;
				else if ( df.originalTypeName == "uint8" )
					df.fdtype = EFDT_uint8;
				else if ( df.originalTypeName == "int16" )
					df.fdtype = EFDT_int16;
				else if ( df.originalTypeName == "uint16" )
					df.fdtype = EFDT_uint16;
				else if ( df.originalTypeName == "int32" || df.originalTypeName == "int" )
					df.fdtype = EFDT_int32;
				else if ( df.originalTypeName == "uint32" || df.originalTypeName == "uint" )
					df.fdtype = EFDT_uint32;
				else if ( df.originalTypeName == "int64" )
					df.fdtype = EFDT_int64;
				else if ( df.originalTypeName == "uint64" )
					df.fdtype = EFDT_uint64;
				df.kind = FC_Integer;
			}
		} else {
			df.kind = FC_Custom;
			df.fdtype = EFDT_custom;
		}
		if ( df.kind != FC_Unknown ) {
			msgInfo.fields.push_back( df );
		}
	}
	auto ib = cachedMsgDefine.insert( std::make_pair( msgInfo.name, msgInfo ) );
	if ( ib.second ) {
		ib.first->second.index = cachedMsgDefine.size();
	}
	return ib.second;
}

static void _DumpSourceGenInfo( const SourceGenInfo& g )
{
	printf( "dump source file begin: %s\n", g.fileName.c_str() );
	std::for_each( g.meta.cachedMsgDefine.begin(), g.meta.cachedMsgDefine.end(),
		[]( std::pair<std::string, MsgDefine> kv ) {
			printf( "--> %s\n", kv.first.c_str() );
	}
	);
	printf( "dump end.\n\n" );
}

const std::string& makeCSharpCommnet(const std::string& comm)
{
	static std::string ss; // warning!!!
	ss = "/// <summary>\n\t\t/// ";
	ss += comm;
	ss += "\n\t\t/// </summary>\n\t\t";
	return ss;
}

FileScanner::FileScanner() : processedCount( 0 ), version( 0 ), hasher( ( unsigned int( 1 << 16 ) - 1 ), NULL ) {
}



FileScanner::~FileScanner()
{
	std::sort( sourceFiles.begin(), sourceFiles.end() );
	for ( auto fn : sourceFiles ) {
		printf( "parse %s...\n\n", fn.c_str() );
		Misc::ByteBuffer buf;
		if ( Misc::readFileAll( fn.c_str(), buf ) ) {
			std::vector< MatchResult > matchResults;
			// 去掉后缀的文件名
			std::string baseName;			
			std::string ext;
			std::string path;
			StringUtil::splitFullFilename( fn, baseName, ext, path );
			buf.push_back( '\0' );
			buf.push_back( '\0' );
			const char* s = &*buf.begin();
			std::string line;
			std::vector< std::string > lines;
			std::vector< MatchResult >& result = matchResults;
			const char* p = s;
			while ( *p != '\0' ) {
				while ( *p == ' ' || *p == '\t' ) { 
					++p;
					continue;
				}
				while ( *p != '\r' && *p != '\n' && *p != '\0' ) {
					line.push_back( *p++ );
				}
				if ( !line.empty() ) {
					lines.push_back( line );
					line.clear();
				}
				++p;
			}
			if ( !line.empty() ) {
				lines.push_back( line );
			}
			if ( lines.empty() ) {
				printf( "empty file.\n" );
				continue;
			}
			int lineNum = 0;
			for ( const auto& src : lines ) {
				MatchResult mr = parseSourceLine( src.c_str(), ++lineNum );
				if (mr.type != KEY_COMMENT && mr.type != KEY_UNKNOWN) {
					result.push_back( mr );
				}
				else if (mr.type == KEY_COMMENT) {
				//	printf("%s\n", src.c_str());
					mr.matched.clear();
					mr.matched.push_back(src);
					result.push_back(mr);
				}
			}

			printf( "ok.\n" );
			printf( "processing..." );
			auto metaInfo = process( matchResults, fn );
			printf( "done\n" );
			std::string outPath( path );
			outPath.append( "MsgProto_" );
			outPath.append( baseName );
			outPath.append( ".cs" );
			printf( "generating source file..." );
			sourceGenInfos.resize( sourceGenInfos.size() + 1 );
			SourceGenInfo& sg = sourceGenInfos.back();
			std::swap( sg.meta, metaInfo );
			sg.fileName = outPath;
			sg.nameSpace = baseName;
			_DumpSourceGenInfo( sg );
		}
	}
	if ( !sourceGenInfos.empty() ) {
		std::string baseName;
		std::string outPath;
		StringUtil::splitFilename( sourceGenInfos.front().fileName, baseName, outPath );
		std::string filePath;
		std::string _filePath;
		if ( outFilePath.empty() ) {
			filePath = StringUtil::standardisePath( outPath );
		} else {
			filePath = StringUtil::standardisePath( outFilePath );
		}
		_filePath = filePath;
		std::string versionFile = _filePath + "ProtocolVersion.cs";
		{
			FILE* fp = fopen( versionFile.c_str(), "w" );
			fprintf( fp, "namespace Network.Messages {\n" );
			fprintf( fp, "\tpublic partial class MessageFactory {\n" );
			fprintf( fp, "\t\tpublic const System.Int32 ProtocolVersion = %d;\n", version );
			fprintf( fp, "\t}\n" );
			fprintf( fp, "}\n" );
			fclose( fp );
		}

		filePath.append( "MessageType.cs" );
		FILE* fp = fopen( filePath.c_str(), "w" );	
		if ( fp ) {
			fprintf( fp, "//=============================================================================\n" );
			fprintf( fp, "// DO NOT MODIFY THIS FILE MANUALLY!!\n" );
			fprintf( fp, "// THIS FILE IS GENERATED BY NETPROTO.\n" );
			fprintf( fp, "// IF YOU HAVE ANY QUESTIONS PLEASE CONTACT LUJIAN.\n" );
			fprintf( fp, "//=============================================================================\n\n" );
			fprintf( fp, "namespace Network.Messages\n" );
			fprintf( fp, "{\n" );
			fprintf( fp, "    public enum MessageType\n" );
			fprintf( fp, "    {\n" );
			fprintf( fp, "         MSG_Undefined = 0,\n" );
			std::set< std::string > allMessageNames;
			std::vector< const MsgDefine* > allMessages;
			std::map<int, std::string> msgTypeIdCheck;
			std::for_each( sourceGenInfos.begin(), sourceGenInfos.end(),
				[&]( const SourceGenInfo& g ){
					fprintf( fp, "         //%s begin\n", g.nameSpace.c_str() );
					std::vector< const MsgDefine* > msgs;
					msgs.reserve( g.meta.cachedMsgDefine.size() );
					for ( const auto& m : g.meta.cachedMsgDefine ) {
						msgs.push_back( &m.second );
					}
					std::sort( msgs.begin(), msgs.end(),
						[]( const MsgDefine* l, const MsgDefine* r ) {
							return l->msgId < r->msgId;
						}
					);

					for ( auto m : msgs ) {
						if ( ( m->type & ( MT_ServerToClient | MT_ClientToServer ) ) != 0 ) {
							if ( m->msgId == 0 ) {
								printf( "%s message id must not be 0!", m->name.c_str() );
								system( "pause" );
								continue;
							}
							if ( msgTypeIdCheck.find( m->msgId ) == msgTypeIdCheck.end() ) {
								msgTypeIdCheck.insert( std::make_pair( m->msgId, m->name ) );
							} else {
								printf( "%s message id [%d] already exists: %s!", m->name.c_str(), m->msgId, msgTypeIdCheck[m->msgId].c_str() );
								system( "pause" );
#if NDEBUG
								abort();
#endif
							}
							fprintf( fp, "         MSG_%s = %d,\n", m->name.c_str(), m->msgId );
						}
					}
					fprintf( fp, "         //%s end\n", g.nameSpace.c_str() );

					std::sort( msgs.begin(), msgs.end(),
						[]( const MsgDefine* l, const MsgDefine* r ) {
							return l->index < r->index;
					}
					);
					{
						std::string filePath;
						if ( outFilePath.empty() ) {
							filePath = StringUtil::standardisePath( outPath );
						} else {
							filePath = StringUtil::standardisePath( outFilePath );
						}
						filePath.append( "MSG_" );
						filePath.append( g.nameSpace );
						filePath.append( ".cs" );
						FILE* fp = fopen( filePath.c_str(), "w" );
						int _indent = 0;
						auto indent = [ &_indent ]() {
							++_indent;
							return true;
						};
						auto outdent = [ &_indent ]() {
							--_indent;
						};
						auto applyIndent = [ &_indent, fp ]() {
							for ( int i = 0; i < _indent; ++i ) {
								fputc( '\t', fp );
							}
						};
						if ( fp ) {	
							fprintf( fp, "//=============================================================================\n" );
							fprintf( fp, "// DO NOT MODIFY THIS FILE MANUALLY!!\n" );
							fprintf( fp, "// THIS FILE IS GENERATED BY NETPROTO.\n" );
							fprintf( fp, "// IF YOU HAVE ANY QUESTIONS PLEASE CONTACT LUJIAN.\n" );
							fprintf( fp, "//=============================================================================\n\n" );
							fprintf( fp, "using System;\n" );
							fprintf( fp, "using System.IO;\n" );
							fprintf( fp, "using System.Runtime.InteropServices;\n" );
							fprintf( fp, "using System.Collections.Generic;\n" );
							//fprintf( fp, "#if !NOT_USE_FAST_STREAM\n" );
							//fprintf( fp, "using BinaryReader = Common.FastestBinaryReader;\n" );
							//fprintf( fp, "using BinaryWriter = Common.FastestBinaryWriter;\n" );
							//fprintf( fp, "#endif" );
							fprintf( fp, "\n" );
							fprintf( fp, "namespace Network.Messages\n" );
							fprintf( fp, "{\n" );
							indent();
							for ( auto m : msgs ) {
								if ( fp ) {
									INDENT_FPRINT, "%s\n", m->comment.c_str());
									{
										unsigned int dirTag = m->type;
										if ( dirTag == MT_None ) {
											// none means this struct may use by all of them
											dirTag = MT_ServerToClient | MT_ClientToServer;
										}
										if ( allMessageNames.find( m->name ) != allMessageNames.end() ) {
											printf( "\n\n\nmessage re-defined: %s in %s\n\n\n", m->name.c_str(), g.fileName.c_str() );
											system( "pause" );
										}
										allMessageNames.insert( m->name );
										int podSize = 0;
										bool isPod = m->IsPOD_Struct( &msgs, &podSize );
										std::string listTypeName = isPod ? "Common.Collections.Generic.List" : "List";
										if ( m->type == MT_None ) {
											if ( !isPod ) {
												INDENT_FPRINT, "public class %s : SerializeAble\n", m->name.c_str() );
											} else {
												INDENT_FPRINT, "#if !NOT_USE_FAST_STREAM\n" );
												INDENT_FPRINT, "[StructLayout( LayoutKind.Sequential, CharSet = CharSet.Ansi, Pack = 1 )]\n" );
												INDENT_FPRINT, "public struct %s\n", m->name.c_str() );
												INDENT_FPRINT, "#else\n" );
												INDENT_FPRINT, "public class %s : SerializeAble\n", m->name.c_str() );
												INDENT_FPRINT, "#endif\n" );
											}
										} else {
											allMessages.push_back( m );
											INDENT_FPRINT, "public class %s : BaseMessage\n", m->name.c_str() );
										}
										INDENT_FPRINT, "{\n" );
										if ( indent() )
										{
											if ( m->type != MT_None ) {
												if ( dirTag & MT_ServerToClient ) {
													INDENT_FPRINT, "static private %s _inst;\n", m->name.c_str() );
													INDENT_FPRINT, "static new public BaseMessage Create( BinaryReader s ) {\n" );
													if ( indent() ) {
														INDENT_FPRINT, "if(_inst == null) _inst = new %s();\n", m->name.c_str() );
														INDENT_FPRINT, "_inst.Deserialize( s );\n" );
														INDENT_FPRINT, "return _inst;\n" );
														outdent();
													}
													INDENT_FPRINT, "}\n" );
												}
												else if (dirTag & MT_ClientToServer) {
													INDENT_FPRINT, "//forbid new this class outside.\n" );
													INDENT_FPRINT, "private %s() { }\n", m->name.c_str() );
													INDENT_FPRINT, "static private %s _inst;\n", m->name.c_str() );
													INDENT_FPRINT, "static public %s GetInstance() {\n", m->name.c_str() );
													if (indent()) {
														INDENT_FPRINT, "if(_inst == null) _inst = new %s();\n", m->name.c_str() );
														INDENT_FPRINT, "return _inst;\n" );
														outdent();
													}
													INDENT_FPRINT, "}\n" );
												}

												INDENT_FPRINT, "override public MessageType GetId() {\n" );
												if ( indent() ) {
													INDENT_FPRINT, "return ID;\n" );
													outdent();
												}
												INDENT_FPRINT, "}\n" );

												INDENT_FPRINT, "public const MessageType ID = MessageType.MSG_%s;\n\n", m->name.c_str() );
											}
											INDENT_FPRINT, "#region members\n" );
											auto write_pod_fields = [&]() {
												for ( const auto& f : m->fields ) {
													assert( f.type == FCT_Scalar );
													if ( f.type == FCT_Scalar ) {
														switch ( f.kind ) {
														case FC_Boolean: INDENT_FPRINT, "%spublic %s m_%s;\n", makeCSharpCommnet(f.comment).c_str(), f.typeName.c_str(), f.name.c_str() ); break;
														case FC_Integer: INDENT_FPRINT, "%spublic %s m_%s;\n",  makeCSharpCommnet(f.comment).c_str(), f.typeName.c_str(), f.name.c_str() ); break;
														case FC_Single: INDENT_FPRINT, "%spublic %s m_%s;\n",  makeCSharpCommnet(f.comment).c_str(), f.typeName.c_str(), f.name.c_str() ); break;
														case FC_Double: INDENT_FPRINT, "%spublic %s m_%s;\n",  makeCSharpCommnet(f.comment).c_str(), f.typeName.c_str(), f.name.c_str() ); break;
														case FC_Custom: INDENT_FPRINT, "%spublic %s m_%s;\n",  makeCSharpCommnet(f.comment).c_str(), f.typeName.c_str(), f.name.c_str() ); break;
														default:
															continue;
														}
													}
												}
											};
											auto write_fields = [&]() {
												for ( const auto& f : m->fields ) {
													if ( f.type == FCT_Scalar ) {
														switch ( f.kind ) {
														case FC_Boolean: INDENT_FPRINT, "%spublic %s m_%s = false;\n",  makeCSharpCommnet(f.comment).c_str(), f.typeName.c_str(), f.name.c_str() ); break;
														case FC_Integer: INDENT_FPRINT, "%spublic %s m_%s = 0;\n",  makeCSharpCommnet(f.comment).c_str(), f.typeName.c_str(), f.name.c_str() ); break;
														case FC_Single: INDENT_FPRINT, "%spublic %s m_%s = 0.0f;\n",  makeCSharpCommnet(f.comment).c_str(), f.typeName.c_str(), f.name.c_str() ); break;
														case FC_Double: INDENT_FPRINT, "%spublic %s m_%s = 0.0;\n",  makeCSharpCommnet(f.comment).c_str(), f.typeName.c_str(), f.name.c_str() ); break;
														case FC_String:
															INDENT_FPRINT, "%s public %s m_%s = String.Empty;\n",  makeCSharpCommnet(f.comment).c_str(), f.typeName.c_str(), f.name.c_str() );
															break;
														case FC_Custom: {
																auto it = std::find_if( msgs.begin(), msgs.end(), 
																	[f]( const MsgDefine* d ) { return d->name == f.typeName; } );
																if ( it != msgs.end() && f.kind == FC_Custom && (*it)->IsPOD_Struct( &msgs ) ) {
																	INDENT_FPRINT, "#if !NOT_USE_FAST_STREAM\n" );
																	INDENT_FPRINT, "%spublic %s m_%s;\n",  makeCSharpCommnet(f.comment).c_str(), f.typeName.c_str(), f.name.c_str() );
																	INDENT_FPRINT, "#else\n" );
																	INDENT_FPRINT, "%spublic %s m_%s = null;\n",  makeCSharpCommnet(f.comment).c_str(), f.typeName.c_str(), f.name.c_str() );
																	INDENT_FPRINT, "#endif\n" );
																} else {
																	INDENT_FPRINT, "%s public %s m_%s = null;\n",  makeCSharpCommnet(f.comment).c_str(), f.typeName.c_str(), f.name.c_str() );
																} 
																break;
															}
														default:
															continue;
														}
													} else if ( f.type == FCT_Array ) {
														std::string fieldListName = f.typeName + "_List";
														auto it = std::find_if( msgs.begin(), msgs.end(), [f]( const MsgDefine* d ) { return d->name == f.typeName; } );
														if ( it != msgs.end() && f.kind == FC_Custom && (*it)->IsPOD_Struct( &msgs ) ) {
															INDENT_FPRINT, "%spublic %s m_%s = null;\n",  makeCSharpCommnet(f.comment).c_str(), fieldListName.c_str(), f.name.c_str() );
														} else {
															INDENT_FPRINT, "%spublic List<%s> m_%s = null;\n",  makeCSharpCommnet(f.comment).c_str(), f.typeName.c_str(), f.name.c_str() );
														}
													}
												}
											};
											if ( isPod ) {
												INDENT_FPRINT, "#if !NOT_USE_FAST_STREAM\n" );
												INDENT_FPRINT, "public const int Size = %d;\n", podSize );
												write_pod_fields();
												INDENT_FPRINT, "#else\n" );
												write_fields();
												INDENT_FPRINT, "#endif\n" );
											} else {
												write_fields();
											}
											INDENT_FPRINT, "#endregion\n\n" );

											INDENT_FPRINT, "#region methods\n" );
											{
												auto write_pod_methods = [&]() {
													if ( podSize > 128 ) {
														printf( "pod size too big, plase modify MessageSerializer.binBuff size in csharp" );
														system( "pause" );
													}
													if ( dirTag & MT_ClientToServer ) {
														INDENT_FPRINT, "public unsafe int Serialize( BinaryWriter writer ) {\n" );
														if ( indent() ) {
															INDENT_FPRINT, "var _buf = MessageSerializer.binBuff;\n" );
															INDENT_FPRINT, "Common.UDebug.Assert( _buf.Length > Size );\n" );
															INDENT_FPRINT, "fixed ( %s* p = &this ) { Marshal.Copy( (IntPtr)p, _buf, 0, Size ); }\n", m->name.c_str() );
															INDENT_FPRINT, "Marshal.Copy( _buf, 0, (IntPtr)writer.Forward( Size ), Size );\n" );
															INDENT_FPRINT, "return Size;\n" );
															outdent();
														}
														INDENT_FPRINT, "}\n" );
													}
													if ( dirTag & MT_ServerToClient ) {
														INDENT_FPRINT, "public unsafe int Deserialize( BinaryReader reader ) {\n" );
														if ( indent() ) {
															INDENT_FPRINT, "var _buf = MessageSerializer.binBuff;\n" );
															INDENT_FPRINT, "Common.UDebug.Assert( _buf.Length > Size );\n" );
															INDENT_FPRINT, "var p = reader.Forward( Size );\n" );
															INDENT_FPRINT, "Marshal.Copy( (IntPtr)p, _buf, 0, Size );\n" );
															INDENT_FPRINT, "fixed ( byte* x = _buf ) { var _x = (%s*)x; fixed ( %s* _this = &this ) { *_this = *_x; } }\n", m->name.c_str(), m->name.c_str() );
															INDENT_FPRINT, "return Size;\n" );
															outdent();
														}
														INDENT_FPRINT, "}\n" );
													}
												};
												auto write_methods = [&]() {
													if ( dirTag & MT_ClientToServer ) {
														INDENT_FPRINT, "public override int Serialize( BinaryWriter writer ) {\n" );
														if ( indent() ) {
															INDENT_FPRINT, "long pos = writer.BaseStream.Position;\n" );
															for ( const auto& f : m->fields ) {
																const std::string& containerName = MetaInfo::getContainerTypeName( f.type );
																INDENT_FPRINT, "MessageSerializer.Write%s_%s( writer, m_%s );\n", containerName.c_str(), f.typeName.c_str(), f.name.c_str() );
															}
															INDENT_FPRINT, "return (int)( writer.BaseStream.Position - pos );\n" );
															outdent();
														}
														INDENT_FPRINT, "}\n" );
													}
													if ( dirTag & MT_ServerToClient ) {
														INDENT_FPRINT, "public override int Deserialize( BinaryReader reader ) {\n" );
														if ( indent() ) {
															INDENT_FPRINT, "long pos = reader.BaseStream.Position;\n" );
															for ( const auto& f : m->fields ) {
																const std::string& containerName = MetaInfo::getContainerTypeName( f.type );
																INDENT_FPRINT, "m_%s = MessageSerializer.Read%s_%s( reader );\n", f.name.c_str(), containerName.c_str(), f.typeName.c_str() );
															}
															INDENT_FPRINT, "return (int)( reader.BaseStream.Position - pos );\n" );
															outdent();
														}
														INDENT_FPRINT, "}\n" );
													}
												};
												if ( isPod ) {
													INDENT_FPRINT, "#if !NOT_USE_FAST_STREAM\n" );
													write_pod_methods();
													INDENT_FPRINT, "#else\n" );
													write_methods();
													INDENT_FPRINT, "#endif\n" );
												} else {
													write_methods();
												}
											}
											INDENT_FPRINT, "#endregion\n" );
											outdent();
										}
										INDENT_FPRINT, "}\n\n" );
										if ( m->msgId == 0 ) {
											std::string msgListName = isPod ? ( m->name + "_List" ) : ( "List<" + m->name + ">" );
											std::string _listTypeName = isPod ? "Common.Collections.Generic.List" : "List";
											if ( isPod ) {
												auto typeListDef = [&]() {
													
													INDENT_FPRINT, "#if !NOT_USE_FAST_STREAM\n" );
													INDENT_FPRINT, "public class %s : %s<%s> {\n", msgListName.c_str(), _listTypeName.c_str(), m->name.c_str() );
													INDENT_FPRINT, "#else\n" );
													INDENT_FPRINT, "public class %s : List<%s> {\n", msgListName.c_str(), m->name.c_str() );
													INDENT_FPRINT, "#endif\n" );
													
													if ( indent() ) {
														INDENT_FPRINT, "public %s( int capacity ) : base( capacity ) { }\n", msgListName.c_str() );
														INDENT_FPRINT, "public %s() : base() { }\n", msgListName.c_str() );
														if ( isPod ) {
															INDENT_FPRINT, "#if !NOT_USE_FAST_STREAM\n" );
															INDENT_FPRINT, "public %s( %s[] data, int size ) : base( data, size ) { }\n", msgListName.c_str(), m->name.c_str() );
															INDENT_FPRINT, "#endif\n" );
														}
														outdent();
													}
													INDENT_FPRINT, "}\n" );
												};
												typeListDef();
											}
											INDENT_FPRINT, "public partial class MessageSerializer\n" );
											INDENT_FPRINT, "{\n" );
											if ( indent() ) {
												{
													INDENT_FPRINT, "static public %s Read_%s( BinaryReader s ) {\n", m->name.c_str(), m->name.c_str() );
													if ( indent() ) {
														INDENT_FPRINT, "var ret = new %s();\n", m->name.c_str() );
														INDENT_FPRINT, "ret.Deserialize( s );\n" );
														INDENT_FPRINT, "return ret;\n" );
														outdent();
													}
													INDENT_FPRINT, "}\n" );
													if ( isPod ) {
														INDENT_FPRINT, "#if !NOT_USE_FAST_STREAM\n" );
														INDENT_FPRINT, "static unsafe public %s ReadList_%s( BinaryReader s ) {\n", msgListName.c_str(), m->name.c_str() );
														INDENT_FPRINT, "#else\n" );
														INDENT_FPRINT, "static public %s ReadList_%s( BinaryReader s ) {\n", msgListName.c_str(), m->name.c_str() );
														INDENT_FPRINT, "#endif\n" );
													} else {
														INDENT_FPRINT, "static public %s ReadList_%s( BinaryReader s ) {\n", msgListName.c_str(), m->name.c_str() );
													}
													if ( indent() ) {
														INDENT_FPRINT, "Int16 count = s.ReadInt16();\n" );
														INDENT_FPRINT, "if ( count <= 0 ) {\n" );
														if ( indent() ) {
															INDENT_FPRINT, "return null;\n" );
															outdent();
														}
														INDENT_FPRINT, "}\n" );
														auto c_name = m->name.c_str();
														auto pod_reader = [&]() {
															INDENT_FPRINT, "var buff = new %s[count];\n", c_name );
															INDENT_FPRINT, "var size = count * %s.Size;\n", c_name );
															INDENT_FPRINT, "fixed ( %s* p = buff ) {\n", c_name );
															INDENT_FPRINT, "	Marshal.Copy( s.GetBuffer(), s.GetOffset(), (IntPtr)p, size );\n" );
															INDENT_FPRINT, "}\n" );
															INDENT_FPRINT, "s.Forward( size );\n" );
															INDENT_FPRINT, "return new %s( buff, count );\n", msgListName.c_str() );
														};
														auto reader = [&]() {
															INDENT_FPRINT, "var ret = new %s( count );\n", msgListName.c_str() );
															INDENT_FPRINT, "for ( int i = 0; i < count; ++i ) {\n" );
															if ( indent() ) {
																INDENT_FPRINT, "ret.Add( Read_%s( s ) );\n", m->name.c_str() );
																outdent();
															}
															INDENT_FPRINT, "}\n" );
															INDENT_FPRINT, "return ret;\n" );
														};
														if ( isPod ) {
															INDENT_FPRINT, "#if !NOT_USE_FAST_STREAM\n" );
															pod_reader();
															INDENT_FPRINT, "#else\n" );
															reader();
															INDENT_FPRINT, "#endif\n" );
														} else {
															reader();
														}
														outdent();
													}
													INDENT_FPRINT, "}\n" );
												}
												{
													INDENT_FPRINT, "static public void Write_%s( BinaryWriter s, %s value ) {\n", m->name.c_str(), m->name.c_str() );
													if ( indent() ) {
														INDENT_FPRINT, "value.Serialize( s );\n" );
														outdent();
													}
													INDENT_FPRINT, "}\n" );
													if ( isPod ) {
														INDENT_FPRINT, "#if !NOT_USE_FAST_STREAM\n" );
														INDENT_FPRINT, "static unsafe public void WriteList_%s( BinaryWriter s, %s value ) {\n", m->name.c_str(), msgListName.c_str() );
														INDENT_FPRINT, "#else\n" );
														INDENT_FPRINT, "static public void WriteList_%s( BinaryWriter s, %s value ) {\n", m->name.c_str(), msgListName.c_str() );
														INDENT_FPRINT, "#endif\n" );
													} else {
														INDENT_FPRINT, "static public void WriteList_%s( BinaryWriter s, List<%s> value ) {\n", m->name.c_str(), m->name.c_str() );
													}
													if ( indent() ) {
														INDENT_FPRINT, "if ( value != null ) {\n" );
														if ( indent() ) {
															INDENT_FPRINT, "Write_Int16( s, (Int16)value.Count );\n" );
															auto c_name = m->name.c_str();
															auto pod_writer = [&]() {
																INDENT_FPRINT, "if ( value.Count > 0 ) {\n" );
																INDENT_FPRINT, "	var size = value.Count * %s.Size;\n", c_name );
																INDENT_FPRINT, "	fixed ( %s* p = value.InternalData ) {\n", c_name );
																INDENT_FPRINT, "		Marshal.Copy( (IntPtr)p, s.GetBuffer(), s.GetOffset(), size );\n" );
																INDENT_FPRINT, "	}\n" );
																INDENT_FPRINT, "	s.Forward( size );\n" );
																INDENT_FPRINT, "}\n" );
															};
															auto writer = [&]() {
																INDENT_FPRINT, "for ( int i = 0; i < value.Count; ++i ) {\n" );
																if ( indent() ) {
																	INDENT_FPRINT, "value[i].Serialize( s );\n" );
																	outdent();
																}
																INDENT_FPRINT, "}\n" );
															};
															if ( isPod ) {
																INDENT_FPRINT, "#if !NOT_USE_FAST_STREAM\n" );
																pod_writer();
																INDENT_FPRINT, "#else\n" );
																writer();
																INDENT_FPRINT, "#endif\n" );
															} else {
																writer();
															}
															outdent();
														}
														INDENT_FPRINT, "} else {\n" );
														if ( indent() ) {
															INDENT_FPRINT, "Write_Int16( s, 0 );\n" );
															outdent();
														}
														INDENT_FPRINT, "}\n" );
														outdent();
													}
													INDENT_FPRINT, "}\n" );
												}
												outdent();
											}
											INDENT_FPRINT, "}\n\n" );
										}
									}
								}
							}
							outdent();
							INDENT_FPRINT, "}\n//EOF\n" );
							fclose( fp );
						}
					}
			}
			);		
			fprintf( fp, "    }\n" );
			fprintf( fp, "    public partial class MessageFactory\n" );
			fprintf( fp, "    {\n" );
			fprintf( fp, "        static public void Initialize() {\n" );
			std::sort( allMessages.begin(), allMessages.end(),
				[]( const MsgDefine* l, const MsgDefine* r ) {
					return l->msgId < r->msgId;
			}
			);
			for ( auto m : allMessages ) {
				if ( m->type & MT_ServerToClient ) {
					fprintf( fp, "            RegisterMessageId( MessageType.MSG_%s, %s.Create );\n", m->name.c_str(), m->name.c_str() );
				}
			}
			fprintf( fp, "        }\n" );
			fprintf( fp, "    }\n" );
			fprintf( fp, "}\n//EOF\n" );
			fclose( fp );
			++processedCount;
		}
	}
	CGen2Erlang maker(version);
    CGenLuaDescTable::version = version;
    CGenLuaDescTable aa(outFilePath, sourceGenInfos);
	maker.make( outFilePath, sourceGenInfos );
	CGenLuaDescTable _maker( outFilePath, sourceGenInfos );
}

MetaInfo FileScanner::process( const std::vector< MatchResult >& matchResults, const std::string& fileName )
{
	MetaInfo metaInfo;
	std::string commnet;
	std::list< MsgDefine > msgDefine;
	std::set< std::string > msgNames;
	MsgDefine md;
	for ( const MatchResult& mr : matchResults ) {
		switch ( mr.type )
		{	
		case KEY_COMMENT:
			commnet += "\n";
			commnet += mr.matched[0];
			break;
		case KEY_STRUCT:
			{
				md.reset();
				md.comment = commnet;
				commnet.clear();
				md.name = mr.matched[1];
				md.type	= MT_None;
				if ( mr.matched.size() > 2 && mr.matched[2] == "<" ) {
					md.type = md.type | MT_ServerToClient;
				}
				if ( mr.matched.size() > 4 && mr.matched[4] == ">" ) {
					md.type = md.type | MT_ClientToServer;
				}
				if ( mr.matched.size() > 3 && mr.matched[3] == "=" ) {
					md.optmized = true;
				}
			}
			break;
		case KEY_FIELD:
			{
				bool invalid = true;
				Field field;
				char error[256] = {0};
				if ( mr.matched.size() >= 5 && !mr.matched[3].empty() ) {
					// c++ template container
					const std::string& containerTypeName = mr.matched[1];
					const std::string& dataTypeName = mr.matched[3];
					const std::string& fieldName = mr.matched[4];
					commnet = mr.matched.back();
					invalid = containerTypeName.empty() || dataTypeName.empty() || fieldName.empty();
					if ( !invalid ) {
						field.name = fieldName;
						field.typeName = dataTypeName;	
						auto it = metaInfo.containerTypeNames.find( containerTypeName );
						if ( it != metaInfo.containerTypeNames.end() ) {
							field.type = metaInfo.getContainerTypeByName( it->second );
						} else {
							sprintf( error, "unknown container type: %s", containerTypeName.c_str() );
							invalid = true;
						}
					}
				} else if ( mr.matched.size() >= 5 ) {				
					const std::string& dataTypeName = mr.matched[1];
					const std::string& fieldName = mr.matched[4];
					commnet = mr.matched.back();
					invalid = dataTypeName.empty() || fieldName.empty();
					if ( !invalid ) {
						field.name = fieldName;
						field.typeName = dataTypeName;
					}
				}
				if ( invalid ) {
					printf( "Invalid field<%s>: %s at line: %d", error, mr.matched[0].c_str(), mr.sourceLine );
				} else {
					field.comment = commnet;
					commnet.clear();
					md.fields.push_back( field );
				}
			}
			break;
		case KEY_END_STRUCT:
			{
				int tempId = 0;		
				if ( msgRecords->hasRecord() ) {
					int _id = 0;
					if ( msgRecords->getId( md.name, _id ) ) {
						// reuse old id
						tempId = _id;
					}
				}
				if ( tempId == 0 && md.type != MT_None ) {
					unsigned int _id = 0;
					hasher.getValue( md.name, _id );
					tempId = (int)_id;
				}
				md.msgId = tempId;
				if ( !md.name.empty() ) {
					if ( msgNames.find( md.name ) != msgNames.end() ) {
						printf( "message redefined! %s in %s line: %d", md.name.c_str(),
							fileName.c_str(), mr.sourceLine );
						system( "pause" );
					}
					msgDefine.push_back( md );
					md.reset();
				}
			}
			break;
		}
	}
	size_t n = msgDefine.size();
	size_t i = 0;
	//printf( "file: %s\n", fileName.c_str() );
	while ( !msgDefine.empty() ) {
		MsgDefine md = msgDefine.front();
		msgDefine.pop_front();
		if ( !metaInfo.cache( md ) ) {
			msgDefine.push_back( md );
		}
		//printf( "Cache: %s\n", md.name.c_str() );
		if ( ++i > n ) {
			//printf("Error,Cannot match all types\n");
			break;
		}
	}
	//system( "pause" );
	return metaInfo;
}

int FileScanner::getVersion( const char* inputPath )
{
	int version = 0;
	std::string path( inputPath );
	path.append( "/__VERSION__" );
	char* s = Helper::fileReadAll( path.c_str() );
	if ( s != NULL ) {
		if ( strlen( s ) != 0 ) {
			sscanf( s, "%d", &version );
		}
		free( s );
	}
	return version;
}

bool FileScanner::operator()( bool isdir, const char* name ) {
	if ( isdir ) {
		return true;
	}
	std::string fn( name );
	if ( StringUtil::endsWith( fn, ".h", false ) ) {
		sourceFiles.push_back( fn );
	} else if ( StringUtil::endsWith( fn, ".cs", false ) && StringUtil::endsWith( fn, "MessageType.cs", false ) == false ) {
		Misc::deleteFile( fn.c_str() );
	}
	return true;
}