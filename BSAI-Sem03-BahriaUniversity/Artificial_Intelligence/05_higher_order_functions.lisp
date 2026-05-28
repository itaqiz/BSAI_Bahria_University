;;; ============================================================
;;; Name         : Muhammad Taqui
;;; Enrollment   : 01-136221-021
;;; Class        : BS-AI(3A)
;;; Title        : Higher-Order Functions - Functions as Arguments
;;; ============================================================

(defun apply-twice (function argument)
  "Applies a function to an argument twice."
  (funcall function (funcall function argument)))

(defun square (x)
  "Returns the square of a number."
  (* x x))

;; Example: square(square(2)) = square(4) = 16
(format t "apply-twice square 2 = ~a~%" (apply-twice #'square 2))

;; iTaqiZ - PK
