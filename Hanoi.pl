
:- dynamic mvcounter/1.

mvcounter(0).

increment_mvcounter :-
   retract(mvcounter(X)),
   Y is X + 1,
   asserta(mvcounter(Y)).

get_mvcounter(Value) :-
   mvcounter(Value).

move(1, X, _, Y) :-
   increment_mvcounter,
   get_mvcounter(Value),
   write('This is move #'), write(Value),write('. Next move is: '),
   write('Move top disk from '), write(X),
   write(' to '), write(Y), nl.

move(N,X,Z,Y) :-

   N>1,
   M is N-1,
   move(M,X,Y,Z),
   move(1,X,_,Y),
   move(M,Z,X,Y).

start(N) :-
   asserta(mvcounter(0)),
   move(N, 'origin', 'mediate', 'destiny').




