cd ../data
start erl -smp enable -pa ../ebin -boot start_sasl -config elog -name game@127.0.0.1 -setcookie erlide -s game start -kernel inet_dist_listen_min 60000 inet_dist_listen_max 60080 +K true +P 500000 +t 10485760 +fnu +hms 8192 +hmbs 8192 +zdbbl 2097151  +e 50000 +sub true +A 16