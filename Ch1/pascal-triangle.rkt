#lang racket

;; Compute next row from previous row.
(define (find-next-row prev-row)
  (define (find-next-iter accum remaining)
    (cond
      [(empty? accum) (find-next-iter (list 1) remaining)]
      [(empty? remaining) (list 1)]
      [(= (length remaining) 1) (cons 1 accum)]
      [else 
        (define new-accum 
          (cons (+ (list-ref remaining 0) (list-ref remaining 1)) 
                accum))
        (find-next-iter new-accum (cdr remaining))]))
  (find-next-iter empty prev-row))

;; Computes Pascal's triangle.
(define (pascal-triangle n)
  (define (pascal-iter accum n)
    (define (pascal-iter-step next-row)
      (define next-accum (cons next-row accum))
      (pascal-iter next-accum (- n 1)))
    (cond 
      [(< n 1) accum]
      [(empty? accum) 
       (pascal-iter-step (find-next-row empty))]
      [else (pascal-iter-step (find-next-row (list-ref accum 0)))]))
  (pascal-iter empty n))
