; ***********************************************************
; bed.g
; ***********************************************************
M98 P"0:/sys/homex.g"                            ; home X
M98 P"0:/sys/homey.g"                            ; home Y
M98 P"0:/sys/homez.g"                            ; home Z
; 
; echo "Bed Traming Cycle: 1 - Difference was " ^ move.calibration.initial.deviation ^ "mm"
;
; while move.calibration.initial.deviation >= 0.031 ; perform additional tramming if previous deviation was over 0.03mm
;     if iterations = 5
;         abort "Too many auto tramming attempts"
;     M98 P"0:/sys/bed4point.g"                    ; perform bed tramming
;     echo "Bed Traming Cycle: " ^ iterations + 2 ^ " - Difference was " ^ move.calibration.initial.deviation ^ "mm"
;         continue
 
; G1 X145 Y163 F9000                               ; go to first probe point
; G30                                              ; home Z by probing the bed
; G29 S0                                           ; mesh level bed
; M402 P0                                          ; retract probe

; Uncomment the following lines to lift Z after probing
; M91
; M564 S1 H0
; G1 Z6 F600                                      ; lift Z relative to current position
; G90
G1 X150 Y10 Z10 F9000                            ; move carraige to center front
