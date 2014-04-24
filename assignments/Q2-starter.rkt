#lang racket

;; An expression is either [var] an alphabetic symbol, 
;; or [abs] (list 'λ v e) where v is an alphabetic symbol and e is an expression,
;; or [app] (list e1 e2) where e1 and e2 are expressions.

;; The following trivial functions make code that uses them more readable.
;; They have been completely implemented.

;; make-abs: symbol expression -> expression[abs]
(define (make-abs var expr) (list 'λ var expr))

;; var-of: expression[abs] -> symbol
(define var-of second)

;; body-of: expression[abs] -> expression
(define body-of third)

;; make-app: expression expression -> expression[app]
(define (make-app rator rand) (list rator rand))

;; rator-of: expression[app] -> expression
(define rator-of first)

;; rand-of: expression[app] -> expression
(define rand-of second)

;; abs?: expression -> Boolean
(define (abs? expr) 
  (and (list? expr) 
       (= 3 (length expr)) 
       (symbol=? 'λ (first expr))))

;; app?: expression -> Boolean
(define (app? expr) 
  (and (list? expr) 
       (= 2 (length expr))))

;; var?: expression -> Boolean
(define var? symbol?)

;; A set is a list of symbols without repetition.

;; The following helper functions are easy to write,
;;  and should be useful in implementing the interpreter.
;; They will not be directly tested by Marmoset.

;; add-to-set: symbol set -> set
(define (add-to-set x s)
  ...) ; fill in

;; remove-from-set: symbol set -> set
(define (remove-from-set x s)
  ...) ; fill in

;; set-union: set set -> set
(define (set-union s1 s2)
  ...) ; fill in

;; set-member? symbol set -> Boolean
(define (set-member? x s)
  ...) ; fill in

;; The following functions are directly tested by Marmoset.
;; In writing them, you may find the primitive function `gensym' useful.

;; alpha-equiv: expression expression -> Boolean
(define (alpha-equiv e1 e2)
  ...)

;; subst: symbol expression expression -> expression
(define (subst var repl expr)
  ...) ;; fill in

;; reducible?: expression -> Boolean
(define (reducible? e)
  ...) ;; fill in

;; reduce: expression -> expression
(define (reduce e)
  ...) ;; fill in

;; normalize: expression -> expression
(define (normalize e)
  ...) ;; fill in

;; bonus functions

;; parse: s-exp -> expression
(define (parse sexp)
  ...) ;; fill in

;; format-lc: expression -> string
(define (format-lc expr)
  ...)
