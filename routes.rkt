#lang racket

(provide calc)

(require "functions.rkt")

(define (calc type value percent time)
   (case type
      [("simple-interest") (simpleInterest value percent time)]
      [("interest") (interest value percent time)]
      [("interest-time") (interestTime value percent time)]
      [("financing-value-month") (financingValueMonth value percent time) ]
      [("financial-independence-value") (financialIndependenceValue value percent)]
      [("financial-independence-month") (financialIndependenceMonth value percent time)]
     )
  )
