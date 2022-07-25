%% 1.24 (*) Lotto: Draw N different random numbers from the set 1..M.
%% The selected numbers shall be put into a result list.
%% Hint: Combine the solutions of problems 1.22 and 1.23.

:- ['22_range', '23_rnd_select'].

lotto(N, M, L) :- range(1, M, R), rnd_select(R, N, L).

%% Example:
%?- lotto(6, 49, L).
%@ L = [18, 38, 7, 6, 22, 43].
