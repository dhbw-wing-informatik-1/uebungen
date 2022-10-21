;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname say_number) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
; Zahl zu Text machen
(: say-number ((integer-from-to 0 3) -> string))
(define say-number
  (lambda (num)
    (cond
      ((= num 0) "zero")
      ((= num 1) "one")
      ((= num 2) "two")
      ((= num 3) "three")
    )
  )
)

(check-expect (say-number 1) "one")
(check-expect (say-number 3) "three")

; Zahl zu Text machen
(: say-number-fallback (number -> string))
(define say-number-fallback
  (lambda (num)
    (cond
      ((= num 0) "zero")
      ((= num 1) "one")
      ((= num 2) "two")
      ((= num 3) "three")
      (else ">3")
    )
  )
)

(check-expect (say-number-fallback 1) "one")
(check-expect (say-number-fallback 365) ">3")
