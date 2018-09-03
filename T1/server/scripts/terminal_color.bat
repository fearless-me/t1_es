rem %1 start mshta vbscript:createobject("wscript.shell").run("""%~0"" ::",0)(window.close)&&exit

@echo off

cls
cd schemes
colortool.exe -q -b OneHalfLight
exit