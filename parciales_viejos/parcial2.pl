/*
   Escriba la función que tome como entrada una lista con sublistas de un solo nivel y una posición P,
   y elimine de cada sublista los elementos que están en la posición P.

   L = [[3, 8, 4, 2, 3], [1, 6, 3, 9, 8], [12, 15]]
   P = 3       ^                ^

   R = [[3, 8, 2, 3], [1, 6, 9, 8], [12, 15]]
*/
  
   eliminar_p_sublista([],_,_,[]).

   eliminar_p_sublista([X|XS], P, PActual, [X|RS]) :-
      PActual\=P,
      PSig is PActual + 1,
      eliminar_p_sublista(XS, P, PSig, RS).
      
   eliminar_p_sublista([_|XS], P, P, XS).
   
   lista_sin_p([], _, []).

   lista_sin_p([X|XS], P, [R|RS]) :-
      eliminar_p_sublista(X, P, 1, R),
      lista_sin_p(XS, P, RS).
  
/*
   Escriba la función que tome como entrada una lista de pares ordenados y una lista de números (sin sublistas),
   y devuelva otra lista que contenga una sublista por cada par, donde cada sublista incluya los elementos de
   la lista de números que pertenecen a la secuencia aritmética definida por dicho par.
   Cada par (A, S) define una secuencia que comienza en A y aumenta en S unidades cada paso (A, A+S, A+2S, ...).
   Si S es negativo, la sublista correspondiente debe estar vacía.
   Cada número puede aparecer en múltiples sublistas o en ninguna.
   Los elementos en cada sublista deben mantener el orden de aparición en la lista original.

   Lista de pares   = [[3, 2], [6, 0], [12, 3], [7, 1]]
   Lista de números = [4, 6, 4, 10, 3, 2, 5]
   Resultado        = [[3, 5], [6], [], [10]]
*/

  maximo([X],X).
  maximo([X|XS], X) :- maximo(XS,X1), X>X1.
  maximo([X|XS], Y) :- maximo(XS, Y), Y>X.
  

  secuencia_aritmetica([A,_S],Max,[]) :- A>Max.
  secuencia_aritmetica([_A,S],_Max,[]) :- S<0.
  secuencia_aritmetica([A,S],_Max,[A]) :- S=0.
  secuencia_aritmetica([A,S],Max,[A|RS]) :-
     A =< Max,
     S>0,
     A1 is A+S,
     secuencia_aritmetica([A1,S],Max,RS).
     
     
  pertenece(X,[X|_]).
  pertenece(X,[_|XS]) :- pertenece(X,XS).


  filtrar_elementos([],_F,[]).
  filtrar_elementos([X|XS], Filtro, [X|RS]) :-
     pertenece(X,Filtro),
     filtrar_elementos(XS, Filtro, RS).
  filtrar_elementos([X|XS], Filtro, RS) :-
     not(pertenece(X,Filtro)),
     filtrar_elementos(XS,Filtro,RS).


  lista_sec_arit([],_,[]).
  lista_sec_arit([P|PS], Nros, [R|RS]) :-
     maximo(Nros, Limite),
     secuencia_aritmetica(P,Limite,Secuencia),
     filtrar_elementos(Secuencia,Nros,R),
     lista_sec_arit(PS,Nros,RS).
