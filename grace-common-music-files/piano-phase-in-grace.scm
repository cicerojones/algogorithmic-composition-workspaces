;;; -*- syntax: Lisp; font-size: 16; line-numbers: no; -*-
;;; Yes! as of...[2016-07-24 Sun]
;;; Want to be able to save output: how?

;;; REFACTORING and ABSTRACTING: what are the most common 
;;; characteristics used in the below programs? 

;; must evaluate the below function first
(define (piano-phase endtime keys rate)
  (process with pat = (make-cycle keys)
           while (< (elapsed) endtime)
           do
           (mp:midi :key (next pat) :dur rate)
           (wait rate)))

;; between generates random number; mod works as num/modulo
(let ((x (between 60 72)))
  (list x (mod x 12)))

(format #t "~{~a (~a) ~}" (list x (mod x 12)))

;; no progn in scheme

;; (progn (list 1)
;;       (print "suck it"))


;; 20 seconds, 12 note loop; completely random series of notes; reichian offset

(let ((series (loop repeat 12
                    for x = (between 54 72) ; create a random series of notes
                    do (format #t "~{~a (~a) ~}" (list x (mod x 12)))
                    collect x)))
  (sprout (list (piano-phase 20 series .167)
                (piano-phase 20 series .170))))



;; The original Steve Reich line

(define reich-line '(e4 fs4 b4 cs5 d5 fs4 e4 cs5 b4 fs4 d5 cs5))

(let ((keys (keynum reich-line))
      (stoptime 20))
  (sprout (list (piano-phase stoptime keys .167)
                (piano-phase stoptime keys .170))))

;; Using some weighting to produce a more consonant series
(let ((series (loop repeat 12
                    for x = 
                    (odds .8 (pick 60 64 67 71) (between 54 66))
                    do (format #t "~{~a (~a) ~}" (list x (mod x 12)))
                    collect x)))
  (sprout (list (piano-phase 20 series .167)
                (piano-phase 20 series .170))))

;; using simple probability distributions
(odds .7 (pick 60 64 67 71) (between 48 60))
(odds .7 (between 60 72) (between 48 60))


;; use pitch classes numbers and transpose
(let* ((sets '((0 4 7 11) (1 5 8 12)))
       (transposed (map (lambda (set) (map (lambda (pc) (+ 60 pc)) set)) sets))
       (series (loop repeat 12
                    for x = 
                    (odds .95 (pick (pick transposed)) (between 54 66))
;                    do (format #t "~{~a (~a) ~}" (list x (mod x 12)))
                    collect x)))
  (sprout (list (piano-phase 20 series .167)
                (piano-phase 20 series .170))))


;; testing let* works
(let* ((sets '((0 1 4 5) (0 1 6 7)))
       (series (pick sets)))
  series)

;; using map as mapcar
(map (lambda (x) (+ 60 x)) '(0 1 2 3))

;; mapping a map over a nested list
(let ((sets '((0 1 2) (0 1 4))))
  (map (lambda (c) (map (lambda (x) (+ 60 x)) c)) sets))


;;; 09-12-14 11:22
(let* ((sets '((0 4 7 11) (1 5 8 12)))
       (transposed (map (lambda (c) (map (lambda (x) (+ 60 x)) c)) sets))
       (series (loop repeat 24
                    for x = 
                    (odds .8 (pick (pick transposed)) (between 54 66))
;                    do (format #t "~{~a (~a) ~}" (list x (mod x 12)))
                    collect x)))
  (sprout (list (piano-phase 120 series .71)
                (piano-phase 120 series .73))))


;; slow with more rapid offset; 2 minutes; 0158 offset by T3; adding in random notes with .2
(let* ((sets '((0 4 7 11) (3 7 10 14)))
       (transposed (map (lambda (c) (map (lambda (x) (+ 60 x)) c)) sets))
       (series (loop repeat 24
                    for x = 
                    (odds .8 (pick (pick transposed)) (between 54 66))
;                    do (format #t "~{~a (~a) ~}" (list x (mod x 12)))
                    collect x)))
  (sprout (list (piano-phase 120 series .65)
                (piano-phase 120 series .8))))

(second '(0 1))

;; slower, 20 seconds, 0158 offset by T4, .2/.8 probability
(let* ((sets '((0 4 7 11) (4 8 11 15)))
       (transposed (map (lambda (c) (map (lambda (x) (+ 60 x)) c)) sets))
       (series (loop repeat 24
                    for x = 
                    (odds .2 (pick (first transposed)) (pick (second transposed)))
;                    do (format #t "~{~a (~a) ~}" (list x (mod x 12)))
                    do (format #t "~a " x)
                    collect x)))
  (sprout (list (piano-phase 20 series .7)
                (piano-phase 20 series .8))))

;; produce midi output in non-real time
(let* ((sets '((0 4 7 11) (3 7 10 14)))
       (length 120)
       (midifile "test1.mid")
       (transposed (map (lambda (c) (map (lambda (x) (+ 60 x)) c)) sets))
       (series (loop repeat 12
                    for x = 
                    (odds .8 (pick (pick transposed)) (between 54 66))
;                    do (format #t "~{~a (~a) ~}" (list x (mod x 12)))
                    collect x)))
  (sprout (list (piano-phase 120 series .45)
                (piano-phase 120 series .8))
          midifile))

(play "test1.mid")

;; the template for generating midifile output with sprouting a piano phase
(let ((keynums (keynum reich-line))
      (stoptime 20)
      (midifile "reich.mid"))
  (sprout (list (piano-phase stoptime keynums .167)
                (piano-phase stoptime keynums .170))
         midifile)
  )

(play "reich.mid")

;; :unique-name :length :pc-information :tempo :level-of-rtm-activity
