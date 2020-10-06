; Homework: Racket Recursion
; --------------------------
; Course: Programming Languages
; Teacher: Gilberto Echeverría Furió
; Author: Héctor Alexis Reyes Manrique (A01339607)
; Date: September 15th, 2020


#lang racket


(define (get-pi-regular n-terms)
    ; Computes the value of pi using regular recursion

    ; Parameters
    ; ----------
    ; n-terms : number
    ;     Number of terms to compute in the series

    ; Returns
    ; -------
    ; number
    ;     Approximation of pi

    (if (zero? n-terms)
        0
        (+ (get-pi-regular (sub1 n-terms)) (/ (* (expt -1.0 (add1 n-terms)) 4.0) (- (* 2.0 n-terms) 1.0)))))


(define (get-pi n-terms)
    ; Computes the value of pi using tail recursion

    ; Parameters
    ; ----------
    ; n-terms : number
    ;     Number of terms to compute in the series

    ; Returns
    ; -------
    ; number
    ;     Approximation of pi

    (let loop ([i n-terms][accumulator 0.0])
        (if (zero? i)
            accumulator
            (loop 
                (sub1 i)
                (+ accumulator (/ (* (expt -1.0 (add1 i)) 4.0) (sub1 (* 2.0 i))))))))


(define (ln-2 n-terms)
    ; Computes the value of the natural logarithm of 2 using tail recursion

    ; Parameters
    ; ----------
    ; n-terms : number
    ;     Number of terms to compute in the series

    ; Returns
    ; -------
    ; number
    ;     Approximation of the natural logarithm of 2

    (let loop ([i n-terms][accumulator 0.0])
        (if (zero? i)
            accumulator
            (loop
                (sub1 i)
                (+ accumulator (/ 1 (* (* 2 i)(- (* 2 i) 1))))))))