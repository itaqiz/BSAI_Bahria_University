;;; ============================================================
;;; Name         : Muhammad Taqui
;;; Enrollment   : 01-136221-021
;;; Class        : BS-AI(3A)
;;; Title        : Simple Genetic Algorithm in Lisp
;;; ============================================================

;;; --- Configuration ---

(defvar *population-size* 100)
(defvar *gene-length*      10)
(defvar *mutation-rate*    0.01)
(defvar *crossover-rate*   0.8)

;;; --- Population Generation ---

(defun generate-individual ()
  "Generates a random binary individual."
  (loop repeat *gene-length* collect (random 2)))

(defun generate-population ()
  "Generates an initial population of individuals."
  (loop repeat *population-size* collect (generate-individual)))

;;; --- Fitness Evaluation ---

(defun evaluate-individual (individual)
  "Evaluates fitness of an individual (sum of genes as placeholder)."
  ;; Fitness = number of 1s in the genome (maximization target)
  (reduce #'+ individual))

;;; --- Genetic Operators ---

(defun flip-gene (gene)
  "Flips a binary gene: 0 -> 1, 1 -> 0."
  (if (= gene 0) 1 0))

(defun mutate (individual)
  "Mutates an individual by flipping genes at mutation rate."
  (loop for gene in individual
        collect (if (<= (random 1.0) *mutation-rate*)
                    (flip-gene gene)
                    gene)))

(defun crossover (parent1 parent2)
  "Performs single-point crossover between two parents."
  (if (<= (random 1.0) *crossover-rate*)
      (let* ((split-point (random *gene-length*))
             (child1 (append (subseq parent1 0 split-point)
                             (subseq parent2 split-point)))
             (child2 (append (subseq parent2 0 split-point)
                             (subseq parent1 split-point))))
        (list child1 child2))
      (list parent1 parent2)))

;;; --- Selection ---

(defun select-individual (evaluated-population)
  "Selects an individual using tournament selection (simplified)."
  (caar (sort (list (nth (random (length evaluated-population)) evaluated-population)
                    (nth (random (length evaluated-population)) evaluated-population))
              #'> :key #'cdr)))

;;; --- Evolution ---

(defun evolve (population)
  "Evolves a population for one generation."
  (let* ((evaluated-population
           (mapcar (lambda (ind)
                     (cons ind (evaluate-individual ind)))
                   population))
         (sorted-population
           (sort evaluated-population #'> :key #'cdr))
         (fittest-individual (caar sorted-population))
         (next-generation (list fittest-individual)))
    (loop repeat (- *population-size* 1) do
      (let* ((parent1  (select-individual sorted-population))
             (parent2  (select-individual sorted-population))
             (children (apply #'crossover (list parent1 parent2))))
        (dolist (child children)
          (push (mutate child) next-generation))))
    next-generation))

;;; --- Run ---

(let* ((population  (generate-population))
       (generations 10))
  (loop repeat generations do
    (setq population (evolve population)))
  (format t "Best fitness after ~a generations: ~a~%"
          generations
          (evaluate-individual (car population))))

;; iTaqiZ - PK
