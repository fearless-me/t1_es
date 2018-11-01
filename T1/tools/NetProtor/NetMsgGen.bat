echo off
cls

echo delete client message sources...
del "..\\..\\Client\\Assets\\Code\\Base\\Net\\Messages\\*.cs" /s /q

echo delete server message sources...
del "..\\..\\Server\\app\\common\\src\\netmsg\\msg*" /s /q

echo clear output directory...
del ".\\Out\\*.cs" /s /q
del ".\\Out\\*.lua" /s /q
del ".\\Out\\netmsg*.erl" /s /q
del ".\\Out\\netmsg*.hrl" /s /q
echo would you like to increase proto version?(Y/N)
set INPUT=
set /P INPUT=Type input: %=%
if /i {%INPUT%}=={y} (goto yes)
if /i {%INPUT%}=={N} (goto no)
if /i {%INPUT%}=={y} (goto yes)
if /i {%INPUT%}=={n} (goto no)

:yes
cd .\\msg
call UpdateVersion.bat
cd ..\\
:no

echo build message protos
cd Builder
start /B /wait NetProtor.exe ../msg ../out

echo current directory: %cd%

::echo save net message type file
::COPY "..\\Out\\MessageType.cs" "..\\msg" /Y

echo copy net message sources to client
XCOPY "..\\Out" "..\\..\\..\\Client\\Assets\\Code\\Base\\Net\\Messages" /s /c /i /d /y /EXCLUDE:EXCLUDE_erl.txt

echo copy net message sources to server
XCOPY ..\\out ..\\..\\..\\Server\\app\\common\\src\\netmsg /s /c /i /d /y /EXCLUDE:EXCLUDE_cs.txt

::echo copy lua net message sources to client
::XCOPY "..\\Out" "..\\..\\..\\Client\\Assets\\StreamingAssets\\Lua\\Net" /s /c /i /d /y /EXCLUDE:EXCLUDE_only_lua.txt

::echo generate net protocal signatures for lua
::cd ../../Bin
::lua52 "..\\..\\Client\\Assets\\StreamingAssets\\LuaRoot\\NetProtoVergen.lua"
echo would you like to commit msg to svn?(Y/N)
set INPUTSVN=
set /P INPUTSVN=input: %=%
if /i {%INPUTSVN%}=={y} (goto commit)
if /i {%INPUTSVN%}=={N} (goto end)
if /i {%INPUTSVN%}=={y} (goto commit)
if /i {%INPUTSVN%}=={n} (goto end)
:commit
cd Builder
call commitMsgSVN.bat
:end


