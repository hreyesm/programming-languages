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

(define test-shift-char
    (test-suite
        " Test function: shift-char "
        (check-equal? (shift-char #\a 0) #\a "No shift")
        (check-equal? (shift-char #\a 1) #\b "Shift one char")
        (check-equal? (shift-char #\a 3) #\d "Shift three chars")
        (check-equal? (shift-char #\b -1) #\a "Shift negative chars")
        (check-equal? (shift-char #\a -1) #\z "Shift back")
        (check-equal? (shift-char #\z 1) #\a "Shift around")
        (check-equal? (shift-char #\A 0) #\A "No shift uppercase")
        (check-equal? (shift-char #\A 1) #\B "Shift one char uppercase")
        (check-equal? (shift-char #\A 3) #\D "Shift three chars uppercase")
        (check-equal? (shift-char #\B -1) #\A "Shift negative chars uppercase")
        (check-equal? (shift-char #\A -1) #\Z "Shift back uppercase")
        (check-equal? (shift-char #\Z 1) #\A "Shift around uppercase")
        (check-equal? (shift-char #\5 9) #\5 "No change to non letter characters")
        (check-equal? (shift-char #\" 9) #\" "No change to non letter characters")
        (check-equal? (shift-char #\  9) #\  "No change to non letter characters")
    ))

(define test-caesar-encode
    (test-suite
        " Test function: caesar-encode "
        (check-equal? (caesar-encode "abc" 0 #f) "abc" "No shift")
        (check-equal? (caesar-encode "abc" 1 #f) "bcd" "Encode one char")
        (check-equal? (caesar-encode "abc" 3 #f) "def" "Encode three chars")
        (check-equal? (caesar-encode "def" -3 #f) "abc" "Encode negative three chars")
        (check-equal? (caesar-encode "abc" -3 #f) "xyz" "Encode negative three chars around")
        (check-equal? (caesar-encode "xyz" 3 #f) "abc" "Encode positive three chars around")
        (check-equal? (caesar-encode "abc" -2 #f) "yza" "Encode negative two chars around")
        (check-equal? (caesar-encode "abc" 0 #t) "abc" "No shift")
        (check-equal? (caesar-encode "bcd" 1 #t) "abc" "Decode one char")
        (check-equal? (caesar-encode "efg" 3 #t) "bcd" "Decode three chars")
        (check-equal? (caesar-encode "abc" -3 #t) "def" "Decode negative three chars")
        (check-equal? (caesar-encode "xyz" -3 #t) "abc" "Decode negative three chars around")
        (check-equal? (caesar-encode "abc" 3 #t) "xyz" "Decode positive three chars around")
        (check-equal? (caesar-encode "xyz" -2 #t) "zab" "Decode negative two chars around")
        (check-equal? (caesar-encode "ABC" -2 #f) "YZA" "Encode negative two chars around uppercase")
        (check-equal? (caesar-encode "XYZ" -2 #t) "ZAB" "Decode negative two chars around uppercase")
        (check-equal? (caesar-encode "The 3 Red $% Tigers" 5 #f) "Ymj 3 Wji $% Ynljwx" "Encode mixed characters")
        (check-equal? (caesar-encode "Ymj 3 Wji $% Ynljwx" 5 #t) "The 3 Red $% Tigers" "Decode mixed characters")
    ))
 
(define test-letter-distance
    (test-suite
        " Test function: letter-distance "
        (check-equal? (letter-distance #\a) 0 "From a to a")
        (check-equal? (letter-distance #\b) 1 "From b to a")
        (check-equal? (letter-distance #\m) 12 "From m to a")
        (check-equal? (letter-distance #\z) 25 "From z to a")
    ))

(define test-vigenere-encode
    (test-suite
        " Test function: vigenere-encode "
        (check-equal? (vigenere-encode "Jump" "aaaa" #f) "Jump" "No shift, data length equal to key length")
        (check-equal? (vigenere-encode "Jump" "bbbb" #f) "Kvnq" "Shift 1 all characters, data length equal to key length")
        (check-equal? (vigenere-encode "Jump" "done" #f) "Mizt" "Different shifts, data length equal to key length")
        (check-equal? (vigenere-encode "Test sentence #35" "aaaa" #f) "Test sentence #35" "No shift, shorter key length")
        (check-equal? (vigenere-encode "Test sentence #35" "bbbb" #f) "Uftu tfoufodf #35" "Shift 1 all characters, shorter key length")
        (check-equal? (vigenere-encode "Test sentence #35" "done" #f) "Wsfx grrwsagh #35" "Different shifts, shorter key length")
        (check-equal? (vigenere-encode "Jump" "aaaa" #t) "Jump" "No shift, data length equal to key length")
        (check-equal? (vigenere-encode "Kvnq" "bbbb" #t) "Jump" "Shift 1 all characters, data length equal to key length")
        (check-equal? (vigenere-encode "Mizt" "done" #t) "Jump" "Different shifts, data length equal to key length")
        (check-equal? (vigenere-encode "Test sentence #35" "aaaa" #t) "Test sentence #35" "No shift, shorter key length")
        (check-equal? (vigenere-encode "Uftu tfoufodf #35" "bbbb" #t) "Test sentence #35" "Shift 1 all characters, shorter key length")
        (check-equal? (vigenere-encode "Wsfx grrwsagh #35" "done" #t) "Test sentence #35" "Different shifts, shorter key length")
    ))

(define test-file->list
    (test-suite
        " Test function: file->list "
        (check-equal? (file->list "test_file_0.txt") '() "Empty file")
        (check-equal? (file->list "test_file_1.txt") '("Line one" "Line two" "Line three" "Finish") "File with 4 lines")
        ;;; (check-equal? (file->list "test_file_2.txt") '("345" "132" "87" "28" "987" "74" "476" "786" "812" "69" "421" "284" "631" "555" "128" "422" "564" "27" "735") "File with multiple lines")
    ))

(define test-list->file
    (test-suite
        " Test function: list->file "
        (check-equal? (list->file "test_file_x.txt" '()) 0 "Empty list")
        (check-equal? (list->file "test_file_x.txt" '("Line one" "Line two" "Line three" "Finish")) 4 "List with 4 items")
        (check-equal? (list->file "test_file_x.txt" '("345" "132" "87" "28" "987" "74" "476" "786" "812" "69" "421" "284" "631" "555" "128" "422" "564" "27" "735")) 19 "List with multiple items")
    ))

(define test-encode-file
    (test-suite
        " Test function: encode-file "
        (check-equal? (encode-file "test_file_0.txt" "encoded_0_c.txt" caesar-encode 5 #f) 0 "Ceasar encode Empty file")
        (check-equal? (encode-file "test_file_1.txt" "encoded_1_c.txt" caesar-encode 5 #f) 4 "Ceasar encode File with 4 lines")
        (check-equal? (encode-file "Homer_Odyssey.txt" "encoded_2_c.txt" caesar-encode 5 #f) 17101 "Ceasar encode File with multiple lines")
        (check-equal? (encode-file "encoded_0_c.txt" "decoded_0_c.txt" caesar-encode 5 #t) 0 "Caesar decode Empty file")
        (check-equal? (encode-file "encoded_1_c.txt" "decoded_1_c.txt" caesar-encode 5 #t) 4 "Caesar decode File with 4 lines")
        (check-equal? (encode-file "encoded_2_c.txt" "decoded_2_c.txt" caesar-encode 5 #t) 17101 "Caesar decode File with multiple lines")
        (check-equal? (encode-file "test_file_0.txt" "encoded_0_v.txt" vigenere-encode "breakthiscode" #f) 0 "Vigenere encode Empty file")
        (check-equal? (encode-file "test_file_1.txt" "encoded_1_v.txt" vigenere-encode "breakthiscode" #f) 4 "Vigenere encode File with 4 lines")
        (check-equal? (encode-file "Homer_Odyssey.txt" "encoded_2_v.txt" vigenere-encode "breakthiscode" #f) 17101 "Vigenere encode File with multiple lines")
        (check-equal? (encode-file "encoded_0_v.txt" "decoded_0_v.txt" vigenere-encode "breakthiscode" #t) 0 "Vigenere decode Empty file")
        (check-equal? (encode-file "encoded_1_v.txt" "decoded_1_v.txt" vigenere-encode "breakthiscode" #t) 4 "Vigenere decode File with 4 lines")
        (check-equal? (encode-file "encoded_2_v.txt" "decoded_2_v.txt" vigenere-encode "breakthiscode" #t) 17101 "Vigenere decode File with multiple lines")
    ))

; Start the execution of the test suite
(displayln "Testing: shift-char")
(run-tests test-shift-char)
(displayln "Testing: caesar-encode")
(run-tests test-caesar-encode)
(displayln "Testing: letter-distance")
(run-tests test-letter-distance)
(displayln "Testing: vigenere-encode")
(run-tests test-vigenere-encode)
(displayln "Testing: file->list")
(run-tests test-file->list)
(displayln "Testing: list->file")
(run-tests test-list->file)
(displayln "Testing: encode-file")
(run-tests test-encode-file)
