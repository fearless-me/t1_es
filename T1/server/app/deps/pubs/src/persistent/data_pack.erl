%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 十一月 2018 14:00
%%%-------------------------------------------------------------------
-module(data_pack).
-author("Administrator").
-include("logger.hrl").
%%-include("db_record.hrl").

%%-record(buff, {id = 0, time = 0, layer = 0, source = 0, lifetime = 0}).
%%-record(task, {id, type, sub_type, p1, p2, p3, p4}).
%%-record(skill, {id, level, cd, p1, p2, p3}).
%%-record(full_data, {buff, task, skill}).

%% API
-export([marshal/1, unmarshal/1, version/1]).
%% todo 数据需要版本号，版本号根据什么来？ 能否自动生成？（尽量不要手动维护）
%% todo 每个数据要怎么编码？怎么兼容？包括增加字段、删除字段？ 改名怎么办？
%% todo 是否需要压缩？
%% todo 要考虑效率、内存、对线上环境的影响
%% todo 正确能用 -> 效率 -> 版本兼容
-define(COMPRESS_LEVEL, 0).

%% fixme 如果性能对标不过  term_to_binary/ binary_to_term 就不需要在费神了
%%
marshal(Data) -> erlang:term_to_binary(Data,[compressed]).
unmarshal(Bin) -> erlang:binary_to_term(Bin).

version(Data) ->
    misc:crc32(erlang:term_to_binary(Data)).

%%test() ->
%%    _Ext = #p_player_save{},
%%    ?DB_RECORD_VERSION,
%%    ok.