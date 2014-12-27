#lang racket

;; Process for approximating (sin x) by using sin x ~= x for x <= 0.1 radians.
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))

;; Procedure p is applied 5 times when (sine 12.15) is evaluated, since
;; 12.15/3^5 = 0.05 <= 0.1

;; Order of growth in space: log n
;; Order of growth in steps: log n
