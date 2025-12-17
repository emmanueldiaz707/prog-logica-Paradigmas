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

