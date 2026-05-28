;;; ============================================================
;;; Name         : Muhammad Taqui
;;; Enrollment   : 01-136221-021
;;; Class        : BS-AI(3A)
;;; Title        : Fibonacci Numbers using Recursion in Lisp
;;; ============================================================

(defun fibonacci (n)
  "Recursively computes the nth Fibonacci number."
  (if (< n 2)
      n
      (+ (fibonacci (- n 1))
         (fibonacci (- n 2)))))

;; Print fibonacci of 14
(print (fibonacci 14))

;; iTaqiZ - PK
