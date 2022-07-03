%% 1.12 (**) Decode a run-length encoded list.
%% Given a run-length code list generated 
%% as specified in problem 1.11.
%% Construct its uncompressed version.

:- ['05_reverse'].

decode(L, R) :- decode_(L, [], Rev), reverse(R, Rev).
decode_([], R, R) :- !.
decode_([[1, X] | L], A, R) :- decode_(L, [X | A], R), !.
decode_([[N, X] | L], A, R)
:- N1 is N - 1,
   decode_([[N1, X] | L], [X | A], R), !.

%% Example:
%?- set_prolog_flag(answer_write_options, [max_depth(0)]).
%?- decode([[4, a], [1, b], [2, c], [2, a], [1, d], [4, e]], X).
%@ X = [a, a, a, a, b, c, c, a, a, d, e, e, e, e].

