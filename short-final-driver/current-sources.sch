EESchema Schematic File Version 4
LIBS:short-final-wiring-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 10
Title "Current sources"
Date "2019-12-21"
Rev "A"
Comp "Iskender Kushan (iskender.ee)"
Comment1 "Short final"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 850  6800 0    79   ~ 0
LM334 current setting\nI = 68 mV / Rset at 25C.\n\nFor 240 Ohm, Iset = 0.28mA
Text Notes 9000 3950 0    79   ~ 16
Taxiway\n#4
Text Notes 7850 3950 0    79   ~ 16
Taxiway\n#3
Text Notes 6800 3950 0    79   ~ 16
Taxiway\n#2
Text Notes 5800 3950 0    79   ~ 16
Taxiway\n#1
Text Notes 4700 3950 0    79   ~ 16
Runway\ncenterline
Text Notes 3600 3950 0    79   ~ 16
Taxiway exit\n#5
Text Notes 2500 3950 0    79   ~ 16
Taxiway exit\n#4
Text Notes 1200 3950 0    79   ~ 16
Taxiway exit\n#3
Text Notes 8900 900  0    79   ~ 16
Taxiway exit\n#2
Text Notes 7800 900  0    79   ~ 16
Taxiway exit\n#1
Text Notes 6400 3400 0    50   ~ 0
Note! In assembly, cathode and anode\nwere swapped for the decision bar.\nThe LED board schematic shows TP75 \nas anode.
Text Notes 6750 750  0    79   ~ 16
Decision bar
Text Notes 5700 750  0    79   ~ 16
Runway back
Text Notes 4650 900  0    79   ~ 16
Runway front\n#2
Text Notes 3600 900  0    79   ~ 16
Runway front\n#1
Text Notes 2550 900  0    79   ~ 16
Runway edge\nright
Text Notes 1150 900  0    79   ~ 16
Runway edge\nleft
Wire Wire Line
	9100 4950 9100 5150
Wire Wire Line
	9100 4450 9100 4550
$Comp
L Connector:TestPoint TP?
U 1 1 5E0354BC
P 9100 4550
AR Path="/5E0354BC" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E0354BC" Ref="TP91"  Part="1" 
F 0 "TP91" V 9054 4738 50  0000 L CNN
F 1 "TestPoint" V 9145 4738 50  0000 L CNN
F 2 "" H 9300 4550 50  0001 C CNN
F 3 "~" H 9300 4550 50  0001 C CNN
	1    9100 4550
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E0354B6
P 9100 4950
AR Path="/5E0354B6" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E0354B6" Ref="TP166"  Part="1" 
F 0 "TP166" V 9054 5138 50  0000 L CNN
F 1 "TestPoint" V 9145 5138 50  0000 L CNN
F 2 "" H 9300 4950 50  0001 C CNN
F 3 "~" H 9300 4950 50  0001 C CNN
	1    9100 4950
	0    1    1    0   
$EndComp
$Comp
L power:+28V #PWR?
U 1 1 5E0354B0
P 9100 4450
AR Path="/5E0354B0" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E0354B0" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 9100 4300 50  0001 C CNN
F 1 "+28V" H 9115 4623 50  0000 C CNN
F 2 "" H 9350 4500 50  0001 C CNN
F 3 "" H 9350 4500 50  0001 C CNN
	1    9100 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0354AA
P 9100 5850
AR Path="/5E0354AA" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E0354AA" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H 9100 5600 50  0001 C CNN
F 1 "GND" H 9105 5677 50  0000 C CNN
F 2 "" H 9100 5850 50  0001 C CNN
F 3 "" H 9100 5850 50  0001 C CNN
	1    9100 5850
	1    0    0    -1  
$EndComp
Connection ~ 9100 5700
Wire Wire Line
	9100 5700 9100 5850
Wire Wire Line
	9350 5700 9350 5600
Wire Wire Line
	9100 5700 9350 5700
Wire Wire Line
	9100 5550 9100 5700
Wire Wire Line
	9350 5350 9350 5400
Wire Wire Line
	9300 5350 9350 5350
$Comp
L Device:R_Small_US R?
U 1 1 5E03549D
P 9350 5500
AR Path="/5E03549D" Ref="R?"  Part="1" 
AR Path="/5DFFBBF9/5E03549D" Ref="R16"  Part="1" 
F 0 "R16" H 9418 5546 50  0000 L CNN
F 1 "1.5k" H 9418 5455 50  0000 L CNN
F 2 "" H 9350 5500 50  0001 C CNN
F 3 "~" H 9350 5500 50  0001 C CNN
	1    9350 5500
	1    0    0    -1  
$EndComp
$Comp
L Reference_Current:LM334M U?
U 1 1 5E035497
P 9100 5350
AR Path="/5E035497" Ref="U?"  Part="1" 
AR Path="/5DFFBBF9/5E035497" Ref="U17"  Part="1" 
F 0 "U17" H 8980 5396 50  0000 R CNN
F 1 "LM334M" H 8980 5305 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 9125 5200 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 9100 5350 50  0001 C CIN
	1    9100 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 5000 8050 5200
Wire Wire Line
	8050 4500 8050 4600
$Comp
L Connector:TestPoint TP?
U 1 1 5E02FEE0
P 8050 4600
AR Path="/5E02FEE0" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E02FEE0" Ref="TP90"  Part="1" 
F 0 "TP90" V 8004 4788 50  0000 L CNN
F 1 "TestPoint" V 8095 4788 50  0000 L CNN
F 2 "" H 8250 4600 50  0001 C CNN
F 3 "~" H 8250 4600 50  0001 C CNN
	1    8050 4600
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E02FEDA
P 8050 5000
AR Path="/5E02FEDA" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E02FEDA" Ref="TP87"  Part="1" 
F 0 "TP87" V 8004 5188 50  0000 L CNN
F 1 "TestPoint" V 8095 5188 50  0000 L CNN
F 2 "" H 8250 5000 50  0001 C CNN
F 3 "~" H 8250 5000 50  0001 C CNN
	1    8050 5000
	0    1    1    0   
$EndComp
$Comp
L power:+28V #PWR?
U 1 1 5E02FED4
P 8050 4500
AR Path="/5E02FED4" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E02FED4" Ref="#PWR030"  Part="1" 
F 0 "#PWR030" H 8050 4350 50  0001 C CNN
F 1 "+28V" H 8065 4673 50  0000 C CNN
F 2 "" H 8300 4550 50  0001 C CNN
F 3 "" H 8300 4550 50  0001 C CNN
	1    8050 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E02FECE
P 8050 5900
AR Path="/5E02FECE" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E02FECE" Ref="#PWR031"  Part="1" 
F 0 "#PWR031" H 8050 5650 50  0001 C CNN
F 1 "GND" H 8055 5727 50  0000 C CNN
F 2 "" H 8050 5900 50  0001 C CNN
F 3 "" H 8050 5900 50  0001 C CNN
	1    8050 5900
	1    0    0    -1  
$EndComp
Connection ~ 8050 5750
Wire Wire Line
	8050 5750 8050 5900
Wire Wire Line
	8300 5750 8300 5650
Wire Wire Line
	8050 5750 8300 5750
Wire Wire Line
	8050 5600 8050 5750
Wire Wire Line
	8300 5400 8300 5450
Wire Wire Line
	8250 5400 8300 5400
$Comp
L Device:R_Small_US R?
U 1 1 5E02FEC1
P 8300 5550
AR Path="/5E02FEC1" Ref="R?"  Part="1" 
AR Path="/5DFFBBF9/5E02FEC1" Ref="R14"  Part="1" 
F 0 "R14" H 8368 5596 50  0000 L CNN
F 1 "1.5k" H 8368 5505 50  0000 L CNN
F 2 "" H 8300 5550 50  0001 C CNN
F 3 "~" H 8300 5550 50  0001 C CNN
	1    8300 5550
	1    0    0    -1  
$EndComp
$Comp
L Reference_Current:LM334M U?
U 1 1 5E02FEBB
P 8050 5400
AR Path="/5E02FEBB" Ref="U?"  Part="1" 
AR Path="/5DFFBBF9/5E02FEBB" Ref="U15"  Part="1" 
F 0 "U15" H 7930 5446 50  0000 R CNN
F 1 "LM334M" H 7930 5355 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 8075 5250 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 8050 5400 50  0001 C CIN
	1    8050 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 5000 6950 5200
Wire Wire Line
	6950 4500 6950 4600
$Comp
L Connector:TestPoint TP?
U 1 1 5E02BA1F
P 6950 4600
AR Path="/5E02BA1F" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E02BA1F" Ref="TP89"  Part="1" 
F 0 "TP89" V 6904 4788 50  0000 L CNN
F 1 "TestPoint" V 6995 4788 50  0000 L CNN
F 2 "" H 7150 4600 50  0001 C CNN
F 3 "~" H 7150 4600 50  0001 C CNN
	1    6950 4600
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E02BA19
P 6950 5000
AR Path="/5E02BA19" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E02BA19" Ref="TP176"  Part="1" 
F 0 "TP176" V 6904 5188 50  0000 L CNN
F 1 "TestPoint" V 6995 5188 50  0000 L CNN
F 2 "" H 7150 5000 50  0001 C CNN
F 3 "~" H 7150 5000 50  0001 C CNN
	1    6950 5000
	0    1    1    0   
$EndComp
$Comp
L power:+28V #PWR?
U 1 1 5E02BA13
P 6950 4500
AR Path="/5E02BA13" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E02BA13" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 6950 4350 50  0001 C CNN
F 1 "+28V" H 6965 4673 50  0000 C CNN
F 2 "" H 7200 4550 50  0001 C CNN
F 3 "" H 7200 4550 50  0001 C CNN
	1    6950 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E02BA0D
P 6950 5900
AR Path="/5E02BA0D" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E02BA0D" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 6950 5650 50  0001 C CNN
F 1 "GND" H 6955 5727 50  0000 C CNN
F 2 "" H 6950 5900 50  0001 C CNN
F 3 "" H 6950 5900 50  0001 C CNN
	1    6950 5900
	1    0    0    -1  
$EndComp
Connection ~ 6950 5750
Wire Wire Line
	6950 5750 6950 5900
Wire Wire Line
	7200 5750 7200 5650
Wire Wire Line
	6950 5750 7200 5750
Wire Wire Line
	6950 5600 6950 5750
Wire Wire Line
	7200 5400 7200 5450
Wire Wire Line
	7150 5400 7200 5400
$Comp
L Device:R_Small_US R?
U 1 1 5E02BA00
P 7200 5550
AR Path="/5E02BA00" Ref="R?"  Part="1" 
AR Path="/5DFFBBF9/5E02BA00" Ref="R12"  Part="1" 
F 0 "R12" H 7268 5596 50  0000 L CNN
F 1 "1.5k" H 7268 5505 50  0000 L CNN
F 2 "" H 7200 5550 50  0001 C CNN
F 3 "~" H 7200 5550 50  0001 C CNN
	1    7200 5550
	1    0    0    -1  
$EndComp
$Comp
L Reference_Current:LM334M U?
U 1 1 5E02B9FA
P 6950 5400
AR Path="/5E02B9FA" Ref="U?"  Part="1" 
AR Path="/5DFFBBF9/5E02B9FA" Ref="U13"  Part="1" 
F 0 "U13" H 6830 5446 50  0000 R CNN
F 1 "LM334M" H 6830 5355 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6975 5250 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 6950 5400 50  0001 C CIN
	1    6950 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 4950 5950 5150
Wire Wire Line
	5950 4450 5950 4550
$Comp
L Connector:TestPoint TP?
U 1 1 5E0275EC
P 5950 4550
AR Path="/5E0275EC" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E0275EC" Ref="TP85"  Part="1" 
F 0 "TP85" V 5904 4738 50  0000 L CNN
F 1 "TestPoint" V 5995 4738 50  0000 L CNN
F 2 "" H 6150 4550 50  0001 C CNN
F 3 "~" H 6150 4550 50  0001 C CNN
	1    5950 4550
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E0275E6
P 5950 4950
AR Path="/5E0275E6" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E0275E6" Ref="TP86"  Part="1" 
F 0 "TP86" V 5904 5138 50  0000 L CNN
F 1 "TestPoint" V 5995 5138 50  0000 L CNN
F 2 "" H 6150 4950 50  0001 C CNN
F 3 "~" H 6150 4950 50  0001 C CNN
	1    5950 4950
	0    1    1    0   
$EndComp
$Comp
L power:+28V #PWR?
U 1 1 5E0275E0
P 5950 4450
AR Path="/5E0275E0" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E0275E0" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 5950 4300 50  0001 C CNN
F 1 "+28V" H 5965 4623 50  0000 C CNN
F 2 "" H 6200 4500 50  0001 C CNN
F 3 "" H 6200 4500 50  0001 C CNN
	1    5950 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0275DA
P 5950 5850
AR Path="/5E0275DA" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E0275DA" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 5950 5600 50  0001 C CNN
F 1 "GND" H 5955 5677 50  0000 C CNN
F 2 "" H 5950 5850 50  0001 C CNN
F 3 "" H 5950 5850 50  0001 C CNN
	1    5950 5850
	1    0    0    -1  
$EndComp
Connection ~ 5950 5700
Wire Wire Line
	5950 5700 5950 5850
Wire Wire Line
	6200 5700 6200 5600
Wire Wire Line
	5950 5700 6200 5700
Wire Wire Line
	5950 5550 5950 5700
Wire Wire Line
	6200 5350 6200 5400
Wire Wire Line
	6150 5350 6200 5350
$Comp
L Device:R_Small_US R?
U 1 1 5E0275CD
P 6200 5500
AR Path="/5E0275CD" Ref="R?"  Part="1" 
AR Path="/5DFFBBF9/5E0275CD" Ref="R10"  Part="1" 
F 0 "R10" H 6268 5546 50  0000 L CNN
F 1 "1.5k" H 6268 5455 50  0000 L CNN
F 2 "" H 6200 5500 50  0001 C CNN
F 3 "~" H 6200 5500 50  0001 C CNN
	1    6200 5500
	1    0    0    -1  
$EndComp
$Comp
L Reference_Current:LM334M U?
U 1 1 5E0275C7
P 5950 5350
AR Path="/5E0275C7" Ref="U?"  Part="1" 
AR Path="/5DFFBBF9/5E0275C7" Ref="U11"  Part="1" 
F 0 "U11" H 5830 5396 50  0000 R CNN
F 1 "LM334M" H 5830 5305 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 5975 5200 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 5950 5350 50  0001 C CIN
	1    5950 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 4900 4900 5100
Wire Wire Line
	4900 4400 4900 4500
$Comp
L Connector:TestPoint TP?
U 1 1 5E021987
P 4900 4500
AR Path="/5E021987" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E021987" Ref="TP73"  Part="1" 
F 0 "TP73" V 4854 4688 50  0000 L CNN
F 1 "TestPoint" V 4945 4688 50  0000 L CNN
F 2 "" H 5100 4500 50  0001 C CNN
F 3 "~" H 5100 4500 50  0001 C CNN
	1    4900 4500
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E021981
P 4900 4900
AR Path="/5E021981" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E021981" Ref="TP72"  Part="1" 
F 0 "TP72" V 4854 5088 50  0000 L CNN
F 1 "TestPoint" V 4945 5088 50  0000 L CNN
F 2 "" H 5100 4900 50  0001 C CNN
F 3 "~" H 5100 4900 50  0001 C CNN
	1    4900 4900
	0    1    1    0   
$EndComp
$Comp
L power:+28V #PWR?
U 1 1 5E02197B
P 4900 4400
AR Path="/5E02197B" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E02197B" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 4900 4250 50  0001 C CNN
F 1 "+28V" H 4915 4573 50  0000 C CNN
F 2 "" H 5150 4450 50  0001 C CNN
F 3 "" H 5150 4450 50  0001 C CNN
	1    4900 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E021975
P 4900 5800
AR Path="/5E021975" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E021975" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 4900 5550 50  0001 C CNN
F 1 "GND" H 4905 5627 50  0000 C CNN
F 2 "" H 4900 5800 50  0001 C CNN
F 3 "" H 4900 5800 50  0001 C CNN
	1    4900 5800
	1    0    0    -1  
$EndComp
Connection ~ 4900 5650
Wire Wire Line
	4900 5650 4900 5800
Wire Wire Line
	5150 5650 5150 5550
Wire Wire Line
	4900 5650 5150 5650
Wire Wire Line
	4900 5500 4900 5650
Wire Wire Line
	5150 5300 5150 5350
Wire Wire Line
	5100 5300 5150 5300
$Comp
L Device:R_Small_US R?
U 1 1 5E021968
P 5150 5450
AR Path="/5E021968" Ref="R?"  Part="1" 
AR Path="/5DFFBBF9/5E021968" Ref="R8"  Part="1" 
F 0 "R8" H 5218 5496 50  0000 L CNN
F 1 "750" H 5218 5405 50  0000 L CNN
F 2 "" H 5150 5450 50  0001 C CNN
F 3 "~" H 5150 5450 50  0001 C CNN
	1    5150 5450
	1    0    0    -1  
$EndComp
$Comp
L Reference_Current:LM334M U?
U 1 1 5E021962
P 4900 5300
AR Path="/5E021962" Ref="U?"  Part="1" 
AR Path="/5DFFBBF9/5E021962" Ref="U9"  Part="1" 
F 0 "U9" H 4780 5346 50  0000 R CNN
F 1 "LM334M" H 4780 5255 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4925 5150 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 4900 5300 50  0001 C CIN
	1    4900 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 4900 3800 5100
Wire Wire Line
	3800 4400 3800 4500
$Comp
L Connector:TestPoint TP?
U 1 1 5E01E565
P 3800 4500
AR Path="/5E01E565" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E01E565" Ref="TP96"  Part="1" 
F 0 "TP96" V 3754 4688 50  0000 L CNN
F 1 "TestPoint" V 3845 4688 50  0000 L CNN
F 2 "" H 4000 4500 50  0001 C CNN
F 3 "~" H 4000 4500 50  0001 C CNN
	1    3800 4500
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E01E55F
P 3800 4900
AR Path="/5E01E55F" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E01E55F" Ref="TP164"  Part="1" 
F 0 "TP164" V 3754 5088 50  0000 L CNN
F 1 "TestPoint" V 3845 5088 50  0000 L CNN
F 2 "" H 4000 4900 50  0001 C CNN
F 3 "~" H 4000 4900 50  0001 C CNN
	1    3800 4900
	0    1    1    0   
$EndComp
$Comp
L power:+28V #PWR?
U 1 1 5E01E559
P 3800 4400
AR Path="/5E01E559" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E01E559" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 3800 4250 50  0001 C CNN
F 1 "+28V" H 3815 4573 50  0000 C CNN
F 2 "" H 4050 4450 50  0001 C CNN
F 3 "" H 4050 4450 50  0001 C CNN
	1    3800 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E01E553
P 3800 5800
AR Path="/5E01E553" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E01E553" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 3800 5550 50  0001 C CNN
F 1 "GND" H 3805 5627 50  0000 C CNN
F 2 "" H 3800 5800 50  0001 C CNN
F 3 "" H 3800 5800 50  0001 C CNN
	1    3800 5800
	1    0    0    -1  
$EndComp
Connection ~ 3800 5650
Wire Wire Line
	3800 5650 3800 5800
Wire Wire Line
	4050 5650 4050 5550
Wire Wire Line
	3800 5650 4050 5650
Wire Wire Line
	3800 5500 3800 5650
Wire Wire Line
	4050 5300 4050 5350
Wire Wire Line
	4000 5300 4050 5300
$Comp
L Device:R_Small_US R?
U 1 1 5E01E546
P 4050 5450
AR Path="/5E01E546" Ref="R?"  Part="1" 
AR Path="/5DFFBBF9/5E01E546" Ref="R6"  Part="1" 
F 0 "R6" H 4118 5496 50  0000 L CNN
F 1 "1.5k" H 4118 5405 50  0000 L CNN
F 2 "" H 4050 5450 50  0001 C CNN
F 3 "~" H 4050 5450 50  0001 C CNN
	1    4050 5450
	1    0    0    -1  
$EndComp
$Comp
L Reference_Current:LM334M U?
U 1 1 5E01E540
P 3800 5300
AR Path="/5E01E540" Ref="U?"  Part="1" 
AR Path="/5DFFBBF9/5E01E540" Ref="U7"  Part="1" 
F 0 "U7" H 3680 5346 50  0000 R CNN
F 1 "LM334M" H 3680 5255 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3825 5150 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 3800 5300 50  0001 C CIN
	1    3800 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 4900 2750 5100
Wire Wire Line
	2750 4400 2750 4500
$Comp
L Connector:TestPoint TP?
U 1 1 5E01A18A
P 2750 4500
AR Path="/5E01A18A" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E01A18A" Ref="TP95"  Part="1" 
F 0 "TP95" V 2704 4688 50  0000 L CNN
F 1 "TestPoint" V 2795 4688 50  0000 L CNN
F 2 "" H 2950 4500 50  0001 C CNN
F 3 "~" H 2950 4500 50  0001 C CNN
	1    2750 4500
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E01A184
P 2750 4900
AR Path="/5E01A184" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E01A184" Ref="TP154"  Part="1" 
F 0 "TP154" V 2704 5088 50  0000 L CNN
F 1 "TestPoint" V 2795 5088 50  0000 L CNN
F 2 "" H 2950 4900 50  0001 C CNN
F 3 "~" H 2950 4900 50  0001 C CNN
	1    2750 4900
	0    1    1    0   
$EndComp
$Comp
L power:+28V #PWR?
U 1 1 5E01A17E
P 2750 4400
AR Path="/5E01A17E" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E01A17E" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 2750 4250 50  0001 C CNN
F 1 "+28V" H 2765 4573 50  0000 C CNN
F 2 "" H 3000 4450 50  0001 C CNN
F 3 "" H 3000 4450 50  0001 C CNN
	1    2750 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E01A178
P 2750 5800
AR Path="/5E01A178" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E01A178" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 2750 5550 50  0001 C CNN
F 1 "GND" H 2755 5627 50  0000 C CNN
F 2 "" H 2750 5800 50  0001 C CNN
F 3 "" H 2750 5800 50  0001 C CNN
	1    2750 5800
	1    0    0    -1  
$EndComp
Connection ~ 2750 5650
Wire Wire Line
	2750 5650 2750 5800
Wire Wire Line
	3000 5650 3000 5550
Wire Wire Line
	2750 5650 3000 5650
Wire Wire Line
	2750 5500 2750 5650
Wire Wire Line
	3000 5300 3000 5350
Wire Wire Line
	2950 5300 3000 5300
$Comp
L Device:R_Small_US R?
U 1 1 5E01A16B
P 3000 5450
AR Path="/5E01A16B" Ref="R?"  Part="1" 
AR Path="/5DFFBBF9/5E01A16B" Ref="R4"  Part="1" 
F 0 "R4" H 3068 5496 50  0000 L CNN
F 1 "1.5k" H 3068 5405 50  0000 L CNN
F 2 "" H 3000 5450 50  0001 C CNN
F 3 "~" H 3000 5450 50  0001 C CNN
	1    3000 5450
	1    0    0    -1  
$EndComp
$Comp
L Reference_Current:LM334M U?
U 1 1 5E01A165
P 2750 5300
AR Path="/5E01A165" Ref="U?"  Part="1" 
AR Path="/5DFFBBF9/5E01A165" Ref="U5"  Part="1" 
F 0 "U5" H 2630 5346 50  0000 R CNN
F 1 "LM334M" H 2630 5255 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2775 5150 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 2750 5300 50  0001 C CIN
	1    2750 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 4850 1500 5050
Wire Wire Line
	1500 4350 1500 4450
$Comp
L Connector:TestPoint TP?
U 1 1 5E01717E
P 1500 4450
AR Path="/5E01717E" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E01717E" Ref="TP94"  Part="1" 
F 0 "TP94" V 1454 4638 50  0000 L CNN
F 1 "TestPoint" V 1545 4638 50  0000 L CNN
F 2 "" H 1700 4450 50  0001 C CNN
F 3 "~" H 1700 4450 50  0001 C CNN
	1    1500 4450
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E017178
P 1500 4850
AR Path="/5E017178" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E017178" Ref="TP144"  Part="1" 
F 0 "TP144" V 1454 5038 50  0000 L CNN
F 1 "TestPoint" V 1545 5038 50  0000 L CNN
F 2 "" H 1700 4850 50  0001 C CNN
F 3 "~" H 1700 4850 50  0001 C CNN
	1    1500 4850
	0    1    1    0   
$EndComp
$Comp
L power:+28V #PWR?
U 1 1 5E017172
P 1500 4350
AR Path="/5E017172" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E017172" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 1500 4200 50  0001 C CNN
F 1 "+28V" H 1515 4523 50  0000 C CNN
F 2 "" H 1750 4400 50  0001 C CNN
F 3 "" H 1750 4400 50  0001 C CNN
	1    1500 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E01716C
P 1500 5750
AR Path="/5E01716C" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E01716C" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 1500 5500 50  0001 C CNN
F 1 "GND" H 1505 5577 50  0000 C CNN
F 2 "" H 1500 5750 50  0001 C CNN
F 3 "" H 1500 5750 50  0001 C CNN
	1    1500 5750
	1    0    0    -1  
$EndComp
Connection ~ 1500 5600
Wire Wire Line
	1500 5600 1500 5750
Wire Wire Line
	1750 5600 1750 5500
Wire Wire Line
	1500 5600 1750 5600
Wire Wire Line
	1500 5450 1500 5600
Wire Wire Line
	1750 5250 1750 5300
Wire Wire Line
	1700 5250 1750 5250
$Comp
L Device:R_Small_US R?
U 1 1 5E01715F
P 1750 5400
AR Path="/5E01715F" Ref="R?"  Part="1" 
AR Path="/5DFFBBF9/5E01715F" Ref="R2"  Part="1" 
F 0 "R2" H 1818 5446 50  0000 L CNN
F 1 "1.5k" H 1818 5355 50  0000 L CNN
F 2 "" H 1750 5400 50  0001 C CNN
F 3 "~" H 1750 5400 50  0001 C CNN
	1    1750 5400
	1    0    0    -1  
$EndComp
$Comp
L Reference_Current:LM334M U?
U 1 1 5E017159
P 1500 5250
AR Path="/5E017159" Ref="U?"  Part="1" 
AR Path="/5DFFBBF9/5E017159" Ref="U3"  Part="1" 
F 0 "U3" H 1380 5296 50  0000 R CNN
F 1 "LM334M" H 1380 5205 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 1525 5100 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 1500 5250 50  0001 C CIN
	1    1500 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1800 9050 2000
Wire Wire Line
	9050 1300 9050 1400
$Comp
L Connector:TestPoint TP?
U 1 1 5E013329
P 9050 1400
AR Path="/5E013329" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E013329" Ref="TP92"  Part="1" 
F 0 "TP92" V 9004 1588 50  0000 L CNN
F 1 "TestPoint" V 9095 1588 50  0000 L CNN
F 2 "" H 9250 1400 50  0001 C CNN
F 3 "~" H 9250 1400 50  0001 C CNN
	1    9050 1400
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E013323
P 9050 1800
AR Path="/5E013323" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E013323" Ref="TP88"  Part="1" 
F 0 "TP88" V 9004 1988 50  0000 L CNN
F 1 "TestPoint" V 9095 1988 50  0000 L CNN
F 2 "" H 9250 1800 50  0001 C CNN
F 3 "~" H 9250 1800 50  0001 C CNN
	1    9050 1800
	0    1    1    0   
$EndComp
$Comp
L power:+28V #PWR?
U 1 1 5E01331D
P 9050 1300
AR Path="/5E01331D" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E01331D" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 9050 1150 50  0001 C CNN
F 1 "+28V" H 9065 1473 50  0000 C CNN
F 2 "" H 9300 1350 50  0001 C CNN
F 3 "" H 9300 1350 50  0001 C CNN
	1    9050 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E013317
P 9050 2700
AR Path="/5E013317" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E013317" Ref="#PWR033"  Part="1" 
F 0 "#PWR033" H 9050 2450 50  0001 C CNN
F 1 "GND" H 9055 2527 50  0000 C CNN
F 2 "" H 9050 2700 50  0001 C CNN
F 3 "" H 9050 2700 50  0001 C CNN
	1    9050 2700
	1    0    0    -1  
$EndComp
Connection ~ 9050 2550
Wire Wire Line
	9050 2550 9050 2700
Wire Wire Line
	9300 2550 9300 2450
Wire Wire Line
	9050 2550 9300 2550
Wire Wire Line
	9050 2400 9050 2550
Wire Wire Line
	9300 2200 9300 2250
Wire Wire Line
	9250 2200 9300 2200
$Comp
L Device:R_Small_US R?
U 1 1 5E01330A
P 9300 2350
AR Path="/5E01330A" Ref="R?"  Part="1" 
AR Path="/5DFFBBF9/5E01330A" Ref="R15"  Part="1" 
F 0 "R15" H 9368 2396 50  0000 L CNN
F 1 "1.5k" H 9368 2305 50  0000 L CNN
F 2 "" H 9300 2350 50  0001 C CNN
F 3 "~" H 9300 2350 50  0001 C CNN
	1    9300 2350
	1    0    0    -1  
$EndComp
$Comp
L Reference_Current:LM334M U?
U 1 1 5E013304
P 9050 2200
AR Path="/5E013304" Ref="U?"  Part="1" 
AR Path="/5DFFBBF9/5E013304" Ref="U16"  Part="1" 
F 0 "U16" H 8930 2246 50  0000 R CNN
F 1 "LM334M" H 8930 2155 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 9075 2050 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 9050 2200 50  0001 C CIN
	1    9050 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 1800 8000 2000
Wire Wire Line
	8000 1300 8000 1400
$Comp
L Connector:TestPoint TP?
U 1 1 5E01193E
P 8000 1400
AR Path="/5E01193E" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E01193E" Ref="TP93"  Part="1" 
F 0 "TP93" V 7954 1588 50  0000 L CNN
F 1 "TestPoint" V 8045 1588 50  0000 L CNN
F 2 "" H 8200 1400 50  0001 C CNN
F 3 "~" H 8200 1400 50  0001 C CNN
	1    8000 1400
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E011938
P 8000 1800
AR Path="/5E011938" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E011938" Ref="TP124"  Part="1" 
F 0 "TP124" V 7954 1988 50  0000 L CNN
F 1 "TestPoint" V 8045 1988 50  0000 L CNN
F 2 "" H 8200 1800 50  0001 C CNN
F 3 "~" H 8200 1800 50  0001 C CNN
	1    8000 1800
	0    1    1    0   
$EndComp
$Comp
L power:+28V #PWR?
U 1 1 5E011932
P 8000 1300
AR Path="/5E011932" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E011932" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 8000 1150 50  0001 C CNN
F 1 "+28V" H 8015 1473 50  0000 C CNN
F 2 "" H 8250 1350 50  0001 C CNN
F 3 "" H 8250 1350 50  0001 C CNN
	1    8000 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E01192C
P 8000 2700
AR Path="/5E01192C" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E01192C" Ref="#PWR029"  Part="1" 
F 0 "#PWR029" H 8000 2450 50  0001 C CNN
F 1 "GND" H 8005 2527 50  0000 C CNN
F 2 "" H 8000 2700 50  0001 C CNN
F 3 "" H 8000 2700 50  0001 C CNN
	1    8000 2700
	1    0    0    -1  
$EndComp
Connection ~ 8000 2550
Wire Wire Line
	8000 2550 8000 2700
Wire Wire Line
	8250 2550 8250 2450
Wire Wire Line
	8000 2550 8250 2550
Wire Wire Line
	8000 2400 8000 2550
Wire Wire Line
	8250 2200 8250 2250
Wire Wire Line
	8200 2200 8250 2200
$Comp
L Device:R_Small_US R?
U 1 1 5E01191F
P 8250 2350
AR Path="/5E01191F" Ref="R?"  Part="1" 
AR Path="/5DFFBBF9/5E01191F" Ref="R13"  Part="1" 
F 0 "R13" H 8318 2396 50  0000 L CNN
F 1 "1.5k" H 8318 2305 50  0000 L CNN
F 2 "" H 8250 2350 50  0001 C CNN
F 3 "~" H 8250 2350 50  0001 C CNN
	1    8250 2350
	1    0    0    -1  
$EndComp
$Comp
L Reference_Current:LM334M U?
U 1 1 5E011919
P 8000 2200
AR Path="/5E011919" Ref="U?"  Part="1" 
AR Path="/5DFFBBF9/5E011919" Ref="U14"  Part="1" 
F 0 "U14" H 7880 2246 50  0000 R CNN
F 1 "LM334M" H 7880 2155 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 8025 2050 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 8000 2200 50  0001 C CIN
	1    8000 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 1800 6950 2000
Wire Wire Line
	6950 1300 6950 1400
$Comp
L Connector:TestPoint TP?
U 1 1 5E00EDE1
P 6950 1400
AR Path="/5E00EDE1" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E00EDE1" Ref="TP74"  Part="1" 
F 0 "TP74" V 6904 1588 50  0000 L CNN
F 1 "TestPoint" V 6995 1588 50  0000 L CNN
F 2 "" H 7150 1400 50  0001 C CNN
F 3 "~" H 7150 1400 50  0001 C CNN
	1    6950 1400
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E00EDDB
P 6950 1800
AR Path="/5E00EDDB" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E00EDDB" Ref="TP75"  Part="1" 
F 0 "TP75" V 6904 1988 50  0000 L CNN
F 1 "TestPoint" V 6995 1988 50  0000 L CNN
F 2 "" H 7150 1800 50  0001 C CNN
F 3 "~" H 7150 1800 50  0001 C CNN
	1    6950 1800
	0    1    1    0   
$EndComp
$Comp
L power:+28V #PWR?
U 1 1 5E00EDD5
P 6950 1300
AR Path="/5E00EDD5" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E00EDD5" Ref="#PWR024"  Part="1" 
F 0 "#PWR024" H 6950 1150 50  0001 C CNN
F 1 "+28V" H 6965 1473 50  0000 C CNN
F 2 "" H 7200 1350 50  0001 C CNN
F 3 "" H 7200 1350 50  0001 C CNN
	1    6950 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E00EDCF
P 6950 2700
AR Path="/5E00EDCF" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E00EDCF" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 6950 2450 50  0001 C CNN
F 1 "GND" H 6955 2527 50  0000 C CNN
F 2 "" H 6950 2700 50  0001 C CNN
F 3 "" H 6950 2700 50  0001 C CNN
	1    6950 2700
	1    0    0    -1  
$EndComp
Connection ~ 6950 2550
Wire Wire Line
	6950 2550 6950 2700
Wire Wire Line
	7200 2550 7200 2450
Wire Wire Line
	6950 2550 7200 2550
Wire Wire Line
	6950 2400 6950 2550
Wire Wire Line
	7200 2200 7200 2250
Wire Wire Line
	7150 2200 7200 2200
$Comp
L Device:R_Small_US R?
U 1 1 5E00EDC2
P 7200 2350
AR Path="/5E00EDC2" Ref="R?"  Part="1" 
AR Path="/5DFFBBF9/5E00EDC2" Ref="R11"  Part="1" 
F 0 "R11" H 7268 2396 50  0000 L CNN
F 1 "240" H 7268 2305 50  0000 L CNN
F 2 "" H 7200 2350 50  0001 C CNN
F 3 "~" H 7200 2350 50  0001 C CNN
	1    7200 2350
	1    0    0    -1  
$EndComp
$Comp
L Reference_Current:LM334M U?
U 1 1 5E00EDBC
P 6950 2200
AR Path="/5E00EDBC" Ref="U?"  Part="1" 
AR Path="/5DFFBBF9/5E00EDBC" Ref="U12"  Part="1" 
F 0 "U12" H 6830 2246 50  0000 R CNN
F 1 "LM334M" H 6830 2155 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6975 2050 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 6950 2200 50  0001 C CIN
	1    6950 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 1850 5950 2050
Wire Wire Line
	5950 1350 5950 1450
$Comp
L Connector:TestPoint TP?
U 1 1 5E00CFD6
P 5950 1450
AR Path="/5E00CFD6" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E00CFD6" Ref="TP71"  Part="1" 
F 0 "TP71" V 5904 1638 50  0000 L CNN
F 1 "TestPoint" V 5995 1638 50  0000 L CNN
F 2 "" H 6150 1450 50  0001 C CNN
F 3 "~" H 6150 1450 50  0001 C CNN
	1    5950 1450
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E00CFD0
P 5950 1850
AR Path="/5E00CFD0" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E00CFD0" Ref="TP62"  Part="1" 
F 0 "TP62" V 5904 2038 50  0000 L CNN
F 1 "TestPoint" V 5995 2038 50  0000 L CNN
F 2 "" H 6150 1850 50  0001 C CNN
F 3 "~" H 6150 1850 50  0001 C CNN
	1    5950 1850
	0    1    1    0   
$EndComp
$Comp
L power:+28V #PWR?
U 1 1 5E00CFCA
P 5950 1350
AR Path="/5E00CFCA" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E00CFCA" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 5950 1200 50  0001 C CNN
F 1 "+28V" H 5965 1523 50  0000 C CNN
F 2 "" H 6200 1400 50  0001 C CNN
F 3 "" H 6200 1400 50  0001 C CNN
	1    5950 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E00CFC4
P 5950 2750
AR Path="/5E00CFC4" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E00CFC4" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 5950 2500 50  0001 C CNN
F 1 "GND" H 5955 2577 50  0000 C CNN
F 2 "" H 5950 2750 50  0001 C CNN
F 3 "" H 5950 2750 50  0001 C CNN
	1    5950 2750
	1    0    0    -1  
$EndComp
Connection ~ 5950 2600
Wire Wire Line
	5950 2600 5950 2750
Wire Wire Line
	6200 2600 6200 2500
Wire Wire Line
	5950 2600 6200 2600
Wire Wire Line
	5950 2450 5950 2600
Wire Wire Line
	6200 2250 6200 2300
Wire Wire Line
	6150 2250 6200 2250
$Comp
L Device:R_Small_US R?
U 1 1 5E00CFB7
P 6200 2400
AR Path="/5E00CFB7" Ref="R?"  Part="1" 
AR Path="/5DFFBBF9/5E00CFB7" Ref="R9"  Part="1" 
F 0 "R9" H 6268 2446 50  0000 L CNN
F 1 "240" H 6268 2355 50  0000 L CNN
F 2 "" H 6200 2400 50  0001 C CNN
F 3 "~" H 6200 2400 50  0001 C CNN
	1    6200 2400
	1    0    0    -1  
$EndComp
$Comp
L Reference_Current:LM334M U?
U 1 1 5E00CFB1
P 5950 2250
AR Path="/5E00CFB1" Ref="U?"  Part="1" 
AR Path="/5DFFBBF9/5E00CFB1" Ref="U10"  Part="1" 
F 0 "U10" H 5830 2296 50  0000 R CNN
F 1 "LM334M" H 5830 2205 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 5975 2100 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 5950 2250 50  0001 C CIN
	1    5950 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 1800 4850 2000
Wire Wire Line
	4850 1300 4850 1400
$Comp
L Connector:TestPoint TP?
U 1 1 5E0080AF
P 4850 1400
AR Path="/5E0080AF" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E0080AF" Ref="TP70"  Part="1" 
F 0 "TP70" V 4804 1588 50  0000 L CNN
F 1 "TestPoint" V 4895 1588 50  0000 L CNN
F 2 "" H 5050 1400 50  0001 C CNN
F 3 "~" H 5050 1400 50  0001 C CNN
	1    4850 1400
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E0080A9
P 4850 1800
AR Path="/5E0080A9" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E0080A9" Ref="TP66"  Part="1" 
F 0 "TP66" V 4804 1988 50  0000 L CNN
F 1 "TestPoint" V 4895 1988 50  0000 L CNN
F 2 "" H 5050 1800 50  0001 C CNN
F 3 "~" H 5050 1800 50  0001 C CNN
	1    4850 1800
	0    1    1    0   
$EndComp
$Comp
L power:+28V #PWR?
U 1 1 5E0080A3
P 4850 1300
AR Path="/5E0080A3" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E0080A3" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 4850 1150 50  0001 C CNN
F 1 "+28V" H 4865 1473 50  0000 C CNN
F 2 "" H 5100 1350 50  0001 C CNN
F 3 "" H 5100 1350 50  0001 C CNN
	1    4850 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E00809D
P 4850 2700
AR Path="/5E00809D" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E00809D" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 4850 2450 50  0001 C CNN
F 1 "GND" H 4855 2527 50  0000 C CNN
F 2 "" H 4850 2700 50  0001 C CNN
F 3 "" H 4850 2700 50  0001 C CNN
	1    4850 2700
	1    0    0    -1  
$EndComp
Connection ~ 4850 2550
Wire Wire Line
	4850 2550 4850 2700
Wire Wire Line
	5100 2550 5100 2450
Wire Wire Line
	4850 2550 5100 2550
Wire Wire Line
	4850 2400 4850 2550
Wire Wire Line
	5100 2200 5100 2250
Wire Wire Line
	5050 2200 5100 2200
$Comp
L Device:R_Small_US R?
U 1 1 5E008090
P 5100 2350
AR Path="/5E008090" Ref="R?"  Part="1" 
AR Path="/5DFFBBF9/5E008090" Ref="R7"  Part="1" 
F 0 "R7" H 5168 2396 50  0000 L CNN
F 1 "240" H 5168 2305 50  0000 L CNN
F 2 "" H 5100 2350 50  0001 C CNN
F 3 "~" H 5100 2350 50  0001 C CNN
	1    5100 2350
	1    0    0    -1  
$EndComp
$Comp
L Reference_Current:LM334M U?
U 1 1 5E00808A
P 4850 2200
AR Path="/5E00808A" Ref="U?"  Part="1" 
AR Path="/5DFFBBF9/5E00808A" Ref="U8"  Part="1" 
F 0 "U8" H 4730 2246 50  0000 R CNN
F 1 "LM334M" H 4730 2155 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4875 2050 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 4850 2200 50  0001 C CIN
	1    4850 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1800 3750 2000
Wire Wire Line
	3750 1300 3750 1400
$Comp
L Connector:TestPoint TP?
U 1 1 5E005656
P 3750 1400
AR Path="/5E005656" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E005656" Ref="TP68"  Part="1" 
F 0 "TP68" V 3704 1588 50  0000 L CNN
F 1 "TestPoint" V 3795 1588 50  0000 L CNN
F 2 "" H 3950 1400 50  0001 C CNN
F 3 "~" H 3950 1400 50  0001 C CNN
	1    3750 1400
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E005650
P 3750 1800
AR Path="/5E005650" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E005650" Ref="TP64"  Part="1" 
F 0 "TP64" V 3704 1988 50  0000 L CNN
F 1 "TestPoint" V 3795 1988 50  0000 L CNN
F 2 "" H 3950 1800 50  0001 C CNN
F 3 "~" H 3950 1800 50  0001 C CNN
	1    3750 1800
	0    1    1    0   
$EndComp
$Comp
L power:+28V #PWR?
U 1 1 5E00564A
P 3750 1300
AR Path="/5E00564A" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E00564A" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 3750 1150 50  0001 C CNN
F 1 "+28V" H 3765 1473 50  0000 C CNN
F 2 "" H 4000 1350 50  0001 C CNN
F 3 "" H 4000 1350 50  0001 C CNN
	1    3750 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E005644
P 3750 2700
AR Path="/5E005644" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E005644" Ref="#PWR013"  Part="1" 
F 0 "#PWR013" H 3750 2450 50  0001 C CNN
F 1 "GND" H 3755 2527 50  0000 C CNN
F 2 "" H 3750 2700 50  0001 C CNN
F 3 "" H 3750 2700 50  0001 C CNN
	1    3750 2700
	1    0    0    -1  
$EndComp
Connection ~ 3750 2550
Wire Wire Line
	3750 2550 3750 2700
Wire Wire Line
	4000 2550 4000 2450
Wire Wire Line
	3750 2550 4000 2550
Wire Wire Line
	3750 2400 3750 2550
Wire Wire Line
	4000 2200 4000 2250
Wire Wire Line
	3950 2200 4000 2200
$Comp
L Device:R_Small_US R?
U 1 1 5E005637
P 4000 2350
AR Path="/5E005637" Ref="R?"  Part="1" 
AR Path="/5DFFBBF9/5E005637" Ref="R5"  Part="1" 
F 0 "R5" H 4068 2396 50  0000 L CNN
F 1 "240" H 4068 2305 50  0000 L CNN
F 2 "" H 4000 2350 50  0001 C CNN
F 3 "~" H 4000 2350 50  0001 C CNN
	1    4000 2350
	1    0    0    -1  
$EndComp
$Comp
L Reference_Current:LM334M U?
U 1 1 5E005631
P 3750 2200
AR Path="/5E005631" Ref="U?"  Part="1" 
AR Path="/5DFFBBF9/5E005631" Ref="U6"  Part="1" 
F 0 "U6" H 3630 2246 50  0000 R CNN
F 1 "LM334M" H 3630 2155 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3775 2050 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 3750 2200 50  0001 C CIN
	1    3750 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 1800 2700 2000
Wire Wire Line
	2700 1300 2700 1400
$Comp
L Connector:TestPoint TP?
U 1 1 5E00484F
P 2700 1400
AR Path="/5E00484F" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E00484F" Ref="TP69"  Part="1" 
F 0 "TP69" V 2654 1588 50  0000 L CNN
F 1 "TestPoint" V 2745 1588 50  0000 L CNN
F 2 "" H 2900 1400 50  0001 C CNN
F 3 "~" H 2900 1400 50  0001 C CNN
	1    2700 1400
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E004849
P 2700 1800
AR Path="/5E004849" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5E004849" Ref="TP65"  Part="1" 
F 0 "TP65" V 2654 1988 50  0000 L CNN
F 1 "TestPoint" V 2745 1988 50  0000 L CNN
F 2 "" H 2900 1800 50  0001 C CNN
F 3 "~" H 2900 1800 50  0001 C CNN
	1    2700 1800
	0    1    1    0   
$EndComp
$Comp
L power:+28V #PWR?
U 1 1 5E004843
P 2700 1300
AR Path="/5E004843" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E004843" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 2700 1150 50  0001 C CNN
F 1 "+28V" H 2715 1473 50  0000 C CNN
F 2 "" H 2950 1350 50  0001 C CNN
F 3 "" H 2950 1350 50  0001 C CNN
	1    2700 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E00483D
P 2700 2700
AR Path="/5E00483D" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5E00483D" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 2700 2450 50  0001 C CNN
F 1 "GND" H 2705 2527 50  0000 C CNN
F 2 "" H 2700 2700 50  0001 C CNN
F 3 "" H 2700 2700 50  0001 C CNN
	1    2700 2700
	1    0    0    -1  
$EndComp
Connection ~ 2700 2550
Wire Wire Line
	2700 2550 2700 2700
Wire Wire Line
	2950 2550 2950 2450
Wire Wire Line
	2700 2550 2950 2550
Wire Wire Line
	2700 2400 2700 2550
Wire Wire Line
	2950 2200 2950 2250
Wire Wire Line
	2900 2200 2950 2200
$Comp
L Device:R_Small_US R?
U 1 1 5E004830
P 2950 2350
AR Path="/5E004830" Ref="R?"  Part="1" 
AR Path="/5DFFBBF9/5E004830" Ref="R3"  Part="1" 
F 0 "R3" H 3018 2396 50  0000 L CNN
F 1 "240" H 3018 2305 50  0000 L CNN
F 2 "" H 2950 2350 50  0001 C CNN
F 3 "~" H 2950 2350 50  0001 C CNN
	1    2950 2350
	1    0    0    -1  
$EndComp
$Comp
L Reference_Current:LM334M U?
U 1 1 5E00482A
P 2700 2200
AR Path="/5E00482A" Ref="U?"  Part="1" 
AR Path="/5DFFBBF9/5E00482A" Ref="U4"  Part="1" 
F 0 "U4" H 2580 2246 50  0000 R CNN
F 1 "LM334M" H 2580 2155 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2725 2050 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 2700 2200 50  0001 C CIN
	1    2700 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1800 1500 2000
Wire Wire Line
	1500 1300 1500 1400
$Comp
L Connector:TestPoint TP?
U 1 1 5DFFDF66
P 1500 1400
AR Path="/5DFFDF66" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5DFFDF66" Ref="TP67"  Part="1" 
F 0 "TP67" V 1454 1588 50  0000 L CNN
F 1 "TestPoint" V 1545 1588 50  0000 L CNN
F 2 "" H 1700 1400 50  0001 C CNN
F 3 "~" H 1700 1400 50  0001 C CNN
	1    1500 1400
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5DFFDF60
P 1500 1800
AR Path="/5DFFDF60" Ref="TP?"  Part="1" 
AR Path="/5DFFBBF9/5DFFDF60" Ref="TP63"  Part="1" 
F 0 "TP63" V 1454 1988 50  0000 L CNN
F 1 "TestPoint" V 1545 1988 50  0000 L CNN
F 2 "" H 1700 1800 50  0001 C CNN
F 3 "~" H 1700 1800 50  0001 C CNN
	1    1500 1800
	0    1    1    0   
$EndComp
$Comp
L power:+28V #PWR?
U 1 1 5DFFDF5A
P 1500 1300
AR Path="/5DFFDF5A" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5DFFDF5A" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 1500 1150 50  0001 C CNN
F 1 "+28V" H 1515 1473 50  0000 C CNN
F 2 "" H 1750 1350 50  0001 C CNN
F 3 "" H 1750 1350 50  0001 C CNN
	1    1500 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DFFDF54
P 1500 2700
AR Path="/5DFFDF54" Ref="#PWR?"  Part="1" 
AR Path="/5DFFBBF9/5DFFDF54" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 1500 2450 50  0001 C CNN
F 1 "GND" H 1505 2527 50  0000 C CNN
F 2 "" H 1500 2700 50  0001 C CNN
F 3 "" H 1500 2700 50  0001 C CNN
	1    1500 2700
	1    0    0    -1  
$EndComp
Connection ~ 1500 2550
Wire Wire Line
	1500 2550 1500 2700
Wire Wire Line
	1750 2550 1750 2450
Wire Wire Line
	1500 2550 1750 2550
Wire Wire Line
	1500 2400 1500 2550
Wire Wire Line
	1750 2200 1750 2250
Wire Wire Line
	1700 2200 1750 2200
$Comp
L Device:R_Small_US R?
U 1 1 5DFFDF47
P 1750 2350
AR Path="/5DFFDF47" Ref="R?"  Part="1" 
AR Path="/5DFFBBF9/5DFFDF47" Ref="R1"  Part="1" 
F 0 "R1" H 1818 2396 50  0000 L CNN
F 1 "240" H 1818 2305 50  0000 L CNN
F 2 "" H 1750 2350 50  0001 C CNN
F 3 "~" H 1750 2350 50  0001 C CNN
	1    1750 2350
	1    0    0    -1  
$EndComp
$Comp
L Reference_Current:LM334M U?
U 1 1 5DFFDF41
P 1500 2200
AR Path="/5DFFDF41" Ref="U?"  Part="1" 
AR Path="/5DFFBBF9/5DFFDF41" Ref="U2"  Part="1" 
F 0 "U2" H 1380 2246 50  0000 R CNN
F 1 "LM334M" H 1380 2155 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 1525 2050 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 1500 2200 50  0001 C CIN
	1    1500 2200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
