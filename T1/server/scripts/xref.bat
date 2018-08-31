cls
@echo off
cd xref_runner
start /B /wait erl -s  xref_runner check
pause
