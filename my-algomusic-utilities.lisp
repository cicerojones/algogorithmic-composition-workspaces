;;; used in an open music workspace
(in-package :om)

(defun mapping-random (lst) 
  (let ((n (random 6)))
    (mapcar (lambda (x) (* 100 (+ 60 (+ 1 n x)))) lst)))

;; (lambda (lols) (mapcar #'mapping-random lols))
