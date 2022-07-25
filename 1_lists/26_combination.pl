%% 1.26 (**) Generate the combinations of K distinct objects
%% chosen from the N elements of a list

%% In how many ways can a committee of 3 be chosen from a group of 12 people?
%% We all know that there are C(12, 3) = 220 possibilities
%% (C(N, K) denotes the well-known binomial coefficients).
%% For pure mathematicians, this result may be great.
%% But we want to really generate all the possibilities (via backtracking).

combination(1, [X | _], [X]).
combination(K, [X | L], [X | R]) :-
    K1 is K - 1,
    combination(K1, L, R).
combination(K, [_ | L], R) :- combination(K, L, R).

%% Examples:

%?- combination(1, [a, b, c], L).
%@ L = [a] ;
%@ L = [b] ;
%@ L = [c] ;
%@ false.

%?- combination(2, [a, b, c], L).
%@ L = [a, b] ;
%@ L = [a, c] ;
%@ L = [b, c] ;
%@ false.

%?- combination(3, [a, b, c], L).
%@ L = [a, b, c] ;
%@ false.

%?- combination(3, [a, b, c, d, e, f], L).
%@ L = [a, b, c] ;
%@ L = [a, b, d] ;
%@ L = [a, b, e] ;
%@ L = [a, b, f] ;
%@ L = [a, c, d] ;
%@ L = [a, c, e] ;
%@ L = [a, c, f] ;
%@ L = [a, d, e] ;
%@ L = [a, d, f] ;
%@ L = [a, e, f] ;
%@ L = [b, c, d] ;
%@ L = [b, c, e] ;
%@ L = [b, c, f] ;
%@ L = [b, d, e] ;
%@ L = [b, d, f] ;
%@ L = [b, e, f] ;
%@ L = [c, d, e] ;
%@ L = [c, d, f] ;
%@ L = [c, e, f] ;
%@ L = [d, e, f] ;
%@ false.
