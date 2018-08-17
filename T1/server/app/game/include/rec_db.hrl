%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 五月 2018 10:14
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(RECORD_DB_HRL).
-define(RECORD_DB_RECORD_HRL, true).

%%全国唯一账号表
-record(p_account, {aid,account,account_crc, plat_account, plat_name, device, imei, idfa, mac, create_time, version_hash_code}).
%% 角色数据表
-record(p_player,{aid, uid, sid, name, level, wing_level, sex, camp, race, career, head,
    map_id, line, x = 0.0, y = 0.0, old_map_id, old_line, old_x = 0.0, old_y = 0.0, data, version
}).


-endif.
