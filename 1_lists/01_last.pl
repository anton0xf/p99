% 1.01 (*) Find the last element of a list.
my_last(Last, [Last]).
my_last(Last, [_ | Tail]) :- my_last(Last, Tail), !.

%?- my_last(X, [a, b, c, d]).
%@ X = d.

