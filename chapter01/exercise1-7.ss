;; Exercise 1.7
;;
;; The good-enough? test used in computing square roots will not be
;; very effective for finding the square roots of very small
;; numbers. Also, in real computers, arithmetic operations are almost
;; always performed with limited precision. This makes our test
;; inadequate for very large numbers. Explain these statements, with
;; examples showing how the test fails for small and large numbers. An
;; alternative strategy for implementing good-enough? is to watch how
;; guess changes from one iteration to the next and to stop when the
;; change is a very small fraction of the guess. Design a square-root
;; procedure that uses this kind of end test. Does this work better
;; for small and large numbers?
;;

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;; Calculating the square root of 0.001 using the procedure above

(sqrt 0.001)

;; returns .04124542607499115
;;
;; This is incorrect. The real square root of 0.001 is
;; 0.031622776601684
;;
;; The predetermined tolerance in the (good-enough?) procedure is set
;; to 0.001 limiting the numbers to above 0.001.

;; Calculating the square root of a larger number causes the
;; evaluation to run too long. The following number never returns.

(sqrt 123456891011121314)

;; This is once again because of the given tolerance of 0.001, the
;; (good-enough?) procedure takes too long finding a square that
;; differs less than this amount.


;; Refine (good-enough?) to watch how 'guess' changes from one
;; iteration to the next and stop when the 'change' differs by less
;; than 0.001.

(define (sqrt x)
  (sqrt-iter 1.0 x 0))

(define (sqrt-iter guess x change)
  (if (good-enough? guess change)
      guess
      (sqrt-iter (improve guess x) x guess)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;; Compute the difference between the last guess and current
;; guess. Make sure the recursive call to (sqrt-iter) uses guess (that
;; is the previous guess) in place of the change symbol.
(define (good-enough? guess change)
  (< (abs (- guess change)) 0.001))

;; Test on 0.001
(sqrt 0.001)
;; returns .03162278245070105

;; Test on 123456891011121314
(sqrt 123456891011121314)
;; returns 351364328.0287874 (without delay)
