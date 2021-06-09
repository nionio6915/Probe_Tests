; ***********************************************************
; deployprobe.g
; ***********************************************************
; echo "Running deployprobe.g"
G91
M564 H0 S0          ; allow movement while not homed
G1 Z15 F6000        ; move Z 15 for clearance above dock.
                    ; need to figure out some safety check on this
G90 
; echo sensors.probes[0].value[0]
if sensors.probes[0].value[0]!=1000    ; if sensor is value other than 1000 do this
  abort "deployprobe start value Probe already picked up.  Manually return probe to the dock"
  echo sensors.probes[0].value[0]
; if we're here we know it's becasue the above is true which I assume is because you have an NC switch as a probe.
; echo "Pass first logic test"
G1 X0.0 Y4 F6000      ; move above probe dock location
G91
G1 Z-10
G90
M400                ; wait for moves to finish
; echo "Probe Pickup while loop running"
while sensors.probes[0].value[0]=1000
  G91
  G1 Z-0.5 F600
  M400
  G90
  ; echo sensors.probes[0].value[0]
  ; echo iterations
  if iterations=100
     break

; echo "Probe Pickup while loop complete"
G91                 ; relative coords
G1 Z-0.25 F600       ; move bed up 1.5 to clear probe from dock since mags pull it up 
M400                ; wait for move to finish
G1 X50 F3000        ; move right so probe moves out of the dock
G1 Z6.5 F3000         ; move bed to clear probe from glass build surface 
G1 X100 F6000       ;
G90                 ; absolute coords
M400                ; wait for moves to finish
G4 S2               ; wait 1 second
M400

if sensors.probes[0].value[0]!=0
   abort "deployprobe endvalue not 0 Probe not picked up!  Print cancelled."

; echo "deployprobe.g complete"