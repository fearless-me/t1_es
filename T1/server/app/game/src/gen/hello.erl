%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 七月 2018 17:05
%%%-------------------------------------------------------------------
-module(hello).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").

%% API
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    %% erlang:process_flag(trap_exit, true),
    %% erlang:process_flag(priority, high),
    ProcessName = misc:create_atom(hello, [t]),
    catch true = erlang:register(ProcessName, self()),

    {ok, #{}}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info(loop_map, State) ->
    Old = erlang:process_info(self(), memory),
    List1 =
        case get(m) of
            undefined ->
                L = lists:seq(1, 100000),
                maps:from_list(lists:zip(L, L));
            Map ->
                D = rand_tool:rand(1, 100000),
                ?DEBUG("delete key ~p",[D]),
                maps:remove(D, Map)
        end,
    put(m, List1),
    New = erlang:process_info(self(), memory),
    ?DEBUG("~nloop_map:~n~p~n~p~nsize:~p",[Old, New, maps:size(List1)]),

    {noreply, State};
do_handle_info(loop, State) ->
    Old = erlang:process_info(self(), memory),
    List1 =
        case get(x) of
            undefined ->
                lists:seq(1, 100000);
            L ->
                D = rand_tool:rand(1, 100000),
                ?DEBUG("delete key ~p",[D]),
                lists:keydelete(D, 1, L)
        end,
    put(x, List1),
    New = erlang:process_info(self(), memory),

    ?DEBUG("~nloop:~n~p~n~p",[Old, New]),
    {noreply, State};
do_handle_info(new, State) ->
    Old = erlang:process_info(self(), memory),
    Ref = erlang:make_ref(),
    List1 = lists:seq(1, 100000),
    put(Ref, List1),
    New = erlang:process_info(self(), memory),

    ?DEBUG("~nnew:~n~p~n~p",[Old, New]),
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.


