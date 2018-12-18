chcp 65001
$DatabaseHost_Old = $args[0];
$DatabasePass_Old = $args[1];
$DatabaseHost_New = $args[2];
$DatabasePass_New = $args[3];
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False)
$Utf8BomEncoding = New-Object System.Text.UTF8Encoding($True)
$SqlPath = "..\..\sql\"
Get-ChildItem $SqlPath | ForEach-Object -Process{
if($_ -is [System.IO.FileInfo])
{
	$CurName = $_
	$CurFile = $SqlPath + $CurName
	Write-Host("处理 $CurFile ")
	$MyFile = [System.IO.File]::ReadAllLines($CurFile, $Utf8NoBomEncoding); 
	[System.IO.File]::WriteAllLines($CurFile, $MyFile, $Utf8BomEncoding);	
	(Get-Content $CurFile).replace($DatabaseHost_Old, $DatabaseHost_New) | Set-Content $CurFile -encoding utf8;
	(Get-Content $CurFile).replace($DatabasePass_Old, $DatabasePass_New) | Set-Content $CurFile -encoding utf8;
	$MyFile = [System.IO.File]::ReadAllLines($CurFile, $Utf8BomEncoding); 
	[System.IO.File]::WriteAllLines($CurFile, $MyFile, $Utf8NoBomEncoding);

}
}

$CenterIni = "..\..\app\center\data\center.ini";
Write-Host("处理$CenterIni");

$MyFile = [System.IO.File]::ReadAllLines($CenterIni, $Utf8NoBomEncoding); 
[System.IO.File]::WriteAllLines($CenterIni, $MyFile, $Utf8BomEncoding);
	
(Get-Content $CenterIni).replace($DatabaseHost_Old, $DatabaseHost_New) | Set-Content $CenterIni -encoding utf8;
(Get-Content $CenterIni).replace($DatabasePass_Old, $DatabasePass_New) | Set-Content $CenterIni -encoding utf8;

$MyFile = [System.IO.File]::ReadAllLines($CenterIni, $Utf8BomEncoding); 
[System.IO.File]::WriteAllLines($CenterIni, $MyFile, $Utf8NoBomEncoding);


$GameIni = "..\..\app\game\data\game.ini";
Write-Host("处理$GameIni");

$MyFile = [System.IO.File]::ReadAllLines($GameIni, $Utf8NoBomEncoding); 
[System.IO.File]::WriteAllLines($GameIni, $MyFile, $Utf8BomEncoding);

(Get-Content $GameIni).replace($DatabaseHost_Old, $DatabaseHost_New) | Set-Content $GameIni -encoding utf8;
(Get-Content $GameIni).replace($DatabasePass_Old, $DatabasePass_New) | Set-Content $GameIni -encoding utf8;

$MyFile = [System.IO.File]::ReadAllLines($GameIni, $Utf8BomEncoding); 
[System.IO.File]::WriteAllLines($GameIni, $MyFile, $Utf8NoBomEncoding);



