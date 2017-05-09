;; Exercise 1-18
;;
;; Using the results of Exercise 1.16 and Exercise 1.17, devise a
;; procedure that generates an iterative process for multiplying two
;; integers in terms of adding, doubling, and halving and uses a
;; logarithmic number of steps.

(define (even? x)
  (= (remainder x 2) 0))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (* a b)
  (*-iter a b 0))

(define (*-iter a b x)
  (cond ((= b 0) x)
	((even? b) (*-iter (double a) (halve b) x))
	(else (*-iter a (- b 1) (+ x a)))))
