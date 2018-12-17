%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十二月 2018 16:35
%%%-------------------------------------------------------------------
-module(cs_db_checker).
-author("Administrator").

-include("logger.hrl").
-include("pub_def.hrl").
-include("common_logdb_month_table.hrl").


%% API
-export([tables/0, check/1, info/1]).
-export([year_month/0]).

tables() ->
    [misc:to_atom(Table) || Table <- ?CENTER_MONTH_TABLE].

check([])-> ok;
check([Table | Tables])->
    ?WARN("\t check table ~p",[Table]),
    gs_db_interface:action_log_check_(random:uniform(10000), Table),
    check(Tables).

info({dblog_month_check_ack,Table, true})->
    db_checker:succeed(Table);
info({dblog_month_check_ack,Table, Res})->
    db_checker:failed(Table, Res),
    ?ERROR("check table ~p, ~p",[Table, Res]);
info(_Info)->
    ok.


year_month()->
    case application:get_env(center, month_table) of
        {ok, Val} -> Val;
        _ ->
            [Value | _] = misc_time:last_two_month(),
            application:set_env(center, month_table, Value),
            Value
    end.
