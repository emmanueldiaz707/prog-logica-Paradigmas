/*
   Tomar como entrada una lista sin sublistas L y un número N,
   devolver una lista con los elementos de L que están en las posiciones múltiplos de N.

   Por ejemplo, si N=3, las posiciones serían 3, 6, 9, etc.

   L = [4, 5, 9, 6, 12, 8, 6, 5, 4, 3, 2, 3, 5, 10]
   N = 3
   
   Resultado = [9, 8, 4, 3]
*/

   lista_pos_mult(L, N, Resultado) :- lista_pos_mult(L, N, N, Resultado).
   
   lista_pos_mult([],_,_,[]).
   
   % Llega a posición múltiplo
   lista_pos_mult([L|LS], N, 1, [L|RS]) :-
      lista_pos_mult(LS, N, N, RS).
   
   % No está en posición múltiplo
   lista_pos_mult([_|LS], N, M, R) :-
      M>1,
      M1 is M-1,
      lista_pos_mult(LS, N, M1, R).
      
/*
   Dada una lista con sublistas L, devolver una lista donde el iésimo elemento
   representa la sumatoria de los números contenidos en nivel i de profundidad de L.
   
   Si no hay elementos numéricos en un nivel específico,
   ese nivel tendrá valor 0 en la lista resultante.
   
   L = [1, [2, 3], [[4, 5], 6], [7, [8, [9]]]]
   R = [1, 18, 17, 9]
*/

   % Elemento es del nivel actual
   sumatoria_nivel(L, Nivel, Sumatoria) :- sumatoria_nivel(L, Nivel, 1, Sumatoria).
   
   sumatoria_nivel([], _, _, 0).

   % Elemento es número y del nivel buscado
   sumatoria_nivel([X|XS], Nivel, Nivel, S) :-
      number(X),
      sumatoria_nivel(XS,Nivel,Nivel,S1),
      S is S1 + X.

   % Elemento es sublista y del nivel buscado
   sumatoria_nivel([X|XS], Nivel, Nivel, S) :-
      is_list(X),
      sumatoria_nivel(XS, Nivel, Nivel, S).

   % Elemento es número y de nivel superior al buscado
   sumatoria_nivel([X|XS], Nivel, NivelActual, S) :-
      number(X),
      Nivel>NivelActual,
      sumatoria_nivel(XS, Nivel, NivelActual, S).

   % Elemento es sublista y de nivel superior al buscado
   sumatoria_nivel([X|XS], Nivel, NivelActual, S) :-
      is_list(X),
      Nivel>NivelActual,
      Nivel1 is NivelActual+1,
      sumatoria_nivel(X, Nivel, Nivel1, S1),
      sumatoria_nivel(XS, Nivel, NivelActual, S2),
      S is S1+S2.
      


   mayor(X,Y,X) :- X>=Y.
   mayor(X,Y,Y) :- X<Y.

   nivel_max([], 1).
   
   nivel_max([X|XS], P) :-
      number(X),
      nivel_max(XS, P).

   nivel_max([X|XS], P) :-
      is_list(X),
      nivel_max(X, P1),
      nivel_max(XS,P2),
      P3 is P1 + 1,
      mayor(P2, P3, P).
      
      
   sumatorias_cont_nivel(L, S) :- nivel_max(L, NivelMax), sumatorias_cont_nivel(L, S, 1, NivelMax).
   
   sumatorias_cont_nivel(_, [], NivelActual, NivelMax) :- NivelActual > NivelMax.

   sumatorias_cont_nivel(L, [S|SS], NivelActual, NivelMax) :-
      NivelActual=<NivelMax,
      sumatoria_nivel(L, NivelActual, S),
      NivelSig is NivelActual + 1,
      sumatorias_cont_nivel(L, SS, NivelSig, NivelMax).

% Está horrible esto pero funciona
