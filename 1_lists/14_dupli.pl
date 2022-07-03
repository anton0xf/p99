%% 1.14 (*) Duplicate the elements of a list.

dupli([], []).
dupli([X | L], [X, X | R]) :- dupli(L, R).

%% Example:
%?- dupli([a, b, c, c, d], X), print(X), nl.
%@     [a, a, b, b, c, c, c, c, d, d]
%@ X = [a, a, b, b, c, c, c, c, d|...].

