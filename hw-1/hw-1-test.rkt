#|
    First Racket homework
    Using functions and arithmetic operations

    Gilberto Echeverria
    09/08/2020
|#

; Import library for unit testing
(require rackunit)
; Import necesary to view the test results
(require rackunit/text-ui)

(define test-is-triangle?
    (test-suite
        " Test function: is-triangle? "
        (check-equal? (is-triangle? 0 0 0) #f "All sides are 0")
        (check-equal? (is-triangle? 0 0 1) #f "Two sides are 0")
        (check-equal? (is-triangle? 0 1 1) #f "One sides are 0")
        (check-equal? (is-triangle? 1 1 1) #t "All sides equal")
        (check-equal? (is-triangle? 1 6 1) #f "One side too long")
        (check-equal? (is-triangle? 1 6 8) #f "One side too short")
        (check-equal? (is-triangle? 5 6 8) #t "Correct triangle")
    ))

(define test-triangle-type
    (test-suite
        " Test function: triangle-type "
        (check-equal? (triangle-type 0 0 0) 'INVALID "Incorrect triangle sides")
        (check-equal? (triangle-type 1 6 1) 'INVALID "Incorrect triangle sides")
        (check-equal? (triangle-type 1 1 1) 'EQUILATERAL "All sides equal")
        (check-equal? (triangle-type 4 6 4) 'ISOSCELES "All sides equal")
        (check-equal? (triangle-type 5 6 8) 'SCALENE "All sides equal")
    ))

(define test-parking-ticket
    (test-suite
        " Test function: parking-ticket "
        (check-= (parking-ticket 0) 0 0.001 "Time parked: 0")
        (check-= (parking-ticket 1) 2 0.001 "Time parked: 1")
        (check-= (parking-ticket 3) 2 0.001 "Time parked: 3")
        (check-= (parking-ticket 4) 2.5 0.001 "Time parked: 4")
        (check-= (parking-ticket 7) 4 0.001 "Time parked: 7")
        (check-= (parking-ticket 3.2) 2.5 0.001 "Time parked: 3.2")
        (check-= (parking-ticket 7.4) 4.5 0.001 "Time parked: 7.4")
        (check-= (parking-ticket 20) 10 0.001 "Time parked: 20")
    ))

; Start the execution of the test suite
(displayln "Testing: is-triangle?")
(run-tests test-is-triangle?)
(displayln "Testing: triangle-type")
(run-tests test-triangle-type)
(displayln "Testing: parking-ticket")
(run-tests test-parking-ticket)
