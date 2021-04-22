; ***********************************************************
; homez.g
; ***********************************************************
if !move.axes[0].homed || !move.axes[1].homed     ; If the printer hasn't been homed, home it
   M98 P"0:/sys/homexy.g"  
M561                                            ; clear any bed transform
M290 S0 R0                                      ; clear baby steps per Wes C
G91                                             ; relative positioning
M400
; G1 H2 Z6 F6000                                  ; lift Z relative to current position
G90                                             ; absolute positioning
M401 P0                                         ; This runs macro file deployprobe
G1 X145 Y162.5 F9000                            ; go to first probe point
M400
G30 -2
M400
G4 P500
M118 S"Call 4 point macro"
M98 P"0:/sys/bed4point.g"                       ; tram bed
;
G1 X145 Y165 F9000                              ; go back to the first probe point and reprobe 0 in case it moved
G30
M402 P0                                         ; retract probe
G1 Z10 F600                                     ; lift Z relative to current position
G90                                             ; absolute positioning
M564 S1 H0
; G1 X150 Y0 F9000                              ; move carraige to center front
