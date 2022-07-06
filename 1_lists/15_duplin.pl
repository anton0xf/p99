%% 1.15 (**) Duplicate the elements of a list a given number of times.

:- ['05_reverse'].

duplin([], _, []).
duplin([X | XS], N, R) :- duplin_(X, XS, N, N, [], Rev), reverse(R, Rev).
duplin_(_, [], 0, _, R, R) :- !.
duplin_(_, [X1 | XS], 0, N, A, R) :- duplin_(X1, XS, N, N, A, R), !.
duplin_(X, XS, N1, N, A, R) :- N2 is N1 - 1,
                               duplin_(X, XS, N2, N, [X | A], R).

%% Example:
%?- duplin([a, b, c], 3, X).
%@ X = [a, a, a, b, b, b, c, c, c].

%?- duplin(X, 3, [a, a, a, b, b, b, c, c, c]).
%@ false. ???

%% What are the results of the goal:
%?- duplin(X, 3, Y).
%@ X = Y, Y = [] ;
%@ X = [_1506],
%@ Y = [_1506, _1506, _1506].
