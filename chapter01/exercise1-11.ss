;; Exercise 1.11
;;
;; A function (f) is defined by the rule that
;;         
;; f(n) = n if n < 3,
;;        f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3
;;
;; Write a procedure that computes (f) by means of a recursive
;; process. Write a procedure that computes (f) by means of an iterative
;; process.

(define (f-recur n)
  (if (< n 3)
      n
      (+ (f-recur (- n 1))
	 (* (f-recur (- n 2)) 2)
	 (* (f-recur (- n 3)) 3))))

(define (f-iter n)
  (f-iter-begin 2 1 0 n))

(define (f-iter-begin a b c count)
  (if (< count 3)
      a
      (f-iter-begin (+ a (* b 2) (* c 3)) a b (- count 1))))

