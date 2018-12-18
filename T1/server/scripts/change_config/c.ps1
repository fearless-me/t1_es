chcp 65001
$CenterHost_Old = $args[0];
$CenterHost_New = $args[1];
$PreFix = "center@";
$CenterOldNode = $PreFix + $CenterHost_Old;
$CenterNewNode = $PreFix + $CenterHost_New;
$GameIni = "..\..\app\game\data\game.ini";


$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False)
$Utf8BomEncoding = New-Object System.Text.UTF8Encoding($True)

$CenterBat = "..\..\app\center\scripts\start.bat";
Write-Host("处理$CenterBat");
(Get-Content $CenterBat).replace($CenterHost_Old, $CenterHost_New) | Set-Content $CenterBat -encoding utf8;

Write-Host("处理$GameIni");


$MyFile = [System.IO.File]::ReadAllLines($GameIni, $Utf8NoBomEncoding); 
[System.IO.File]::WriteAllLines($GameIni, $MyFile, $Utf8BomEncoding);


(Get-Content $GameIni).replace( $CenterOldNode, $CenterNewNode) | Set-Content $GameIni -encoding utf8;


$MyFile = [System.IO.File]::ReadAllLines($GameIni, $Utf8BomEncoding); 
[System.IO.File]::WriteAllLines($GameIni, $MyFile, $Utf8NoBomEncoding);

