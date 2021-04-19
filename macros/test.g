G90
echo "Homing X Y"
; M98 P"0:/sys/homexy.g" 
M400
echo "Homing Z"
; M98 P"0:/sys/homez.g" 
; M28 {"0:/macros/probe-results/results.g"}
var XPos = {50+random(100)}		; establish arbitrary X position between 50 & 149
var Ypos = {50+random(100)}		; establish arbitraty Y position between 50 & 149
echo state.time
echo "Start Loop" 
while iterations <= 5   			; perform 5 passes 
	echo iterations				      ; echo the pass number
	echo "Moves"	    			    ; echo the start of Moves
	G90					            		; set absolute mode
	M401 P0					          	; deploy probe
	G1 XXPos F6000	
	G1 YYPos F6000             	; Move Y to a random position between 50 & 149
	G1 Z{10+random(7)} F600	  	; Move Z to a random position between 10 & 16
  M558 F{5+random(51)} A1	    ; establish random probe speed betweem 5 - 55 
	M400						            ; wait for moves to finish
	echo "" ^ state.time ^ iterations ^ "-X-" ^move.axes[0].machinePosition ^"-Y-" ^move.axes[1].machinePosition ^"-Z-" ^move.axes[2].machinePosition ^ "-Speed-" ^ sensor.probe[0].speed
	; echo carraige position to the screen 
 	M28 {"0:/macros/probe-results/" ^state.time ^iterations ^"-X-" ^move.axes[0].machinePosition ^"-Y-" ^move.axes[1].machinePosition ^"-Z-" ^move.axes[2].machinePosition ^ "-Speed-" ^sensor.probe[0].speed}
                            	; write out the postion data
	M400          					  	; let moves finish
	M29						            	; Close file
	G30 S-1											; Execute Z Probe
	echo "" ^ iterations ^" -X-Y-Z-Probe-" ^ move.axes[2].machinePosition              	; Echo the probe result and iteration number to console
	M28 {"0:/macros/probe-results/" ^state.time ^iterations ^"-X-Y-Z-Probe-Speed-" ^move.axes[2].machinePosition "-Speed-" ^ sensor.probe[0].speed}
																					                                          	; Create a file, named as the probe result and iteration number in the
                                                                                     	; 0:/macro/probe-results/ directory.  
	M29                                                                                	; Close file
	G1 Z10                                                                              ; Move Z to 10mm height
	M402 P0						; retract probe
  G1 X{50+random(100)} F6000  ; establish arbitrary X position between 50 & 149
  G1 Y{50+random(100)} F6000 	; establish arbitrary Y position between 50 & 149

echo "Macro Complete"