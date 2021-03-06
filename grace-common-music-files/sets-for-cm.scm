;;; -*- syntax: Lisp; font-size: 16; line-numbers: no; -*-
;;; Yes! as of...[2016-07-24 Sun 11:29]

(define *dyads-tn* '((0 1) (0 2) (0 3) (0 4) (0 5) (0 6)))

(define *trichords-tn* '((0 1 2) (0 1 3) (0 2 3) (0 1 4) (0 3 4) (0 1 5) (0 4 5) (0 1 6) (0 5 6) (0 2 4) (0 2 5) (0 3 5) (0 2 6) (0 4 6) (0 2 7) (0 3 6) (0 3 7) (0 4 7) (0 4 8)))

(define *tetrachords-tn* '((0 1 2 3) (0 1 2 4) (0 2 3 4) (0 1 3 4) (0 1 2 5) (0 3 4 5) (0 1 2 6) (0 4 5 6) (0 1 2 7) (0 1 4 5) (0 1 5 6) (0 1 6 7) (0 2 3 5) (0 1 3 5) (0 2 4 5) (0 2 3 6) (0 3 4 6) (0 1 3 6) (0 3 5 6) (0 2 3 7) (0 4 5 7) (0 1 4 6) (0 2 5 6) (0 1 5 7) (0 2 6 7) (0 3 4 7) (0 1 4 7) (0 3 6 7) (0 1 4 8) (0 3 4 8) (0 1 5 8) (0 2 4 6) (0 2 4 7) (0 3 5 7) (0 2 5 7) (0 2 4 8) (0 2 6 8) (0 3 5 8) (0 2 5 8) (0 3 6 8) (0 3 6 9) (0 1 3 7) (0 4 6 7)))

(define *pentachords-tn* '((0 1 2 3 4) (0 1 2 3 5) (0 2 3 4 5) (0 1 2 4 5) (0 1 3 4 5) (0 1 2 3 6) (0 3 4 5 6) (0 1 2 3 7) (0 4 5 6 7) (0 1 2 5 6) (0 1 4 5 6) (0 1 2 6 7) (0 1 5 6 7) (0 2 3 4 6) (0 1 2 4 6) (0 2 4 5 6) (0 1 3 4 6) (0 2 3 5 6) (0 2 3 4 7) (0 3 4 5 7) (0 1 3 5 6) (0 1 2 4 8) (0 2 3 4 8) (0 1 2 5 7) (0 2 5 6 7) (0 1 2 6 8) (0 1 3 4 7) (0 3 4 6 7) (0 1 3 4 8) (0 1 4 5 7) (0 2 3 6 7) (0 1 3 6 7) (0 1 4 6 7) (0 1 3 7 8) (0 1 5 7 8) (0 1 4 5 8) (0 3 4 7 8) (0 1 4 7 8) (0 2 3 5 7) (0 2 4 5 7) (0 1 3 5 7) (0 2 4 6 7) (0 2 3 5 8) (0 3 5 6 8) (0 2 4 5 8) (0 3 4 6 8) (0 1 3 5 8) (0 3 5 7 8) (0 2 3 6 8) (0 2 5 6 8) (0 1 3 6 8) (0 2 5 7 8) (0 1 4 6 8) (0 2 4 7 8) (0 1 3 6 9) (0 2 3 6 9) (0 1 4 6 9) (0 1 4 7 9) (0 2 4 6 8) (0 2 4 6 9) (0 2 4 7 9) (0 1 2 4 7) (0 3 5 6 7) (0 3 4 5 8) (0 1 2 5 8) (0 3 6 7 8)))

(define *hexachords-tn* '((0 1 2 3 4 5) (0 1 2 3 4 6) (0 2 3 4 5 6) (0 1 2 3 5 6) (0 1 3 4 5 6) (0 1 2 4 5 6) (0 1 2 3 6 7) (0 1 4 5 6 7) (0 1 2 5 6 7) (0 1 2 6 7 8) (0 2 3 4 5 7) (0 1 2 3 5 7) (0 2 4 5 6 7) (0 1 3 4 5 7) (0 2 3 4 6 7) (0 1 2 4 5 7) (0 2 3 5 6 7) (0 1 2 4 6 7) (0 1 3 5 6 7) (0 1 3 4 6 7) (0 1 3 4 5 8) (0 3 4 5 7 8) (0 1 2 4 5 8) (0 3 4 6 7 8) (0 1 4 5 6 8) (0 2 3 4 7 8) (0 1 2 4 7 8) (0 1 4 6 7 8) (0 1 2 5 7 8) (0 1 3 6 7 8) (0 1 3 4 7 8) (0 1 4 5 7 8) (0 1 4 5 8 9) (0 2 3 4 6 8) (0 2 4 5 6 8) (0 1 2 4 6 8) (0 2 4 6 7 8) (0 2 3 5 6 8) (0 1 3 4 6 8) (0 2 4 5 7 8) (0 1 3 5 6 8) (0 2 3 5 7 8) (0 1 3 5 7 8) (0 1 3 4 6 9) (0 2 3 5 6 9) (0 1 3 5 6 9) (0 1 3 6 8 9) (0 1 3 6 7 9) (0 2 3 6 8 9) (0 1 3 5 8 9) (0 1 4 6 8 9) (0 2 4 5 7 9) (0 2 3 5 7 9) (0 2 4 6 7 9) (0 1 3 5 7 9) (0 2 4 6 8 9) (0 2 4 6 8 10) (0 1 2 3 4 7) (0 3 4 5 6 7) (0 1 2 3 4 8) (0 1 2 3 7 8) (0 2 3 4 5 8) (0 3 4 5 6 8) (0 1 2 3 5 8) (0 3 5 6 7 8) (0 1 2 3 6 8) (0 2 5 6 7 8) (0 1 2 3 6 9) (0 1 2 5 6 8) (0 2 3 6 7 8) (0 1 2 5 6 9) (0 1 2 5 8 9) (0 2 3 4 6 9) (0 1 2 4 6 9) (0 2 4 5 6 9) (0 1 2 4 7 9) (0 2 3 4 7 9) (0 1 2 5 7 9) (0 1 3 4 7 9) (0 1 4 6 7 9)))

;TnI-types
(define *dyads* '((0 1) (0 2) (0 3) (0 4) (0 5) (0 6)))

(define *trichords* '((0 1 2) (0 1 3) (0 1 4) (0 1 5) (0 1 6) (0 2 4) (0 2 5) (0 2 6) (0 2 7) (0 3 6) (0 3 7) (0 4 8)))

(define *tetrachords* '((0 1 2 3) (0 1 2 4) (0 1 3 4) (0 1 2 5) (0 1 2 6) (0 1 2 7) (0 1 4 5) (0 1 5 6) (0 1 6 7) (0 2 3 5) (0 1 3 5) (0 2 3 6) (0 1 3 6) (0 2 3 7) (0 1 3 7) (0 1 4 6) (0 1 5 7) (0 3 4 7) (0 1 4 7) (0 1 4 8) (0 1 5 8) (0 2 4 6) (0 2 4 7) (0 2 5 7) (0 2 4 8) (0 2 6 8) (0 3 5 8) (0 2 5 8) (0 3 6 9)))

(define *pentachords* '((0 1 2 3 4) (0 1 2 3 5) (0 1 2 4 5) (0 1 2 3 6) (0 1 2 3 7) (0 1 2 5 6) (0 1 2 6 7) (0 2 3 4 6) (0 1 2 4 6) (0 1 3 4 6) (0 2 3 4 7) (0 1 3 5 6) (0 1 2 4 8) (0 1 2 5 7) (0 1 2 6 8) (0 1 3 4 7) (0 1 3 4 8) (0 1 4 5 7) (0 1 3 6 7) (0 1 3 7 8) (0 1 4 5 8) (0 1 4 7 8) (0 2 3 5 7) (0 1 3 5 7) (0 2 3 5 8) (0 2 4 5 8) (0 1 3 5 8) (0 2 3 6 8) (0 1 3 6 8) (0 1 4 6 8) (0 1 3 6 9) (0 1 4 6 9) (0 2 4 6 8) (0 2 4 6 9) (0 2 4 7 9) (0 1 2 4 7) (0 3 4 5 8) (0 1 2 5 8)))

(define *hexachords* '((0 1 2 3 4 5) (0 1 2 3 4 6) (0 1 2 3 5 6) (0 1 2 4 5 6) (0 1 2 3 6 7) (0 1 2 5 6 7) (0 1 2 6 7 8) (0 2 3 4 5 7) (0 1 2 3 5 7) (0 1 3 4 5 7) (0 1 2 4 5 7) (0 1 2 4 6 7) (0 1 3 4 6 7) (0 1 3 4 5 8) (0 1 2 4 5 8) (0 1 4 5 6 8) (0 1 2 4 7 8) (0 1 2 5 7 8) (0 1 3 4 7 8) (0 1 4 5 8 9) (0 2 3 4 6 8) (0 1 2 4 6 8) (0 2 3 5 6 8) (0 1 3 4 6 8) (0 1 3 5 6 8) (0 1 3 5 7 8) (0 1 3 4 6 9) (0 1 3 5 6 9) (0 1 3 6 8 9) (0 1 3 6 7 9) (0 1 3 5 8 9) (0 2 4 5 7 9) (0 2 3 5 7 9) (0 1 3 5 7 9) (0 2 4 6 8 10) (0 1 2 3 4 7) (0 1 2 3 4 8) (0 1 2 3 7 8) (0 2 3 4 5 8) (0 1 2 3 5 8) (0 1 2 3 6 8) (0 1 2 3 6 9) (0 1 2 5 6 8) (0 1 2 5 6 9) (0 2 3 4 6 9) (0 1 2 4 6 9) (0 1 2 4 7 9) (0 1 2 5 7 9) (0 1 3 4 7 9) (0 1 4 6 7 9)))

;; the massive concatenation of all 215 (?) Tn set-types
(define *tn-types* (append *dyads-tn* *trichords-tn* *tetrachords-tn* *pentachords-tn* *hexachords-tn*))
(define *tni-types* (append *dyads* *trichords* *tetrachords* *pentachords* *hexachords*))

(define tetra-pat (make-cycle *tetrachords*))
(next tetra-pat)
