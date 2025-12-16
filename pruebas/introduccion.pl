padre(juan, pedro).
padre(juan, maria).
padre(pedro, matias).
padre(matias, federico).

hermanos(X,Y):-padre(Z,X),padre(Z,Y),not(X=Y).


cantidad([],0).
cantidad([_X|XS],R) :- cantidad(XS,RS), R is RS+1.

sumatoria([],0).
sumatoria([X|XS],N) :- sumatoria(XS,N1), N is N1+X.

existe(X,[X|_]).
existe(X,[_|XS]) :- existe(X,XS).

minimo([X],X).
minimo([X|XS], X) :- minimo(XS,M), X=<M.
minimo([X|XS], Y) :- minimo(XS,Y), Y<X.

potencia(_B, 0, 1).
potencia(B, N, R) :- N>0, N1 is N-1, potencia(B, N1, R1), R is R1*B.
potencia(B, N, R) :- N<0, N1 is N+1, potencia(B,N1, R1), R is R1/B.