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
  (exact->inexact (* value  timeMonth (percent percentInterest))))

;; Juros Composto
(define (interest value percentInterest timeMonth)
  (exact->inexact (* value  (expt (+ 1 (percent percentInterest)) timeMonth))))

;; Um capital de R$ 75.000,00 aplicado a uma taxa de juro composto de 1,5% a.m., precisa de quantos meses para resultar em um montante de R$ 84.486,94
(define (interestTime value percentInterest total)
  (exact->inexact (/ (log (/ total value) 10) (log (+ 1 (percent percentInterest)) 10))))

;; Calculo Mensalidade do Financiamento
(define (financingValueMonth total percentInterest timeMonth )
 (exact->inexact (* total (/ (percent percentInterest) (- 1(/ 1 (expt (+ 1 (percent percentInterest)) timeMonth)))))))

;; Quanto Preciso para obter a independecia financeira
(define (financialIndependenceValue value percentInterest)
  (exact->inexact (/ (* value 12) (percent percentInterest))))

;; Quanto tempo você irá demorar para alcançar sua independencia financeira -> O que eu tenho - Porcentagem - porcentagem
(define (financialIndependenceMonth value percentInterest)
  (exact->inexact (interestTime value percentInterest (financialIndependenceValue value  percentInterest)))
)





 
