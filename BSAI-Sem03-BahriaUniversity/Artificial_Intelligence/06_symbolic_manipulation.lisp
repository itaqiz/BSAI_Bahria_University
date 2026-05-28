;;; ============================================================
;;; Name         : Muhammad Taqui
;;; Enrollment   : 01-136221-021
;;; Class        : BS-AI(3A)
;;; Title        : Symbolic Manipulation - Simplifying Algebraic Expressions
;;; ============================================================

(defun simplify-expression (expression)
  "Entry point: simplifies and prints the result."
  (let ((simplified-expression (simplify expression)))
    (format t "Simplified expression: ~a~%" simplified-expression)))

(defun simplify (expression)
  "Simplifies an expression recursively."
  (if (atom expression)
      expression
      (simplify-subexpression expression)))

(defun simplify-subexpression (expression)
  "Simplifies each sub-expression by operator."
  (destructuring-bind (operator &rest operands) expression
    (let ((simplified-operands (mapcar #'simplify operands)))
      (simplify-operands operator simplified-operands))))

(defun simplify-operands (operator operands)
  "Dispatches simplification by operator type."
  (cond
    ((eq operator '+) (simplify-addition operands))
    ((eq operator '-) (simplify-subtraction operands))
    ((eq operator '*) (simplify-multiplication operands))
    ((eq operator '/) (simplify-division operands))
    (t (cons operator operands))))

(defun simplify-addition (operands)
  "Removes zero terms from addition."
  (let ((non-zero-operands (remove 0 operands)))
    (if non-zero-operands
        (if (null (cdr non-zero-operands))
            (car non-zero-operands)
            `(+ ,@non-zero-operands))
        0)))

(defun simplify-subtraction (operands)
  "Simplifies subtraction expressions."
  (if (null (cdr operands))
      (simplify (- (car operands)))
      `(- ,(car operands) ,(simplify (cadr operands)))))

(defun simplify-multiplication (operands)
  "Removes unit (1) terms from multiplication."
  (let ((non-one-operands (remove 1 operands)))
    (if non-one-operands
        (if (null (cdr non-one-operands))
            (car non-one-operands)
            `(* ,@non-one-operands))
        1)))

(defun simplify-division (operands)
  "Simplifies division expressions."
  (if (null (cdr operands))
      (simplify (/ 1 (car operands)))
      `(/ ,(car operands) ,(simplify (cadr operands)))))

;; Example usage
(simplify-expression '(* (+ x 2) (- x 1)))

;; iTaqiZ - PK
