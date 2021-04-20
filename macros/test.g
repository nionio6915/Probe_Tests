G90
echo "Homing X Y"
; M98 P"0:/sys/homexy.g" 
M400
echo "Homing Z"
; M98 P"0:/sys/homez.g" 
; M28 {"0:/macros/probe-results/results.g"}
echo state.time
M558 F{5+random(51)} A1            ; establish random probe speed betweem 5 - 55
echo (60*sensors.probes[0].speed)
G1 X{100+random(101)} F6000        ; move to random generated point in X
G1 Y{100+random(101)} F6000        ; move to randome generated point in Y
G1 Z{10+random(7)} F600            ; move to randome generated point in Y
M400                               ; wait for moves to finish
G60 S2                             ; store the X Y position to slot 2 to reacall later
echo "Start Loop" 
while iterations <= 5              ; perform 5 passes 
  M401                             ; deploy probe
  echo iterations                  ; echo the pass number
  echo "Moves"                     ; echo the start of Moves
  G90                              ; set absolute mode
  G1 R2 X0 Y0 F6000                ; Move X Y to 0,0 relative to stored position 2 
  G1 Z{10+random(7)} F600          ; Move X Y to 0,0 from stored position 2 and Z to a random position between 10 & 16
  M400                             ; wait for moves to finish
  echo "" ^ state.time ^ iterations ^ "-X-" ^move.axes[0].machinePosition ^"-Y-" ^move.axes[1].machinePosition ^"-Z-" ^move.axes[2].machinePosition
                                   ; echo carraige position to the screen 
  M28 {"0:/macros/probe-results/" ^state.time ^iterations ^"-X-" ^move.axes[0].machinePosition ^"-Y-" ^move.axes[1].machinePosition ^"-Z-" ^move.axes[2].machinePosition}
                                   ; write out the postion data
  M400                             ; let moves finish
  M29                              ; Close file
  G30 S-1                          ; Execute Z Probe
  echo "" ^ state.time ^ iterations ^ "-X-Y-Z-Probe-" ^ move.axes[2].machinePosition  ^ "-Speed-" ^ sensors.probe[0].speed
                                                                                      ; Echo the probe result and iteration number to console
  M28 {"0:/macros/probe-results/" ^state.time ^iterations ^"-X-Y-Z-Probe-Speed-" ^move.axes[2].machinePosition "-Speed-" ^ sensor.probe[0].speed}
                                                                                      ; Create a file, named as the probe result and iteration number in the
                                                                                      ; 0:/macro/probe-results/ directory.  
  M29                                                                                    ; Close file
  G1 Z10                                                                                ; Move Z to 10mm height
  M402                             ; retract probe

echo "Macro Complete"
