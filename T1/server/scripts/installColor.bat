@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit  
cd /d "%~dp0"
xcopy /F /R /Y .\ansi\*.dll C:\Windows\System32\
xcopy /F /R /Y .\ansi\*.exe C:\Windows\System32\
ping -n 10 127.0.0.1 > nul
start /B ansicon.exe -U

pause
