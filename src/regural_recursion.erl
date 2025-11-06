-module(regural_recursion).

-export([lsc_rec/0, pds_rec/0]).

-spec lsc_rec() -> integer().
lcs_calc(1) ->
    1;
lcs_calc(N) ->
    case N rem 2 of
        0 ->
            lcs_calc(N div 2) + 1;
        1 ->
            lcs_calc(3 * N + 1) + 1
    end.

lcs_loop(1, Mx) ->
    Mx;
lcs_loop(N, Mx) ->
    lcs_loop(N - 1, max(Mx, lcs_calc(N - 1))).

lsc_rec() ->
    lcs_loop(999999, 0).

pds_loop([], Carry) ->
    case Carry > 0 of
        true ->
            [Carry];
        false ->
            []
    end;
pds_loop([H | T], Carry) ->
    Value = H * 2 + Carry,
    case Value >= 10 of
        true ->
            pds_loop(T, 1) ++ [Value rem 10];
        false ->
            pds_loop(T, 0) ++ [Value]
    end.

pds_iter(0, List) ->
    List;
pds_iter(N, List) ->
    pds_iter(N - 1, pds_loop(lists:reverse(List), 0)).

pds_rec() ->
    lists:sum(pds_iter(1000, [1])).
