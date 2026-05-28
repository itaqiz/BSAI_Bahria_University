;;; ============================================================
;;; Name         : Muhammad Taqui
;;; Enrollment   : 01-136221-021
;;; Class        : BS-AI(3A)
;;; Title        : List Manipulation - Reverse a List
;;; ============================================================

(defun reverse-list (lst)
  "Recursively reverses a list."
  (if (null lst)
      nil
      (append (reverse-list (cdr lst))
              (list (car lst)))))

;; Example usage
(print (reverse-list '(1 2 3 4 5)))

;; iTaqiZ - PK
