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
   R = Resultado = [1, 18, 17, 9]
*/