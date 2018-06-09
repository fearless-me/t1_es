%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 20:24
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(COMMON_RECORD_HRL).
-define(COMMON_RECORD_HRL, true).

%%
-record(r_login_req, {plat_name="", plat_account_name = "", access_token = "", player_pid = 0}).
%%
-record(r_login_ack, {error = 0, account_info = undefined}).
%%
-record(r_account_info, {account_id = 0, account_name = ""}).
%%
-record(r_create_player_req, {sid, name, camp, career, race, sex, head, x, y, mid}).
%%
-record(r_create_player_ack, {error = 0, uid = 0, acc_id = 0, name = "", camp = 0, career = 0, race = 0, sex = 0, head = 0}).
%%
%%-record(r_gs_db_info,{node = '', pid = 0, req_no = 0, status = 0}).
%%






-endif.
