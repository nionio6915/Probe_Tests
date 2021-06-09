T0                  ; Select Tool 0
M140 S20            ; start bed heating at 50 and continue
G10 P0 S0	R0	; Set extruder temp 190
M190 S20            ; wait for bet to reach 50
G4 10
M81 S1