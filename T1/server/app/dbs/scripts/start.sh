#!/bin/sh
cd ../data
echo "start dbs ..."
erl -detached -smp -pa ../ebin -boot start_sasl -name dbs@127.0.0.1  -setcookie erlide -s dbs start -kernel inet_dist_listen_min 60000 inet_dist_listen_max 60080 +K true +P 500000 +t 10485760 +fnu +hms 8192 +hmbs 8192 +zdbbl 2097151  +e 50000 +sbwt none +sub true
