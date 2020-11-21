/*
Unit tests for factorial functions

Gilberto Echeverria
10/11/2020
*/

% Indicate the name for the tests
:- begin_tests(list_functions).
% Import the knowledge base
:- include(hector_reyes_pl8).

% Function 'in_list'
test(element_not_in_list, [fail]) :-
    in_list([e, t, y, s, w, h], u).
test(element_in_list) :-
    in_list([e, t, y, s, w, h], t).

% % Function 'element_at'
test(index_not_in_range, [fail]) :-
    element_at(4, [1, 2, 3], _).
test(element_at_index_0) :-
    element_at(0, [1, 2, 3], 1).
test(element_at_index_1) :-
    element_at(1, [1, 2, 3], 2).
test(element_at_index_2) :-
    element_at(2, [1, 2, 3], 3).
test(element_at_negative_index_1) :-
    element_at(-1, [1, 2, 3], 3).
test(element_at_negative_index_3) :-
    element_at(-3, [1, 2, 3], 1).
test(element_at_invalid_negative_index, [fail]) :-
    element_at(-4, [1, 2, 3], _).

% % Function 'range'
test(positive_range_step_1) :-
    range(2, 9, 1, [2, 3, 4, 5, 6, 7, 8]).
test(positive_range_step_n) :-
    range(2, 9, 3, [2, 5, 8]).
test(positive_range_invalid_step) :-
    range(9, 2, 1, []).
test(negative_range_step_1) :-
    range(9, 2, -1, [9, 8, 7, 6, 5, 4, 3]).
test(negative_range_step_n) :-
    range(9, 2, -4, [9, 5]).

% % Function 'remove_doubles'
test(empty_list) :-
    remove_doubles([], []).
test(list_without_repetitions) :-
    remove_doubles([a, b, c], [a, b, c]).
test(list_with_repetitions) :-
    remove_doubles([a, b, b, c, c], [a, b, c]).
test(list_with_more_repetitions) :-
    remove_doubles([a, b, b, b, c, c, c, c], [a, b, c]).
test(list_with_non_contiguous_repetitions) :-
    remove_doubles([a, a, a, b, b, b, c, c, a, a], [a, b, c, a]).

% % Function 'fibonacci'
test(fibonacci_up_to_0) :-
    fibonacci(0, [0]).
test(fibonacci_up_to_1) :-
    fibonacci(1, [0, 1]).
test(fibonacci_up_to_2) :-
    fibonacci(2, [0, 1, 1]).
test(fibonacci_up_to_3) :-
    fibonacci(3, [0, 1, 1, 2]).
test(fibonacci_up_to_5) :-
    fibonacci(5, [0, 1, 1, 2, 3, 5]).
test(fibonacci_up_to_10) :-
    fibonacci(10, [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]).

:- end_tests(list_functions).
