; Homework: Racket Functions
; --------------------------
; Course: Programming Languages
; Teacher: Gilberto Echeverría Furió
; Author: Héctor Alexis Reyes Manrique (A01339607)
; Date: September 8th, 2020

#lang racket

(define (is-triangle? a b c)
    ; Receives the length of three sides and determines whether they describe a valid triangle.

    ; Parameters
    ; ----------
    ; a, b, c : number
    ;     Length of side

    ; Returns
    ; -------
    ; boolean
    ;     True if a, b, and c describe a valid triangle
    ;     False otherwise

    (if (and
        (and
            (> a 0)
            (> b 0)
            (> c 0))
        (and
            (> (+ a b) c)
            (> (+ b c) a)
            (> (+ c a) b)))
        #t
        #f))

(define (triangle-type a b c)
    ; Receives the length of three sides and, if they describe a valid triangle, decides on the type of triangle. 

    ; Parameters
    ; ----------
    ; a, b, c : number
    ;     Length of side

    ; Returns
    ; -------
    ; symbol
    ;     'INVALID
    ;     'EQUILATERAL
    ;     'ISOSCELES
    ;     'SCALENE

    (if (is-triangle? a b c)
        (cond
            [(= a b c) 'EQUILATERAL]
            [(or
                (and (not (= a b)) (= a c))
                (and (not (= a c)) (= a b))
                (and (not (= b c)) (= a b))
            ) 'ISOSCELES]
            [(and
                (not (= a b))
                (not (= a c))
                (not (= b c))
            ) 'SCALENE])
        'INVALID))

(define (parking-ticket h)
    ; Receives an amount of time in hours (with decimals) and the amount to pay for parking time, following these rules:
    ;     - Pay $2 for the first 3 hours
    ;     - After 3 hours, any hour (full or partial) pays $0.5
    ;     - The maximum cost is $10

    ; Parameters
    ; ----------
    ; h : number
    ;     Amount of time in hours

    ; Returns
    ; -------
    ; number
    ;     Amount to pay for parking time

    (define (amount h)
        (+ (* h 0.5) 1))
    (cond
        [(zero? h) 0]
        [(<= h 3) 2]
        [else (cond
                [(> (amount h)(+ (floor (amount h)) 0.5))
                    (min (+ (floor (amount h)) 0.5) 10)]
                [(= (amount h)(floor (amount h)))
                    (min (- (floor (amount h)) 0.5) 10)]
                [(<= (amount h)(+ (floor (amount h)) 0.5))
                    (min (floor (amount h)) 10)])]))