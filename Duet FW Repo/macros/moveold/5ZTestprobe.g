G91 
G1 Z10 
G90 
G1 X75 Y75
M558 K0 P5 C"^zprobe.in" H8 F300 T12000 A3 S0.01
                                                ; K0 for probe 0, P5 for NC switch, C for input pin, ^ for enabling the native pullup resistor on Duet2 hardware running RRF3  
                                                ; H dive height of 8mm, F300 probing speed 6mm/sec, T9000 travel speed 150mm/sec,   
                                                ; A3 number of probes 1, S0.01 max tolerance of 0.01 
                                                ;
G31 K0 P500 X-16.4 Y-29.27 Z5.45                ; CHECK for LOOSE things first! set Z probe trigger value, offset and trigger height.  Higher numbers makes nozzle closer to bed

G30 S-1 K0
G31 K0 


