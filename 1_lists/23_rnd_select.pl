%% 1.23 (**) Extract a given number of randomly selected elements from a list.
%% The selected items shall be put into a result list.

%% Hint: Use the built-in random number generator random/2
%% and the result of problem 1.20.

:- ['20_remove_at'].

rnd_select(_, 0, []) :- !.
rnd_select(L, N, [X | R]) :-
    N > 0, N1 is N - 1,
    length(L, M),
    M1 is M + 1,
    random(1, M1, K),
    remove_at(X, L, K, L1),
    rnd_select(L1, N1, R).

%% Example:
%% ?- rnd_select([a, b, c, d, e, f, g, h], 3, L).
%@ L = [f, h, a].
%@ L = [h, c, e].
%@ L = [g, d, a].

%% ?- rnd_select([a, b, c], 3, L).
%@ L = [c, b, a].
%@ L = [b, c, a].
%@ L = [a, c, b].
