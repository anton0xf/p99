% 1.01 (*) Find the last element of a list.
my_last(Last, [Last]) :- !.
my_last(Last, [_ | Tail]) :- my_last(Last, Tail), !.

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
