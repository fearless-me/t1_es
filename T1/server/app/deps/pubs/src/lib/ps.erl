%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 一月 2018 16:57
%%%-------------------------------------------------------------------
-module(ps).
-author("mawenhong").

%% API
-export([
%% send(MsgId) -> MsgId
%% send(MsgId, Msg) -> {MsgId, Msg}
%% send_with_from(_, MsgId, Msg) -> {MsgId, Msg, self()}
%% send_with_from(_, MsgId, Msg, FromPid) -> {MsgId, Msg, FromPid}
    send/2,
    send/3,
    send_with_from/2,
    send_with_from/3,
    send_with_from/4
]).
%%
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
send(Dst, Msg) when is_tuple(Dst)->
    erlang:send(Dst, Msg).
%%
send(undefined, _, _) -> ok;
send(0,_,_)-> ok;
send(Name, MsgId, Msg) when is_atom(Name), is_atom(MsgId) ->
    case whereis(Name) of
        undefined ->
            case global:whereis_name(Name) of
                undefined -> skip;
                Pid -> erlang:send(Pid, {MsgId,Msg})
            end;
        Pid -> erlang:send(Pid, {MsgId,Msg})
    end;
send(Pid, MsgId, Msg) when is_pid(Pid), is_atom(MsgId) ->
    erlang:send(Pid, {MsgId,Msg});
send(Dst,MsgId, Msg) when is_tuple(Dst), is_atom(MsgId)->
    erlang:send(Dst, {MsgId,Msg}).

send_with_from(undefined, _) -> ok;
send_with_from(0, _)-> ok;
send_with_from(Name, MsgId) when is_atom(Name), is_atom(MsgId) ->
    case whereis(Name) of
        undefined ->
            case global:whereis_name(Name) of
                undefined -> skip;
                Pid -> erlang:send(Pid, {MsgId, self()})
            end;
        Pid -> erlang:send(Pid, {MsgId, self()})
    end;
send_with_from(Pid, MsgId) when is_pid(Pid), is_atom(MsgId) ->
    erlang:send(Pid, {MsgId,self()});
send_with_from(Dst, MsgId) when is_tuple(Dst), is_atom(MsgId)->
    erlang:send(Dst, {MsgId,self()}).

send_with_from(undefined, _, _) -> ok;
send_with_from(0, _, _)-> ok;
send_with_from(Name, MsgId, Msg) when is_atom(Name), is_atom(MsgId) ->
    case whereis(Name) of
        undefined ->
            case global:whereis_name(Name) of
                undefined -> skip;
                Pid -> erlang:send(Pid, {MsgId, Msg, self()})
            end;
        Pid -> erlang:send(Pid, {MsgId, Msg, self()})
    end;
send_with_from(Pid, MsgId, Msg) when is_pid(Pid), is_atom(MsgId) ->
    erlang:send(Pid, {MsgId, Msg,self()});
send_with_from(Dst, MsgId, Msg) when is_tuple(Dst), is_atom(MsgId)->
    erlang:send(Dst, {MsgId, Msg,self()}).

send_with_from(undefined, _, _, _) -> ok;
send_with_from(0, _, _, _)-> ok;
send_with_from(Name, MsgId, Msg, From) when is_atom(Name) ->
    case whereis(Name) of
        undefined ->
            case global:whereis_name(Name) of
                undefined -> skip;
                Pid -> erlang:send(Pid, {MsgId, Msg,From})
            end;
        Pid -> erlang:send(Pid, {MsgId, Msg,From})
    end;
send_with_from(Pid, MsgId, Msg, From) when is_pid(Pid) ->
    erlang:send(Pid, {MsgId, Msg,From});
send_with_from(Dst, MsgId, Msg, From) when is_tuple(Dst)->
    erlang:send(Dst, {MsgId, Msg,From}).
