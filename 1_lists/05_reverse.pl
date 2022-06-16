% 1.05 (*) Reverse a list.
reverse(L, R) :- reverse_(L, [], R).
reverse_([], R, R) :- !.
reverse_([X | L], Acc, R) :- reverse_(L, [X | Acc], R), !.

%?- reverse([1, 2, 3], R).
%@ R = [3, 2, 1].

%?- reverse(L, [1, 2, 3]).
%@ L = [3, 2, 1].

:- begin_tests(reverse).
test(empty) :- reverse([], []).
test(one) :- reverse([a], [a]).
test(two) :- reverse([a, b], [b, a]).
test(two_wrong, [fail]) :- reverse([a, b], [a, b]).
test(three) :- reverse([a, b, c], [c, b, a]).
test(four) :- reverse([a, b, c, d], [d, c, b, a]).
test(four_wrong, [fail]) :- reverse([a, b, c, d], [d, b, c, a]).
:- end_tests(reverse).

%?- run_tests.
%@ % PL-Unit: len  done
%@ % PL-Unit: reverse ....... done
%@ % All 7 tests passed
%@ true.
