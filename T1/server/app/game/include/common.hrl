%%%-------------------------------------------------------------------
%%% @author snail
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 11. 二月 2015 16:35
%%%-------------------------------------------------------------------
-author("snail").

-ifndef(COMMON_HRL).
-define(COMMON_HRL,1).

-include("type.hrl").
-include("setup.hrl").
-include("logger.hrl").
-include("activityDef.hrl").
-include("commonDef.hrl").
-include("db.hrl").
-include("errorCode.hrl").
-include("guild.hrl").
-include("logRecord.hrl").
-include("mall.hrl").
-include("mysql.hrl").
-include("setting.hrl").
-include("variant.hrl").
-include("condition.hrl").
-include("logic.hrl").
-include("logic_trigger.hrl").
-include("logic_target.hrl").
-include("notice.hrl").
-include("json_lib.hrl").
-include("pub_def.hrl").


-ifndef(RELEASE).
-define(ERROR_CODE(C),			_={?DEBUG("[DebugForErrorCode] ~p []", [C]), playerMsg:sendErrorCodeMsg(C)}).
-define(ERROR_CODE(C, P),		_={?DEBUG("[DebugForErrorCode] ~p ~p", [C, P]), playerMsg:sendErrorCodeMsg(C, P)}).
-define(ERROR_CODE(N, C, P),	_={?DEBUG("[DebugForErrorCode] ~p ~p", [C, P]), playerMsg:sendErrorCodeMsg(N, C, P)}).
-else.
-define(ERROR_CODE(C),			playerMsg:sendErrorCodeMsg(C)).
-define(ERROR_CODE(C, P),		playerMsg:sendErrorCodeMsg(C, P)).
-define(ERROR_CODE(N, C, P),	playerMsg:sendErrorCodeMsg(N, C, P)).
-endif.	%% RELEASE


-endif.
