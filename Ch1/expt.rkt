#lang racket

;; Recursive definition of the exponential of a given number.
(define (expt b n)
  (if (= n 0)
    1
    (* b (expt b (- n 1)))))

;; Iterative
(define (expt2 b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
    product
    (expt-iter b
               (- counter 1)
               (* b product))))

(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

;; Sucessive squaring method
(define (fast-expt b n)
  (cond [(= n 0) 1]
        [(even? n) (square (fast-expt b (/ n 2)))]
        [else (* b (fast-expt b (- n 1)))]))
