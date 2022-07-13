%% 1.21 (*) Insert an element at a given position into a list.

insert_at(X, YS, 1, [X | YS]) :- !.
insert_at(X, [Y | YS], N, [Y | R]) :-
    N1 is N - 1,
    insert_at(X, YS, N1, R).

%% Example:
%?- insert_at(alfa, [a, b, c, d], 2, L).
%@ L = [a, alfa, b, c, d].

%?- insert_at(alfa, [a, b, c, d], 1, L).
%@ L = [alfa, a, b, c, d].

%?- insert_at(alfa, [a, b, c, d], 5, L).
%@ L = [a, b, c, d, alfa].

%?- insert_at(X, [a, b, c, d], 2, [a, alfa, b, c, d]).
%@ X = alfa.

%?- insert_at(alfa, [a, b, c, d], N, [a, alfa, b, c, d]).
