(import (rnrs))

(define (leap-year? year)
  (if (= (remainder year 4) 0) (if (= (remainder year 100) 0) (if (= (remainder year 400) 0) #t #f) #t) #f))
