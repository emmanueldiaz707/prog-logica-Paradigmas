/*
   Escriba una función que tome como entrada una lista con sublistas L y reordene los elementos de la lista principal y cada sublista
   de tal manera que queden todos los números al principio y las listas al final (de la lista y cada sublista).

   L = [2, 8, [3, 1], 2, [7, 3, 10, [4, 2], 9, [1]], 4]

   R = [2, 8, 2, 4, [3, 1], [7, 3, 10, 9, [4, 2], [1]]]
*/

   /* NO RESPETA EL ORDEN DE APARICIÓN, PERO NO LO EXIGE LA CONSIGNA
   
   ordenar_sublista([],[]).

   ordenar_sublista([X|XS], [X|RS]) :-
      not(is_list(X)),
      ordenar_sublista(XS,RS).


   ordenar_sublista([X|XS], R) :-
      is_list(X),
      ordenar_sublista(X,R1),
      ordenar_sublista(XS,R2),
      append(R2,[R1],R).
   */
   
   % RESPETA EL ORDEN DE APARICIÓN
   
   ordenar_sublista(L,R) :- ordenar_sublista(L, [], [], R).
   
   ordenar_sublista([X|XS], Numeros, Sublistas, R) :-
      number(X),
      append(Numeros, [X], Numeros1),
      ordenar_sublista(XS,Numeros1,Sublistas,R).
      
   ordenar_sublista([X|XS], Numeros, Sublistas, R) :-
      is_list(X),
      ordenar_sublista(X,RX),
      append(Sublistas,[RX],Sublistas1),
      ordenar_sublista(XS,Numeros,Sublistas1,R).

   ordenar_sublista([], Numeros, Sublistas, R) :-
      append(Numeros, Sublistas, R).

