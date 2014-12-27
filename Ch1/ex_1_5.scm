; A test to determine whether the interpreted we are faced with is
; using applicative-order evaluation or normal-order evaluation.
(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

(test 0 (p))

; Applicative order evaluation: the result will be an infinite loop.
; Normal-order: the result will be 0.
