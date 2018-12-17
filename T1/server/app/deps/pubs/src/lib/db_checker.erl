%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 十二月 2018 14:31
%%%-------------------------------------------------------------------
-module(db_checker).
-author("Administrator").

-behaviour(gen_serverw).
-include("logger.hrl").

-export([run/0, succeed/1, failed/2, is_all_done/0]).

%% API
-export([start_link/1]).
-export([mod_init/1, on_terminate/2, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

run() -> gen_server:cast(?MODULE, start_check).
succeed(Table) -> gen_server:cast(?MODULE, {succeed, Table}).
failed(Table, Error) -> gen_server:cast(?MODULE, {failed, Table, Error}).
is_all_done() -> gen_server:call(?MODULE, all_done).


%%%===================================================================
%% define
-record(state, {all = [], todo = [], tips = [], mod}).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link(Mod) ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, Mod, []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(Mod) ->
    erlang:process_flag(trap_exit, true),
    Tables = Mod:tables(),
    db_checker:run(),
    {ok, #state{mod = Mod, all = Tables, todo = Tables}}.

%%--------------------------------------------------------------------
do_handle_call(all_done, _From, State) ->
    Res = case State#state.todo of
              [] -> true;
              All->
                  case State#state.tips of
                      [] -> All;
                      Tip -> Tip
                  end
          end,
    {reply, Res, State};
do_handle_call(Request, From, State) ->
    ?ERROR("call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info(start_check, #state{mod = Mod, all = All} = State) ->
    Mod:check(All),
    {noreply, State#state{todo = All, tips = []}};
do_handle_info(Info, #state{mod = Mod} = State) ->
    Mod:info(Info),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(start_check, #state{mod = Mod, all = All} = State) ->
    Mod:check(All),
    {noreply, State#state{todo = All}};
do_handle_cast({succeed, Table}, #state{todo = Todo} = State) ->
    Left = i_done(lists:delete(Table, Todo)),
    {noreply, State#state{todo = Left}};
do_handle_cast({failed, _Table, Error}, #state{tips = Tips} = State) ->
    {noreply, State#state{tips = [Error | Tips]}};
do_handle_cast(Request, State) ->
    ?ERROR("cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
on_terminate(_Reason, _State) ->
    ok.

%%--------------------------------------------------------------------
i_done([]) ->
    Milliseconds = next_day_milliseconds(),
    erlang:send_after(Milliseconds, self(), start_check),
    [];
i_done(Any) ->
    Any.


next_day_milliseconds() ->
    {H, M, S} = erlang:time(),
    ((24 - H) * 3600 - M * 60 - S) * 1000.
