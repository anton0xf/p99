%% 1.19 (**) Rotate a list N places to the left.
%% Hint: Use the predefined predicates length/2 and append/3,
%% as well as the result of problem 1.17.

:- ['17_split'].

rotate([], _, []).
rotate(L, 0, L) :- !.
rotate(L, N, R) :-
    N > 0,
    split(L, N, L1, L2),
    append(L2, L1, R), !.
rotate(L, N, R) :-
    N < 0,
    length(L, Len),
    N1 is Len + N,
    rotate(L, N1, R).

%% Examples:
%% ?- rotate([a, b, c, d, e, f, g, h], 3, X).
%@ X = [d, e, f, g, h, a, b, c].

%% ?- rotate([a, b, c, d, e, f, g, h], -2, X).
%@ X = [g, h, a, b, c, d, e, f].
