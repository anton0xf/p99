%% 1.15 (**) Duplicate the elements of a list a given number of times.

duplin([], _, []).
duplin([X | XS], N, R) :- duplin_(X, XS, N, N, R).
duplin_(_, [], 0, _, []) :- !.
duplin_(_, [X | XS], 0, N, R) :- duplin_(X, XS, N, N, R), !.
duplin_(X, XS, N1, N, [X | R]) :- N2 is N1 - 1,
                                  duplin_(X, XS, N2, N, R).

%% Example:
%?- duplin([a, b, c], 3, X).
%@ X = [a, a, a, b, b, b, c, c, c].

%?- duplin(X, 3, [a, a, a, b, b, b, c, c, c]).
%@ X = [a, b, c].

%% What are the results of the goal:
%?- duplin(X, 3, Y).
%@ X = Y, Y = [] ;
%@ X = [_2386],
%@ Y = [_2386, _2386, _2386].
