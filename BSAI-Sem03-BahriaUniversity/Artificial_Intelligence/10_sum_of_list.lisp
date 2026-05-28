;;; ============================================================
;;; Name         : Muhammad Taqui
;;; Enrollment   : 01-136221-021
;;; Class        : BS-AI(3A)
;;; Title        : Recursive Sum of a List in Lisp
;;; ============================================================

(defun sum-list (lst)
  "Recursively computes the sum of all numbers in a list."
  (if (null lst)
      0
      (+ (car lst) (sum-list (cdr lst)))))

(defun get-numbers ()
  "Reads numbers from user input until 'done' is entered."
  (format t "Enter a number (or 'done' to finish): ")
  (let ((input (read)))
    (if (equal input 'done)
        '()
        (cons input (get-numbers)))))

;; Run
(let ((numbers (get-numbers)))
  (format t "Sum: ~a~%" (sum-list numbers)))

;; iTaqiZ - PK
