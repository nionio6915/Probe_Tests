; Probe repeatability testing
; Directory "0:/macros/probe-results/" must exist to save results
; Upon completion, download zip file of the results directory, make a file listing of the directory in the form of a text file, save that file
; as a .csv file, import into spreadsheet - setting "-" as the deliminator.
 
M401 P0
G1 Z5                                                                                     ; Move Z to 5mm height
G1 X148 Y163 Z15 F6000                                                                    ; Move to center of bed
G30 
while iterations <5 
  M558 F(20+10*iterations) A1                                                                    ; Set probing speed
  G30 Z-99999 S-1                                                                        ; Execute Z Probe
  echo "" ^ move.axes[2].machinePosition ^ "-F10x" ^ iterations ^ "-1"  
  ; Echo the probe result and iteration number to console
  M28 {"0:/macros/probe-results/"^ move.axes[2].machinePosition ^"-F10x" ^iterations ^"-1" }      
  ; Create a file, named as the probe result and iteration number in the
  ; 0:/macro/probe-results/ directory.
  M29      ; Close file
  G1 Z15 F1200                                                                                  ; Move Z to 15mm height
  M400
  ;
  G30 Z-99999 S-1
  echo "" ^ move.axes[2].machinePosition ^ "-F10x" ^ iterations ^ "-2"  
  M28 {"0:/macros/probe-results/"^ move.axes[2].machinePosition ^"-F10x" ^iterations ^"-2" }
  M29      ; Close file
  G1 Z15 F1200                                                                                  ; Move Z to 15mm height
  M400
  ;
  G30 Z-99999 S-1
  echo "" ^ move.axes[2].machinePosition ^ "-F10x" ^ iterations ^ "-3"  
  M28 {"0:/macros/probe-results/"^ move.axes[2].machinePosition ^"-F10x" ^iterations ^"-3" }
  M29      ; Close file
  G1 Z15 F1200                                                                                  ; Move Z to 15mm height
  M400
  ;
  G30 Z-99999 S-1
  echo "" ^ move.axes[2].machinePosition ^ "-F10x" ^ iterations ^ "-4"  
  M28 {"0:/macros/probe-results/"^ move.axes[2].machinePosition ^"-F10x" ^iterations ^"-4" }
  M29      ; Close file
  G1 Z15 F1200                                                                                  ; Move Z to 15mm height
  M400
  ;
  G30 Z-99999 S-1
  echo "" ^ move.axes[2].machinePosition ^ "-F10x" ^ iterations ^ "-5"  
  M28 {"0:/macros/probe-results/"^ move.axes[2].machinePosition ^"-F10x" ^iterations ^"-5" }
  M29      ; Close file
  G1 Z15 F1200                                                                                  ; Move Z to 15mm height
  M400
  ;
M402 P0 