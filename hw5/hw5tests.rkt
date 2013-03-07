#lang racket

(require "hw5.rkt")


;ex 1 tests

(define rktlst (list 1 2 3 4))
(define mupllist (cons 1 (cons 2 (cons 3 (cons 4 (aunit))))))
(define m (racketlist->mupllist rktlst))
(define r (mupllist->racketlist m))
(equal? m mupllist)
(equal? rktlst r)


(define mupl-e1 (ifgreater (int 3) (int 2) (int 1) (int 0)))
(equal? (eval-exp mupl-e1) (int 1))

(define mupl-e2 (mlet "j" (int 1) (ifgreater (int 3) (int 2) (var "j") (int 0))))
(equal? (eval-exp mupl-e2) (int 1))

(define mupl-e3 (apair mupl-e2 (int 2)))
(equal? (eval-exp (fst mupl-e3)) (int 1))

(define mupl-e4 (apair (int 2) mupl-e2))
(equal? (eval-exp (snd mupl-e4)) (int 1))


(equal? (eval-exp (isaunit (aunit))) (int 1))
(equal? (eval-exp (isaunit (int 2))) (int 0))


; a test case that uses problems 1, 2, and 4
; should produce (list (int 10) (int 11) (int 16))
;(define test1
 ; (mupllist->racketlist
  ; (eval-exp (call (call mupl-mapAddN (int 7))
   ;                (racketlist->mupllist 
    ;                (list (int 3) (int 4) (int 9)))))))