%Exercicio1:

%VitorSantiniBessa(11821BCC010)
contem(I,F,B) :- B>=I,B=<F.
contem([[I,F]|T],B) :- contem(I,F,B);
contem(T,B).

%JuntandoDoisintervalos
insere( [[I1,F1],[I2,F2]|T],[[I1,F2]|T],[X,Y]) :- X is F1 +1,
Y is I2 -1,!.
insere( [[I1,F1]|T],[[I1,Y]|T],[X,Y]) :- X==I1,
Y>F1; contem(I1,F1,X),!.
insere( [[I1,F1]|T],[[X,F1]|T],[X,Y]) :- X<I1,
Y==F1; contem(I1,F1,Y),!.

%Noinicio
insere( [[I,F]],[[X,Y],[I,F]],[X,Y]) :- X<I, Y<F,!.

%Nofim
insere( [ [I,F]|T], [[[I,F]|T],[X,Y]], [X,Y]) :- X>F,!.

%Novointervalo
insere( [ [I,F]|T], [ [X,Y],[I,F]|T],[X,Y]):- Y<I,!.
insere( [], [ [X,Y] ], [X,Y]) :- !.

%recursao
insere( [H|T],[H|Ti],X) :- insere(T,Ti,X).


%Exercicio2:

%VitorSantiniBessa(11821BCC010)
contem(I,F,[X,Y]) :- X>=I,Y=<F.
contem([[I,F]|T],B) :- contem(I,F,B);
contem(T,B).

contem1(I,F,B) :- B>=I,B=<F.
contem1([[I,F]|T],B) :- contem1(I,F,B);
contem1(T,B).

%removendotudo
remove( [ [R,F]],[] ,[X,Y]):- X==R, Y==F,!.

%removedofim
remove( [ [I,R]|T], [ [I,P]|T], [X,Y]) :- Y==R, P is X-1,!.

%removedoinicio
remove( [ [I,R]|T], [ [P,R]|T], [X,Y]) :- X==I, P is Y+1,!.

%removedomeio
remove( [ [I,F]|T ], [ [I,NF],[NI,F]|T],[X,Y] ) :-
contem(I,F,[X,Y]),
NF is X-1,
NI is Y+1,!.

%removedeambos
remove( [ [I,F],[I1,F1]|T ], [ [I,NF],[NI,F1]|T],[X,Y] ) :- contem1(I,F,X), contem1(I1,F1,Y), NF is X-1, NI is Y+1,!.
