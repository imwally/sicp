;; Exercise 1.5
;;
;; Ben Bitdiddle has invented a test to determine whether the
;; interpreter he is faced with is using applicative-order evaluation
;; or normal-order evaluation. He defines the following two
;; procedures:

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

;; Then he evaluates the expression

(test 0 (p))

;; What behavior will Ben observe with an interpreter that uses
;; applicative-order evaluation? What behavior will he observe with an
;; interpreter that uses normal-order evaluation? Explain your answer.
;;
;; Assume that the evaluation rule for the special form 'if' is the
;; same whether the interpreter is using normal or applicative order:
;; The predicate expression is evaluated first, and the result
;; determines whether to evaluate the consequent or the alternative
;; expression.

;; Answer:
;;
;; When this procedure is evaluated under an applicative-order
;; interpreter each subexpression is evaluated regardless if it's
;; needed or not. In this case the second argument (p) is evaluated to
;; itself in the body of 'test' which never ends causing an infinite
;; loop. The procedure does not return anything.
;;
;; Under a normal-order interpreter, the x and y arguments of the
;; 'test' procedure are replaced with a 0 and (p) in the body which
;; yields the following expression: (if (= 0 0) 0 (p)). Since the
;; predicate evaluates to true, that is 0 = 0, the consequent is
;; returned without evaluating the alternative. The procedure will
;; return a 0.
