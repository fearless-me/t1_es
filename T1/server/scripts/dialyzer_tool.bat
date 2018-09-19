cls
@echo off
echo build plt
dialyzer.exe --build_plt --apps erts kernel stdlib mnesia

echo check game code
@dialyzer.exe -r ../app/game/ebin -I "../app/game/include" -I "../app/game/src/pub/config" -I "../app/game/src/pub/netmsg" -I "../app/common/include" -I "../app/deps/pubs/include" -I "../app/deps/gen_rpc/include" -I "../app/deps/mysql-otp/include"  -I "../app/center/include"  -o ../app/dialyzer-game.log   --fullpath --dump_callgraph callg.raw
dialyzer -r ../app/game/src ../app/deps/pubs/src ../app/deps/db_proxy/src ../app/deps/db_share/src ../app/common/src --src -I "../app/game/include" -I "../app/game/src/pub/config" -I "../app/game/src/pub/netmsg" -I "../app/common/include" -I "../app/deps/pubs/include" -I "../app/deps/gen_rpc/include" -I "../app/deps/mysql-otp/include"  -I "../app/center/include"  -o ../dialyzer-game.log   --fullpath --dump_callgraph ./callg.raw


echo check center code
@dialyzer.exe -r ../app/center/ebin -I "../app/game/include" -I "../app/game/src/pub/config" -I "../app/game/src/pub/netmsg" -I "../app/common/include" -I "../app/deps/pubs/include" -I "../app/deps/gen_rpc/include" -I "../app/deps/mysql-otp/include"  -I "../app/center/include"  -o ../app/dialyzer-center.log   --fullpath --dump_callgraph callc.raw
dialyzer -r ../app/center/src ../app/deps/pubs/src ../app/deps/db_proxy/src ../app/deps/db_share/src ../app/common/src --src -I "../app/game/include" -I "../app/game/src/pub/config" -I "../app/game/src/pub/netmsg" -I "../app/common/include" -I "../app/deps/pubs/include" -I "../app/deps/gen_rpc/include" -I "../app/deps/mysql-otp/include"  -I "../app/center/include"  -o ../dialyzer-center.log   --fullpath --dump_callgraph ./callc.raw
pause