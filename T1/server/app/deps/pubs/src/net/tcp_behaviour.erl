%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 一月 2018 20:09
%%%-------------------------------------------------------------------
-module(tcp_behaviour).
-author("mawenhong").

%% API
-callback on_init(Socket::any()) -> State ::any().
-callback on_data(Socket::any(), Data :: binary()) -> ok.
-callback on_close(Socket::any(), Reason ::term()) -> ok.

-callback on_info_msg(Info::any()) -> ok.
-callback on_call_msg(Request::any(), From::pid())-> Reply :: any().
-callback on_cast_msg(Request :: any) -> ok.
-callback on_net_msg(Msg :: any) -> ok.