;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname aufgabe_1_14) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
;Berechnet den Verbrauch in Liter pro 100 km
(: liters-per-hundred-kilometers (number number -> number))
(define liters-per-hundred-kilometers
  (lambda (liter km)
           (* 100 (/ liter km))
  )
)

(check-expect (liters-per-hundred-kilometers 6.5 50) 13)
(check-expect (liters-per-hundred-kilometers 8 100) 8)
(check-expect (liters-per-hundred-kilometers 0 99999999999) 0)

;Berechnet wieviele Meilen wir mit einer Gallone fahren können
(: miles-per-gallon (number number -> number))
(define miles-per-gallon
  (lambda (miles gallon)
    (/ miles gallon)
  )
)

(check-expect (miles-per-gallon 8 2) 4)
(check-expect (miles-per-gallon 20 3) (/ 20 3))
(check-expect (miles-per-gallon 0 6) 0)

(define kilometers-per-mile 1.61)

; Rechnet km in meilen um
(: kilometers->miles (number -> number))
(define kilometers->miles
  (lambda (km)
    (/ km kilometers-per-mile)
  )
)

(check-expect (kilometers->miles 1.61) 1)
(check-expect (round (kilometers->miles 5.95)) 4)

; Rechnet meilen in km um
(: miles->kilometers (number -> number))
(define miles->kilometers
  (lambda (miles)
    (* kilometers-per-mile miles)
  )
)

(check-expect (miles->kilometers 1) 1.61)
(check-expect (miles->kilometers 10) 16.1)
(check-expect (miles->kilometers (kilometers->miles 3.6273)) 3.6273)

(define liters-per-gallon 3.79)

; Rechnet Liter in Gallonen um
(: liters->gallons (number -> number))
(define liters->gallons
  (lambda (liters)
    (/ liters liters-per-gallon)
  )
)

(check-expect (liters->gallons 3.79) 1)
(check-expect (liters->gallons 0) 0)

; Rechnet Gallonen in Liter um
(: gallons->liters (number -> number))
(define gallons->liters
  (lambda (gallons)
    (* gallons liters-per-gallon)
  )
)

(check-expect (gallons->liters 1) 3.79)
(check-expect (gallons->liters 0) 0)
  
; Rechnet l/100km in Meilen/Gallone um
(: l/100km->mi/gal (number -> number))
(define l/100km->mi/gal
  (lambda (l/100km)
    (miles-per-gallon
      (kilometers->miles 100) ; 100km in meilen
      (liters->gallons l/100km) ; gallone/100km
    )
  )
)

; Rechnet Meilen/Gallone in l/100km um
(: mi/gal->l/100km (number -> number))
(define mi/gal->l/100km
  (lambda (mi/gal)
    (liters-per-hundred-kilometers
     (gallons->liters 1)
     (miles->kilometers mi/gal)
    )
  )
)

(check-expect (mi/gal->l/100km (l/100km->mi/gal 213424)) 213424)
(check-error (l/100km->mi/gal 0))

; Beschneidet eine Zahl auf 2 Nachkommastellen
(: floor-to-2-decimals (number -> number))
(define floor-to-2-decimals
  (lambda (num)
    (/ (floor (* 100 num)) 100)
  )
)

(check-expect (floor-to-2-decimals (mi/gal->l/100km 1)) 235.40)
(check-expect (floor-to-2-decimals (l/100km->mi/gal 1)) 235.40)