; A re-implementation of good-enough? that watches how guess changes from
; one interation to the next and stops when the change is a small fraction
; of the guess.
(define (sqrt-iter guess x)
  (define next-guess (improve guess x))
  (if (good-enough? next-guess guess)
    next-guess
    (sqrt-iter next-guess x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? next-guess guess)
  (< (abs (- next-guess guess)) (* next-guess 0.001)))
