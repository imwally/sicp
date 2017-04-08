;; Exercise 1.4
;;
;; Observe that our model of evaluation allows for combinations whose
;; operators are compound expressions. Use this observation to
;; describe the behavior of the following procedure.

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; The a-plus-abs-b procedure first evaluates whether b is greater
;; than zero, and if it is, the primitive '+' procedure is returned as
;; an operator for a subexpression of (+ a b). If b is less than zero
;; the primitive '-' procedure is returned instead for a subexpression
;; of (- a b).
