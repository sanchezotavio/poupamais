#lang racket

(provide calc)

(require "functions.rkt")

(define (calc type value percentInterest timeMonth)
   (case type
      [("simple-interest") (simpleInterest value percentInterest timeMonth)]
      [("interest") (interest value percentInterest timeMonth)]
     )
  )
