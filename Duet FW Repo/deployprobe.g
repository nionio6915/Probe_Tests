; ***********************************************************
; deployprobe.g
; ***********************************************************
G91
M564 H0 S0          ; allow movement while not homed
G1 Z15 F6000        ; move Z 15 for clearance above dock.
                    ; need to figure out some safety check on this
G90 

if sensors.probes[0].value[0]!=1000    ; if sensor is value other than 1000 do this
  abort "deployprobe value0 Probe already picked up.  Manually return probe to the dock"
 
; if we're here we know it's becasue the above is true which I assume is because you have an N0 switch as a probe.

M400

G1 X0.0 Y2 F6000      ; move above probe dock location
G91
G1 Z-10
G90
M400                ; wait for moves to finish

while sensors.probes[0].value[0]=1000
  G91
  G1 Z-0.5 F600
  M400
  G90
  echo sensors.probes[0].value[0]
  echo iterations
  if iterations=100
     break

G91                 ; relative coords
G1 Z-1.5 F600       ; move bed up 1 to clear probe from dock since mags pull it up 
M400                ; wait for move to finish
G1 X50 F3000        ; move right so probe moves out of the dock
G1 Z5 F3000         ; move bed to clear probe from glass build surface 
G1 X100 F6000       ;
G90                 ; absolute coords
M400                ; wait for moves to finish
G4 S1               ; wait 1 second
M564 S1             ; limit axis to print area

if sensors.probes[0].value[0]!=0
   abort "deployprobe endvalue not 0 Probe not picked up!  Print cancelled."