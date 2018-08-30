cls
@echo off
cd ../scripts/xref_runner
start /B /wait erl -s  xref_runner check
pause
