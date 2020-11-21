/* Homework: Prolog Lists
   ----------------------
Course: Programming Languages
Teacher: Gilberto Echeverría Furió
Author: Héctor Alexis Reyes Manrique (A01339607)
        (in collaboration with Daniela Vignau León)
Date: November 20th, 2020 */



/* Takes a list and an element, and determines if the element can be found inside the list. 

*/

in_list([Element|_], Element) :- !.
in_list([_|Tail], Element) :-
    in_list(Tail, Element).



% Takes an index and a list, and returns the element at index n of the list. If the index is negative, then the iteration is started from the right side.

element_at(0, [Element|_], Element) :- !.
element_at(Index, [_|Tail], Element) :-
    Index >= 0, 
    NewIndex is Index - 1,
    element_at(NewIndex, Tail, Element), !.
element_at(Index, List, Element) :-
    Index < 0,
    length(List, Length),
    NewIndex is Length + Index,
    NewIndex >= 0,
    element_at(NewIndex, List, Element), !.



% Takes a starting and ending number, as well as an increment and a list. The list will be a collection of numbers from start to finish, with the increment specified. The top limit is not inclusive. If it is not possible to get from start to finish with the increment provided, return an empty list.

range(Start, Stop, Step, []) :-
    Start =< Stop,
    Step < 0, !.
range(Start, Stop, Step, []) :-
    Start >= Stop,
    Step > 0, !.
range(Start, Stop, Step, [Start|Tail]) :-
    Start < Stop,
    Next is Start + Step,
    range(Next, Stop, Step, Tail), !.
range(Start, Stop, Step, [Start|Tail]) :-
    Start > Stop,
    Next is Start + Step,
    range(Next, Stop, Step, Tail), !.



% Takes a list and returns a list where there are no continiuous elements duplicated.

remove_doubles([], []) :- !. 
remove_doubles([Element], [Element]) :- !. 
remove_doubles([Element,Element|Tail], Ans) :-
    remove_doubles([Element|Tail], Ans), !.
remove_doubles([Element,Diff|Tail], [Element|Ans]) :-
    Element \== Diff,
    remove_doubles([Diff|Tail], Ans).



% Takes a positive integer and returns a list containing the numbers in the Fibonacci sequence to the given integer.

fibonacci(0, [0]) :- !.
fibonacci(1, [0, 1]) :- !.
fibonacci(Num, Series) :-
    Num > 1,
    Num1 is Num - 1,
    Num2 is Num - 2,
    fibonacci(Num1, Index1),
    last(Index1, Val1),
    fibonacci(Num2, Index2),
    last(Index2, Val2),
    Val is Val1 + Val2,
    append(Index1, [Val], Series).