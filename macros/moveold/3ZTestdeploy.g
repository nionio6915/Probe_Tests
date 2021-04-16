M558 K0 P8 C"zprobe.in" H8 F300 T12000 A3 S0.01 ; set as unfiltered NO switch

M564 S0	; allow movement outside of print area
G91  ; 
G1 Z10 ; may not be needed if premptive Z move on X & Y homing is good enough
G90	; absolute positioning
M98 P"move/1ZTestdockside.g"   ; move carraige to the side of the dock aligning magnets
M400
M98 P"move/2ZTestdock.g"       ; move carraige over probe aligning magnets
G30 X1 Y-29.7 S-1              ; probe down to pick up the device when magnets complete circuit probe should be triggered
M400
G91
G1 Z-2
M400
