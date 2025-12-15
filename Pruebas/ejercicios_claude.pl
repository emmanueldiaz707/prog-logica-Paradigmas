% 1. maximo(Lista, Max)
maximo([X], X).
maximo([X|XS], X) :- maximo(XS,M), X>M.
maximo([X|XS], M) :- maximo(XS,M), X=<M.

% 2. ultimo(Lista, Elem)
ultimo([X],X).
ultimo([_|XS], U) :- ultimo(XS,U).

% 3. posicion_elem(Elem, Lista, Pos)
%posicion_elem(_,[],0).
posicion_elem(X,[X|_],1).
posicion_elem(E,[X|XS],P) :- E \= X, posicion_elem(E,XS,P1), P is P1+1.

% 4. duplicar(Lista, ListaDuplicada)
% [1,2,3] -> [1,1,2,2,3,3]
duplicar([X], [X,X]).
duplicar([X|XS], [X,X|XS1]) :- duplicar(XS,XS1).

% 5. invertir(Lista, ListaInvertida)

% 6. eliminar_elem(Elem, Lista, Resultado)
% Eliminar primera ocurrencia de un elemento

% 7. contar_mayores(Lista, Umbral, Cantidad)

% 8. todos_positivos(Lista)
% Verifica si todos los elementos de la lista son positivos

% 9. rango(Lista, Min, Max)
% Hallar mínimo y máximo

% 10. concatenar(Lista1, Lista2, Resultado)

% 11. intercalar(Lista1, Lista2, Resultado)
% [1,2,3], [a,b,c] -> [1,a,2,b,3,c]

% 12. sublista(Sublista, Lista)
% [2,3], [1,2,3,4] -> true

% 13. partir(Lista, N, Inicio, Fin)
% [1,2,3,4,5], 2 -> [1,2], [3,4,5].

% 14. aplanar(ListaAnidada, ListaPlana)
% [1,[2,3],[4,[5,6]],7] -> [1,2,3,4,5,6,7]

% 15. eliminar_duplicados(Lista, ListaSinDuplicados)

% 16. es_palindromo(Lista)

% 17. ordenada(Lista)
% [1,3,2] -> false

% 18. segundo_minimo(Lista, Segundo)
% [5,1,3,8,2] -> 2

