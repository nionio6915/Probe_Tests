; ***********************************************************
; homey.g
; **********************************************************
if boards[0].vIn.current < 23
    M291 S2 R"Turn on power?" P"Power is OFF?" 
    M292 P0
    M80
    G4 P1000        ; wait 1 second for power to stabilize

if boards[0].vIn.current > 23
    M290 S0 R0      ; remove baby stepping
    M400
    ; Home Y at the high end of the axis
    G91              ; relative positioning
    G1 H2 Z5 F6000   ; lift Z relative to current position
    G1 H1 Y325 F6000 ; move quickly to Y axis endstop and stop there (first pass)
    G1 H2 Y-5  F6000 ; go back a few mm
    G1 H1 Y325 F360  ; move slowly to Y axis endstop once more (second pass)
    G1 H2 Z-5 F6000  ; lower Z to starting point
    G90              ; absolute positioning