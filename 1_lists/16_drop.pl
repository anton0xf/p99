%% 1.16 (**) Drop every N'th element from a list.

drop(L, N, R) :- drop_(L, N, N, R).
drop_([], _, _, []).
drop_([_ | L], 1, N, R) :- drop_(L, N, N, R), !.
drop_([X | L], N1, N, [X | R]) :-
    N2 is N1 - 1,
    drop_(L, N2, N, R), !.

%% Example:
%% ?- drop([a, b, c, d, e, f, g, h, i, k], 3, X).
%@ X = [a, b, d, e, g, h, k].

%% ?- drop(X, 3, [a, b, d, e, g, h, k]), print(X).
%@     [a, b, _170, d, e, _188, g, h, _206, k]
%@ X = [a, b, _170, d, e, _188, g, h, _206|...].

