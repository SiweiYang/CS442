#lang racket

(require test-engine/racket-tests)

(struct fun (param body) #:transparent)

(struct app (fn arg) #:transparent)

(define-struct closure (ast env) #:transparent)

;; parse: s-expression -> AST

(define (parse sx)
  (match sx
    [`(fun (,x) ,bdy) (fun x (parse bdy))]
    [`(,f ,x) (app (parse f) (parse x))]
    [x x]))

;; A substitution is a (list n v), where n is a symbol and v is a value.

;; An environment (env) is a list of substitutions.

;; An AST is a fun or an app or a var (symbol)

;; interp: AST env -> closure

(define (interp ast env)
  (match ast
    [(fun v bdy) (closure ast env)]
    [(app fun-exp arg-exp)
       (match (interp fun-exp env)
         [(closure (fun param body) cl-env)
          (interp body (cons (list param (interp arg-exp env)) cl-env))])]
    [x (second (assoc x env))]))

;; please comment out or change the name of this function in
;; code submitted to Marmoset

(define (run sexp) (closure-ast (interp (parse sexp) empty)))

;; definitions for tests

(define id '(fun (x) x))
(define id-ast (parse id))

;; tests (insufficient, even for starter code)

(check-expect (parse id) (fun 'x 'x))
(check-expect (run id) id-ast)
(check-expect (run `(,id ,id)) id-ast)

(test)