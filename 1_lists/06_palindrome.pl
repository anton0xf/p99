%% 1.06 (*) Find out whether a list is a palindrome.
%% A palindrome can be read forward or backward; e.g. [x, a, m, a, x].
:- ['05_reverse'].

palindrome(L) :- reverse(L, L).

%?- palindrome([x, a, m, a, x]).
%@ true.

:- begin_tests(palindrome).
test(empty) :- palindrome([]).
test(one) :- palindrome([_]).
test(two) :- palindrome([a, a]).
test(two_neg, [fail]) :- palindrome([a, b]).
test(two_search) :- palindrome([a, X]), X = a.
test(five) :- palindrome([x, a, m, a, x]).
:- end_tests(palindrome).

%?- run_tests.
