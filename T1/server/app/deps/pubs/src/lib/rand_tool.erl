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

%% API
-export([
    new/0, new/1,
    rand/0, rand/2,
    seed/0
]).


-define(INT32_MAX, 2147483647).
-define(UINT32_MAX, 4294967295).
-define(RAND_KEY, fake_rand_process_key___).

-spec new() -> integer().
new() ->
    Key = os:system_time(seconds),
    put(?RAND_KEY, Key),
    Key.

-spec new(Seed :: integer()) -> Seed :: integer().
new(Seed) ->
    put(?RAND_KEY, Seed),
    Seed.

-spec rand() -> integer().
rand() ->
    Key1 = ensure_new(),
    % gcc 线性同余随机数生成器
    Key2 = ((Key1 * 1103515245 + 12345)) band ?UINT32_MAX,
%%    <<Key3:32/signed-little>> = <<Key2:32/unsigned-little>>,
    
    Key3 =
        if
            Key2 > ?INT32_MAX ->
                0 - (((Key2 - 1) band ?INT32_MAX) bxor ?INT32_MAX);
            true ->
                (Key2 band ?UINT32_MAX)
        end,
    
    put(?RAND_KEY, Key3),
    (Key3 bsr 1) band ?INT32_MAX.

-spec rand(Min :: integer(), Max :: integer()) -> integer().
rand(Min, Min) -> Min;
rand(Min, Max) ->
    Min + (rand() rem (Max - Min + 1)).

-spec seed() -> integer().
seed() ->
    ensure_new().
%%
-spec ensure_new() -> integer().
ensure_new() ->
    case get(?RAND_KEY) of
        undefined -> new();
        Key -> Key
    end.

