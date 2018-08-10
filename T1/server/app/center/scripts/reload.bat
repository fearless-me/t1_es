erl -make
start /B /WAIT erl -name reload@127.0.0.1 -setcookie erlide -s reload reload  center@127.0.0.1 
pause