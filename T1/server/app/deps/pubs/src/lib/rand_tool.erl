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
-export([new/0]).
-export([new/1]).
-export([rand/0]).
-export([seed/0]).


-define(INT32_MAX, 2147483647).
-define(RAND_KEY, fake_rand_process_key___).

-spec new() -> integer().
new() ->
    Key = os:system_time(seconds),
    put(?RAND_KEY, Key),
    Key.

new(Seed) ->
    put(?RAND_KEY, Seed),
    Seed.

-spec rand() -> integer().
rand() ->
    Key1 = ensure_new(),
    % gcc
    Key2 = ((Key1 * 1103515245 + 12345) bsr 1) band ?INT32_MAX ,
    put(?RAND_KEY, Key2),
    Key2.

seed() ->
    ensure_new().
%%
ensure_new() ->
    case get(?RAND_KEY) of
        undefined -> new();
        Key -> Key
    end.

