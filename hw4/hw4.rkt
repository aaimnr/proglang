
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

(define (sequence low high stride)
    (if (> low high)
        null
        (cons low (sequence  (+ low stride) high stride))))

(define (string-append-map xs suffix)
  (map (λ (s) (string-append s suffix)) xs))

(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(empty? xs) (error "list-nth-mod: empty list")]
        [#t  (car (list-tail xs (remainder n (length xs))))]))

(define (stream-for-n-steps s n)
  (define pr (s))
  (if (= n 0)
      null
      (cons (car pr) (stream-for-n-steps (cdr pr) (- n 1)))))

(define funny-number-stream 
  (letrec ([f (λ (x) (cons 
                       (if (= (remainder x 5) 0)
                           (* -1 x)
                           x)
                       (λ () (f (+ x 1)))))])
   (λ()(f 1))))

(define dan-then-dog (λ () (cons "dan.jpg" (λ () ( cons "dog.jpg" dan-then-dog )))))
 
(define (stream-add-zero s)
  (define pr (s))
  (λ () (cons (cons 0 (car pr))
              (stream-add-zero (cdr pr)))))

(define (cycle-lists xs ys)
  (define (f n)
    (cons 
     (cons (list-nth-mod xs n) 
           (list-nth-mod ys n))
          (λ () (f (+ n 1)))))
  (λ () (f 0)))

(define (vector-assoc v vec)
  (define (v-ass n)
    (cond [(= n (vector-length vec)) #f]
          [(and (pair? (vector-ref vec n))
                (equal? (car (vector-ref vec n)) v))
           (vector-ref vec n)
           ]
          [#t (v-ass (+ n 1))]))
  (v-ass 0))
    
                
  
  
  
  
  
  
  
  
  
  
  
  
  
  



  