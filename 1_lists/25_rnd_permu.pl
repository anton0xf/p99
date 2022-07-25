%% 1.25 (*) Generate a random permutation of the elements of a list.
%% Hint: Use the solution of problem 1.23.

:- ['23_rnd_select'].

rnd_permu(L, R) :- length(L, N), rnd_select(L, N, R).

%% Example:
%% ?- rnd_permu([a, b, c, d, e, f], L).
%@ L = [e, b, f, d, a, c].
