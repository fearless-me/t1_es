@echo off
chcp 65001
cls
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

PowerShell -Command "& { begin{ Write-Host "** WinRM防火墙设置 **"; Enable-PSRemoting –SkipNetworkProfileCheck –Force } process{ cd WSMan::localhost\client; Get-ChildItem; Write-Host "** 请输入被信任主机IP **: "; $HostIp = [Console]::ReadLine(); Set-Item ./TrustedHosts $HostIp ;} end { Get-ChildItem } }" 


pause