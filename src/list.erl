-module(list).

-export([lcs_list/0, pds_list/0]).

collatz_sequence_length(1, Count) ->
    Count;
collatz_sequence_length(N, Count) ->
    case N rem 2 of
        0 ->
            collatz_sequence_length(N div 2, Count + 1);
        1 ->
            collatz_sequence_length(N * 3 + 1, Count + 1)
    end.

lcs_list() ->
    lists:max([collatz_sequence_length(N, 1) || N <- lists:seq(1, 999999)]).

pds_list() ->
    Number = trunc(math:pow(2, 1000)),
    Digits = [N - $0 || N <- integer_to_list(Number)],
    lists:sum(Digits).
