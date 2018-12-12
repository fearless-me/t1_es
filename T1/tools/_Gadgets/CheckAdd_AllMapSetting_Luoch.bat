@echo off
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
cd ../../
TortoiseProc.exe /command:add /path:"Client\\Assets\\StreamingAssets\\PathGridRunTime*Client\\Assets\\StreamingAssets\\MapInfo*Client\\Assets\\Scenes\\output*Server\\app\\game\\src\\pub\\mapcfgs*Client\\Assets\\ToolOutput\\PathGrid" /closeonend:0
TortoiseProc.exe /command:commit /path:"Client\\Assets\\StreamingAssets\\PathGridRunTime*Client\\Assets\\StreamingAssets\\MapInfo*Client\\Assets\\Scenes\\output*Server\\app\\game\\src\\pub\\mapcfgs*Client\\Assets\\ToolOutput\\PathGrid*Client\\ProjectSettings\\EditorBuildSettings.asset" /closeonend:0