#lang racket

(define (factorial n)
  (if (= n 1)
    1
    (* n (factorial (- n 1)))))

(define (factorial2 n)
  (define (iter product counter max-count)
    (if (> counter max-count)
      product
      (iter (* product counter) 
            (add1 counter) 
            max-count)))
  (iter 1 1 n))
