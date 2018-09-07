rem %1 start mshta vbscript:createobject("wscript.shell").run("""%~0"" ::",0)(window.close)&&exit

@echo off

cls
cd ../../Tools\NetProtor
start NetMsgGen.bat
exit