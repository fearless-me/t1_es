@echo off
erl -make
start /B /WAIT escript.exe cc_fast.ers
:: start /B /WAIT erl  -smp -name game_compile@127.0.0.1 -s cc_fast main [] +sbwt none +sub true +A 16