-module(pds_tests).

-include_lib("eunit/include/eunit.hrl").

pds_test() ->
    ?assertEqual([1366, 1366, 1366, 1366, 1366], lab1:pds()).
