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

(define test-hailstone
    (test-suite
        " Test function: hailstone "
        (check-equal? (hailstone 0) '() "Input less than 1")
        (check-equal? (hailstone 1) '(1) "Input is 1")
        (check-equal? (hailstone 2) '(2 1) "Input is 2")
        (check-equal? (hailstone 3) '(3 10 5 16 8 4 2 1) "Input is 3")
        (check-equal? (hailstone 5) '(5 16 8 4 2 1) "Input is 5")
        (check-equal? (hailstone 58) '(58 29 88 44 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1) "Input is 58")
    ))

(define test-shift-char
    (test-suite
        " Test function: shift-char "
        (check-equal? (shift-char #\a 0) #\a "No shift")
        (check-equal? (shift-char #\a 1) #\b "Shift one char")
        (check-equal? (shift-char #\a 3) #\d "Shift three chars")
        (check-equal? (shift-char #\b -1) #\a "Shift negative chars")
        (check-equal? (shift-char #\a -1) #\z "Shift back")
        (check-equal? (shift-char #\z 1) #\a "Shift around")
    ))

(define test-caesar-encode
    (test-suite
        " Test function: caesar-encode "
        (check-equal? (caesar-encode "abc" 0) "abc" "No shift")
        (check-equal? (caesar-encode "abc" 1) "bcd" "Shift one char")
        (check-equal? (caesar-encode "abc" 3) "def" "Shift three chars")
        (check-equal? (caesar-encode "def" -3) "abc" "Shift negative three chars")
        (check-equal? (caesar-encode "abc" -3) "xyz" "Shift negative three chars around")
        (check-equal? (caesar-encode "xyz" 3) "abc" "Shift positive three chars around")
        (check-equal? (caesar-encode "abc" -2) "yza" "Shift negative two chars around")
    ))
 
; Start the execution of the test suite
(displayln "Testing: hailstone")
(run-tests test-hailstone)
(displayln "Testing: shift-char")
(run-tests test-shift-char)
(displayln "Testing: caesar-encode")
(run-tests test-caesar-encode)
