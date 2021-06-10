(import (rnrs))

; Takes a string of DNA nucleotides and returns its RNA translation
(define (dna->rna dna)
    (begin (define (dna-list->rna-list dna-list) ; I operate with lists just because I want to practise using them
                    (if (null? dna-list) ; If the list is empty...
                            dna-list ; ...return the empty list
                            (cons (replace-nucleotide (car dna-list)) ; If the list is not empty, translate the first item and recurse
                                  (dna-list->rna-list (cdr dna-list)))))
           (list->string (dna-list->rna-list (string->list dna))))) ; Call the dna-list->rna-list procedure, but it takes a list of characters (not a string), so convert it to a list first and convert it back after finishing

; Takes a nucleotide DNA character and returns the RNA corresponding character
(define (replace-nucleotide x) (cond ((eq? x #\G) #\C)
                                     ((eq? x #\C) #\G)
                                     ((eq? x #\T) #\A)
                                     ((eq? x #\A) #\U)
                                     (else 'unknown-nucleotide)))
