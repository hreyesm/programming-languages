/*
Unit tests for factorial functions

Gilberto Echeverria
10/11/2020
*/

% Indicate the name for the tests
:- begin_tests(list_functions).
% Import the knowledge base
:- include("Hector_Reyes_pl9").

% Function 'sentence'
% Detection of invalid sentences
test(invalid_structure, [fail]) :-
    sentence(_, ['niño', 'corre'], _).
test(invalid_structure, [fail]) :-
    sentence(_, ['el', 'corre', 'niño'], _).
test(missmatched_article_gender, [fail]) :-
    sentence(_, ['el', 'niña', 'corre'], _).
test(missmatched_article_number, [fail]) :-
    sentence(_, ['el', 'niños', 'corre'], _).
test(missmatched_article_gender, [fail]) :-
    sentence(_, ['el', 'niño', 'lanza', 'el', 'pelota'], _).
test(missmatched_article_number, [fail]) :-
    sentence(_, ['el', 'niño', 'lanza', 'las', 'pelota'], _).
test(missmatched_verb_number, [fail]) :-
    sentence(_, ['el', 'niño', 'corren'], _).
test(missmatched_verb_number, [fail]) :-
    sentence(_, ['los', 'niños', 'corre'], _).
test(missmatched_adjective_gender, [fail]) :-
    sentence(_, ['el', 'niño', 'pequeña', 'corren'], _).
test(missmatched_adjective_number, [fail]) :-
    sentence(_, ['los', 'niños', 'grande', 'corre'], _).

% Recognition of valid sentences
test(intransitive_verb) :-
    sentence(sen(subj(art(el), nou(niño)), pred(v(corre))), ['el', 'niño', 'corre'], []).
test(intransitive_verb_plural_subject) :-
    sentence(sen(subj(art(los), nou(niños)), pred(v(corren))), ['los', 'niños', 'corren'], []).
test(transitive_verb) :-
    sentence(sen(subj(art(el), nou(niño)), pred(v(lanza), subj(art(la), nou(pelota)))), ['el', 'niño', 'lanza', 'la', 'pelota'], []).
test(transitive_verb_plural_subject) :-
    sentence(sen(subj(art(los), nou(niños)), pred(v(lanzan), subj(art(la), nou(pelota)))), ['los', 'niños', 'lanzan', 'la', 'pelota'], []).
test(adjectives) :-
    sentence(sen(subj(art(el), nou(niño), adj(grande)), pred(v(lanza), subj(art(las), nou(pelotas), adj(pequeñas)))), ['el', 'niño', 'grande', 'lanza', 'las', 'pelotas', 'pequeñas'], []).
test(adjectives) :-
    sentence(sen(subj(art(el), nou(niño), adj(grande)), pred(v(lanza), subj(art(las), nou(pelotas), adj(rojas)))), ['el', 'niño', 'grande', 'lanza', 'las', 'pelotas', 'rojas'], []).
test(adjectives) :-
    sentence(sen(subj(art(el), nou(niño), adj(grande)), pred(v(lanza), subj(art(la), nou(pelota), adj(roja)))), ['el', 'niño', 'grande', 'lanza', 'la', 'pelota', 'roja'], []).

:- end_tests(list_functions).
