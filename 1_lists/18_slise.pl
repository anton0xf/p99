%% 1.18 (**) Extract a slice from a list.
%% Given two indices, I and K, the slice is the list containing
%% the elements between the I'th and K'th element
%% of the original list (both limits included).
%% Start counting the elements with 1.

slice([], _, _, []) :- !.
slice(_, 1, 0, []) :- !.
slice([X | L], 1, K, [X | R]) :-
    K1 is K - 1,
    slice(L, 1, K1, R), !.
slice([_ | L], I, K, R) :-
    I1 is I - 1,
    K1 is K - 1,
    slice(L, I1, K1, R), !.

%% Example:
%% ?- slice([a, b, c, d, e, f, g, h, i, k], 3, 7, X).
%@ X = [c, d, e, f, g].
