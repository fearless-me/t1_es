@echo off
rem %1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
rem cd /d "%~dp0"

cls
start /B /WAIT powershell -Command "set-ExecutionPolicy RemoteSigned"
start /B /WAIT powershell -file  %1 %2 %3 %4 %5
pause
exit