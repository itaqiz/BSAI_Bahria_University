;;; ============================================================
;;; Name         : Muhammad Taqui
;;; Enrollment   : 01-136221-021
;;; Class        : BS-AI(3A)
;;; Title        : Tower of Hanoi in Lisp
;;; ============================================================

(defun move-disks (n source dest temp)
  "Recursively moves n disks from source to dest using temp as auxiliary."
  (if (zerop n)
      nil
      (progn
        (move-disks (- n 1) source temp dest)
        (format t "Move disk ~a from ~a to ~a.~%" n source dest)
        (move-disks (- n 1) temp dest source))))

(defun tower-of-hanoi (n)
  "Solves the Tower of Hanoi puzzle with n disks."
  (move-disks n 'A 'C 'B))

;; Example: Solve for 3 disks
(tower-of-hanoi 3)

;; iTaqiZ - PK
