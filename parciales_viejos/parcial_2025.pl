/*
  Tomar una lista L sin sublistas y una cantidad C.
  Devolver otra lista con las sumatorias de los C elementos de L
  partiendo de cada posición, desde 1 hasta longitud(L)-C+1.
  
  L = [1,3,2,4,5,4,3,2,3,4,9,10,2,33]
  C = 4

  R = [10,14,15,16,14,12,12,18,26,25,54]
  
  
  longitud(L) = 14
  longitud(R) = longitud(L)-C+1 = 14-4+1 = 11
*/

  n_elementos(_, 0, []).
  n_elementos([X|XS], N, [X|YS]) :- N>0, N1 is N-1, n_elementos(XS,N1,YS).
  
  sumatoria([],0).
  sumatoria([X|XS],S) :- sumatoria(XS,S1), S is S1+X.
  
  longitud([],0).
  longitud([_|XS],S) :- longitud(XS,S1), S is S1+1.
  
  lista_sumatorias(L,C,Resultado) :- longitud(L,Long), Limite is Long-C+1, lista_sumatorias(L,C,Resultado,Limite).
  lista_sumatorias(_, _, [], 0).
  lista_sumatorias([X|XS], C, [Y|YS], Limite) :-
     n_elementos([X|XS], C, Z),
     sumatoria(Z, S),
     Y is S,
     Limite1 is Limite-1,
     lista_sumatorias(XS, C, YS, Limite1).

/*
  Tomar como entrada una lista L sin sublistas y una lista M con sublistas.
  Devolver una lista con sublistas de la forma [E,N1,N2,...,Nr],
  donde E es cada elemento de L y N1..Nr son los niveles de M en los cuales
  se encuentran cada una de las ocurrencias de E.
  
  L no posee elementos repetidos.
  Cada elemento E de L debe aparecer una sola vez en la lista resultante.
  
  L = [6,3,2,4,8,9]
  M = [2,5,[4,7,3],5,[3,[4,9,2,10],6,5,7,4],9,2]

  R = [[6,2],[3,2,2],[2,1,3,1],[4,2,3,2],[8],[9,3,1]]
*/
  % Caso base: no hay más elementos en la lista
  nivel_elem(_,[],_,[]).

  % Encuentra el elemento
  nivel_elem(Elem, [Elem|MS], NivelActual, [NivelActual|RS]) :-
     nivel_elem(Elem, MS, NivelActual, RS).

  % El elemento no es el buscado. Continuar con el resto de la lista
  nivel_elem(Elem, [M|MS], NivelActual, Resultado) :-
     Elem \= M,
     not(is_list(M)),
     nivel_elem(Elem, MS, NivelActual, Resultado).
     
  % Se encontró una sublista. Buscar dentro de ella y en el resto de la lista.
  nivel_elem(Elem, [M|MS], NivelActual, Resultado) :-
     is_list(M),
     Niv1 is NivelActual + 1,
     nivel_elem(Elem, M, Niv1, Res1),
     nivel_elem(Elem, MS, NivelActual, Res2),
     append(Res1, Res2, Resultado).
     
  % Construir lista final
  lista_niveles([],_,[]).
  lista_niveles([L|LS], M, [[L|SublistaNiveles]|RS]) :-
     nivel_elem(L, M, 1, SublistaNiveles),
     lista_niveles(LS,M,RS).
