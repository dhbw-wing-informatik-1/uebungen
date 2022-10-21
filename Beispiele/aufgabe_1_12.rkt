;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname aufgabe_1_12) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
; Schreibt einen String zweimal hintereinander
(: double-string (string -> string))
(define double-string
  (lambda (str)
    (string-append str str)
  )
)

(check-expect (double-string "a") "aa")

; Schreibt einen String viermal hintereinander
(: quadruple-string (string -> string))
(define quadruple-string
  (lambda (str)
    (double-string (double-string str))
  )
)

; Schreibt einen String achtmal hintereinander
(: octuple-string (string -> string))
(define octuple-string
  (lambda (str)
    (double-string (quadruple-string str))
  )
)

; Schreibt einen String sechzehnmal hintereinander
(: sixteentuple-string (string -> string))
(define sixteentuple-string
  (lambda (str)
    (quadruple-string (quadruple-string str))
  )
)

(check-expect (sixteentuple-string "a") "aaaaaaaaaaaaaaaa")