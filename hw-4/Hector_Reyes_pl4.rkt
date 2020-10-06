; Homework: Functional Programs
; ----------------------
; Course: Programming Languages
; Teacher: Gilberto Echeverría Furió
; Author: Héctor Alexis Reyes Manrique (A01339607)
; Date: October 9th, 2020

#lang racket


(define (shift-char c n)
    ; Takes a character and an integer. If the character is a letter in the English alphabet, either lowercase or uppercase, it will change the character for the one at the distance indicated by the integer. Other characters different from letters will be left as they are. The integer can be positive, negative or zero.

    ; Parameters
    ; ----------
    ; c : char
    ; n : int

    ; Returns
    ; -------
    ; char

    (define (c->i c n)
        (+ (char->integer c) (modulo n -26)))
    (define (helper c n m)
        (if (< (c->i c n) m)
            (integer->char (+ (c->i c n) 26))
            (integer->char (c->i c n))))
    (cond
        [(and (>= (char->integer c) 65) (<= (char->integer c) 90))
            (helper c n 65)]
        [(and (>= (char->integer c) 97) (<= (char->integer c) 122))
            (helper c n 97)]
        [else c]))


(define (caesar-encode s n b)
    ; Takes a string,  an integer and a boolean. If the boolean value is false, the function will encode the string by shifting each of its characters the distance indicated by the integer. If the boolean is false, the function will decode the string by using the negative of the integer.

    ; Parameters
    ; ----------
    ; s : str
    ; n : int
    ; b : bool

    ; Returns
    ; -------
    ; str

    (define (helper s n m)
        (let loop ([s-list (string->list s)] [n n] [ans empty])
            (if (empty? s-list)
                (list->string ans)
                (loop (cdr s-list) n (append ans (list (shift-char (car s-list) (* n m))))))))
    (if (equal? b #f)
        (helper s n 1)
        (helper s n -1)))


(define (letter-distance c)
    ; Takes a lowercase letter, and returns an integer with the distance from the letter "a" to the parameter.

    ; Parameters
    ; ----------
    ; c : char

    ; Returns
    ; -------
    ; int

    (- (char->integer c) 97))


(define (vigenere-encode s k b)
    ; Takes a string for the data, another string with only lowercase letters for the key, and a boolean. If the boolean is negative, the function will encode, and vice versa. The key will indicate how many characters to shift on each position as the distance from letter "a" to the one used in the key.

    ; Parameters
    ; ----------
    ; s : str
    ; k : str
    ; b : bool

    ; Returns
    ; -------
    ; str

    (define (helper s k n)
        (let loop ([s-list (string->list s)] [k-list (string->list k)] [ans empty])
            (cond
                [(empty? s-list)
                    (list->string ans)]
                [(= (length k-list) 1)
                    (loop (cdr s-list) (string->list k) (append ans (list (shift-char (car s-list) (* (letter-distance (car k-list)) n)))))]
                [else
                    (loop (cdr s-list) (cdr k-list) (append ans (list (shift-char (car s-list) (* (letter-distance (car k-list)) n)))))])))
    (if (equal? b #f)
        (helper s k 1)
        (helper s k -1)))


(define (file->list filename-in)
    ; Takes a string with the name of a file. Returns a list of strings with each line of the file.

    ; Parameters
    ; ----------
    ; filename-in : str

    ; Returns
    ; -------
    ; List[str]

    (define in (open-input-file filename-in))
    (let loop ([line (read-line in)] [ans empty])
        (cond
            [(eof-object? line)
                (close-input-port in) ans]
            [else
                (loop (read-line in) (append ans (list line)))])))


(define (list->file filename-out lst)
    ; Takes a string with the name of a file and a list. Returns the number of lines written to the file and outputs each element in the list as a line in the file.

    ; Parameters
    ; ----------
    ; filename-out : str
    ; lst : List

    ; Returns
    ; -------
    ; int

    (define out (open-output-file filename-out #:exists 'truncate))
    (let loop ([n 0] [lst lst])
        (cond
            [(empty? lst)
                (close-output-port out) n]
            [else
                (fprintf out "~a\n" (car lst))
                (loop (add1 n) (cdr lst))])))


(define (encode-file filename-in filename-out algorithm k b)
    ; Takes the name of the input file, the name of the output file, the function to use for encoding, the key, and a boolean. Returns the number of lines written to the output file. If the boolean is false, it will encode the input file into the output file, using the algorithm and key specified. If the boolean if true, it will decode the input file into the output file.

    ; Parameters
    ; ----------
    ; filename-in : str
    ; filename-out : str
    ; algorithm : str
    ; k : str
    ; b : bool

    (define in (open-input-file filename-in))
    (define out (open-output-file filename-out #:exists 'truncate))
    (let loop ([n 0] [line (read-line in)])
        (cond
            [(eof-object? line)
                (close-output-port out) n]
            [else
                (fprintf out "~a\n" (algorithm line k b))
                (loop (add1 n) (read-line in))])))