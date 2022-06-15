% 1.03 (*) Find the K'th element of a list.
% The first element in the list is number 1.

element_at(X, [X | _], 1) :- !.
element_at(X, [_ | L], N)
:- integer(N), N > 0,
   N1 is N - 1,
   element_at(X, L, N1), !.

% Example:
%?- element_at(X, [a, b, c, d, e], 3).
%@ X = c.

:- begin_tests(element_at).
test(empty, [fail]) :- element_at(_, [], _).

test(zeroth_from_one, [fail]) :- element_at(_, [_], 0).
test(first_from_one) :- element_at(a, [a], 1).
test(second_from_one, [fail]) :- element_at(_, [_], 2).
test(third_from_one, [fail]) :- element_at(_, [_], 3).

test(zeroth_from_two, [fail]) :- element_at(_, [_, _], 0).
test(first_from_two) :- element_at(a, [a, _], 1).
test(second_from_two) :- element_at(a, [_, a], 2).
test(third_from_two, [fail]) :- element_at(_, [_, _], 3).

test(zeroth_from_three, [fail]) :- element_at(_, [_, _, _], 0).
test(first_from_three) :- element_at(a, [a, _, _], 1).
test(second_from_three) :- element_at(a, [_, a, _], 2).
test(third_from_three) :- element_at(a, [_, _, a], 3).
test(fourth_from_three, [fail]) :- element_at(_, [_, _, _], 4).

test(zeroth_from_four, [fail]) :- element_at(_, [_, _, _, _], 0).
test(first_from_four) :- element_at(a, [a, _, _, _], 1).
test(second_from_four) :- element_at(a, [_, a, _, _], 2).
test(third_from_four) :- element_at(a, [_, _, a, _], 3).
test(fourth_from_four) :- element_at(a, [_, _, _, a], 4).
test(fourth_from_four, [fail]) :- element_at(_, [_, _, _, _], 5).
:- end_tests(element_at).

%?- run_tests.
%@ % PL-Unit: element_at .................... done
%@ % All 20 tests passed
%@ true.
