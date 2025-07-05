% Aquí va el código.

% head (x:xs) = x

% El pipe | separa cabeza y cola de la lista
head(X,[X|_]).

% Sólo sirve con listas de 3 elementos: 
% segundo(Segundo, [_,Segundo,_]).

segundo(Segundo, [_,Segundo|_]).

% Nuestro propio member
elem(X,[X|_]).
elem(X,[_|Cola]):-
    elem(X, Cola).



esHijo(bart, marge).
esHijo(hugo, marge).
esHijo(todd, ned).
esHijo(lisa, homero).
esHijo(hugo, homero).
esHijo(bart, homero).
esHijo(lisa, marge).
esHijo(maggie, homero).
esHijo(rod, ned).
esHijo(homero, abe).
esHijo(maggie, marge).
esHijo(abe, jorro).

ancestro(Descendiente, Ancestro):-
    esHijo(Descendiente, Ancestro).
ancestro(Descendiente, Ancestro):-
    esHijo(Hijo,Ancestro),
    ancestro(Descendiente, Hijo).




actividad(cine).
actividad(arjona).
actividad(princesasOnIce).
actividad(pool).
actividad(bowling).

costo(cine, 400).
costo(arjona, 1750).
costo(princesasOnIce, 2500).
costo(pool, 350).
costo(bowling, 300).

% posibleItinerario(Costo, Itinerario).

posibleItinerario(Costo, [Act | Acts]):-
    costo(Act, ElCostoDeUna),
    is(Restante, Costo - ElCostoDeUna),
    Restante >= 0,
    posibleItinerario(Restante, Acts).

posibleItinerario(_, []).




cocinero(donato).
cocinero(pietro).
pirata(felipe, 27).
pirata(marcos, 39).
pirata(facundo, 45).
pirata(tomas, 20).
pirata(betina, 26).
pirata(gonzalo, 22).

bravo(tomas).
bravo(felipe).
bravo(marcos).
bravo(betina).

persona(donato).
persona(pietro).
persona(felipe).
persona(marcos).
persona(facundo).
persona(tomas).
persona(gonzalo).
persona(betina).

% Un pirata quiere armar la tripulación para su barco. Él sólo quiere llevar:
% - cocineros o
% - piratas bravos o
% - piratas de más de 40 años
% No se puede llevar personas repetidas

tripulacionPosible(Tripulacion):-
    findall(Persona, puedeSubirAlBarco(Persona), TodosLosQuePueden),
    subconjunto(TodosLosQuePueden, Tripulacion).

puedeSubirAlBarco(Persona):-
    cocinero(Persona).
puedeSubirAlBarco(Persona):-
    pirata(Persona,_),
    bravo(Persona).
puedeSubirAlBarco(Persona):-
    pirata(Persona, Edad),
    Edad > 40.

% subconjunto(Todos, Subconjunto).
subconjunto(_,[]).
subconjunto([X|Xs], [X|Ys]):-
    subconjunto(Xs, Ys).
subconjunto([_|Xs], Ys):-
    subconjunto(Xs, Ys).
