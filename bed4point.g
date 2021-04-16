; ***********************************************************
; bed4point.g
; ***********************************************************
; probe is -16.4 in X -29.4 in Y bed is 290 in X 325 in Y
; adjust coords so that probe hits symmetric points on bed and avoids dock

 G90
 G30 P0 X0.0 Y45.0 F9000.0 Z-99999       ; probe front left
 G30 P1 X0.0 Y285.0 F9000.0 Z-99999      ; probe back left
 G30 P2 X270.0 Y285.0 F9000.0 Z-99999    ; probe back right
 G30 P3 X270.0 Y45.0 F9000.0 Z-99999 S3  ; probe near front right leadscrew and calibrate 3 motors
