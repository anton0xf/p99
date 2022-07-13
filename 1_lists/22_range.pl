%% 1.22 (*) Create a list containing all integers within a given range.

range(N, N, [N]) :- !.
range(N, M, [N | R]) :-
    N < M,
    N1 is N + 1,
    range(N1, M, R).

%% Example:
%?- range(4, 9, L).
%@ L = [4, 5, 6, 7, 8, 9].
