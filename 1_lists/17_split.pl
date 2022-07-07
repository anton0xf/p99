%% 1.17 (*) Split a list into two parts; the length of the first part is given.
%% Do not use any predefined predicates.

split([], _, [], []).
split(L, 0, [], L) :- !.
split([X | L], N, [X | L1], L2) :-
    N1 is N - 1,
    split(L, N1, L1, L2).

%% Example:
%% ?- split([a, b, c, d, e, f, g, h, i, k], 3, L1, L2).
%% L1 = [a, b, c]
%% L2 = [d, e, f, g, h, i, k]
