;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname aufgabe_1_11) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
(: umrechnung (number number number -> number))
(define umrechnung
  (lambda (summand faktor zahl)
    (+
     (* zahl faktor)
     summand
     )
    )
  )

(define celsius->fahrenheit
  (lambda (zahl)
    (umrechnung 32 1.8 zahl)
    )
  )

(define fahrenheit->celsius
  (lambda (zahl)
    (umrechnung (* (/ 5 9) -32) (/ 5 9) zahl)
    )
  )

(check-expect (fahrenheit->celsius 32) 0)
(check-expect (celsius->fahrenheit 49) 120.2)
