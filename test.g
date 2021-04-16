echo "Homing X Y"
G28 X Y
M400
echo "Homing Z"
G28 Z
M400 
echo "Start Loop" 
while iterations <3
  echo iterations
  M401 P0
  M400
  echo "Moves"
  G1 X(150+((7*(floor(10*(sin(sqrt(sensors.analog[0].lastReading * state.upTime))))))))
  G1 Y(150+((5*(floor(10*(cos(sqrt(sensors.analog[0].lastReading * state.upTime))))))))
  G1 Z(12+abs(7*(floor(10*(sin(sqrt(sensors.analog[0].lastReading * state.upTime)))))))
  M400
  ;
  echo "" ^ iterations ^"X=" ^move.axes[0].machinePosition ^"Y=" ^move.axes[1].machinePosition ^"Z=" ^move.axes[2].machinePosition
  M28 {"0:/macros/probe-results/" ^ iterations ^"-X=" ^move.axes[0].machinePosition ^"-Y=" ^move.axes[1].machinePosition ^"-Z=" ^move.axes[2].machinePosition}
  M402 P0
  M400