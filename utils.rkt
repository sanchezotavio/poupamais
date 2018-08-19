#lang racket

(provide percent)

(provide round-off)

(define (percent value)
  (/ value 100))

(define (round-off z n)
  (let ((power (expt 10 n)))
    (/ (round (* power z)) power)))
