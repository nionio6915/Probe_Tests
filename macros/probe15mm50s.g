; Probe repeatability testing
; Directory "0:/macros/probe-results/" must exist to save results
; Upon completion, download zip file of the results directory, make a file listing of the directory in the form of a text file, save that file
; as a .csv file, import into spreadsheet - setting "-" as the deliminator.
; dir /b > results.csv

 
M401 P0                                                                                   ; This runs macro file deployprobe
; G32                                                                                       ; Home and level
G1 Z15                                                                                    ; Move Z to 15mm height
G1 X146 Y163 F6000                                                                        ; Move to center of bed
;                    https://duet3d.dozuki.com/Wiki/Gcode#Section_G30_Single_Z_Probe
G30                ; Probe the bed at the current XY position. When the probe is triggered, set the Z coordinate to the probe trigger height.
; 
; G30 S-1 ; Probe the bed at the current XY position. When the probe is triggered, do not adjust the Z coordinate,
; just report the machine height at which the probe was triggered.


M558 F50 A1                                                                               ; Set probing speed
while iterations <=49                                                                     ; Perform 50 passes
  G30 Z-99999 S-1                                                                         ; Execute Z Probe
  echo "" ^ move.axes[2].machinePosition ^ ",F50," ^ iterations                           ; Echo the probe result and iteration number to console
  M28 {"0:/macros/probe-results/"^ move.axes[2].machinePosition ^"-F50-"^iterations}      ; Create a file, named as the probe result and iteration number in the
                                                                                          ; 0:/macro/probe-results/ directory.  
  M29                                                                                     ; Close file
  G1 Z15                                                                                  ; Move Z to 15mm height
  M400                                                                                    ; Wait for current moves to finish
M402 P0                                         ; This runs macro file deployprobe