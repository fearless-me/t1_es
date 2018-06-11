#ifndef __HELPER_H__
#define __HELPER_H__

#include <stdio.h>
#include <assert.h>
#include <algorithm>
#include <vector>

#ifndef SAFE_DELETE
	#define SAFE_DELETE(p)          { if (p) { delete(p); (p) = NULL;} }
#endif

#ifndef SAFE_DELETE_ARRAY
	#define SAFE_DELETE_ARRAY(p)    { if (p) { delete[] (p); (p) = NULL; } }
#endif

#ifndef SAFE_FREE
	#define SAFE_FREE(p)    { if (p) { free(p); (p) = NULL; } }
#endif

namespace Helper
{
	template< typename T >
	inline T transPathSplitter( T c ) {
		return ( c != T('\\') ) ? c : T('/');
	}

	template< typename T >
	inline bool isPathSplitter( T c ) {
		return c == '\\' || c == '/';
	}
	
	template< typename T >
	inline T& transPath( T& s ) {
		std::transform( s.begin(), s.end(), s.begin(), transPathSplitter< typename T::value_type > );
		return s;
	}

	std::string getDirName( const std::string& path );
	std::string getFullPath( const char* path );
	bool pushPath( const char* dest );
	bool popPath();
	bool isDir( const char* name );
	void makeDir( const char* name );
	bool copyFile( const char* oldFilePath, const char* newFilePath, bool failIfExists = false );
	bool deleteFolder( const char* folder );
	bool shellDeleteFolder( const char* folder );
	bool fileExist( const char* file );
	int fileLength( FILE* fp );
	char* fileReadAll( const char* file, size_t* read = NULL );
	int getFileLists( std::vector< std::string >& fnlist, const char* path, bool filterfunc( const char* filter ) );
}

#endif
