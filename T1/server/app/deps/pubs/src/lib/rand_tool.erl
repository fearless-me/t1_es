%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%  伪随机
%%% @end
%%% Created : 25. 五月 2018 16:39
%%%-------------------------------------------------------------------
-module(rand_tool).
-author("mawenhong").

-include("common_def.hrl").

%% API
-export([
    new/0, new/1,
    rand/0, rand/1, rand/2,
    seed/0,
    prob/1
]).


-define(INT32_MAX, 2147483647).
-define(UINT32_MAX, 4294967295).
-define(RAND_KEY, fake_rand_process_key___).

-spec new() -> integer().
new() ->
    Key = os:system_time(seconds),
    erlang:put(?RAND_KEY, Key),
    Key.

-spec new(Seed :: integer()) -> Seed :: integer().
new(Seed) ->
    erlang:put(?RAND_KEY, Seed),
    Seed.

prob(FProb) ->
    X = erlang:trunc(FProb * ?PERCENT),
    X =< rand_tool:rand(1, ?PERCENT).

-spec rand() -> integer().
rand() ->
    Key1 = ensure_new(),
    % gcc 线性同余随机数生成器
    Key2 = ((Key1 * 1103515245 + 12345)) band ?UINT32_MAX,
%%    <<Key3:32/signed-little>> = <<Key2:32/unsigned-little>>,

    Key3 = case Key2 > ?INT32_MAX of
               true ->
                   0 - (((Key2 - 1) band ?INT32_MAX) bxor ?INT32_MAX);
               _Any ->
                   (Key2 band ?UINT32_MAX)
           end,

    erlang:put(?RAND_KEY, Key3),
    (Key3 bsr 1) band ?INT32_MAX.


-spec rand(N :: integer() ) -> integer().
rand(N) when N >= 1 -> rand_tool:rand(1, N).

-spec rand(Min :: integer(), Max :: integer()) -> integer().
rand(Min, Min) -> Min;
rand(Min, Max) ->
    Min + (rand_tool:rand() rem (Max - Min + 1)).

-spec seed() -> integer().
seed() ->
    ensure_new().
%%
-spec ensure_new() -> integer().
ensure_new() ->
    case erlang:get(?RAND_KEY) of
        undefined -> rand_tool:new();
        Key -> Key
    end.

