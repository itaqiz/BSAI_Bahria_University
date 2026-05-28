;;; ============================================================
;;; Name         : Muhammad Taqui
;;; Enrollment   : 01-136221-021
;;; Class        : BS-AI(3A)
;;; Title        : Recursive Factorial in Lisp
;;; ============================================================

(defun factorial (n)
  "Recursively computes the factorial of a non-negative integer n."
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))))

(defun main ()
  (format t "Enter a number: ")
  (let ((number (parse-integer (read-line))))
    (format t "Factorial of ~a is ~a.~%" number (factorial number))))

(main)

;; iTaqiZ - PK
