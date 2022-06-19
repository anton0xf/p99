%% 1.07 (**) Flatten a nested list structure.
%% Transform a list, possibly holding lists as elements into
%% a 'flat' list by replacing each list with its elements (recursively).

%% Hint: Use the predefined predicates is_list/1 and append/3

%%% Author's solution:
%% my_flatten(X,[X]) :- \+ is_list(X).
%% my_flatten([],[]).
%% my_flatten([X|Xs],Zs) :- my_flatten(X,Y), my_flatten(Xs,Ys), append(Y,Ys,Zs).

my_flatten([], []).
my_flatten([[] | L], R) :- my_flatten(L, R).
my_flatten([X | L], R) :- is_list(X),
                          my_flatten(X, X_flat),
                          my_flatten(L, L_flat),
                          append(X_flat, L_flat, R), !.
my_flatten([X | L], [X | L_flat]) :- atom(X), my_flatten(L, L_flat).

%% Example:
%?- my_flatten([a, [b, [c, d], e]], X).
%@ X = [a, b, c, d, e].

%?- my_flatten([[[]], [a], [b, [c, [], [d]], e]], X).
%@ X = [a, b, c, d, e].
