;;; ============================================================
;;; Name         : Muhammad Taqui
;;; Enrollment   : 01-136221-021
;;; Class        : BS-AI(3A)
;;; Title        : Graph Traversal - DFS and BFS in Lisp
;;; ============================================================

;;; --- Depth-First Search ---

(defun dfs-visit (graph node visited)
  "Recursively visits nodes using DFS."
  (if (member node visited)
      nil
      (progn
        (format t "Visited node: ~a~%" node)
        (push node visited)
        (dolist (neighbor (cdr (assoc node graph)))
          (dfs-visit graph neighbor visited)))))

(defun dfs (graph start-node)
  "Initiates DFS from the start node."
  (dfs-visit graph start-node '()))

;;; --- Breadth-First Search ---

(defun bfs (graph start-node)
  "Traverses graph using BFS starting from start-node."
  (let ((visited (list start-node))
        (queue   (list start-node)))
    (loop while queue do
      (let ((current-node (pop queue)))
        (format t "Visited node: ~a~%" current-node)
        (dolist (neighbor (cdr (assoc current-node graph)))
          (unless (member neighbor visited)
            (push neighbor visited)
            (push neighbor queue)))))))

;;; --- Graph Definition ---

(defvar *graph*
  '((A B C)
    (B D)
    (C E F)
    (D)
    (E)
    (F G)
    (G)))

;;; --- Run Traversals ---

(format t "~%=== DFS Traversal ===~%")
(dfs *graph* 'A)

(format t "~%=== BFS Traversal ===~%")
(bfs *graph* 'A)

;; iTaqiZ - PK
