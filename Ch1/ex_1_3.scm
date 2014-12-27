(define (square x) (* x x))

(define (sum-of-squares a b)
  (+ (square a) (square b)))

; Takes three numbers as arguments and returns the sum of squares of
; the two larger numbers.
(define (sum-larger-squares a b c)
  (define (compare test a b) (if (test a b) a b))
  (sum-of-squares (compare > a b) (compare > (compare < a b) c)))
