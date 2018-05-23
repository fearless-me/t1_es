%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 五月 2018 10:08
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(VECTOR3_HRL).
-define(VECTOR3_HRL, true).

-record(vector3,{x=0.0,y=0.0,z=0.0}).
-type vector3() :: #vector3{}.
-export_type([vector3/0]).

-endif.
