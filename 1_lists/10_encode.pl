%% 1.10 (*) Run-length encoding of a list.
%% Use the result of problem 1.09 to implement the so-called
%% run-length encoding data compression method.
%% Consecutive duplicates of elements are encoded as terms [N, E]
%% where N is the number of duplicates of the element E.

:- ['05_reverse'].

encode(L, R) :- encode_(L, [], Rev), reverse(R, Rev).

encode_([], R, R) :- !.

encode_([X | L], [[N, X] | A], R)
:- N1 is N + 1,
   encode_(L, [[N1, X] | A], R), !.

encode_([X | L], A, R) :- encode_(L, [[1, X] | A], R), !.

%% Example:
%?- encode([a, a, a, a, b, c, c, a, a, d, e, e, e, e], X).
%@ X = [[4, a], [1, b], [2, c], [2, a], [1, d], [4, e]].

