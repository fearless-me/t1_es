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
	$MyFile = $MyFile.replace($DatabaseHost_Old, $DatabaseHost_New).replace($DatabasePass_Old, $DatabasePass_New)
	[System.IO.File]::WriteAllLines($CurFile, $MyFile, $Utf8NoBomEncoding);

}
}

# 
Write-Host("处理$CenterIni");
$CenterIni = "..\..\app\center\data\center.ini";
$MyFile = [System.IO.File]::ReadAllLines($CenterIni, $Utf8NoBomEncoding); 
$MyFile = $MyFile.replace($DatabaseHost_Old, $DatabaseHost_New).replace($DatabasePass_Old, $DatabasePass_New)
[System.IO.File]::WriteAllLines($CenterIni, $MyFile, $Utf8NoBomEncoding);


#
Write-Host("处理$GameIni");
$GameIni = "..\..\app\game\data\game.ini";
$MyFile = [System.IO.File]::ReadAllLines($GameIni, $Utf8NoBomEncoding); 
$MyFile = $MyFile.replace($DatabaseHost_Old, $DatabaseHost_New).replace($DatabasePass_Old, $DatabasePass_New)
[System.IO.File]::WriteAllLines($GameIni, $MyFile, $Utf8NoBomEncoding);



