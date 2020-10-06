#|
    First Racket homework
    Using functions and arithmetic operations and lists

    Gilberto Echeverria
    13/08/2020
|#

; Import library for unit testing
(require rackunit)
; Import necesary to view the test results
(require rackunit/text-ui)

(define test-get-pi-regular
    (test-suite
        " Test function: get-pi-regular "
        (check-= (get-pi-regular 0)       0.0             0.0000000000001 "Zero iterations")
        (check-= (get-pi-regular 1)       4.0             0.0000000000001 "Zero iterations")
        (check-= (get-pi-regular 2)       2.6666666666666 0.0000000000001 "One iteration")
        (check-= (get-pi-regular 3)       3.4666666666666 0.0000000000001 "Two iterations")
        (check-= (get-pi-regular 4)       2.8952380952380 0.0000000000001 "Three iterations")
        (check-= (get-pi-regular 10)      3.0418396189294 0.0000000000001 "10 iterations")
        (check-= (get-pi-regular 1000)    3.1405926538397 0.0000000000001 "1000 iterations")
        (check-= (get-pi-regular 100000)  3.1415826535897 0.0000000000001 "1000 iterations")
        (check-= (get-pi-regular 1000000) 3.1415916535897 0.0000000000001 "1000000 iterations")
    ))

(define test-get-pi
    (test-suite
        " Test function: get-pi "
        (check-= (get-pi 0)       0.0             0.0000000000001 "Zero iterations")
        (check-= (get-pi 1)       4.0             0.0000000000001 "Zero iterations")
        (check-= (get-pi 2)       2.6666666666666 0.0000000000001 "One iteration")
        (check-= (get-pi 3)       3.4666666666666 0.0000000000001 "Two iterations")
        (check-= (get-pi 4)       2.8952380952380 0.0000000000001 "Three iterations")
        (check-= (get-pi 10)      3.0418396189294 0.0000000000001 "10 iterations")
        (check-= (get-pi 1000)    3.1405926538397 0.0000000000001 "1000 iterations")
        (check-= (get-pi 100000)  3.1415826535897 0.0000000000001 "1000 iterations")
        (check-= (get-pi 1000000) 3.1415916535897 0.0000000000001 "1000000 iterations")
    ))

(define test-ln-2
    (test-suite
        " Test function: ln-2 "
        (check-= (ln-2 0)       0.0             0.0000000000001 "Zero iterations")
        (check-= (ln-2 1)       0.5             0.0000000000001 "Zero iterations")
        (check-= (ln-2 2)       0.5833333333333 0.0000000000001 "One iteration")
        (check-= (ln-2 3)       0.6166666666666 0.0000000000001 "Two iterations")
        (check-= (ln-2 4)       0.6345238095238 0.0000000000001 "Three iterations")
        (check-= (ln-2 10)      0.6687714031754 0.0000000000001 "10 iterations")
        (check-= (ln-2 1000)    0.6928972430599 0.0000000000001 "1000 iterations")
        (check-= (ln-2 100000)  0.6931446805661 0.0000000000001 "1000 iterations")
        (check-= (ln-2 1000000) 0.6931469305600 0.0000000000001 "1000000 iterations")
    ))


; Start the execution of the test suite
(displayln "Testing: get-pi-regular")
(run-tests test-get-pi-regular)
(displayln "Testing: get-pi")
(run-tests test-get-pi)
(displayln "Testing: ln-2")
(run-tests test-ln-2)
