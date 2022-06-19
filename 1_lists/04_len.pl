% 1.04 (*) Find the number of elements of a list.

% simple impl
%% len([], 0).
%% len([_ | L], N) :- len(L, N1), N is N1 + 1.

len(L, N) :- len_(L, 0, N).
len_([], N, N) :- !.
len_([_ | L], N1, N) :- N2 is N1 + 1, len_(L, N2, N), !.

%?- len([_, _, _, _, _], N).
%@ N = 5.

%?- len(L, 3).
%@ L = [_1872, _1878, _1884].

:- begin_tests(len).
test(empty) :- len([], 0).
test(one) :- len([_], 1).
test(two) :- len([_, _], 2).
test(three) :- len([_, _, _], 3).
test(four) :- len([_, _, _, _], 4).

test(get_three) :- len([_, _, _], N), N = 3.
test(get_three_elements_list) :- len(L, 3), L = [_, _, _].
:- end_tests(len).

%?- run_tests.
%@ % PL-Unit: len ...... done
%@ % All 6 tests passed
%@ true.
