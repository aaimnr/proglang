#lang racket

(require "hw5.rkt")


;ex 1 tests

(define rktlst (list 1 2 3 4))
(define mupllist (cons 1 (cons 2 (cons 3 (cons 4 (aunit))))))
(define m (racketlist->mupllist rktlst))
(define r (mupllist->racketlist m))
(equal? m mupllist)
(equal? rktlst r)

; a test case that uses problems 1, 2, and 4
; should produce (list (int 10) (int 11) (int 16))
;(define test1
 ; (mupllist->racketlist
  ; (eval-exp (call (call mupl-mapAddN (int 7))
   ;                (racketlist->mupllist 
    ;                (list (int 3) (int 4) (int 9)))))))