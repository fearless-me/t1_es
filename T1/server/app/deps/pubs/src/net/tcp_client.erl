
-module(tcp_client).
-author("Administrator").
-include("netmsg.hrl").
-include("netconf.hrl").
-include("logger.hrl").

%% API
-export([connect/1, c/1]).

c(Port) -> spawn(fun()-> tcp_client:connect(Port) end).

connect(Port)->
	tcp_codec:init(#net_conf{}),
	{ok,Socket} = ranch_tcp:connect({127,0,0,1}, Port, [{active, false}]),

	Msg1 = #pk_U2LS_Login_Normal{
		platformAccount = "test_net",
		platformName = "test",
		platformNickName = "",
		time = misc:seconds(),
		sign = "owner"
	},

	send_msg(Socket, Msg1),
	recv_msg(Socket),

	send_msg(Socket, #pk_GS2U_GoNewMap{tarMapID = 3, fX = 100.1, fY = 200.2}),
	recv_msg(Socket),
	ok.

send_msg(Socket, Msg) ->
	{_Bytes1, IoList1} = tcp_codec:encode(Msg),
	ranch_tcp:send(Socket, IoList1).

recv_msg(Socket) ->

	case ranch_tcp:recv(Socket, 6, 50000) of
		{ok, Any} ->
			{Size, Left} = binary_lib:read_int32(Any),
			{Cmd, _} = binary_lib:read_int16(Left),
			{ok, MsgBin} = ranch_tcp:recv(Socket, Size - 6, 50000),
			io:format("recv:~p~n",[netmsg:decode(Cmd, MsgBin)]),
			ok;
		_ ->
			skip
	end.
