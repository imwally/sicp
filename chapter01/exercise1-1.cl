;; Exercise 1.1
;;
;; Below is a sequence of expressions. What is the result printed by
;; the interpreter in the response to each expression? Assume that the
;; sequence is to be evaluated in the order in which it is presented.

10

;; Guess: 10
;;
;; Reason: Literal numbers are evaluated as the number they represent
;; in base 10.
;;
;; Answer: 10


(+ 5 3 4)

;; Guess: 12
;;
;; Reason: This is an addition procedure specified by the '+' operator
;; in the beginning of the expression. Addition is applied to each
;; operand from left to right.
;;
;; Answer: 12


(- 9 1)

;; Guess: 8
;;
;; Reason: This is the subtraction procedure specified by the '-'
;; operator in the beginning of the expression. Subtraction is applied
;; to each operand from left to right.
;;
;; Answer: 8

(/ 6 2)

;; Guess: 3
;;
;; Reason: Division procedure specified by the '/' operator at the
;; beginning of the expression. Division is applied to each operand
;; from left to right.
;;
;; Answer 3


(+ (* 2 4) (- 4 6))

;; Guess: 6
;;
;; Reason: This is a combination procedure containing a total of 3
;; combinations. First, the left most subexpression of (* 2 4) is
;; evaluated to 8, then the next subexpression of (- 4 6) is evaluated
;; to -2, and finally the main addition expression of (+ 8 -2) is
;; evaluated to 6.
;;
;; Answer: 6


(define a 3)

;; Guess: Nothing
;;
;; Reason: define is a special form. This associates the symbol 'a' to
;; the value 3. The symbol 'a' is not used yet.
;;
;; Answer: Nothing


(define b (+ a 1))

;; Guess: Nothing
;;
;; Reason: Same as above. This is a procedure definition that
;; associates the symbol 'b' with the subexpression (+ a 1). It will
;; add 1 to the value of 'a'.
;;
;; Answer: Nothing


(+ a b (* a b))

;; Guess: 19
;;
;; Reason: First, the left most subexpression 'a' is evaluated to 3,
;; then 'b' is evaluated to 4 because 'b' is a procedure that adds 1
;; to 'a', then the next subexpression (* a b) is evaluated first by
;; evaluating 'a' to 3 and 'b' to 4 and then multiplying these
;; arguments together resulting in 12. Finally the addition operator
;; '+' is applied to the three values '3', '4', and '12' which results
;; in 19.
;;
;; Answer: 19


(= a b)

;; Guess: false
;;
;; Reason: The '=' operator will apply the equality procedure to the
;; arguments 'a' and 'b'. The first value 'a' is 3 and the second, 'b'
;; evaluates to (+ a 1) resulting in 4 and therefore false because 3
;; does not equal 4.
;;
;; Answer: false


(if (and (> b a) (< b (* a b)))
    b
    a)

;; Guess: 4
;;
;; Reason: if is a special form for evaluating conditional expressions
;; with two cases. The two cases (> b a) and (< b (* a b)) are being
;; compared with the logical composition 'and' which itself is also a
;; special form. First (> b a) is evaluated to true since 4 > 3, next
;; the expression (< b (* a b)) is evaluated to true since 4 <
;; 12. Because both expression evaluate to true the consequent is
;; returned, 4.
;;
;; Answer: 4


(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

;; Guess: 16
;;
;; Reason: cond is a special form that takes an arbitrary number of
;; pairs of expressions called clauses. The first expression in the
;; pair is the predicate. If it evaluates to true than the second
;; expression, the consequent is evaluated and returned. If the
;; predicate evaluates to false the next clause is checked until a
;; true one is found. Since (= a 4) evaluates to false the next clause
;; is checked. Since (= b 4) is true the consequent (+ 6 7 a) is
;; evaluated and returned, which is 16.
;;
;; Answer: 16


(+ 2 (if (> b a) b a))

;; Guess: 6
;;
;; Reason: First evaluate the predicate (> b a) in the conditional
;; 'if' check. This evaluates to true since 4 > 3. The consequent 4 is
;; returned. Now the addition procedure denoted by the '+' is applied
;; to 2 and 4 resulting in 6.
;;
;; Answer: 6

(* (cond ((> a b) a)
	 ((< a b) b)
	 (else -1))
   (+ a 1))

;; Guess: 16
;;
;; Reason: The first predicate evaluates to false because 3 is not
;; greater than 4. The second predicate is evaluated to true because 3
;; < 4. The consequent expression, 4, is evaluated. Next, the
;; expression (+ a 1) evaluates to 4 since 3 + 1 = 4. Finally the
;; multiplication procedure is applied to these two subexpressions 4
;; and 4 which evaluates to 16.
;;
;; Answer: 16
