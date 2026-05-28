;;; ============================================================
;;; Name         : Muhammad Taqui
;;; Enrollment   : 01-136221-021
;;; Class        : BS-AI(3A)
;;; Title        : Lab Task-4 - Fibonacci Sequence in Lisp
;;; Due          : 22 March 2023
;;; ============================================================

(defun fibonacci (n)
  "Returns the nth Fibonacci number recursively."
  (if (< n 2)
      n
      (+ (fibonacci (- n 1))
         (fibonacci (- n 2)))))

;; Print fibonacci(13) = 233
(print (fibonacci 13))

;; iTaqiZ - PK
