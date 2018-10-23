@echo off
if "%1" == "h" goto begin
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
:begin
cd ../../../
TortoiseProc.exe /command:add /path:"tools/NetProtor/msg*Server\\app\\common\\src\\netmsg*Client\\Assets\\Code\\Base\\Net\\Messages*Client\\Assets\\StreamingAssets\\Lua\\Net" /closeonend:0
TortoiseProc.exe /command:commit /path:"tools/NetProtor/msg*Server\\app\\common\\src\\netmsg*Client\\Assets\\Code\\Base\\Net\\Messages*Client\\Assets\\StreamingAssets\\Lua\\Net" /closeonend:0