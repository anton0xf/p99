%% 1.20 (*) Remove the K'th element from a list.

remove_at(X, [X | L], 1, L) :- !.
remove_at(Y, [X | L], N, [X | R]) :-
    N1 is N - 1,
    remove_at(Y, L, N1, R).

%% Example:
%% ?- remove_at(X, [a, b, c, d], 2, R).
%@ X = b,
%@ R = [a, c, d].
