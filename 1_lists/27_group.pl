%% 1.27 (**) Group the elements of a set into disjoint subsets.
%% a) In how many ways can a group of 9 people work
%%    in 3 disjoint subgroups of 2, 3 and 4 persons?
%%    -> C(9, 2) * C(7, 3) = 1260

%%    Write a predicate that generates all the possibilities via backtracking.

%% Let's start from group2(L, G1, G2) which group 4 elements into
%% 2 disjoint groups by 20 elements
group2_([], 0, [], 0, []).
group2_([X | L], N1, [X | G1], N2, G2) :-
    M is N1 - 1,
    group2_(L, M, G1, N2, G2).
group2_([X | L], N1, G1, N2, [X | G2]) :-
    M is N2 - 1,
    group2_(L, N1, G1, M, G2).
group2(L, G1, G2) :- group2_(L, 2, G1, 2, G2).
%?- group2([a, b, c, d], G1, G2).
%@ G1 = [a, b], %@ G2 = [c, d] ;
%@ G1 = [a, c], %@ G2 = [b, d] ;
%@ G1 = [a, d], %@ G2 = [b, c] ;
%@ G1 = [b, c], %@ G2 = [a, d] ;
%@ G1 = [b, d], %@ G2 = [a, c] ;
%@ G1 = [c, d], %@ G2 = [a, b] ;
%@ false.

%?- aggregate_all(count, group2([a, b, c, d], G1, G2), Count).
%@ Count = 6.

group3_([], 0, [], 0, [], 0, []).
group3_([X | L], N1, [X | G1], N2, G2, N3, G3) :-
    M is N1 - 1,
    group3_(L, M, G1, N2, G2, N3, G3).
group3_([X | L], N1, G1, N2, [X | G2], N3, G3) :-
    M is N2 - 1,
    group3_(L, N1, G1, M, G2, N3, G3).
group3_([X | L], N1, G1, N2, G2, N3, [X | G3]) :-
    M is N3 - 1,
    group3_(L, N1, G1, N2, G2, M, G3).
group3(L, G1, G2, G3) :- group3_(L, 2, G1, 3, G2, 4, G3).

%% Example:
%?- group3([aldo, beat, carla, david, evi, flip, gary, hugo, ida], G1, G2, G3).
% G1 = [aldo, beat],  G2 = [carla, david, evi],  G3 = [flip, gary, hugo, ida]
% ...
%?- aggregate_all(count,
%   group3([aldo, beat, carla, david, evi, flip, gary, hugo, ida], G1, G2, G3),
%   Count).
%@ Count = 1260.

%% b) Generalize the above predicate in a way that we can specify
%%    a list of group sizes and the predicate will return a list of groups.

%% Example:
%% ?- group([aldo, beat, carla, david, evi, flip, gary, hugo, ida], [2, 2, 5], Gs).
%% Gs = [[aldo, beat], [carla, david], [evi, flip, gary, hugo, ida]]
%% ...

%% Note that we do not want permutations of the group members;
%% i.e. [[aldo, beat], ...] is the same solution as [[beat, aldo], ...].
%% However,  we make a difference between [[aldo, beat], [carla, david], ...]
%% and [[carla, david], [aldo, beat], ...].

%% You may find more about this combinatorial problem in a good book
%% on discrete mathematics under the term "multinomial coefficients".
