@echo off

CHCP 65001
cls

cd ..\\app\\game
echo 请确保已经变 %cd%\ebin 已经生成了rw_code模块的代码
set /P INPUT=按回车开始执行: %=%

cd .\\data

start /B /WAIT erl -pa ../ebin -s rw_code run_halt run_from_scripts_ket

set INPUTSVN=
set /P INPUTSVN=是否要提交导出文件到svn?(Y/N)%=%
if /i {%INPUTSVN%}=={y} (goto commit)
if /i {%INPUTSVN%}=={N} (goto end)
if /i {%INPUTSVN%}=={y} (goto commit)
if /i {%INPUTSVN%}=={n} (goto end)

:commit
TortoiseProc.exe /command:add /path:"./../*" /closeonend:0
TortoiseProc.exe /command:commit /path:"./../*" /closeonend:0

:end
exit