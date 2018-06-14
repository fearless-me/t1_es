%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 五月 2018 16:12
%%%-------------------------------------------------------------------
-author("mawenhong").

-record(net_conf,{
    max_msg_bytes = 8*1024,
    cmd_id_bytes = 2   :: 2 | 4,
    hdr_size_bytes = 4  ::  2 | 4,
    compress_bytes = 512
}).