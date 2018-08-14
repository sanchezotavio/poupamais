#lang racket

(provide simpleInterest)

(provide interest)

(provide interestTime)

(provide financingValueMonth)

;; Juros Simples
(define (simpleInterest value percentInterest timeMonth)
  (* value  timeMonth (/ percentInterest 100)))

;; Juros Composto
(define (interest value percentInterest timeMonth)
  (* value  (expt (+ 1 (/ percentInterest 100)) timeMonth)))

;; Valor Total Financiamento
(define (interestTime value percentInterest total)
  (/ (log (/ total value) 10) (log (+ 1 (/ percentInterest 100)) 10)))

;; Calculo Mensalidade do Financiamento
(define (financingValueMonth total percentInterest timeMonth )
 (exact->inexact (* total (/ (/ percentInterest 100) (- 1(/ 1 (expt (+ 1 (/ percentInterest 100)) timeMonth)))))))

;; Quanto Preciso para obter o sucesso financeiro 
(define (sucess value percentInterest)
  (/ (* value 12) (/ percentInterest 100)))




 
