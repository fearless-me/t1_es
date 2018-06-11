#include <stdlib.h>
#include <stdio.h>
#include <map>
#include <vector>
#include <string>
#include <set>
#include <list>
#include "Parser.h"
#include "Gen2Erlang.h"
#include <conio.h>

#include <direct.h>

int main( int argn, const char** args )
{
	std::string currentPath;
	std::string inputPath;
	std::string outPath;
	if ( argn > 1 ) {
		inputPath = args[1];
		inputPath = StringUtil::standardisePath( inputPath );
	} else {
		char _curPath[256];
		_getcwd( _curPath, 256 );
		std::string curPath = _curPath;
		inputPath = StringUtil::standardisePath( curPath );
	}
	if ( argn > 2 ) {
		outPath = args[2];
		outPath = StringUtil::standardisePath( outPath );
		Misc::isDirectory( outPath.c_str() );
		Misc::createDirectories( outPath.c_str() );

	} else {
		outPath = inputPath;
	}
	{
		FileScanner fs;
		fs.outFilePath = outPath;
		fs.version = FileScanner::getVersion( inputPath.c_str() );
		fs.syncMsg( inputPath.c_str() );
		Misc::treeWalk( inputPath.c_str(), fs );
	}
	return 0;
}

//EOF
