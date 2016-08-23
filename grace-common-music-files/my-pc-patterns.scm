;;; -*- syntax: Lisp; font-size: 16; line-numbers: no; -*-
;;; Yes! as of...[2016-07-24 Sun 11:28]
;;; Working with Patterns
;;; the following two functions work together
;;; and must be played with a 'sprout's

;;; deal with files?
(chdir "~/")
;(chdir "/Users/b/Github-repos/algogorithmic-composition-workspaces")
(pwd)
(load "/Users/b/Github-repos/algogorithmic-composition-workspaces/sets-for-cm.lisp")

;;; work with pc-sets

(load "sets-for-cm.lisp")

(car *trichords*)
(car *pentachords-tn*)

;;; define a variable:: NB. must evaluate the set-for-cm.lisp file first!!
(define tetra-pat (make-cycle *tetrachords*))

;; for testing where you are in the tetrachord cycle
(next tetra-pat)

;;; mypat creates a 3-octave web
(define (mypat notes)
  (make-cycle (list (make-heap notes)
                    (make-heap (transpose notes 12))
                    (make-heap (transpose notes -12))
                    )))

;;; create a function to play patterns using midi ports

(define (playpat num notes rate)
  (process with zztop = (mypat notes)
           repeat num
           for n = (next zztop)
           do
           (mp:midi :dur (* rate 2) :key (keynum n) :amp .7)
           (wait rate)))

;; test out with minor pentachord
(sprout (playpat 30 (note '(a4 b c5 d e)) .15))
 
;; test out with 0148t
(sprout (playpat 30 (note '(a4 bf cs f g)) .2))


;;; you can pass sprout another argument that pairs up
;;; with the things in the list of the process you pass it
(sprout (list (playpat 40 (note '(a4 bf cs f g)) .2)
              (playpat 40 (note '(a4 b c5 d e)) .15))
        '(0.5 8.5))

;;; last argument is the mysterious "wait" rate
(sprout (list (playpat 8 (note '(a4 bf cs f g)) 1)
              (playpat 8 (note '(a4 b c5 d e)) 1))
        '(0 8))



;;; some other sets and pattern building
;; define a minor pentachord
(define minor-gamut (mypat (note '(a4 b c5 d e))))
(next minor-gamut 20)

(note '(a4 0 c5 d e))

(define newpat (mypat '(60 61 64 68 70)))
(next newpat #t)

;;; create function to make 3-octave web given pc sets!
(define (pct pcs)
  (map (lambda (elt) (list elt (pitch-class elt))) pcs))


;;; LIBRARY-TYPE UTILITY: pcpat

;; pcpat exists primarily to allow you to pass in pitch-class sets
;; i.e. (0 1 2 3) as lists and have them be transposed up into
;; midi-playable octaves

(define (pcpat notes)
  (make-cycle (list (make-heap (transpose notes 48))
                    (make-heap (transpose notes 60))
                    (make-heap (transpose notes 72))
                    )))


;;;; begin defining my own versions of the 'process' pattern ;;;;


;;; designed initially for printing out but commented out
(define (willpat num notes rate)
  (process with willtop = (pcpat notes)
;           initially (format #t "~{~{~a~10t~}~%~}" (pct (next willtop #t)))
           repeat num
           for n = (next willtop)
           do
           (mp:midi :dur (* rate 2) :key (keynum n) :amp .7)
           (wait rate)))
;           finally (print (next willtop #t))))

;;; first process using multiple pc-sets
;;; t-levels built in
(sprout (list (willpat 60 (note '(0 1 4 8 10)) .2)
              (willpat 30 (note '(1 2 4 5 7 8)) .15)
              (willpat 90 (note '(5 7 8 9 10 11 14 15)) .4))
        '(0.1 11.9 16))

;;; now takes extra arguments for note-length and amplitude
(define (illpat num notes rate fac vol)
  (process with willtop = (pcpat notes)
;           initially (format #t "~{~{~a~10t~}~%~}" (pct (next willtop #t)))
           repeat num
           for n = (next willtop)
           do
           (mp:midi :dur (* rate fac) :key (keynum n) :amp vol)
           (wait rate)))

;;;; write to files on disk!
;; Note: >>> Error: Scheduler busy, cannot open "t8301.mid"
;;; write out all these instances of 0138t to a midi file rather than play
(sprout (list (illpat 60 (note '(0 1 3 8 11)) .2 2 .7)
              (illpat 30 (note '(1 2 4 5 7 8)) .25 3 .55)
              (illpat 90 (note '(5 7 8 9 10 11 14 15)) .4 6 .45))
        '(0.1 11.9 16)
        "t8301.mid")

;;; to listen to an example of the previous genre
(sprout (list (illpat 60 (note '(0 1 3 8 11)) .2 2 .7)
              (illpat 30 (note '(1 2 4 5 7 8)) .25 3 .55)
              (illpat 90 (note '(5 7 8 9 10 11 14 15)) .4 6 .45))
        '(0.1 11.9 16))
        
;;; LIBRARY TYPE UTILITY
;;; now user selects t-level as an argument

;; refactor: should set a default t-level
(define (tpcpat notes t-level)
  (make-cycle (list (make-heap (transpose notes (+ 48 t-level)))
                    (make-heap (transpose notes (+ 60 t-level)))
                    (make-heap (transpose notes (+ 72 t-level)))
                    )))

;;; now add yet another argument, this for the t-level to use
(define (stillpat num notes t-level rate fac vol)
  (process with willtop = (tpcpat notes t-level)
           repeat num
           for n = (next willtop)
           do
           (mp:midi :dur (* rate fac) :key (keynum n) :amp vol)
           (wait rate)))



;;; now create a midifile of 0138t sets at 0, 4, and 8
;;; also, use versioning with  the file names
(let ((name (file-version "t8310.mid" #t)))
  (sprout (list (stillpat 70 (note '(0 1 3 8 11)) 0 .6 4 .6)
                (stillpat 40 (note '(0 1 3 8 11)) 4 .8 5 .5)
                (stillpat 90 (note '(0 1 3 8 11)) 8 .99 7 .35))
          '(0 30 50)
          name))


;;; define a variable:: NB. must evaluate the set-for-cm.lisp file first!!
(define tetra-pat (make-cycle *tetrachords*))

;; for testing where you are in the tetrachord cycle
(next tetra-pat)

;;; now create new files and cycle through
(let ((name (file-version "pcset.mid" #t))
      (pcset (next tetra-pat)))
  (sprout (list (stillpat 70 (note pcset) 0 .6 4 .6)
                (stillpat 40 (note pcset) 4 .8 5 .5)
                (stillpat 90 (note pcset) 8 .99 7 .35))
          '(0 30 50)
          name)
  (print pcset))

(let ((pcset (next tetra-pat)))
  (sprout (list (stillpat 80 (note pcset) 0 .3 4 .7)
                (stillpat 58 (note pcset) 4 .4 5 .6)
                (stillpat 30 (note pcset) 8 .5 7 .5))
          '(0 10 20))
  (print pcset))

(let ((pcset (next tetra-pat)))
  (sprout (list (stillpat 32 (note pcset) 0 .5 0.9 1)
                (stillpat 32 (note (next tetra-pat)) 0 1 0.9 .8))
          '(0 16)))

;; start to develop for play-a-long ear-training
(let ((pcset (next tetra-pat)))
  (sprout (list (stillpat 32 (note pcset) 0 2 1.5 1)
                (stillpat 32 (note pcset) 1 1.5 1 .8))
          '(0 64))
  (print pcset))

;; use pentachords
(define penta-pat (make-cycle *pentachords*))

;; use a 7 scale cycle
(let ((pcset (next penta-pat)))
  (sprout (list (stillpat 10 (note pcset) 0 1 4 1)
                (stillpat 10 (note pcset) 5 1 3.5 .95)
                (stillpat 10 (note pcset) 10 1 3 .8)
                (stillpat 10 (note pcset) 3 1 2.5 .75)
                (stillpat 10 (note pcset) 8 1 2 .7)
                (stillpat 10 (note pcset) 1 1 1 .65)
                (stillpat 10 (note pcset) 6 1 .5 .6)
                )
          '(0 10 20 30 40 50 60))
  (print pcset))         




;;;; development detritus

(define my-name (file-version "t8310.mid" #t))

(file-version "dips.mid" #t)

(let ((a (file-version "dips.mid" #t)))
  (print a))

my-name

;;;
(define (play-notes-pat collection length)
  (sprout (playpat length (note collection) .2)))

(play-notes-pat '(c cs e g gs b) 50)

(let ((sc0134 '(c cs e f)))
  (play-notes-pat sc0134 50))

(define (play-30notes-pat collection)
  (sprout (playpat 30 (note collection) .2)))

(play-30notes-pat '(d ef fs g))

(map (lambda (pcs) (play-30notes-pat pcs)) '((c cs e f) (f fs a bf)))

;
;; Designing patterns
;

; TODO: create mypat2 that is like mypat but it take a list of
; intervals and a list of transpostion offsets and return a cycle
; containing as many heaps as offsets with each heap containing the
; intervals tranposed to the offset

; TODO: design a pattern that randomly returns quarters, eighth s and
; triplets. if eights are selected then 2 must be returned, if
; triplets are picked then three must be returned. no more than 2
; quarters can be consecutively returned.

(map keynum '((c5) (60) (440))) ;= ((72) (34.50637058500631) (69.0))
(map note '((60) (c5) (120))) ;= (("c4") ("c5") ("c9"))
(hertz '((c4) (60) (c))) ;= ((261.6255653005986) (261.6255653005986) (261.6255653005986))

;;;;

;;; Patterns are:

; Patterns are objects that generate data in different orderings. The
; cycle pattern is the simplest pattern, it generates data in an
; endless loop from front to back. to use a pattern you first have to
; make it:

(define pat (make-cycle '(a b c d )))

; Once you have a pattern use the next function to read data from it.
; execute this statement a number of times to see what is printed

(next pat)

; Calling next with #t reads a whole "period" or "chunk" of elements
; from the pattern:

(next pat #t)

; For simple streams, if the second argument is a number then a list
; of that many elements are returned from the pattern

(next pat 3)

; The for: parameter lets you specify a "period size" for the stream
; when you create it

(define pat (make-cycle (note '(a4 b c5 d e)) :for 3))

; Important pattern rule: Constant data can be replaced by patterns of
; data. So we can replace the number 3 with a pattern of period
; lengths

(define pat (make-cycle '(a b c d) :for (make-cycle '(2 3 4 5))))

(loop repeat 8
      do (print (next pat #t)))

; A heap pattern generates its data in random order by shuffling it each time it starts over:

(define pat (make-heap (note '(a4 b c5 d e))))

(next pat #t)

; Since we can replace constant data with patterns, we can create
; subpatterns of data. in this example we put a heap pattern inside a
; cycle pattern. A <heap> randomly shuffles its data.

(define pat (make-cycle (list (make-cycle '(a1 a2 a3))
                              (make-cycle '(b1 b2 b3))
                              (make-cycle '(c1 c2 c3)))))

(next pat #t)

; Here is a little example that generates randomly constructed chords

(define (makechords )
  (make-cycle (list (make-heap (note '(60 64 67 71))
                               (make-weighting '(3 4 5)))
                    (make-heap (note '(60 61 68 71))
                               (make-weighting '(3 4 5)))
                    (make-heap (note '(61 65 68 72))
                               (make-weighting '(3 4 5))))
                 :for 1))



(define (makerhythms)
  (make-cycle '(1 1 1 .5)))

(define pat (makechords))

(next pat #t)

(define (playjazzchords num notepat rhypat tpo)
  (process repeat num
           for rhy = (in-tempo (next rhypat) tpo)
           for chd = (next notepat #t)
           do
           (loop for n in chd
                 do
                 (mp:midi :key (keynum n) :dur .1 :amp .8))
           (wait rhy)
           ))


(sprout (playjazzchords 30 (makechords) (makerhythms) 160))
