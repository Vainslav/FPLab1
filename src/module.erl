-module(module).

-export([lcs_module/0, pds_module/0]).

lcs(1, Count) ->
    Count;
lcs(N, Count) ->
    case N rem 2 of
        0 ->
            lcs(N div 2, Count + 1);
        1 ->
            lcs(N * 3 + 1, Count + 1)
    end.

lcs_module() ->
    Seq = lists:seq(1, 999999),
    lists:foldl(fun(N, Acc) -> max(lcs(N, 1), Acc) end, 1, Seq).

pds_module() ->
    Number = integer_to_list(trunc(math:pow(2, 1000))),
    lists:foldl(fun(N, Acc) -> Acc + (N - $0) end, 0, Number).
