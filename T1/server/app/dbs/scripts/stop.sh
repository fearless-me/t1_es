erl -make
erl -name stopgs@127.0.0.1 -setcookie erlide -s stop_server stop dbs@127.0.0.1 dbs
