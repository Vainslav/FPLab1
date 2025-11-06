-module(map).

-export([lcs_map/0, pds_map/0]).

collatz_sequence_length(1, Count) ->
    Count;
collatz_sequence_length(N, Count) ->
    case N rem 2 of
        0 ->
            collatz_sequence_length(N div 2, Count + 1);
        1 ->
            collatz_sequence_length(N * 3 + 1, Count + 1)
    end.

lcs_map() ->
    Seq = lists:seq(1, 999999),
    Mapped = lists:map(fun(N) -> collatz_sequence_length(N, 1) end, Seq),
    lists:max(Mapped).

pds_calc(N) ->
    Value = N * 2,
    case Value >= 10 of
        true ->
            [1, Value rem 10];
        false ->
            [Value]
    end.

pds_asemble({[1, X], [_]}) ->
    X;
pds_asemble({[X], [1, _]}) ->
    X + 1;
pds_asemble({[X], [_]}) ->
    X;
pds_asemble({[1, X], [1, _]}) ->
    X + 1.

get_last([Last]) ->
    [Last];
get_last([1, Last]) ->
    [Last].

pds_iter(0, List) ->
    List;
pds_iter(N, List) ->
    L = lists:map(fun pds_calc/1, List),
    Zipped =
        lists:zip(
            lists:droplast(L), tl(L)),
    Last = get_last(lists:last(L)),
    case Zipped of
        [] ->
            pds_iter(N - 1, lists:flatten(L));
        _ ->
            New_list =
                case hd(L) of
                    [1, _] ->
                        [1 | lists:map(fun pds_asemble/1, Zipped)];
                    _ ->
                        lists:map(fun pds_asemble/1, Zipped)
                end,
            pds_iter(N - 1, lists:append(New_list, Last))
    end.

pds_map() ->
    lists:sum(pds_iter(1000, [1])).
