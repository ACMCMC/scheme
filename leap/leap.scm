(import (rnrs))

(define (leap-year? year)
  (if (= (remainder year 4) 0) (if (= (remainder year 100) 0) (if (= (remainder year 400) 0) #t #f) #t) #f)) ; A leap year must (1) be divisible by 4; (2) not be divisible by 100 but (3) not by 400 (if it's divisible by 100 and 400, then it's a leap year)
