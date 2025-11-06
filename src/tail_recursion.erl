-module(tail_recursion).

-export([lsc_tail/0, pds_tail/0]).

lcs_calc(1, Count) ->
    Count;
lcs_calc(N, Count) ->
    case N rem 2 of
        0 ->
            lcs_calc(N div 2, Count + 1);
        1 ->
            lcs_calc(3 * N + 1, Count + 1)
    end.

lcs_loop(1, Mx) ->
    Mx;
lcs_loop(N, Mx) ->
    lcs_loop(N - 1, max(Mx, lcs_calc(N - 1, 1))).

lsc_tail() ->
    lcs_loop(999999, 0).

pds_loop(List) ->
    pds_loop(List, 0, []).

pds_loop([], Carry, Acc) ->
    case Carry > 0 of
        true ->
            [Carry | Acc];
        false ->
            Acc
    end;
pds_loop([H | T], Carry, Acc) ->
    Value = H * 2 + Carry,
    case Value >= 10 of
        true ->
            pds_loop(T, 1, [Value rem 10 | Acc]);
        false ->
            pds_loop(T, 0, [Value | Acc])
    end.

pds_iter(0, List) ->
    List;
pds_iter(N, List) ->
    pds_iter(N - 1, pds_loop(lists:reverse(List))).

pds_tail() ->
    lists:sum(pds_iter(1000, [1])).
