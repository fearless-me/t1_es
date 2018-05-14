%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 一月 2018 16:57
%%%-------------------------------------------------------------------
-module(ps_mgr).
-author("mawenhong").

%% API
-export([
%% send(,Msg) -> Msg
%% send2(_,Msg) -> {Msg, FromPid}
%% send3(_,Msg, FromPid) -> {Msg, FromPid}
    send/2, send2/2, send3/3,
    is_alive/1
]).

send(undefined, _) -> ok;
send(0,_)-> ok;
send(Name, Msg) when is_atom(Name) ->
    case whereis(Name) of
        undefined ->
            case global:whereis_name(Name) of
                undefined -> skip;
                Pid -> erlang:send(Pid, Msg)
            end;
        Pid -> erlang:send(Pid, Msg)
    end;
send(Pid, Msg) when is_pid(Pid) ->
    erlang:send(Pid, Msg);
send(Dst,Msg) when is_tuple(Dst)->
    erlang:send(Dst, Msg).

send2(undefined, _) -> ok;
send2(0,_)-> ok;
send2(Name, Msg) when is_atom(Name) ->
    case whereis(Name) of
        undefined ->
            case global:whereis_name(Name) of
                undefined -> skip;
                Pid -> erlang:send(Pid, {Msg,self()})
            end;
        Pid -> erlang:send(Pid, {Msg,self()})
    end;
send2(Pid, Msg) when is_pid(Pid) ->
    erlang:send(Pid, {Msg,self()});
send2(Dst,Msg) when is_tuple(Dst)->
    erlang:send(Dst, {Msg,self()}).

send3(undefined, _,_) -> ok;
send3(0,_,_)-> ok;
send3(Name, Msg, From) when is_atom(Name) ->
    case whereis(Name) of
        undefined ->
            case global:whereis_name(Name) of
                undefined -> skip;
                Pid -> erlang:send(Pid, {Msg,From})
            end;
        Pid -> erlang:send(Pid, {Msg,From})
    end;
send3(Pid, Msg, From) when is_pid(Pid) ->
    erlang:send(Pid, {Msg,From});
send3(Dst,Msg, From) when is_tuple(Dst)->
    erlang:send(Dst, {Msg,From}).


is_alive(0)-> false;
is_alive(undefined) -> false;
is_alive(Name) when is_atom(Name) ->
    case whereis(Name) of
        undefined -> false;
        Pid -> erlang:is_process_alive(Pid)
    end;
is_alive(Pid) when is_pid(Pid) ->
    erlang:is_process_alive(Pid).
