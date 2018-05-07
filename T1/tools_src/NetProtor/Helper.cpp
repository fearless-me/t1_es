#include "Helper.h"
#include <fstream>

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <shellapi.h>
#include <shlwapi.h>
#include <direct.h>
#include <vector>
#pragma comment( lib, "shell32.lib" )
#pragma comment( lib, "shlwapi.lib" )

#pragma warning( disable : 4996 )

namespace Helper {

static std::vector< std::string > pathStack;

bool pushPath( const char* dest )
{
	char buf[MAX_PATH];
	GetCurrentDirectoryA( MAX_PATH, buf );
	pathStack.push_back( std::string( buf ) );
	int ret = SetCurrentDirectoryA( dest );
	if ( !ret ) {
		GetCurrentDirectoryA( MAX_PATH, buf );
		_asm { nop }
	}
	GetCurrentDirectoryA( MAX_PATH, buf );
	return ret ? true : false;
}

bool popPath()
{
	if ( pathStack.empty() ) {
		return false;
	}
	SetCurrentDirectoryA( pathStack.back().c_str() );
	pathStack.pop_back();
	return true;
}

bool isDir( const char* name )
{
	WIN32_FIND_DATA fileinfo;
	HANDLE handle = FindFirstFile( name, &fileinfo );
	if ( handle ) {
		FindClose( handle );
		return !!( fileinfo.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY );
	}
	return false;
}

void makeDir( const char* name )
{
	_mkdir( name );
}

bool copyFile( const char* oldFilePath, const char* newFilePath, bool failIfExists )
{
	return !!CopyFile( oldFilePath, newFilePath, failIfExists );
}

bool shellDeleteFolder( const char* folder )
{
	if ( !PathIsDirectory( folder ) ) {
		return false;
	}
	SHFILEOPSTRUCT FileOp;
	FileOp.fFlags = FOF_NOCONFIRMATION;  
	FileOp.hNameMappings = NULL;
	FileOp.hwnd = NULL;
	FileOp.lpszProgressTitle = NULL;
	FileOp.pFrom = folder;
	FileOp.pTo = NULL;
	FileOp.wFunc = FO_DELETE;
	if ( SHFileOperation( &FileOp ) == 0 )
		return true;
	return false;
}

bool deleteFolder( const char* folder )
{
	if ( !pushPath( folder ) )
		return false;
	WIN32_FIND_DATA fileinfo;
	HANDLE handle = FindFirstFile( "*.*", &fileinfo );
	while ( FindNextFile( handle, &fileinfo ) ) { 
		if( ( fileinfo.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY ) &&
			( strcmp( fileinfo.cFileName, ".." ) != 0 ) 
			&& !( fileinfo.dwFileAttributes & FILE_ATTRIBUTE_HIDDEN ) )
		{
			deleteFolder( fileinfo.cFileName );
		}
		else if ( fileinfo.dwFileAttributes & FILE_ATTRIBUTE_ARCHIVE ) 
		{
			DeleteFile( fileinfo.cFileName );
		}
	}
	if ( handle != 0 ) {
		FindClose( handle );
	}
	popPath();
	RemoveDirectory( folder );
	return true;
}

int getFileLists( std::vector< std::string >& fnlist, const char* path, bool filterfunc( const char* filter ) )
{
	char OldPath[ MAX_PATH ];
	if ( path && path[ 0 ] != 0 ) {
		::GetCurrentDirectory( MAX_PATH, OldPath );
		const char* dir = strrchr( path, '/' );
		BOOL ret = SetCurrentDirectory( dir ? dir + 1 : path );
		if ( !ret )
			return 0;
	}
	WIN32_FIND_DATA fileinfo;
	HANDLE handle = FindFirstFile( "*.*", &fileinfo );
	if ( handle != 0 ) { 
		do {
			if ( !( fileinfo.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY ) ) {
				if ( filterfunc == NULL || !filterfunc( fileinfo.cFileName ) ) {
					std::string full_path( path );
					if ( path[0] != 0 )
						full_path.append( "/" );
					full_path.append( fileinfo.cFileName );
					fnlist.push_back( full_path );
				}
			} else if ( fileinfo.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY ) {
				char* p = fileinfo.cFileName;
				if ( p && *p != '.' ) {
					std::string child_path( path );
					if ( path[0] != 0 )
						child_path.append( "/" );
					child_path.append( fileinfo.cFileName );
					getFileLists( fnlist, child_path.c_str(), filterfunc );
				}
			}
		}
		while ( FindNextFile( handle, &fileinfo ) );
		FindClose( handle );
	}
	if ( path && path[ 0 ] != 0 )
		::SetCurrentDirectory( OldPath );
	return (int)fnlist.size();
}

bool fileExist(const char* file) {
	bool rtn = false;
	std::fstream _file;
	_file.open(file, std::ios::in);
	if(_file) {
		rtn = true;
	}
	_file.close();

	return rtn;
}

int fileLength(FILE* fp) {
	int result = 0;
	int curpos = 0;

	assert(fp);
	curpos = ftell(fp);
	fseek(fp, 0L, SEEK_END);
	result = ftell(fp);
	fseek(fp, curpos, SEEK_SET);

	return result;
}

char* fileReadAll( const char* file, size_t* read )
{
	char* result = NULL;
	FILE* fp = NULL;
	assert(file);
	fp = fopen(file, "rb");
	if(fp != NULL) {
		int l = fileLength(fp);
		result = (char*)malloc(l + 4);
		assert(result);
		fread(result, 1, l, fp);
		fclose(fp);
		result[l] = '\0';
		result[l + 1] = 'e';
		result[l + 2] = 'n';
		result[l + 3] = 'd';

		if(read)
			*read = (size_t)l;
	}

	return result;
}

std::string getDirName( const std::string& path )
{
	std::string ret = path;
	transPath( ret );
	std::string::size_type p = ret.find_last_of( '/' );
	if ( p != std::string::npos ) {
		ret.erase( 0, p + 1 );
	}
	return ret;
}

std::string getFullPath( const char* path )
{
	std::string ret;
	char out[ MAX_PATH ] = { 0 };
	GetFullPathName( path, MAX_PATH, out, NULL );
	ret = out;
	transPath( ret );
	return ret;
}

}