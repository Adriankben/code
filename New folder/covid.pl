:- use_module(library(pce)).

:- dynamic stats/2.
:- dynamic riskcountry/1.
:- dynamic riskcountry/1.
:- dynamic riskcountry/1.
:- dynamic underlyingill/1.


% total number diagnosed, total number of persons at risk
stats(0,0).

riskcountry(jamaica, china, usa).
riskcountryD('united kingdom', germany, denmark, usa).
riskcountryO().

findall(X,avenger(X),Avengers).

% insert countries with high variant infection rate
addfact(C):-assert(riskcountry(C)), nl, write('Country: '), write(C), write('added to regular database').
addfact1(C):-assert(riskcountryD(C)), nl, write('Country: '), write(C), write('added to Delta database').
addfact2(C):-assert(riskcountryO(C)), nl, write('Country: '), write(C), write('added to Omicron database').


underlyingill:-.

statistics:- write("Covid Rate, Underlying COnditions").