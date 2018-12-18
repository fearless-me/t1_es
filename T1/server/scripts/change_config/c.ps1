chcp 65001
#
$CenterHost_Old = $args[0];
$CenterHost_New = $args[1];
$PreFix = "center@";
$CenterOldNode = $PreFix + $CenterHost_Old;
$CenterNewNode = $PreFix + $CenterHost_New;
$GameIni = "..\..\app\game\data\game.ini";
$CenterBat = "..\..\app\center\scripts\start.bat";

#
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False)
$Utf8BomEncoding = New-Object System.Text.UTF8Encoding($True)


#
Write-Host("处理$CenterBat");
$MyFile = [System.IO.File]::ReadAllLines($CenterBat, $Utf8NoBomEncoding);
$MyFile = $MyFile.replace($CenterHost_Old, $CenterHost_New)
[System.IO.File]::WriteAllLines($CenterBat, $MyFile, $Utf8NoBomEncoding);

#
Write-Host("处理$GameIni");
$MyFile = [System.IO.File]::ReadAllLines($GameIni, $Utf8NoBomEncoding); 
$MyFile = $MyFile.replace( $CenterOldNode, $CenterNewNode)
[System.IO.File]::WriteAllLines($GameIni, $MyFile, $Utf8NoBomEncoding);

#
