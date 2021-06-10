(import (rnrs))

(define (dna->rna dna)
    (begin (define (dna-list->rna-list dna-list)
                    (if (null? dna-list)
                            dna-list
                            (cons (replace-nucleotide (car dna-list))
                                  (dna-list->rna-list (cdr dna-list)))))
           (list->string (dna-list->rna-list (string->list dna)))))

(define (replace-nucleotide x) (cond ((eq? x #\G) #\C)
                                     ((eq? x #\C) #\G)
                                     ((eq? x #\T) #\A)
                                     ((eq? x #\A) #\U)
                                     (else 'unknown-nucleotide)))
