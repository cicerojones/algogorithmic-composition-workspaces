(
 ;; single quarter note in 1/4
 ((1 (1)))				
 ;; half-note in 2/4
 ((2 (1)))
 ;; dotted-half in 3/4
 ((3 (1)))
 ;; whole-note in 4/4
 ((4 (1))) 				; 4
 ;; two eighths in 1/4
 ((1 (1 1)))				
 ;; two quarters in 2/4
 ((2 (1 1)))
 ;; weird quarter-note duplet in 3/4
 ((3 (1 1)))
 ;; weird two half note duplet in 4/4
 ((4 (1 1)))				;22
 ;; three eighth-note triplet
 ((1 (1 1 1)))
 ;; quarter-note triplet in 3/4
 ((2 (1 1 1)))
 ;; three quarters in 3/4
 ((3 (1 1 1)))
 ;; quarter-note triplet in 4/4
 ((4 (1 1 1)))				
 ;; 4 sixteenths in 1/4
 ((1 (1 1 1 1)))
 ;; 4 eighths in 2/4
 ((2 (1 1 1 1)))
 ;; 4 quarter 'quadruplet' in 3/4
 ((3 (1 1 1 1)))
 ;; 4 quarters in 4/4
 ((4 (1 1 1 1))) 			;1111

 ;;;; all 4/4
 ;; two half-notes in 4/4
 ((2 (1)) (2 (1)))			;22better
 ;; dotted-half, quarter in 4/4
 ((3 (1)) (1 (1)))			;31
 ;; quarter, dotted-half in 4/4
 ((1 (1)) (3 (1))) 			;13
 ;; half, two quarters in 4/4
 ((2 (1)) (1 (1)) (1 (1)))		;211
 ;; quarter, half, quarter in 4/4
 ((1 (1)) (2 (1)) (1 (1)))		;121
 ;; two quarters, half in 4/4
 ((1 (1)) (1 (1)) (2 (1)))		;112
 ;; four quarters in 4/4 (concisest)
 ((1 (1)) (1 (1)) (1 (1)) (1 (1)))	;1111best

 ;;;; some gaps in display
 ;; two quarters, half in 4/4
 ((2 (1 1)) (2 (1))) 
 ;; half, two quarters in 4/4
 ((2 (1)) (2 (1 1))) 

 ;; four eighths, half in 4/4
 ((2 (1 1 1 1)) (2 (1)))
 ;; half, four eighths in 4/4
 ((2 (1)) (2 (1 1 1 1)))

 ;; four eighths, two quarters in 4/4
 ((2 (1 1 1 1)) (2 (1 1)))
 ;; two quarters, four eighths in 4/4
 ((2 (1 1)) (2 (1 1 1 1)))

 ;;;; first mozart duet rhythms (in 'order')
 ;; 
 (1 (1)) ;; quarter note pickup? 1/4 measure
 ;; four eighths
 ((2 (1 1 1 1)))
 ;; quarter, eighth rest, eighth note
 ((1 (1)) (1 (-1 1)))
 ;; ((1 (1 1)) ((1 (1)) (1 (1 1))))
 ;; eighth, two sixteenths in 1/4
 ((1 (2 1 1)))
 ;; two eighths, eighth, two sixteenths 
 ((1 (1 1)) (1 (2 1 1)))
 ;; eighth, two sixteenths, four sixteenths
 ((1 (2 1 1)) (1 (1 1 1 1)))
 ;; eight sixteenths
 ((1 (1 1 1 1)) (1 (1 1 1 1)))
 ;; eight sixteenths all beamed??
 ((2 (1 1 1 1 1 1 1 1)))
 
 ;; tied over quarter, two eighths
 ((1 (1.0)) (1 (1 1)))

;;; first mozart duet b section
 ;; two quarters in 2/4
 ((2 (1)) (1 (1)))
 ;; quarter tied to eighth, eighth
 ((1 (1)) (1 (1.0 1)))
 ;; eighth rest, eighth, quarter
 ((1 (-1 1)) (1 (1)))
 ;; tied over eighth, eighth, quarter
 ((1 (1.0 1)) (1 (1)))
 ;; two quarters in 2/4 (more concise?)
 ((1 (1)) (1 (1)))
 ;; tied over eighth, eighth tied to eighth, eighth (aka eighth, quarter, eighth)
 ((1 (1.0 1)) (1 (1.0 1)))
 ;; explicit eighth, quarter, eighth
 ((2 (1 2 1))) 
 ;; eighth, eighth rest, eighth, eighth rest
 ((1 (1 -1)) (1 (1 -1)))
 ;; quarter, dotted eighth, sixteenth
 ((1 (1)) (1 (3 1))))

;;;; the following may work, but are not in MOZART-RTM-db
((2 (1 -1)) (2 (1 -1)))
((1 (1.0)) (1 (1)))
((1 (1.0)) (1 (2)) (1 (1)))
(1 (1 1 1 1 1 1 1 1))
((1 (1 2 1)))
;; ((1 (1) (1))) ;; quarter note in 4/4
;;  ((2 (1) (1)))
;;  ((3 (1) (1)))
;;  ((4 (1) (1)))
;;  ((1 (1 1) (1 1)))
;;  ((2 (1 1) (1 1)))
;;  ((3 (1 1) (1 1)))
;;  ((4 (1 1) (1 1)))
;;  ((1 (1 1 1) (1 1 1) (1 1 1)))
;;  ((2 (1 1 1) (1 1 1) (1 1 1)))
;;  ((3 (1 1 1) (1 1 1) (1 1 1)))
;;  ((4 (1 1 1) (1 1 1) (1 1 1)))
;;  ((1 (1) (1) (1) (1)))
;;  ((2 (1) (1) (1) (1)))
;;  ((3 (1) (1) (1) (1)))
;; ((4 (1) (1) (1) (1)))
;; )

;;;; uncommented
(
 ((1 (1)))
 ((2 (1)))
 ((3 (1)))
 ((4 (1)))
 ((1 (1 1)))
 ((2 (1 1)))
 ((3 (1 1)))
 ((4 (1 1)))
 ((1 (1 1 1)))
 ((2 (1 1 1)))
 ((3 (1 1 1)))
 ((4 (1 1 1)))
 ((1 (1 1 1 1)))
 ((2 (1 1 1 1)))
 ((3 (1 1 1 1)))
 ((4 (1 1 1 1)))
 ((2 (1)) (2 (1)))
 ((3 (1)) (1 (1)))
 ((1 (1)) (3 (1)))
 ((2 (1)) (1 (1)) (1 (1)))
 ((1 (1)) (2 (1)) (1 (1)))
 ((1 (1)) (1 (1)) (2 (1)))
 ((1 (1)) (1 (1)) (1 (1)) (1 (1)))
 ((2 (1 1)) (2 (1)))
 ((2 (1)) (2 (1 1)))
 ((2 (1 1 1 1)) (2 (1)))
 ((2 (1)) (2 (1 1 1 1)))
 ((2 (1 1 1 1)) (2 (1 1)))
 ((2 (1 1)) (2 (1 1 1 1)))
 ((1 (1)))
 ((2 (1 1 1 1)))
 ((1 (1)) (1 (-1 1)))
 ((1 (2 1 1)))
 ((1 (1 1)) (1 (2 1 1)))
 ((1 (2 1 1)) (1 (1 1 1 1)))
 ((1 (1 1 1 1)) (1 (1 1 1 1)))
 ((2 (1 1 1 1 1 1 1 1)))
 ((1 (1.0)) (1 (1 1)))
 ((2 (1)) (1 (1)))
 ((1 (1)) (1 (1.0 1)))
 ((1 (-1 1)) (1 (1)))
 ((1 (1.0 1)) (1 (1)))
 ((1 (1)) (1 (1)))
 ((1 (1.0 1)) (1 (1.0 1)))
 ((2 (1 2 1))) 
 ((1 (1 -1)) (1 (1 -1)))
 ((1 (1)) (1 (3 1))))
