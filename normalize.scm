(define (normalize table)
  (let ((total 0) (norm (make-hashtable)))
    (do-choices (key (getkeys table))
      (set! total (+ total (get table key))))
    (do-choices (key (getkeys table))
      (store! norm key (/~ (get table key) total)))
    norm))

(define (range-normalize table)
  (let ((maxval #f) (minval #f) (norm (make-hashtable)))
    (do-choices (key (getkeys table))
      (if maxval
	  (set! maxval (max (get table key) maxval))
	  (set! maxval (get table key)))
      (if minval
	  (set! minval (min (get table key) minval))
	  (set! minval (get table key))))
    (do-choices (key (getkeys table))
      (store! norm key (/~ (- (get table key) minval)
			   (- maxval minval))))
    norm))
