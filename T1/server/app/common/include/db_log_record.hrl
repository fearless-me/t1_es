%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-author("Hello World").

-ifndef(DB_TABLE_LOG_RECORD_HRL).
-define(DB_TABLE_LOG_RECORD_HRL, true).


-define(DB_RECORD_VERSION, 1544776200).

%% t1_log.log_money
%% aid bigint(20) unsigned "" DEFAULT "" COMMENT "" KEY MUL
%% uid bigint(20) unsigned "" DEFAULT "" COMMENT "" KEY ""
%% sid int(11) unsigned "" DEFAULT "" COMMENT "" KEY ""
%% name varchar(192) "" DEFAULT "" COMMENT "" KEY ""
%% level int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% camp int(11) unsigned "" DEFAULT 0 COMMENT "" KEY ""
%% race int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% career int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% head int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% map_id int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% line int(11) "" DEFAULT 0 COMMENT "" KEY ""
-record(p_log_money,{
	aid=0,uid=0,sid=0,name="",level=1,camp=0,race=1,career=1,
	head=1,map_id=1,line=0
}).


%% t1_log.log_player
%% aid bigint(20) unsigned "" DEFAULT "" COMMENT "" KEY MUL
%% uid bigint(20) unsigned "" DEFAULT "" COMMENT "" KEY ""
%% sid int(11) unsigned "" DEFAULT "" COMMENT "" KEY ""
%% name varchar(192) "" DEFAULT "" COMMENT "" KEY ""
%% level int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% camp int(11) unsigned "" DEFAULT 0 COMMENT "" KEY ""
%% race int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% career int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% head int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% map_id int(11) unsigned "" DEFAULT 1 COMMENT "" KEY ""
%% line int(11) "" DEFAULT 0 COMMENT "" KEY ""
-record(p_log_player,{
	aid=0,uid=0,sid=0,name="",level=1,camp=0,race=1,career=1,
	head=1,map_id=1,line=0
}).

-endif.
