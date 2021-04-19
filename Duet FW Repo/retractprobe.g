; ***********************************************************
;
; retractprobe.g
;
; ***********************************************************
; M118 S"Redefine probe as NC"
; M558 K0 P5 C"^zprobe.in" H8 R0.5 F200 T9000 A1 S0.03
; M400
if sensors.probes[0].value[0]!= 0
    abort "retractprobe: Probe not currently picked up!"

; M564 S0	                     ; allow movement outside of print area
G90	                         ; absolute positioning

G1 X100 Y0 Z5 F12000         ; move to the starting point 
G1 X45 Y0 F6000              ; move to the entry position for the dock
G1 X0 Y0 F3000               ; move to the dock position
G1 X0 Y50 F12000             ; move to the side adjacent to the dock
M400
G1 X100 Y50 F12000           ; move to the right to clear dock
G1 X145 Y0 Z5 F6000          ; move to start point at middle front 
M400
M564 S1                      ; limit axis to print area

if sensors.probes[0].value[0]!= 1000
    abort "retractprobe: Probe not correctly dropped off in dock!"
