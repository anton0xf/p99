%% 1.11 (*) Modified run-length encoding.
%% Modify the result of problem 1.10 in such a way that 
%% if an element has no duplicates it is simply copied 
%% into the result list. Only elements with duplicates 
%% are transferred as [N, E] terms.

:- ['05_reverse'].

encode_modified(L, R) :- encode_(L, [], Rev), reverse(R, Rev).

encode_([], R, R) :- !.

encode_([X | L], [[N, X] | A], R)
:- N1 is N + 1,
   encode_(L, [[N1, X] | A], R), !.

encode_([X | L], [X | A], R) :- encode_(L, [[2, X] | A], R), !.

encode_([X | L], A, R) :- encode_(L, [X | A], R), !.

%% Example:
%?- encode_modified([a, a, a, a, b, c, c, a, a, d, e, e, e, e], X).
%@ X = [[4, a], b, [2, c], [2, a], d, [4, e]].

