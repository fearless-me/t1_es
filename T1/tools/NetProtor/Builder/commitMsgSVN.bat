@echo off
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
cd ../../../
TortoiseProc.exe /command:add /path:"tools/NetProtor/msg*server\\app\\deps\\pubs\\src\\net" /closeonend:0
TortoiseProc.exe /command:commit /path:"tools/NetProtor/msg*server\\app\\deps\\pubs\\src\\net" /closeonend:0