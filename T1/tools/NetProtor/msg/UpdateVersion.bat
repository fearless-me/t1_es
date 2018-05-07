echo off

set oldVersion=0

if not exist __VERSION__ (
	echo 1 > __VERSION__
) else (
	set /p oldVersion=<__VERSION__
)

set newVersion=%oldVersion%
set /a newVersion = newVersion + 1

echo %newVersion% > __VERSION__
echo Resource version has been changed from %oldVersion% to %newVersion%

::just wait 2s to let the user be able to see the result more clear
start /min /w mshta vbscript:setTimeout("window.close()",2000)


