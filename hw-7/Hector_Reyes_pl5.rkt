; Homework: Concurrent Programs
; -----------------------------
; Course: Programming Languages
; Teacher: Gilberto Echeverría Furió
; Author: Héctor Alexis Reyes Manrique (A01339607)
; Date: November 6th, 2020

#lang racket

(define pipe (make-channel))

(define (divisible-up-to n)
    ; Returns the integer that is divisible by 1, 2,..., N.

    ; Parameters
    ; ----------
    ; n : int

    ; Returns
    ; -------
    ; int
    (let loop
        ([i 1] [ans 1])
        (if (equal? i n)
            ans
            (loop (add1 i) (/ (* ans (add1 i)) (gcd ans (add1 i)))))))

(define (make-thread tid)
    ; Computes the divisible-up-to for the received number, prints the result, and reads the next available number of a channel. If the message on the channel is 'end, then the thread ends its execution.

    ; Parameters
    ; ----------
    ; tid : int
    (thread (lambda ()
        (let loop ()
            (define message (channel-get pipe))
            (sleep 1)
            (cond
                [(equal? message 'end)
                    (printf "Thread ~a has finished\n" tid)]
                [else
                    (printf "Thread: ~a | Input: ~a | Result: ~a\n" tid message (divisible-up-to message))
                    (loop)])))))

(define (main t n l)
    ; Generates a list of N random numbers between 2 and L, launches T threads, and posts all the numbers in the list one by one to a chanel.

    ; Parameters
    ; ----------
    ; t : int
    ; n : int
    ; l : int

    ; Returns
    ; -------
    ; int
    (define data (for/list ([i (range n)]) (random 2 l)))
    (define threads (map make-thread (range t)))
    (printf "~a\n" data)
    (let loop ([data data])
        (cond
            [(not (empty? data))
                (channel-put pipe (car data))
                (loop (cdr data))]))
    (let loop ([t t])
        (cond
            [(not (zero? t))
                (channel-put pipe 'end)
                (loop (sub1 t))]))
    (for-each thread-wait threads))