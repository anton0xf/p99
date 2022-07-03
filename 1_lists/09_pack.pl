%% 1.09 (**) Pack consecutive duplicates of list elements into sublists.
%% If a list contains repeated elements they should be placed in separate sublists.

:- ['05_reverse'].

pack(L, R) :- pack_(L, [], Rev), reverse(R, Rev).
pack_([], R, R) :- !.
pack_([X | L], [[X | XS] | A], R) :- pack_(L, [[X, X | XS] | A], R), !.
pack_([X | L], A, R) :- pack_(L, [[X] | A], R), !.

%% Example:
%?- pack([a], X).
%@ X = [[a]].

%?- pack([a, a, a, a, b, c, c, a, a, d, e, e, e, e], X).
%% X = [[a, a, a, a], [b], [c, c], [a, a], [d], [e, e, e, e]]

:- begin_tests(pack).
test(empty) :- pack([], []).
test(one) :- pack([a], [[a]]).
test(one_one) :- pack([a, b], [[a], [b]]).
test(two) :- pack([a, a], [[a, a]]).
test(three) :- pack([a, a, a], [[a, a, a]]).
test(one_two_three) :- pack([a, b, b, c, c, c], [[a], [b, b], [c, c, c]]).
test(complex) :- pack([a, a, a, a, b, c, c, a, a, d, e, e, e, e], X),
                 X = [[a, a, a, a], [b], [c, c], [a, a], [d], [e, e, e, e]].
:- end_tests(pack).

%?- run_tests.
%@ % PL-Unit: reverse ....... done
%@ % PL-Unit: pack ....... done
%@ % All 14 tests passed
%@ true.
