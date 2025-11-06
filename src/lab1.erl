-module(lab1).

-import(tail_recursion, [lsc_tail/0, pds_tail/0]).
-import(regural_recursion, [lsc_rec/0, pds_rec/0]).
-import(map, [lcs_map/0, pds_map/0]).
-import(module, [lcs_module/0, pds_module/0]).
-import(list, [lcs_list/0, pds_list/0]).

-export([longest_callatz_sequence/0, pds/0]).

longest_callatz_sequence() ->
    [lsc_tail(), lsc_rec(), lcs_map(), lcs_module(), lcs_list()].

pds() ->
    [pds_tail(), pds_rec(), pds_map(), pds_list(), pds_module()].
