@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

cd ../data
start erl -pa ../ebin -kernel logger_sasl_compatible true -boot start_sasl -config elog  -kernel logger_level error -name game@192.168.18.52 -setcookie erlide -s game start -kernel inet_dist_listen_min 60000 inet_dist_listen_max 60080 +P 500000 +t 10485760 +fnu +hms 8192 +hmbs 8192 +zdbbl 2097151  +e 50000 +sub true +A 16 +hmaxk false +IOt 8 +IOp 8