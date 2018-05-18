%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 一月 2018 10:48
%%%-------------------------------------------------------------------
-module(misc).
-author("mawenhong").

%% API
-export([start_applications/1, ensure_all_applications_started/1]).
-export([make_atom/2,atom_to_binary/1]).
-export([interval_operation/5]).
-export([b2i/1, i2b/1]).
-export([ntoa/1, ntoab/1]).
-export([ip/0, peername/1, ip_string/1]).
-export([ceil/1,mod_1/2, floor/1, clamp/3]).
-export([get_value/3]).
-export([stacktrace/0, stacktraceE/0]).
-export([milli_seconds/0, seconds/0]).
-export([parse_information_unit/1]).
-export([register_process/3]).
-export([create_process_name/2]).
-export([register_name/1]).
-export([is_alive/1]).
-export([to_atom/1]).
-export([list_to_string/2]).

%%%-------------------------------------------------------------------
atom_to_binary(A) ->
    list_to_binary(atom_to_list(A)).

create_process_name(Prefix, List) ->
    to_atom(lists:concat(lists:flatten([Prefix] ++ lists:map(fun(T) -> ['_', T] end, List)))).

register_process(Pid, Prefix, List) ->
    ProcessName = misc:create_process_name(Prefix, List),
    erlang:register(ProcessName, Pid).

register_name(Pid) ->
    case erlang:process_info(Pid, registered_name) of
        {registered_name,Name} -> Name;
        _ -> unknown
    end.


is_alive(0)-> false;
is_alive(undefined) -> false;
is_alive(Name) when is_atom(Name) ->
    case whereis(Name) of
        undefined -> false;
        Pid -> erlang:is_process_alive(Pid)
    end;
is_alive(Pid) when is_pid(Pid) ->
    erlang:is_process_alive(Pid).



%% @doc convert other type to atom
to_atom(Msg) when is_atom(Msg) ->
    Msg;
to_atom(Msg) when is_binary(Msg) ->
    list_to_atom2(binary_to_list(Msg));
to_atom(Msg) when is_list(Msg) ->
    list_to_atom2(Msg);
to_atom(_) ->
    throw(other_value).  %%list_to_atom("").

list_to_atom2(List) when is_list(List) ->
    case catch(list_to_existing_atom(List)) of
        {'EXIT', _} -> erlang:list_to_atom(List);
        Atom when is_atom(Atom) -> Atom
    end.

list_to_string([], SuffixStr)-> SuffixStr;
list_to_string(List, SuffixStr)-> string:join(List, SuffixStr).

-spec ceil(X) -> integer() when X::number().
ceil(X) ->
    T = trunc(X),
    if
        X - T == 0 ->
            T;
        true ->
            if
                X > 0 ->
                    T + 1;
                true ->
                    T
            end
    end.

-spec floor(X) -> integer() when X::number().
floor(X) ->
    T = trunc(X),
    if
        X - T == 0 ->
            T;
        true ->
            if
                X > 0 ->
                    T;
                true ->
                    T-1
            end
    end.

-spec clamp(X,Min,Max) -> Min | X | Max when X::number(),Min::number(),Max::number().
clamp(X,Min,Max) when Min =< Max andalso X < Min ->
    Min;
clamp(X,Min,Max) when Min =< Max andalso X > Max ->
    Max;
clamp(X,Min,Max) when Min =< Max ->
    X.


%% Faster alternative to proplists:get_value/3.
get_value(Key, Opts, Default) ->
    case lists:keyfind(Key, 1, Opts) of
        {_, Value} -> Value;
        _ -> Default
    end.

stacktrace()->
    erlang:get_stacktrace().

stacktraceE()->
   try erlang:error(callStack) catch _ : _ -> erlang:get_stacktrace() end.

milli_seconds()->
    os:system_time(milli_seconds).

seconds() ->
    os:system_time(seconds).

%% Format IPv4-mapped IPv6 addresses as IPv4, since they're what we see
%% when IPv6 is enabled but not used (i.e. 99% of the time).
ntoa({0,0,0,0,0,16#ffff,AB,CD}) ->
    inet_parse:ntoa({AB bsr 8, AB rem 256, CD bsr 8, CD rem 256});
ntoa(IP) ->
    inet_parse:ntoa(IP).

ntoab(IP) ->
    Str = ntoa(IP),
    case string:str(Str, ":") of
        0 -> Str;
        _ -> "[" ++ Str ++ "]"
    end.


%获取本机IP地址
-spec ip() -> string().
ip() ->
    {ok, Hostname} = inet:gethostname(),
    {ok, Address}  = inet:getaddr(Hostname, inet),
    ip_string(Address).

-spec peername(Socket) -> {IP,Port} when
    Socket::port(),IP::string(),Port::integer().
peername(Socket) ->
    case inet:peername(Socket) of
        {ok, {Address, Port}} ->
            {ip_string(Address),Port};
        _ ->
            {"0.0.0.0",0}
    end.

ip_string(Address)->
    AList = tuple_to_list(Address),
    [A1,A2,A3,A4 | _] = AList,
    io_lib:format( "~w.~w.~w.~w", [A1,A2,A3,A4] ).

start_applications(App)->
    case application:start(App) of
        ok -> true;
        {error,{already_started,App}}-> true;
        {error,Reason} -> Reason
    end.

ensure_all_applications_started(App) ->
    case application:ensure_all_started(App) of
        {ok,_} -> true;
        {error,Reason} -> Reason
    end.

mod_1(Val, Base) -> (Val rem Base) + 1.


make_atom(Fmt,Args)->
    list_to_atom(lists:flatten(io_lib:format(Fmt, Args))).

b2i(true) -> 1;
b2i(false) -> 0;
b2i(1) -> 1;
b2i(0) -> 0.

i2b(0) -> false;
i2b(1) -> true;
i2b(false) -> false;
i2b(true) -> true.

%% Ideally, you'd want Fun to run every IdealInterval. but you don't
%% want it to take more than MaxRatio of IdealInterval. So if it takes
%% more then you want to run it less often. So we time how long it
%% takes to run, and then suggest how long you should wait before
%% running it again with a user specified max interval. Times are in millis.
interval_operation({M, F, A}, MaxRatio, MaxInterval, IdealInterval, LastInterval) ->
    {Micros, Res} = timer:tc(M, F, A),
    {Res, Micros, case {Micros > 1000 * (MaxRatio * IdealInterval),
        Micros > 1000 * (MaxRatio * LastInterval)} of
              {true,  true}  -> lists:min([MaxInterval,
                  round(LastInterval * 1.5)]);
              {true,  false} -> LastInterval;
              {false, false} -> lists:max([IdealInterval,
                  round(LastInterval / 1.5)])
          end}.

parse_information_unit(Value) when is_integer(Value) -> {ok, Value};
parse_information_unit(Value) when is_list(Value) ->
    case re:run(Value,
        "^(?<VAL>[0-9]+)(?<UNIT>kB|KB|MB|GB|kb|mb|gb|Kb|Mb|Gb|kiB|KiB|MiB|GiB|kib|mib|gib|KIB|MIB|GIB|k|K|m|M|g|G)?$",
        [{capture, all_but_first, list}]) of
        {match, [[], _]} ->
            {ok, list_to_integer(Value)};
        {match, [Num]} ->
            {ok, list_to_integer(Num)};
        {match, [Num, Unit]} ->
            Multiplier = case Unit of
                             KiB when KiB =:= "k";  KiB =:= "kiB"; KiB =:= "K"; KiB =:= "KIB"; KiB =:= "kib" -> 1024;
                             MiB when MiB =:= "m";  MiB =:= "MiB"; MiB =:= "M"; MiB =:= "MIB"; MiB =:= "mib" -> 1024*1024;
                             GiB when GiB =:= "g";  GiB =:= "GiB"; GiB =:= "G"; GiB =:= "GIB"; GiB =:= "gib" -> 1024*1024*1024;
                             KB  when KB  =:= "KB"; KB  =:= "kB"; KB =:= "kb"; KB =:= "Kb"  -> 1000;
                             MB  when MB  =:= "MB"; MB  =:= "mB"; MB =:= "mb"; MB =:= "Mb"  -> 1000000;
                             GB  when GB  =:= "GB"; GB  =:= "gB"; GB =:= "gb"; GB =:= "Gb"  -> 1000000000
                         end,
            {ok, list_to_integer(Num) * Multiplier};
        nomatch ->
            % log error
            {error, parse_error}
    end.

