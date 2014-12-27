#lang racket

;; f(n) = n if n<3, and f(n) = f(n-1) + 2*f(n-2) + 3*f(n-3) if n >= 3.
;; Recursive procedure:
(define (f-recurs n)
  (cond [(< n 3) n]
        [else (+ (f-recurs (- n 1)) 
                 (* 2 (f-recurs (- n 2))) 
                 (* 3 (f-recurs (- n 3))))]))

;; iterative
(define (f-iter n)
  (define (f-inner a b c count)
    (define f-next (+ a (* b 2) (* c 3)))
    (cond [(< count 3) count]
          [(= count 3) f-next]
          [else (f-inner f-next a b (sub1 count))]))
  (f-inner 2 1 0 n))
