; 0:/sys/primeline.g
; Print 100mm prime line at a 'randomized' X positon from 25 to 150, Y from 320 -325
G90 
G1 X{25+random(126)} Y{317+random(8)} Z0.6 F3000.0;
G92 E0.0 ; set E position to 0
G91
G1 Z0.3 X100.0 E20.0 F1000.0                               ; prime line
G92 E0.0                                                   ; set E position to 0
M400                                                       ; finish all current moves / clear the buffer
