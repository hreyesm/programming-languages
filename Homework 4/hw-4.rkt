; Homework: Racket Lists
; ----------------------
; Course: Programming Languages
; Teacher: Gilberto Echeverría Furió
; Author: Héctor Alexis Reyes Manrique (A01339607)
; Date: October 9th, 2020

#lang racket


(define (shift-char c n)
    (define (c->i c n)
        (+ (char->integer c) (modulo n -26)))
    (define (temp c n m)
        (if (< (c->i c n) m)
            (integer->char (+ (c->i c n) 26))
            (integer->char (c->i c n))))
    (cond
        [(and (>= (char->integer c) 65) (<= (char->integer c) 90))
            (temp c n 65)]
        [(and (>= (char->integer c) 97) (<= (char->integer c) 122))
            (temp c n 97)]
        [else c]))

(define (caesar-encode s n b)
    (define (temp s n m)
        (let loop ([s-list (string->list s)] [n n] [ans empty])
            (if (empty? s-list)
                (list->string ans)
                (loop (cdr s-list) n (append ans (list (shift-char (car s-list) (* n m))))))))
    (if (equal? b #f)
        (temp s n 1)
        (temp s n -1)))

(define (letter-distance c)
    (- (char->integer c) 97))

(define (vigenere-encode s k b)
    (define (temp s k n)
        (let loop ([s-list (string->list s)] [k-list (string->list k)] [ans empty])
            (cond
                [(empty? s-list)
                    (list->string ans)]
                [(= (length k-list) 1)
                    (loop (cdr s-list) (string->list k) (append ans (list (shift-char (car s-list) (* (letter-distance (car k-list)) n)))))]
                [else
                    (loop (cdr s-list) (cdr k-list) (append ans (list (shift-char (car s-list) (* (letter-distance (car k-list)) n)))))])))
    (if (equal? b #f)
        (temp s k 1)
        (temp s k -1)))

(define (file->list filename-in)
    (define in (open-input-file filename-in))
    (let loop ([line (read-line in)] [ans empty])
        (cond
            [(eof-object? line)
                (close-input-port in) ans]
            [else
                (loop (read-line in) (append ans (list line)))])))

(define (list->file filename-out lst)
    (define out (open-output-file filename-out #:exists 'truncate))
    (let loop ([n 0] [lst lst])
        (cond
            [(empty? lst)
                (close-output-port out) n]
            [else
                (fprintf out "~a\n" (car lst))
                (loop (add1 n) (cdr lst))])))

(define (encode-file filename-in filename-out encode k b)
    (define in (open-input-file filename-in))
    (define out (open-output-file filename-out #:exists 'truncate))
    (let loop ([n 0] [line (read-line in)])
        (cond
            [(eof-object? line)
                (close-output-port out) n]
            [else
                (fprintf out "~a\n" (encode line k b))
                (loop (add1 n) (read-line in))])))