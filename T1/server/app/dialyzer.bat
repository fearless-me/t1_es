cls
@echo off
cd ../
dialyzer --build_plt --apps erts kernel stdlib mnesia
dialyzer -r ./app/game/ebin -o ./app/dialyzer-game.log   --fullpath --dump_callgraph callg.raw
pause