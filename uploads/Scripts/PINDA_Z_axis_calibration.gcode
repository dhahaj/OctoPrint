; G-Code script for manual Z axis calibration
;M1 Mesh Bed status & stored data
;G81 ?            ; Print status & stored mesh data
;G4 S10           ; 10 second pause
M117 Starting Manual Z-Axis PINDA calibration
G4 S5               ; 5 second pause
G0 Z60             ; raise Z to not heat PINDA before bed is warm

;M104 S215       ; set extruder temp
M117 Bed Heating...
M140 S62         ; set bed temp
M190 S62         ; wait for bed temp
;M109 S215       ; wait for extruder temp

M117 Moving to heating position
G0 X50 Y50 Z0.15 ; this is a good PINDA heating position
G4 S4
M117 PINDA heating to 35C
M860 S38         ; the new code - wait until PINDA is >= 35C

M117 Performing Auto Home
G28 W            ; home all without mesh bed level
G4 S2

M117 Performing Mesh Bed Leveling
G4 S5           ; 10 second pause
G80              ; mesh bed leveling