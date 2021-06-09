G90

echo "Homing X Y"
M98 P"0:/sys/homexy.g" 
M400

echo "Homing Z"
M98 P"0:/sys/homez.g" 
; M28 {"0:/macros/probe-results/results.g"}
; echo state.time

M558 F{60+6*(random(11))} A1        ; randomize probe speed from 1mm/s to 2mm/s
echo (60*sensors.probes[0].speed)

G1 X{100+random(101)} F9000        ; move to random generated point in X
G1 Y{100+random(101)} F9000        ; move to random generated point in Y
G1 Z{12+random(11)} F1200            ; move to random generated point in Y
; echo "X" ^move.axes[0].machinePosition ^"Y" ^move.axes[1].machinePosition ^"Z" ^move.axes[2].machinePosition
M400                               ; wait for moves to finish
G60 S2                             ; store the X Y position to slot 2 to reacall later

echo "Starting Loop" 

while iterations <= 5             ; perform 25 passes 
  ; echo "Call deployprobe.g"
  G4 P200                          ; wait .2 seconds 
  M401 P0                          ; deploy probe
  G4 P200                          ; wait .2 seconds 
  echo iterations                  ; echo the pass number
  ; echo "Moves"                   ; echo the start of Moves
  G90                              ; set absolute mode
  G1 R2 X0 Y0 F9000                ; Move X Y to 0,0 relative to stored position 2 
  G1 Z{10+random(7)} F1200         ; Move X Y to 0,0 from stored position 2 and Z to a random position between 10 & 16
  M400                             ; wait for moves to finish
  G4 P200                          ; wait .2 seconds 
  
  echo "" ^iterations ^ "X" ^ move.axes[0].machinePosition ^ "Y" ^move.axes[1].machinePosition ^ "Z" ^move.axes[2].machinePosition
                                   ; echo carraige position to the screen 
  M28 {"0:/macros/probe-results/" ^iterations ^"-X-" ^move.axes[0].machinePosition ^"-Y-" ^move.axes[1].machinePosition ^"-Z-" ^move.axes[2].machinePosition}
                                   ; write out the postion data
  M400                             ; let moves finish
  M29                              ; Close file
  G30 S-1                          ; Execute Z Probe
  M400                             ; wait for moves to finish
  G4 P200                          ; wait .2 seconds 
  echo "" ^iterations ^"-X-n-Y-n-Z-n-Probe-" ^move.axes[2].machinePosition  ^"-Speed-" ^sensors.probes[0].speed
                                                                                      ; Echo the probe result and iteration number to console
  M28 {"0:/macros/probe-results/" ^iterations ^"-X-n-Y-n-Z-n-Probe-" ^move.axes[2].machinePosition ^ "-Speed-" ^sensors.probes[0].speed}
                                                                                      ; Create a file, named as the probe result and iteration number in the
                                                                                      ; 0:/macro/probe-results/ directory.  
  M29                                                                                 ; Close file
  G1 Z10                                                                              ; Move Z to 10mm height
  M400
  G4 P200                          ; wait .2 seconds 
  ; echo "Call retractprobe.g"
  M402 P0                          ; retract probe
  G4 P200                          ; wait .2 seconds 
  M400
echo "Macro Complete"