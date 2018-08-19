#lang racket

(require racket/list
	 web-server/http
         web-server/servlet-env
         web-server/dispatch
	 json)

 (require web-server/http/request-structs)



(define (response
	 #:code    [code/kw 200]
	 #:message [message/kw "OK"]
	 #:seconds [seconds/kw (current-seconds)]
	 #:mime    [mime/kw #f]
	 #:headers [headers/kw empty]
	 #:body    [body/kw empty])
  (define mime
    (cond ((string? mime/kw)
	   (string->bytes/utf-8 mime/kw))
          ((bytes? mime/kw)
           mime/kw)
	  (else
	   #f)))
  (define message
    (cond ((bytes? message/kw)
	   message/kw)
	  ((string? message/kw)
	   (string->bytes/utf-8 message/kw))
          (else
           #f)))
  (define body
    (cond ((string? body/kw)
	   (list (string->bytes/utf-8 body/kw)))
	  ((bytes? body/kw)
	   (list body/kw))
	  ((list? body/kw)
           body/kw)
	  (#t
	   body/kw)))
  (response/full
   code/kw
   message
   seconds/kw
   mime
   headers/kw
   body))


(require  "routes.rkt")

(define (symbolify x)
  (string->symbol (format "~s" x)))


(define (get-calc req type x y z)
    (response #:body  (format "~s" (calc type x y z))
		#:mime #t
                #:headers   (list 
                          (make-header #"Access-Control-Allow-Origin" #"*")
                          )))
     
(define (not-allowed req)
  (response #:code 405
	    #:message "Method Not Allowed"))

(define (not-found req)
  (response #:code 404
	    #:message "Not Found"))


(define-values (go _)
  (dispatch-rules
   [("calc" (string-arg) (number-arg) (number-arg) (number-arg)) #:method "get" get-calc]
   [("calc") #:method (regexp ".*") not-allowed]
   [else not-found]))


(module+ main
  (serve/servlet
   go
   #:port 4000
   #:command-line? #t
   #:servlet-regexp #rx""))