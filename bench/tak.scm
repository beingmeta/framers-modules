;;; -*- Mode: Scheme; -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; File:         tak.sch
; Description:  TAK benchmark from the Gabriel tests
; Author:       Richard Gabriel
; Created:      12-Apr-85
; Modified:     12-Apr-85 09:58:18 (Bob Shaw)
;               22-Jul-87 (Will Clinger)
; Language:     Scheme
; Status:       Public Domain
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;;; TAK -- A vanilla version of the TAKeuchi function
 
(in-module 'bench/tak)

(use-module 'bench/lispish)

(define (tak x y z)
  (if (not (< y x))
      z
      (tak (tak (- x 1) y z)
           (tak (- y 1) z x)
           (tak (- z 1) x y))))

(define benchfn tak)

(module-export! '{tak benchfn})
 
;;; call: (tak 18 12 6)
 
;;(run-benchmark "TAK" (lambda () (tak 18 12 6)))
