; ***********************************************************
; homex.g
; **********************************************************
if boards[0].vIn.current < 23
    M291 S2 R"Turn on power?" P"Power is OFF!" 
    M292 P0
    M80
    G4 P1000        ; wait 1 second for power to stabilize
else   
    M290 S0 R0      ; remove baby stepping
    M400
    ; Home X at the high end of the axis
    G91              ; relative positioning
    G1 H2 Z5 F6000   ; lift Z relative to current position
    G1 H1 X292 F6000 ; move quickly to X axis stop there define X290 (first pass)
    G1 H2 X-5  F6000 ; go back a few mm
    G1 H1 X292 F360  ; move slowly to X axis endstop stop define X290 (second pass)
    G1 H2 Z-5 F6000  ; lower Z again
    G90              ; absolute positioning