%%% 1.08 (**) Eliminate consecutive duplicates of list elements.

%% If a list contains repeated elements they should be replaced with a single
%% copy of the element. The order of the elements should not be changed.

compress([], []).
compress([X, X | L], R) :- compress([X | L], R), !.
compress([X | L], [X | R]) :- compress(L, R).

%% Example:
%% ?- compress([a, a, a, a, b, c, c, a, a, d, e, e, e, e], X).
%@ X = [a, b, c, a, d, e].

:- begin_tests(compress).
test(empty) :- compress([], []).
test(one) :- compress([a], [a]).
test(one_one) :- compress([a, b], [a, b]).
test(two) :- compress([a, a], [a]).
test(three) :- compress([a, a, a], [a]).
test(one_two_three) :- compress([a, b, b, c, c, c], [a, b, c]).
test(complex) :- compress([a, a, a, a, b, c, c, a, a, d, e, e, e, e], X),
                 X = [a, b, c, a, d, e].
:- end_tests(compress).

%?- run_tests.
%@ % PL-Unit: compress ....... done
%@ % All 7 tests passed
%@ true.
