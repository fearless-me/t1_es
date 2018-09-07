
echo off

CHCP 65001
cls

cd ..\\sql\\
echo 请修改：%cd%\BakDB.bat 以确保能正确导出
set /P INPUT=按回车开始执行: %=%
call BakDB.bat

set INPUTSVN=
set /P INPUTSVN=是否要提交导出文件到svn?(Y/N)%=%
if /i {%INPUTSVN%}=={y} (goto commit)
if /i {%INPUTSVN%}=={N} (goto end)
if /i {%INPUTSVN%}=={y} (goto commit)
if /i {%INPUTSVN%}=={n} (goto end)

:commit
TortoiseProc.exe /command:add /path:"./*" /closeonend:0
TortoiseProc.exe /command:commit /path:"./*" /closeonend:0

:end
exit