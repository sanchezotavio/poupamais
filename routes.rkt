#lang racket

(provide calc)

(require "functions.rkt")

(define (calc type x y)
   (case type
      [("sum") (sum x y)]
      [("multi") (multi x y)]
      [("power") (power x)]
     )
  )
