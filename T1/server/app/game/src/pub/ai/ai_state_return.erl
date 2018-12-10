%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 十二月 2018 16:00
%%%-------------------------------------------------------------------
-module(ai_state_return).
-author("Administrator").

%% API
-export([on_enter/1, on_exit/1, update/1, on_event/2]).

on_enter(Uid) ->
    mod_ai:start_return(Uid),
%%    object_state:set(Uid, ?Invincible)
    mod_ai:clear_all_enmity(Uid),
    mod_buff:del_debuff(Uid),
    
    ok.

on_exit(_Uid) ->
    %%todo 设置生命到最大血
    %%     dfadsfads

    %%object_state:unset(Uid, ?Invincible)

    ok.

update(Uid) ->
    mod_ai:update_return(Uid),
    ok.

on_event(_Uid, _Event) -> ok.