cls
@echo off
echo build plt
dialyzer.exe --build_plt --apps erts kernel stdlib mnesia

echo check game code
dialyzer.exe -r ../app/game/ebin -o ../app/dialyzer-game.log   --fullpath --dump_callgraph callg.raw
@dialyzer -r ../app/game/src ../app/deps/pubs/src --src -o ../dialyzer-game.log   --fullpath --dump_callgraph callg.raw


echo check center code
dialyzer.exe -r ../app/center/ebin -o ../app/dialyzer-center.log   --fullpath --dump_callgraph callc.raw
@dialyzer -r ../app/center/src 	../app/deps/pubs/src ../app/deps/db_proxy/src ../app/deps/db_share/src --src -o ../dialyzer-center.log   --fullpath --dump_callgraph callc.raw
pause