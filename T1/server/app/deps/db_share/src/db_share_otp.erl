%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 八月 2018 10:49
%%%-------------------------------------------------------------------
-module(db_share_otp).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("pub_def.hrl").
-include("pub_rec.hrl").



%% API
-export([add_tab/3, get_tab/2]).
-export([start_link/0]).
-export([mod_init/1, on_terminate/2, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).



-define(ETS_SHARE_TABLE_NAME, ets_share_table_name).
-record(share_table_name, {key, tab, sid, tab_name}).

add_tab(Sid, Tab, TabName) ->
    Info = #share_table_name{
        key = {Sid, Tab},
        tab = Tab,
        sid = Sid,
        tab_name = TabName
    },
    ets:insert(?ETS_SHARE_TABLE_NAME, Info),
    ok.

get_tab(Sid, Tab) ->
    ets:lookup_element(
        ?ETS_SHARE_TABLE_NAME, {Sid, Tab}, #share_table_name.tab_name).


%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [], []).


%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    ets:new(
        ?ETS_SHARE_TABLE_NAME,
        [
            named_table,
            public,
            {keypos, #share_table_name.key},
            ?ETS_RC, ?ETS_WC
        ]
    ),
    {ok, #{}}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
on_terminate(_Reason, _State) ->
    ok.