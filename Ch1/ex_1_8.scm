; Uses Newton's method for cube-roots to find an approximation to the cube
; root of x.
; Better approximation than y to cube root of x:
; (x/y^2 + 2y) / 3
(define (cube-rt-iter guess x)
  (define next-guess (improve guess x))
  (if (good-enough? next-guess guess)
    next-guess
    (cube-rt-iter next-guess x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? next-guess guess)
  (< (abs (- next-guess guess)) (* (abs next-guess) 0.001)))

(define (cube-rt x)
  (cond ((= x 0) 0.)
        ((< x 0) (- (cube-rt-iter 1.0 (abs x))))
        (else (cube-rt-iter 1.0 x))))
