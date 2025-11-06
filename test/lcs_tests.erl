-module(lcs_tests).

-include_lib("eunit/include/eunit.hrl").

lcs_test_() ->
    {timeout,
     10000,
     ?_assertEqual([525, 525, 525, 525, 525], lab1:longest_callatz_sequence())}.
