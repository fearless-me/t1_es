echo off
echo delete server map-info...
del "..\..\Server\app\game\data\maps\*" /s /q

XCOPY "..\..\Client\Assets\ToolOutput\PathGrid" "..\..\Server\app\game\data\maps" /s /c /i /d /y /EXCLUDE:EXCLUDE_ServerMapOnly.txt
XCOPY "..\..\Client\Assets\StreamingAssets\MapInfo" "..\..\Server\app\game\data\maps" /s /c /i /d /y /EXCLUDE:EXCLUDE_ServerMapOnly.txt
