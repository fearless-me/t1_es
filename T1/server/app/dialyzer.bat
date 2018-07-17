cls
@echo off
cd ../
dialyzer --build_plt --apps erts kernel stdlib mnesia
@dialyzer -r ./app/game/ebin -o ./app/dialyzer-game.log   --fullpath --dump_callgraph callg.raw
dialyzer -r ./app/game/src ./deps/pubs/src --src -o ./app/dialyzer-game.log   --fullpath --dump_callgraph callg.raw
pause