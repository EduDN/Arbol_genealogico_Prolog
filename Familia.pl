hombre(saul).
hombre(jorge).
hombre(fabio). %Agregado
hombre(ivan).
hombre(silvio). %Agregado
mujer(elena).
mujer(julia).
mujer(rosalba).
mujer(bree).
padres(rosalba,jorge).
padres(rosalba,julia).
padres(rosalba,saul).
padres(ivan,saul).
padres(ivan,jorge).
padres(ivan,julia).
padres(fabio,rosalba).
padres(fabio,silvio).
padres(elena,rosalba). %Agregado
padres(elena,silvio).
padres(silvio,bree).
hermano(silvio,rosalba).
hermano(X,Y):-
    padres(P,X),
    padres(P,Y),
    hombre(X),
    not(Y==X).
hermana(rosalba,silvio).
hermana(X,Y):-
    padres(P,X),
    padres(P,Y),
    mujer(X),
    not(Y==X).
%reglas
abuelos(X,Z):-
    padres(X,Y),
    padres(Y,Z).

abuela(X,Y):-
    abuelos(X,Y),
    mujer(X).

abuelo(X,Y):-
    abuelos(X,Y),
    hombre(X).

madre(X,Y):-
    padres(X,Y)
    ,mujer(X).

padre(X,Y):-
    padres(X,Y),
    hombre(X).

sobrina(X,Y):-
    padres(P,X),
    (hermana(P,Y);hermano(P,Y)),
    mujer(X).

sobrino(X,Y):-
    padres(P,X),
    (hermana(P,Y);hermano(P,Y)),
    hombre(X).

tios(X,Y):-
    %Corte
    padres(P,Y),!,
    (hermano(P,X);hermana(P,X)).
