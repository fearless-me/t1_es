cls
@echo off
cd xref_runner
start /B /wait erl -s  xref_runner check "..\\xref_gs.config"
start /B /wait erl -s  xref_runner check "..\\xref_cs.config"
pause
