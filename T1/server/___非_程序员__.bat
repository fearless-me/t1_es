@echo off
rem %1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
rem cd /d "%~dp0"

cls
cd scripts
erl -make
escript.exe dev.ers usr