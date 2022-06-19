% 1.02 (*) Find the last but one element of a list.

% simple impl
%% last_but_one([X, _], X).
%% last_but_one([_, X, Y | R], Z) :- last_but_one([X, Y | R], Z).

last_but_one([Y1, Y2 | L], X) :- last_but_one_(L, Y1, Y2, X).
last_but_one_([], X, _, X).
last_but_one_([Y3 | L], Y1, Y2, X) :- last_but_one_(L, Y2, Y3, X).

%?- trace.
%?- last_but_one([1, 2], X).
%@ X = 1.

%?- last_but_one([1, 2, 3, 4], X).
%@ X = 3.

:- begin_tests(last_but_one).
test(empty, [fail]) :- last_but_one([], _).
test(one, [fail]) :- last_but_one([_], _).
test(two) :- last_but_one([a, _], a).
test(three) :- last_but_one([_, a, _], a).
test(four) :- last_but_one([_, _, a, _], a).
test(five) :- last_but_one([_, _, _, a, _], a).
:- end_tests(last_but_one).

%?- run_tests.
%@ % PL-Unit: last_but_one ...... done
%@ % All 6 tests passed
%@ true.
