% 1.01 (*) Find the last element of a list.

% simple impl
%% my_last(X, [X]).
%% my_last(X, [_ | L]) :- my_last(X, L).

my_last(X, [Y | L]) :- my_last_(L, X, Y).
my_last_([], X, X).
my_last_([Y | L], X, _) :- my_last_(L, X, Y).

%?- my_last(X, [a, b, c, d]).
%@ X = d.

:- begin_tests(my_last).
test(empty, [fail]) :- my_last(_, []).
test(one) :- my_last(a, [a]).
test(two) :- my_last(b, [a, b]).
test(two_wrong, [fail]) :- my_last(a, [a, b]).
test(three) :- my_last(c, [a, b, c]).
:- end_tests(my_last).

%?- run_tests.
%@ % PL-Unit: my_last ..... done
%@ % All 5 tests passed
%@ true.
