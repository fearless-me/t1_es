@echo off

echo Generate ErrorCode

echo "Make ErrorCodeString.xls"
pushd ..\\..\\ErrorCodeGen\\ReadExcel\\bin\\Release
start /B /MIN /wait ReadExcel.exe CreateExcel ..\\..\\..\\..\\NetProtor\\ErrorCode\\ErrorCode.h ..\\..\\..\\..\\..\\Client\\Assets\\Plugins\\Client\\Game\\ErrorCode.cs ..\\..\\..\\..\\..\\Gamedata\\LocalizedSourceFile\\ErrorCodeString.xls
popd
echo "generate client/server code"
pushd ..\\..\\_Gadgets
start /B /MIN /wait ErrorCodeAndUpdateText_Generate.bat
popd 
echo "commit client/server code"
pushd ..\\..\\_Gadgets
start /B /MIN /wait ErrorCodeAndUpdateText_Commit.bat
popd 
echo "done!!!!"
pause 