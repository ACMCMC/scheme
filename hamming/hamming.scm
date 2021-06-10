(import (rnrs))

; Calculates the Hamming distance (number of differences) between two strings
(define (hamming-distance strand-a strand-b)
    (cond ((not (= (string-length strand-a) ; If the length of the two strings is not the same...
                   (string-length strand-b)))
           (error "Different length" "Check")) ; ...throw an error
          ((= (string-length strand-a) 0) 0) ; If the length of the strings is 0, return 0 (stop condition)
          ((string=? (substring strand-a 0 1) ;  If the first character of the strings is equal...
                     (substring strand-b 0 1))
           (hamming-distance (substring strand-a 1 (string-length strand-a)) ; ...recurse with the rest of the list
                             (substring strand-b 1 (string-length strand-b))))
          (else (+ 1 (hamming-distance (substring strand-a 1 (string-length strand-a)) ; If the first character of both strings is not equal...
                                       (substring strand-b 1 (string-length strand-b))))))) ; ...recurse, but add 1 to the result (there's a difference, so Hamming's value is incremented)
