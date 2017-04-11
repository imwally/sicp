;; Exercise 1.6
;;
;; Alyssa P. Hacker doesn't see why if needs to be provided as a
;; special form. "Why can't I just define it as an ordinary procedure
;; in terms of cond?" she asks. Alyssa's friend Eva Lu Ator claims
;; this can indeed be done, and she defines a new version of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;; What happens when Alyssa attempts to use this to compute square
;; roots? Explain.
;;
;; Answer:
;; Aborting!: maximum recursion depth exceeded.
;;
;; Explanation:
;; 
;; The (new-if) procedure uses the (cond) procedure in place of the
;; (if) special form. Since the (cond) condition evaluates the
;; else-clause regardless if the predicate is true the (sqrt-iter)
;; procedure is called infinitely. The (if) special form would have
;; eventually returned the consequent without evaluating the
;; alternative breaking the infinite loop.

