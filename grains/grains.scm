; Calculate the number of grains of wheat on a chessboard given that the number on each square doubles.

; There once was a wise servant who saved the life of a prince. The king promised to pay whatever the servant could dream up.
; Knowing that the king loved chess, the servant told the king he would like to have grains of wheat.
; One grain on the first square of a chess board, with the number of grains doubling on each successive square.
; There are 64 squares on a chessboard (where square 1 has one grain, square 2 has two grains, and so on).

; Write code that shows:
; - how many grains were on a given square, and
; - the total number of grains on the chessboard

(import (rnrs))

; Calculates the number of grains in a given square (2^(n-1))
(define (square n)
  (if (or (< n 1) (> n 64)) (error "square" "Number out of bounds") (if (= n 1) 1 (* (square (- n 1)) 2))))

; Generates a list in the range [bottom, top]
(define (range-between bottom top) (if (> bottom top) '() (cons bottom (range-between (+ 1 bottom) top))))

; Calculates the total amount of grains, summing all of the 64 squares
(define total
  (fold-right (lambda (car seq) (+ (square car) seq)) 0 (range-between 1 64)))
