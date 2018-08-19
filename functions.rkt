#lang racket

(require "utils.rkt")

(provide simpleInterest)

(provide interest)

(provide interestTime)

(provide financingValueMonth)

(provide financialIndependenceValue)

(provide financialIndependenceMonth)

;; Juros Simples
(define (simpleInterest value percentInterest timeMonth)
  (round-off (exact->inexact (* value  timeMonth (percent percentInterest))) 2 ))

;; Juros Composto
(define (interest value percentInterest timeMonth)
  (round-off  (exact->inexact (- (* value  (expt (+ 1 (percent percentInterest)) timeMonth)) value)) 2 ))


(define (interestTime value percentInterest total)
   (round-off(exact->inexact (/ (log (/ total value) 10) (log (+ 1 (percent percentInterest)) 10))) 2 ))

;; Calculo Mensalidade do Financiamento
(define (financingValueMonth total percentInterest timeMonth )
  (round-off (exact->inexact (* total (/ (percent percentInterest) (- 1(/ 1 (expt (+ 1 (percent percentInterest)) timeMonth)))))) 2 ))

;; Quanto Preciso para obter a independecia financeira
(define (financialIndependenceValue value percentInterest)
   (round-off (exact->inexact (/ value (percent percentInterest))) 2 ))

;; Quanto tempo você irá demorar para alcançar sua independencia financeira -> O que eu tenho - Porcentagem - porcentagem
(define (financialIndependenceMonth value percentInterest time)
   (round-off (exact->inexact (interestTime value percentInterest (financialIndependenceValue value  percentInterest))) 2 ))





 
