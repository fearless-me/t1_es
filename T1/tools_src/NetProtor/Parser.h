#pragma once

#include <vector>
#include <map>
#include <list>
#include <set>
#include <regex>
#include <iostream>
#include <sstream>
#include <fstream>
#include <windows.h> 
#include <limits.h>

#include "_Misc.h"
#include "StringUtil.h"
#include "Helper.h"

extern "C"
{
#include "Ext/regex.h"
}

enum KEY_TYPE
{
	KEY_UNKNOWN		= -1,
	KEY_STRUCT      = 0,
	KEY_COMMENT     = 1,
	KEY_FIELD       = 2,
	KEY_END_STRUCT  = 3,
};

static const char* PatternSource[] =
{
	"^[ \t]*struct[ \t]+(\\w+)[ \t]*([<]?)([-|=]?)([>]?)[ \t]*",
	"^[ \t]*//",
	"(\\w+)[ \t]*(<(\\w+)>)?[ \t]*(\\w+)",
	"^[ \t]*}",															
};


extern regex_t* Patterns[ _countof( PatternSource ) ];


struct RegBank {
	std::map< std::string, regex_t > bank;
	regex_t* getReg( const char* source ) {
		regex_t regex;
		int errCode = 0;
		char errMsg[1024] = {0};
		size_t errMsgLen = 0;
		if ( ( errCode = regcomp( &regex, source, REG_EXTENDED | REG_NEWLINE ) ) == 0 ) {
			bank[ source ] = regex;
			return &( bank.insert( std::make_pair( source, regex ) ).first->second );
		}
		errMsgLen = regerror( errCode, &regex, errMsg, sizeof( errMsg ) );
		errMsgLen = errMsgLen < sizeof( errMsg ) ? errMsgLen : sizeof( errMsg ) - 1;
		errMsg[ errMsgLen ] = '\0';
		printf( "compile regular expression: \"%s\" failed: %s\n", source, errMsg );
		regfree( &regex );
		return NULL;
	}
	bool matchTest( const char* test, const std::string& pattern )
	{
		regex_t* reg = getReg( pattern.c_str() );
		if ( reg ) {
			if ( regexec( reg, test, 0, NULL, 0 ) == 0 ) {
				return true;
			}
		}
		return false;
	}
	~RegBank() {
		std::map< std::string, regex_t >::iterator it = bank.begin();
		while ( it != bank.end() ) {
			regfree( &it->second );
			++it;
		}
	}
	RegBank()
	{
		for ( int i = 0; i < _countof( PatternSource ); ++i ) {
			Patterns[i] = getReg( PatternSource[i] );
			if ( !Patterns[i] ) {
				printf( "reg express error!\n" );
				exit( -1 );
			}
		}
	}
};

static RegBank GRegBank;

static char* substr( const char*str, unsigned start, unsigned end )
{
	unsigned n = end - start;
	static char stbuf[1024];
	stbuf[0] = '\0';
	strncpy(stbuf, str + start, n);
	stbuf[n] = 0;
	return stbuf;
}

struct MatchResult
{
	KEY_TYPE type;
	std::vector< std::string > matched;
	int sourceLine;
	MatchResult() : type( KEY_UNKNOWN ), sourceLine( -1 )
	{
	}
	 MatchResult( MatchResult&& o )
	{
		matched = std::move( o.matched );
		type = o.type;
		sourceLine = o.sourceLine;
	}

	 explicit MatchResult(const MatchResult& o)
	{
		matched = o.matched;
		type = o.type;
		sourceLine = o.sourceLine;
	}
};

static MatchResult parseSourceLine( const char* source, int sourceLine )
{
	char ebuf[1280];
	char lbuf[1280];
	MatchResult v;
	for ( int j = 0; j < _countof( PatternSource ); ++j ) {
		size_t nmatch = 10;
		regmatch_t pm[10] = { 0 };
		int ret = regexec( Patterns[j], source, nmatch, pm, 0 );
	 	if ( ret == REG_NOMATCH ) {
			continue;
		}
		else if ( ret != 0 ) {
			regerror( ret, Patterns[j], ebuf, sizeof( ebuf ) );
			fprintf( stderr, "%s: regcom('%s')\n", ebuf, lbuf );
			continue;
		}
		for ( size_t x = 0; x < nmatch; ++x ) {
			if ( pm[x].rm_so != -1 ) {
				const char* sub = substr( source, pm[x].rm_so, pm[x].rm_eo );
				v.matched.push_back(sub);
			} 
			else {
				v.matched.push_back("");
			}
		}
		if (j == KEY_FIELD) {
			const char* comm = strstr(source, "//");
			if(comm !=NULL){
			/*	std::string ss = "/// <summary>\n\t\t/// ";
				ss += comm;
				ss += "\n\t\t/// </summary>\n\t\t";*/
				v.matched.push_back((comm+2));
			}
			else {
				v.matched.push_back("");
			}
		}
		v.type = ( KEY_TYPE )j;
		v.sourceLine = sourceLine;
	
		break;
	}
	return v;
}

static bool isComment( const char* source ) {
	const std::regex tempPattern( "^[ \t]*//" );
	return std::regex_match( source, tempPattern );
}

static bool isCommentBegin( const char* source ) {
	const std::regex tempPattern( "^[ \t]*//(.*)begin" );
	return std::regex_match( source, tempPattern );
}

static bool isCommentEnd( const char* source ){
	const std::regex tempPattern( "^[ \t]*//(.*)end" );
	return std::regex_match( source, tempPattern );
}

static std::string getCommentName( const char* source ){
	int ret = 0;
	char* pattern = "[^ |^\t|^/][a-zA-Z1-9]*"; // first word
	regex_t reg;
	size_t nmatch = 10;
	regmatch_t pmatch[10] = { 0 };
	std::string outStr = "nodata";
	ret = regcomp( &reg, pattern, 0 ); 
	if ( ret != 0 ) {
		printf( "regcomp failed!\n" );
	} else {
		ret = regexec( &reg, source, nmatch, pmatch, 0 );
		if ( ret == REG_NOERROR ) {
			outStr = substr(source, pmatch[0].rm_so, pmatch[0].rm_eo);
		}
	}
	return outStr;
}


enum FieldContainerType
{
	FCT_Invalid = -1,
	FCT_Scalar = 0,
	FCT_Array = 1,
};

enum MessageType
{
	MT_None = 0,
	MT_ServerToClient = ( 1 << 0 ),
	MT_ClientToServer = ( 1 << 1 ),
};

enum FieldKind
{
	FC_Unknown = 0,
	FC_Boolean,
	FC_Integer,
	FC_Single,
	FC_Double,
	FC_String,
	FC_Custom,
};

enum EFieldType
{
	EFDT_unknown,
	EFDT_bool,
	EFDT_int8,
	EFDT_uint8,
	EFDT_int16,
	EFDT_uint16,
	EFDT_int32,
	EFDT_uint32,
	EFDT_int64,
	EFDT_uint64,
	EFDT_float,
	EFDT_double,
	EFDT_string,
	EFDT_custom,
};

struct Field
{
	FieldContainerType type;
	unsigned int msgType;
	std::string typeName;
	std::string originalTypeName;
	std::string name;
	std::string comment;
	FieldKind kind;
	EFieldType fdtype;
	Field() : type( FCT_Scalar ), msgType( MT_None ), kind( FC_Unknown ), fdtype( EFDT_unknown ) {
	}
	Field( Field&& o ) {
		typeName = std::move( o.typeName );
		originalTypeName = std::move( o.originalTypeName );
		name = std::move( o.name );
		type = std::move( o.type );
		msgType = std::move( o.msgType );
		kind = std::move( o.kind );
		comment = std::move(o.comment);
		fdtype = o.fdtype;
	}

	Field(const Field& o) {
		typeName = std::move(o.typeName);
		originalTypeName = std::move(o.originalTypeName);
		name = std::move(o.name);
		type = std::move(o.type);
		msgType = std::move(o.msgType);
		kind = std::move(o.kind);
		comment = std::move(o.comment);
		fdtype = o.fdtype;
	}

	Field& operator=(const Field& o) {
		typeName = std::move(o.typeName);
		originalTypeName = std::move(o.originalTypeName);
		name = std::move(o.name);
		type = std::move(o.type);
		msgType = std::move(o.msgType);
		kind = std::move(o.kind);
		comment = std::move(o.comment);
		fdtype = o.fdtype;
		return *this;
	}
};

extern int TypeSizeTable[];

struct MsgDefine
{
	std::string comment;
	std::string name;
	unsigned int type;
	int msgId;
	int index;
	bool optmized;
	std::vector< Field > fields;
	MsgDefine() : type( MT_None ), msgId( 0 ), index( 0 ), optmized( false ) {
	}
	void reset() {
		name.clear();
		fields.clear();
		msgId = 0;
		comment.clear(); 
		optmized = false;
	}
	MsgDefine( MsgDefine&& o ) {
		name = std::move( o.name );
		comment = std::move(o.comment);
		fields = std::move( o.fields );
		type = std::move( o.type );
		msgId = std::move( o.msgId );
		index = std::move( o.index );
		optmized = std::move( o.optmized );
	}

	MsgDefine(const MsgDefine& o) {
		name = std::move(o.name);
		comment = std::move(o.comment);
		fields = std::move(o.fields);
		type = std::move(o.type);
		msgId = std::move(o.msgId);
		index = std::move(o.index);
		optmized = std::move(o.optmized);
	}

	int GetPODStructSize( const std::vector<const MsgDefine*>* bank ) const {
		int size = 0;
		if ( IsPOD_Struct( bank, &size ) ) {
			return size;
		} else {
			return 0;
		}
	}	
	int GetPODSize( const std::vector<const MsgDefine*>* bank ) const {
		int size = 0;
		if ( IsPOD( bank, &size ) ) {
			return size;
		} else {
			return 0;
		}
	}
	bool IsPOD_Struct( const std::vector<const MsgDefine*>* bank = NULL, int* psize = NULL ) const {
		size_t r = 0;
		if ( type != MT_None || optmized == false || this->type ) {
			return false;
		}
		int size = 0;
		for ( const Field& f : fields ) {
			if ( f.type != FCT_Scalar ) {
				return false;
			}
			if ( f.kind == FC_Boolean || f.kind == FC_Integer || f.kind == FC_Single || f.kind == FC_Double ) {
				++r;
				size += TypeSizeTable[f.fdtype];
			} else if ( f.kind == FC_Custom ) {
				if ( bank != NULL ) {
					auto it = std::find_if( bank->begin(), bank->end(),
						[&f]( const MsgDefine* test ) {
							return test->name == f.typeName;
						}
					);					
					if ( it != bank->end() ) {
						if ( (*it)->IsPOD_Struct( bank ) ) {
							++r;
						}
					}
				}
			}
		}	
		if ( psize != NULL ) {
			*psize = size;
		}
		return r == fields.size();
	}
	bool IsPOD( const std::vector<const MsgDefine*>* bank = NULL, int* psize = NULL ) const {
		size_t r = 0;
		int size = 0;
		for ( const Field& f : fields ) {
			if ( f.type != FCT_Scalar ) {
				return false;
			}
			if ( f.kind == FC_Boolean || f.kind == FC_Integer || f.kind == FC_Single || f.kind == FC_Double ) {
				++r;
				size += TypeSizeTable[f.fdtype];
			} else if ( f.fdtype == FC_Custom ) {
				if ( bank != NULL ) {
					auto it = std::find_if( bank->begin(), bank->end(),
						[&f]( const MsgDefine* test ) {
							return test->name == f.typeName;
						}
					);
					if ( it != bank->end() ) {
						int _size = 0;
						if ( (*it)->IsPOD( bank, &_size ) ) {
							++r;
							size += _size;
						}
					}
				}
			}
		}
		if ( psize != NULL ) {
			*psize = size;
		}
		return r == fields.size();
	}
};

struct MsgBank
{
	typedef std::vector< MsgDefine > MsgGroupType;
	std::map< std::string, MsgGroupType > bank;
	MsgGroupType& getGroup( const std::string& nameSpace ) {
		return bank[ nameSpace ];
	}
};

struct MetaInfo
{
	static std::map< std::string, std::string > typeNamesAlias;
	static std::map< std::string, std::string > containerTypeNames;
	std::map< std::string, MsgDefine > cachedMsgDefine;
	MetaInfo();

	MetaInfo( MetaInfo&& o ) {
		cachedMsgDefine = std::move( o.cachedMsgDefine );
	}

	MetaInfo(const MetaInfo& o) {
		cachedMsgDefine = o.cachedMsgDefine;
	}

	MetaInfo& operator=(const MetaInfo& o) {
		cachedMsgDefine = o.cachedMsgDefine;
		return *this;
	}

	static const std::string& getContainerTypeName( FieldContainerType type );
	static FieldContainerType getContainerTypeByName( const std::string& name );
	bool cache( const MsgDefine& md );
};

#define INDENT_FPRINT	applyIndent(); fprintf( fp

class StringHashGen {
	unsigned int mMask;
public:
	typedef unsigned int ( *FPHashString )( const std::string& s );
	unsigned int getMask() const { return mMask; }
	void setMask( unsigned int mask ) { mMask = mask; }
	bool getValue( const std::string& s, unsigned int& value ) {
		value = 1;
		if ( m_hashBank.size() >= mMask ) {
			return false;
		}
		value = m_hasher( s );
		value &= mMask;
		while ( m_hashBank.find( value ) != m_hashBank.end() || value <= 0 ) {
			++value;
			value &= mMask;
		}
		m_hashBank.insert( value );
		return true;
	}
	static unsigned int defaultHashString( const std::string& s ) {
		unsigned int HashVal = 0;
		for ( size_t i = 0; i < s.length(); ++i ) {
			HashVal += (unsigned int)( s[i] * 193951 );
			HashVal *= 399283;
		}
		return HashVal;
	}
	StringHashGen( unsigned int mask = 0x7fffffff, FPHashString hasher = NULL ) {
		mMask = mask;
		if ( hasher == NULL ) {
			m_hasher = defaultHashString;
		}
	}
	bool reserveValue( unsigned int value ) {
		if ( value != ( value & mMask ) ) {
			return false;
		}
		return m_hashBank.insert( value ).second;
	}
	std::set<unsigned int> m_hashBank;
	FPHashString m_hasher;
};

class MessageIdRecords {
public:
	MessageIdRecords( const char* filePath ){
		std::string fullPath = filePath;
		fullPath = StringUtil::standardisePath( fullPath );
		fullPath.append( "MessageType.cs" );
		std::ifstream fs;
		fs.open( fullPath, std::ios::in );
		if ( fs ) {
			read( fs );		
		} else {
			printf( "MessageType.cs not found!" );
			system( "pause" );
		}
		fs.close();
	}
	void reserve( StringHashGen& hashGen ) {
		for ( auto item : ids ) {
			if ( !hashGen.reserveValue( item.second ) ) {
				printf( "invalid hash id, reserve failed!" );
				system( "pause" );
				abort();
			}
		}
	}
	bool hasRecord() const {
		return ids.empty() == false;
	}
	bool getId( const std::string& name, int& id ) {
		auto it = ids.find( name );
		if ( it != ids.end() ) {
			id = it->second;
			return true;
		}
		return false;
	}
private:
	void read( std::ifstream& fs ){
		std::string scopeName;	
		bool inScope = false;	
		char buffer[4096];
		while ( !fs.eof() ) {
			fs.getline( buffer, sizeof( buffer ), '\n' );
			if ( isCommentBegin( buffer ) ) {
				inScope = true;
				continue;
			}
			if ( isCommentEnd( buffer ) ) {
				inScope = false;
				continue;
			}
			if ( inScope == true ) {
				std::stringstream word( buffer ); 
				std::string name, sign, id = "";
				word >> name;
				word >> sign;
				word >> id;
				// remove prefix: "MSG_"
				std::string structName = name.substr( 4, name.length() - 4 );
				auto _id = std::atoi( id.c_str() );
				if ( _id <= 0 ) {
					printf( "message type \"%s\" id must greater than 0!", name.c_str() );
					system( "pause" );
					continue;
				}
				ids.insert( std::make_pair( structName, _id ) );
			}
		}
	}
	std::map<std::string, int> ids;
};

struct SourceGenInfo {
	MetaInfo meta;
	std::string fileName;
	std::string nameSpace;
	SourceGenInfo() {}
	SourceGenInfo( SourceGenInfo&& o ) :meta(std::move(o.meta)) {
		
		fileName = std::move( o.fileName );
		nameSpace = std::move( o.nameSpace );
	}
};

struct FileScanner : Misc::TreeWalker {
	MetaInfo process( const std::vector< MatchResult >& matchResults, const std::string& fn );
	std::vector< SourceGenInfo > sourceGenInfos;
	std::vector< std::string > sourceFiles;
	std::string outFilePath;
	std::auto_ptr<MessageIdRecords> msgRecords;
	StringHashGen hasher;
	int processedCount;
	int version;

	void syncMsg( const char* inputPath ){
		msgRecords.reset( new MessageIdRecords( inputPath ) );
		msgRecords->reserve( hasher );
	}
	static int getVersion( const char* inputPath );
	FileScanner();
	~FileScanner();
	virtual bool operator()( bool isdir, const char* name );	
};







