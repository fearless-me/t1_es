%% coding: latin-1
-module(gameMapCfg).
-compile(export_all).

getMapCfg(1)-> cfg_gamemapcfg1:getRow(1) ;
getMapCfg(2)-> cfg_gamemapcfg2:getRow(2) ;
getMapCfg(3)-> cfg_gamemapcfg3:getRow(3) ;
getMapCfg(4)-> cfg_gamemapcfg4:getRow(4) ;
getMapCfg(10170)-> cfg_gamemapcfg10170:getRow(10170) ;
getMapCfg(_)-> undefined.
