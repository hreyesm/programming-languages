; Homework: Racket Lists
; ----------------------
; Course: Programming Languages
; Teacher: Gilberto Echeverría Furió
; Author: Héctor Alexis Reyes Manrique (A01339607)
; Date: September 25th, 2020

#lang racket


(define (hailstone n)
    ; Generates a list of numbers, starting at the number provided and finishing at 1. Numbers in between are obtained and added to the list as follows:
    ;   1) if the number is even, divide it by 2
    ;   2) If the number is odd, multiply it by 3 and add 1

    ; Parameters
    ; ----------
    ; n : int

    ; Returns
    ; -------
    ; List[int]

    (if (zero? n)
        empty
        (let loop ([n n] [ans empty])
            (cond [(= n 1)
                (append ans (list n))]
            [(zero? (modulo n 2))
                (loop (/ n 2) (append ans (list n)))]
            [else
                (loop (+ (* n 3) 1) (append ans (list n)))]))))


(define (shift-char c n)
    ; Changes a character in the English alphabet for the one at the distance indicated by an integer (positive or negative)

    ; Parameters
    ; ----------
    ; c : char
    ; n : int

    ; Returns
    ; -------
    ; char

    (define (c->i c n)
        (+ (char->integer c) (modulo n -26)))   
    (if (< (c->i c n) 97)
        (integer->char (+ (c->i c n) 26))
        (integer->char (c->i c n))))


(define (caesar-encode s n)
    ; Encodes a string by shifting each of its characters the distance indicated by an integer

    ; Parameters
    ; ----------
    ; s : str
    ; n : int

    ; Returns
    ; -------
    ; str

    (let loop ([s-list (string->list s)] [n n] [ans empty])
        (if (empty? s-list)
            (list->string ans)
            (loop (cdr s-list) n (append ans (list (shift-char (car s-list) n)))))))