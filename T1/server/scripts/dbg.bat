cls 
cd ../app/game/data
cls
start /B /WAIT erl -smp enable -pa ../ebin -kernel logger_sasl_compatible true -boot start_sasl -config elog  -kernel logger_level error -name dbg@127.0.0.1 -setcookie erlide -kernel inet_dist_listen_min 60000 inet_dist_listen_max 60080 +K true +P 500000 +t 10485760 +fnu +hms 8192 +hmbs 8192 +zdbbl 2097151  +e 50000 +sub true +A 16 +hmaxk false