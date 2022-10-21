;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname xor) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
; Berechnet das exklusive oder zweier boolscher Werte
(: xor (boolean boolean -> boolean))
(define xor
  (lambda (a b)
    (or
     (and a (not b))
     (and (not a) b)
    )
  ) 
)

(check-expect (xor #f #f) #f)
(check-expect (xor #t #t) #f)
(check-expect (xor #t #f) #t)
(check-expect (xor #f #t) #t)