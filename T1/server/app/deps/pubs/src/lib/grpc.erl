
-module(grpc).

%%% Library interface
-export([call/3, call/4, call/5, call/6]).

%% Async calls
-export([async_call/3, async_call/4, yield/1, nb_yield/1, nb_yield/2]).

%% Cast and safe_cast
-export([cast/3, cast/4, cast/5]).

%% Parallel evaluation
-export([eval_everywhere/3, eval_everywhere/4, eval_everywhere/5]).

%% Parallel sync call
-export([multicall/3, multicall/4, multicall/5]).

%% Asynchronous broadcast
-export([abcast/2, abcast/3]).

%% Synchronous broadcast
-export([sbcast/2, sbcast/3]).

%% Misc functions
-export([nodes/0]).

%% client hash
-export([client_hash/2]).

%%% ===================================================
%%% Library interface
%%% ===================================================
-type node_or_tuple() :: atom() | {atom(), term()}.
%% All functions are GUARD-ed in the sender module, no
%% need for the overhead here
-spec async_call(node_or_tuple(), atom() | tuple(), atom() | function()) -> term() | {badrpc, term()} | {badtcp | term()}.
async_call({Node, Key}, M, F) ->
    gen_rpc:async_call(client_hash(Node, Key), M, F);
async_call(Node, M, F) ->
    gen_rpc:async_call(Node, M, F).

-spec async_call(node_or_tuple(), atom() | tuple(), atom() | function(), list()) -> term() | {badrpc, term()} | {badtcp | term()}.
async_call({Node, Key}, M, F, A) ->
    gen_rpc:async_call(client_hash(Node, Key), M, F, A);
async_call(Node, M, F, A) ->
    gen_rpc:async_call(Node, M, F, A).

-spec call(node_or_tuple(), atom() | tuple(), atom() | function()) -> term() | {badrpc, term()} | {badtcp | term()}.
call({Node, Key}, M, F) ->
    gen_rpc:call(client_hash(Node, Key), M, F);
call(Node, M, F) ->
    gen_rpc:call(Node, M, F).

-spec call(node_or_tuple(), atom() | tuple(), atom() | function(), list()) -> term() | {badrpc, term()} | {badtcp | term()}.
call({Node, Key}, M, F, A) ->
    gen_rpc:call(client_hash(Node, Key), M, F, A);
call(Node, M, F, A) ->
    gen_rpc:call(Node, M, F, A).

-spec call(node_or_tuple(), atom() | tuple(), atom() | function(), list(), timeout() | undefined) ->
    term() | {badrpc, term()} | {badtcp | term()}.
call({Node, Key}, M, F, A, RecvTO) ->
    gen_rpc:call(client_hash(Node, Key), M, F, A, RecvTO);
call(Node, M, F, A, RecvTO) ->
    gen_rpc:call(Node, M, F, A, RecvTO).

-spec call(node_or_tuple(), atom() | tuple(), atom() | function(), list(), timeout() | undefined, timeout() | undefined) -> term() | {badrpc, term()} | {badtcp | term()}.

call({Node, Key}, M, F, A, RecvTO, SendTO) ->
    gen_rpc:call(client_hash(Node, Key), M, F, A, RecvTO, SendTO);
call(Node, M, F, A, RecvTO, SendTO) ->
    gen_rpc:call(Node, M, F, A, RecvTO, SendTO).

-spec cast(node_or_tuple(), atom() | tuple(), atom() | function()) -> true.
cast({Node, Key}, M, F) ->
    gen_rpc:cast(client_hash(Node, Key), M, F);
cast(Node, M, F) ->
    gen_rpc:cast(Node, M, F).

-spec cast(node_or_tuple(), atom() | tuple(), atom() | function(), list()) -> true.
cast({Node, Key}, M, F, A) ->
    gen_rpc:cast(client_hash(Node, Key), M, F, A);
cast(Node, M, F, A) ->
    gen_rpc:cast(Node, M, F, A).

-spec cast(node_or_tuple(), atom() | tuple(), atom() | function(), list(), timeout() | undefined) -> true.
cast({Node, Key}, M, F, A, SendTO) ->
    gen_rpc:cast(client_hash(Node, Key), M, F, A, SendTO);
cast(Node, M, F, A, SendTO) ->
    gen_rpc:cast(Node, M, F, A, SendTO).

-spec eval_everywhere([node_or_tuple()], atom() | tuple(), atom() | function()) -> abcast.
eval_everywhere(Nodes, M, F) ->
    gen_rpc:eval_everywhere(Nodes, M, F).

-spec eval_everywhere([node_or_tuple()], atom() | tuple(), atom() | function(), list()) -> abcast.
eval_everywhere(Nodes, M, F, A) ->
    gen_rpc:eval_everywhere(Nodes, M, F, A).

-spec eval_everywhere([node_or_tuple()], atom() | tuple(), atom() | function(), list(), timeout() | undefined) -> abcast.
eval_everywhere(Nodes, M, F, A, SendTO) ->
    gen_rpc:eval_everywhere(Nodes, M, F, A, SendTO).

-spec yield(tuple()) -> term() | {badrpc, term()}.
yield(Key) ->
    gen_rpc:yield(Key).

-spec nb_yield(tuple()) -> {value, term()} | {badrpc, term()}.
nb_yield(Key) ->
    gen_rpc:nb_yield(Key).

-spec nb_yield(tuple(), timeout()) -> {value, term()} | {badrpc, term()}.
nb_yield(Key, Timeout) ->
    gen_rpc:nb_yield(Key, Timeout).

-spec multicall(atom() | tuple(), atom(), list()) -> {list(), list()}.
multicall(M, F, A) ->
    gen_rpc:multicall(M, F, A).

-spec multicall(list() | atom() | tuple(), atom() | tuple(), atom() | list(), list() | timeout()) -> {list(), list()}.
multicall(NodesOrModule, MorF, ForA, AorTimeout) ->
    gen_rpc:multicall(NodesOrModule, MorF, ForA, AorTimeout).

-spec multicall(list(), atom() | tuple(), atom(), list(), timeout()) -> {list(), list()}.
multicall(Nodes, M, F, A, Timeout) ->
    gen_rpc:multicall(Nodes, M, F, A, Timeout).

-spec abcast(atom(), term()) -> abcast.
abcast(Name, Msg) when is_atom(Name) ->
    gen_rpc:abcast(Name, Msg).

-spec abcast(list(), atom(), term()) -> abcast.
abcast(Nodes, Name, Msg) when is_list(Nodes), is_atom(Name) ->
    gen_rpc:abcast(Nodes, Name, Msg).

-spec sbcast(atom(), term()) -> {list(), list()}.
sbcast(Name, Msg) when is_atom(Name) ->
    gen_rpc:sbcast(Name, Msg).

-spec sbcast(list(), atom(), term()) -> {list(), list()}.
sbcast(Nodes, Name, Msg) when is_list(Nodes), is_atom(Name) ->
    gen_rpc:sbcast(Nodes, Name, Msg).

-spec nodes() -> list().
nodes() ->
    gen_rpc:nodes().

-define(MULTI_CLIENT, 2).
client_hash(Node, _Key) when ?MULTI_CLIENT == 1->
    Node;
client_hash(Node, Key)  when is_integer(Key) ->
    {Node, Key rem ?MULTI_CLIENT + 1};
client_hash(Node, Key) ->
    {Node, erlang:phash2(Key) rem ?MULTI_CLIENT + 1}.
