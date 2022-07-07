% 1.15 (**): Duplicate the elements of a list agiven number of times

% dupli(L1,N,L2) :- L2 is obtained from L1 by duplicating all elements
%    N times.
%    (list,integer,list) (?,+,?)

dupli(L1,N,L2) :- dupli(L1,N,L2,N).

% dupli(L1,N,L2,K) :- L2 is obtained from L1 by duplicating its leading
%    element K times, all other elements N times.
%    (list,integer,list,integer) (?,+,?,+)

dupli([],_,[],_).
dupli([_|Xs],N,Ys,0) :- dupli(Xs,N,Ys,N).
dupli([X|Xs],N,[X|Ys],K) :- K > 0, K1 is K - 1, dupli([X|Xs],N,Ys,K1).

%% Example:
%?- duplin([a, b, c], 3, X).
%@ X = [a, a, a, b, b, b, c, c, c].

%?- duplin(X, 3, [a, a, a, b, b, b, c, c, c]).
%@ X = [a, b, c].

%% What are the results of the goal:
%?- duplin(X, 3, Y).
%@ X = Y, Y = [] ;
%@ X = [_2386],
%@ Y = [_2386, _2386, _2386].
