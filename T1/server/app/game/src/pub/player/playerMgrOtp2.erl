%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 玩家管理进程（2号进程），主要是用来为playerMgrOtp分摊压力，目前用于解决跨服数据同步的问题
%%% 注意，本进程不要处理登录，创建玩家进程相关的逻辑
%%% @end
%%% Created : 12. 七月 2018 17:17
%%%-------------------------------------------------------------------
-module(playerMgrOtp2).
-author("tiancheng").

-behaviour(myGenServer).

-include("playerPrivate.hrl").
-include("gsInc.hrl").
-include("main.hrl").

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3,
    handle_exception/3
]).

-define(SERVER, ?MODULE).

-record(state, {}).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @end
%%--------------------------------------------------------------------
-spec(start_link() ->
    {ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link() ->
    myGenServer:start_link({local, ?PsNamePlayerMgr_2}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%                     {ok, State, Timeout} |
%%                     ignore |
%%                     {stop, Reason}
%% @end
%%--------------------------------------------------------------------
-spec(init(Args :: term()) ->
    {ok, State :: #state{}} | {ok, State :: #state{}, timeout() | hibernate} |
    {stop, Reason :: term()} | ignore).
init([]) ->
    {ok, #state{}}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%%
%% @end
%%--------------------------------------------------------------------
-spec(handle_call(Request :: term(), From :: {pid(), Tag :: term()},
    State :: #state{}) ->
    {reply, Reply :: term(), NewState :: #state{}} |
    {reply, Reply :: term(), NewState :: #state{}, timeout() | hibernate} |
    {noreply, NewState :: #state{}} |
    {noreply, NewState :: #state{}, timeout() | hibernate} |
    {stop, Reason :: term(), Reply :: term(), NewState :: #state{}} |
    {stop, Reason :: term(), NewState :: #state{}}).
handle_call(_Request, _From, State) ->
    {reply, ok, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% @end
%%--------------------------------------------------------------------
-spec(handle_cast(Request :: term(), State :: #state{}) ->
    {noreply, NewState :: #state{}} |
    {noreply, NewState :: #state{}, timeout() | hibernate} |
    {stop, Reason :: term(), NewState :: #state{}}).
handle_cast(Request, State) ->
    ?ERROR("recv cast unknow info:~p", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
-spec(handle_info(Info :: timeout() | term(), State :: #state{}) ->
    {noreply, NewState :: #state{}} |
    {noreply, NewState :: #state{}, timeout() | hibernate} |
    {stop, Reason :: term(), NewState :: #state{}}).
handle_info({updateArunaCrossTask, _Pid, {RoleID, #rec_task{} = Task}}, State) ->
    case core:queryPlayerPidByRoleID(RoleID) of
        offline ->
            updateArunaCrossTask(RoleID, Task);
        Pid ->
            %% 在线，发给玩家模块去处理
            psMgr:cast(Pid, updateArunaCrossTask, Task)
    end,
    {noreply, State};

handle_info({fixSaveAllRune, _Pid, _Msg}, State) ->
    playerRune:fixSaveAllRune(),
    {noreply, State};

handle_info(Info, State) ->
    ?ERROR("recv info unknow info:~p", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
%%
%% @spec terminate(Reason, State) -> void()
%% @end
%%--------------------------------------------------------------------
-spec(terminate(Reason :: (normal | shutdown | {shutdown, term()} | term()),
    State :: #state{}) -> term()).
terminate(_Reason, _State) ->
    ok.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Convert process state when code is changed
%%
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%% @end
%%--------------------------------------------------------------------
-spec(code_change(OldVsn :: term() | {down, term()}, State :: #state{},
    Extra :: term()) ->
    {ok, NewState :: #state{}} | {error, Reason :: term()}).
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

handle_exception(Type,Why,State) ->
    myGenServer:default_handle_excetion(Type, Why, State).

%%%===================================================================
%%% Internal functions
%%%===================================================================

updateArunaCrossTask(RoleID, #rec_task{taskID = TaskID} = NewTask) ->
    case ets:lookup(ets_rec_playerdata, RoleID) of
        [#rec_playerdata{rec_task_accepted = Accepts} = PlayerData] ->
            case lists:keyfind(TaskID, #rec_task.taskID, Accepts) of
                #rec_task{} ->
                    NewAccepts = lists:keystore(TaskID, #rec_task.taskID, Accepts, NewTask),
                    ets:update_element(ets_rec_playerdata, RoleID, {#rec_playerdata.rec_task_accepted, NewAccepts}),
                    NewPlayerData = PlayerData#rec_playerdata{rec_task_accepted = NewAccepts},
                    gsSendMsg:sendMsg2PlayerDataMgr(saveOtherPlayerData, NewPlayerData),
                    ?INFO("updateArunaCrossTask roleID:~p, taskID:~p", [RoleID, TaskID]),
                    ok;
                _ ->
                    skip
            end;
        _ ->
            skip
    end,
    ok.