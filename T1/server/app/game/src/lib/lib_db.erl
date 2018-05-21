%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. 五月 2018 14:22
%%%-------------------------------------------------------------------
-module(lib_db).
-author("mawenhong").
-include("logger.hrl").
-include("record.hrl").
-include("login.hrl").
-include("db_record.hrl").

%% API
-export([load_account_info/1]).

load_account_info(AccName) ->
    #p_account{
        accountID = misc:crc32(AccName),
        platformAccount = AccName,
        platformAccountCrc = misc:crc32(AccName)
    }.
