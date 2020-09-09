split([], [], []).
split([H|T], [H|L1], L2) :- H>=0, split(T, L1, L2).
split([H|T], L1, [H|L2]) :- H<0, split(T, L1, L2).

min_max(Z, X, Y) :- sort(Z, A), reverse(A, B), ([Y|_]) = A, ([X|_]) = B.

perfect_squares([],[], 0).
perfect_squares([H|T], [H|Ys], N) :- ps(H, A), A = 0.0, perfect_squares(T, Ys, M), N is M + 1 .
perfect_squares([H|T], Ys, N) :- ps(H, A), A \= 0.0, perfect_squares(T, Ys, N). 

ps(X, Y) :- sqrt(X, A), floor(A, B), Y is A - B.

sum([], 0).
sum([X|Xs], S) :- sum(Xs, T), S is X + T.

squareAll([],[]).
squareAll([X|Xs], [Y|Ys]) :- squareAll(Xs, Ys), Y is X * X.

cubeAll([],[]).
cubeAll([X|Xs], [Y|Ys]) :- cubeAll(Xs, Ys), Y is X * X * X.

square_cube_difference([], []).
square_cube_difference(L, X) :- squareAll(L, S), cubeAll(L, C), sum(S, Ssum), sum(C, Csum), X is  Csum - Ssum. 

sqrt_all([],[]).
sqrt_all([X|Xs], [Y|Ys]) :- sqrt_all(Xs, Ys), sqrt(X, Y).

floor_all([],[]).
floor_all([X|Xs], [Y|Ys]) :- floor_all(Xs, Ys), floor(X, Y).

decrease_all(X , [] ,[] ).
decrease_all(X , [H|T] ,[A|B]) :- sbtrc(X,H,A),decrease_all(X,T,B).

sbtrc(X,H,K):-K  is H - X.

standard_deviation([],[]).
standard_deviation(L, X) :- length(L, LEN), sum(L, S), M is S / LEN, decrease_all(M, L, A), squareAll(A, B), sum(B, C), N is C / LEN, sqrt(N, X).
