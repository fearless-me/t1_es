#!/bin/sh
cd ../data
echo "start center ..."
erl -detached -smp -pa ../ebin  -logger_level info -name center@127.0.0.1  -setcookie erlide -s center start -kernel inet_dist_listen_min 60000 inet_dist_listen_max 60080 +K true +P 500000 +t 10485760 +fnu +hms 8192 +hmbs 8192 +zdbbl 2097151  +e 50000 +sbwt none +sub true
