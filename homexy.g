; ***********************************************************
; homexy.g
; ***********************************************************
; 
if boards[0].vIn.current < 23
    M291 S2 R"Turn on power?" P"Power is OFF?" 
    M292 P0
    M80
    G4 P1000                           ; wait 1 second for power to stabilize
elif boards[0].vIn.current > 23
   M561                                 ; clear any bed transform
   M290 S0 R0                           ; clear baby steps per Wes C
   M564 S0 H0                           ; allow movement outside limits
                                        ; Home X and Y at the high end of the axis
   G91                                  ; relative positioning
   G1 H2 Z2 F600                       ; lift Z relative to current position
   G1 H1 X290 Y290 F9000                ; move quickly to X and Y axis endstops and stop there (first pass)
   G1 H2 X-5 Y-5   F9000                ; go back a few mm
   G1 H1 X290 Y290 F360                 ; move slowly to X and Y axis endstops once more (second pass)
   G1 H2 Z-2 F600                       ; lift Z relative to current position
   G90                                  ; absolute positioning
   M564 S1