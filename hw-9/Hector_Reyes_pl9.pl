/*
Homework: NLP
-------------------------------------
Course: Programming Languages
Teacher: Gilberto Echeverría Furió
Author: Héctor Alexis Reyes Manrique (A01339607)
Date: November 30th, 2020
*/


/*
Dictionary
----------
*/

% Articles

article(art(el), sin, mas, L0, L) :- terminal(el, L0, L).
article(art(la), sin, fem, L0, L) :- terminal(la, L0, L).
article(art(los), plu, mas, L0, L) :- terminal(los, L0, L).
article(art(las), plu, fem, L0, L) :- terminal(las, L0, L).
article(art(ellos), plu, mas, L0, L) :- terminal(ellos, L0, L).
article(art(ellas), plu, fem, L0, L) :- terminal(ellas, L0, L).
article(art(un), sin, mas, L0, L) :- terminal(un, L0, L).
article(art(una), sin, fem, L0, L) :- terminal(una, L0, L).
article(art(unos), plu, mas, L0, L) :- terminal(unos, L0, L).
article(art(unas), plu, fem, L0, L) :- terminal(unas, L0, L).
article(art(mi), sin, _, L0, L) :- terminal(mi, L0, L).
article(art(mis), plu, _, L0, L) :- terminal(mis, L0, L).

% Nouns

noun(nou(estudiante), sin, _, L0, L) :- terminal(estudiante, L0, L).
noun(nou(estudiantes), plu, _, L0, L) :- terminal(estudiantes, L0, L).
noun(nou(clase), sin, fem, L0, L) :- terminal(clase, L0, L).
noun(nou(clases), plu, fem, L0, L) :- terminal(clases, L0, L).
noun(nou(alumno), sin, mas, L0, L) :- terminal(alumno, L0, L).
noun(nou(alumnos), plu, mas, L0, L) :- terminal(alumnos, L0, L).
noun(nou(alumna), sin, fem, L0, L) :- terminal(alumna, L0, L).
noun(nou(alumnas), plu, fem, L0, L) :- terminal(alumnas, L0, L).
noun(nou(niño), sin, mas, L0, L) :- terminal(niño, L0, L).
noun(nou(niños), plu, mas, L0, L) :- terminal(niños, L0, L).
noun(nou(niña), sin, fem, L0, L) :- terminal(niña, L0, L).
noun(nou(niñas), plu, fem, L0, L) :- terminal(niñas, L0, L).
noun(nou(pelota), sin, fem, L0, L) :- terminal(pelota, L0, L).
noun(nou(pelotas), plu, fem, L0, L) :- terminal(pelotas, L0, L).
noun(nou(bici), sin, fem, L0, L) :- terminal(bici, L0, L).

% Verbs

verb(v(asiste), sin, transitive, L0, L) :- terminal(asiste, L0, L).
verb(v(asisten), plu, transitive, L0, L) :- terminal(asisten, L0, L).
verb(v(escucha), sin, _, L0, L) :- terminal(escucha, L0, L).
verb(v(escuchan), plu, _, L0, L) :- terminal(escuchan, L0, L).
verb(v(rie), sin, intransitive, L0, L) :- terminal(rie, L0, L).
verb(v(rien), plu, intransitive, L0, L) :- terminal(rien, L0, L).
verb(v(corre), sin, intransitive, L0, L) :- terminal(corre, L0, L).
verb(v(corren), plu, intransitive, L0, L) :- terminal(corren, L0, L).
verb(v(lanza), sin, transitive, L0, L) :- terminal(lanza, L0, L).
verb(v(lanzan), plu, transitive, L0, L) :- terminal(lanzan, L0, L).
verb(v(monta), sin, transitive, L0, L) :- terminal(monta, L0, L).
verb(v(montan), plu, transitive, L0, L) :- terminal(montan, L0, L).

% Adjectives

adjective(adj(grande), sin, _, L0, L) :- terminal(grande, L0, L).
adjective(adj(grandes), sin, _, L0, L) :- terminal(grandes, L0, L).
adjective(adj(pequeña), sin, fem, L0, L) :- terminal(pequeña, L0, L).
adjective(adj(pequeñas), plu, fem, L0, L) :- terminal(pequeñas, L0, L).
adjective(adj(roja), sin, fem, L0, L) :- terminal(roja, L0, L).
adjective(adj(rojas), plu, fem, L0, L) :- terminal(rojas, L0, L).


/*
Terminal
--------
*/

terminal(Word, [Word|Rest], Rest).


/*
Predicates
--------
*/

sentence(sen(Subject, Predicate), L0, L) :-
    subject(Subject, Number, L0, L1),
    predicate(Predicate, Number, L1, L), !.

subject(subj(Article, Noun), Number, L0, L) :-
    article(Article, Number, Gender, L0, L1),
    noun(Noun, Number, Gender, L1, L), !.

subject(subj(Article, Noun, Adjective), Number, L0, L) :-
    article(Article, Number, Gender, L0, L1),
    noun(Noun, Number, Gender, L1, L2),
    adjective(Adjective, Number, Gender, L2, L), !.

predicate(pred(Verb), Number, L0, L) :-
    verb(Verb, Number, intransitive, L0, L), !.

predicate(pred(Verb, DirectObject), Number, L0, L) :-
    verb(Verb, Number, _, L0, L1),
    subject(DirectObject, _, L1, L), !.