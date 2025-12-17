/*
   39. Escriba una función llamada "Cantidad-de" que toma como argumentos una lista y una condición (función),
   y devuelve la cantidad de elementos de la lista que cumplen con dicha condición.
*/

  par(X) :- 0 is X mod 2.
  mayor_que_tres(X) :- X>3.
  mayor_que_cinco(X) :- X>5.

  cantidad_de([],_,0).
  cantidad_de([X|XS], Condicion, Cant) :-
     call(Condicion,X),
     cantidad_de(XS,Condicion,Cant1),
     Cant is Cant1 + 1.
  cantidad_de([X|XS], Condicion, Cant) :-
     not(call(Condicion,X)),
     cantidad_de(XS,Condicion,Cant).


%  41. Defina una función llamada “Select” que devuelva la lista de elementos que cumplen con una determinada condición.

   select1([],_,[]).
   select1([X|XS], Condicion, [X|RS]) :-
      call(Condicion,X),
      select1(XS,Condicion,RS).
   select1([X|XS], Condicion, R) :-
      not(call(Condicion,X)),
      select1(XS,Condicion,R).