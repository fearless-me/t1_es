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
-include("player_record.hrl").
-include("common_record.hrl").
-include("db_record.hrl").
-include("map_obj.hrl").

%% API
-export([load_account_info/1]).
-export([load_player_list_/2]).
-export([load_player_data_/3]).
-export([create_player_/3]).

load_account_info(AccName) ->
    #p_account{
        accountID = misc:crc32(AccName),
        platformAccount = AccName,
        platformAccountCrc = misc:crc32(AccName)
    }.

load_player_list_(Pid, _AccId) ->
    ps:send(Pid, {load_player_list_ack, []}).

load_player_data_(Pid, AccId, PlayerId) ->
    ps:send(Pid,
        {
            load_player_data_ack,
            #m_player{
                uid = PlayerId,
                aid = AccId,
                other = #r_player_other{}
            }
        }
    ),
    ok.

create_player_(
    Pid, AccId,
    #r_create_player_req{
        name = Name,
        camp = Camp,
        career = Career,
        race = Race,
        sex = Sex,
        head = Head
    }
) ->
    ps:send(
        Pid,
        {
            create_player_ack,
            #r_create_player_ack{
                error = 0,
                uid = uid_gen:player_uid(),
                acc_id = AccId,
                name = Name,
                camp = Camp,
                career = Career,
                race = Race,
                sex = Sex,
                head = Head
            }
        }
    ),
    ok.
