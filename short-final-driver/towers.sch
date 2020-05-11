EESchema Schematic File Version 4
LIBS:short-final-wiring-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 10
Title ""
Date ""
Rev ""
Comp "Iskender Kushan (iskender.ee)"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R_Small_US R?
U 1 1 5ECB812B
P 1600 2800
AR Path="/5DFFBABC/5ECB812B" Ref="R?"  Part="1" 
AR Path="/5EC20A43/5ECB812B" Ref="R?"  Part="1" 
AR Path="/5EC8FFB8/5ECB812B" Ref="R?"  Part="1" 
AR Path="/5ECB6469/5ECB812B" Ref="R?"  Part="1" 
F 0 "R?" V 1750 2800 50  0000 C CNN
F 1 "3k" V 1850 2800 50  0000 C CNN
F 2 "" H 1600 2800 50  0001 C CNN
F 3 "~" H 1600 2800 50  0001 C CNN
	1    1600 2800
	0    1    1    0   
$EndComp
Text Label 2150 2800 0    50   ~ 0
~TOWER_STATIC_LEDS
$Comp
L Connector:TestPoint TP?
U 1 1 5ECB813D
P 1350 3800
AR Path="/5DFFBABC/5ECB813D" Ref="TP?"  Part="1" 
AR Path="/5EC20A43/5ECB813D" Ref="TP?"  Part="1" 
AR Path="/5EC8FFB8/5ECB813D" Ref="TP?"  Part="1" 
AR Path="/5ECB6469/5ECB813D" Ref="TP61"  Part="1" 
F 0 "TP61" H 1050 3950 50  0000 L CNN
F 1 "TestPoint" H 1408 3827 50  0001 L CNN
F 2 "" H 1550 3800 50  0001 C CNN
F 3 "~" H 1550 3800 50  0001 C CNN
	1    1350 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5ECB8143
P 1650 3850
AR Path="/5DFFBABC/5ECB8143" Ref="R?"  Part="1" 
AR Path="/5EC20A43/5ECB8143" Ref="R?"  Part="1" 
AR Path="/5EC8FFB8/5ECB8143" Ref="R?"  Part="1" 
AR Path="/5ECB6469/5ECB8143" Ref="R?"  Part="1" 
F 0 "R?" V 1500 3900 50  0000 C CNN
F 1 "3k" V 1400 3900 50  0000 C CNN
F 2 "" H 1650 3850 50  0001 C CNN
F 3 "~" H 1650 3850 50  0001 C CNN
	1    1650 3850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5ECB815C
P 1650 4750
AR Path="/5DFFBABC/5ECB815C" Ref="R?"  Part="1" 
AR Path="/5EC20A43/5ECB815C" Ref="R?"  Part="1" 
AR Path="/5EC8FFB8/5ECB815C" Ref="R?"  Part="1" 
AR Path="/5ECB6469/5ECB815C" Ref="R?"  Part="1" 
F 0 "R?" V 1500 4800 50  0000 C CNN
F 1 "3k" V 1400 4800 50  0000 C CNN
F 2 "" H 1650 4750 50  0001 C CNN
F 3 "~" H 1650 4750 50  0001 C CNN
	1    1650 4750
	0    -1   -1   0   
$EndComp
Text HLabel 3300 2800 2    50   Input ~ 0
~TOWER_STATIC_LEDS
$Comp
L Connector:TestPoint TP?
U 1 1 5ECB8170
P 1300 2750
AR Path="/5DFFBABC/5ECB8170" Ref="TP?"  Part="1" 
AR Path="/5EC20A43/5ECB8170" Ref="TP?"  Part="1" 
AR Path="/5EC8FFB8/5ECB8170" Ref="TP?"  Part="1" 
AR Path="/5ECB6469/5ECB8170" Ref="TP59"  Part="1" 
F 0 "TP59" H 1000 2900 50  0000 L CNN
F 1 "TestPoint" H 1358 2777 50  0001 L CNN
F 2 "" H 1500 2750 50  0001 C CNN
F 3 "~" H 1500 2750 50  0001 C CNN
	1    1300 2750
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5ECB8790
P 5750 1350
AR Path="/5DFFBABC/5ECB8790" Ref="TP?"  Part="1" 
AR Path="/5EC20A43/5ECB8790" Ref="TP?"  Part="1" 
AR Path="/5EC8FFB8/5ECB8790" Ref="TP?"  Part="1" 
AR Path="/5ECB6469/5ECB8790" Ref="TP51"  Part="1" 
F 0 "TP51" H 5450 1500 50  0000 L CNN
F 1 "TestPoint" H 5808 1377 50  0001 L CNN
F 2 "" H 5950 1350 50  0001 C CNN
F 3 "~" H 5950 1350 50  0001 C CNN
	1    5750 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5ECB88B1
P 6000 1350
F 0 "#PWR?" H 6000 1200 50  0001 C CNN
F 1 "+3.3V" H 6015 1523 50  0000 C CNN
F 2 "" H 6000 1350 50  0001 C CNN
F 3 "" H 6000 1350 50  0001 C CNN
	1    6000 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 1350 5750 1450
Wire Wire Line
	5750 1450 6000 1450
Wire Wire Line
	6000 1450 6000 1350
Text Label 5750 3350 0    50   ~ 0
~TOWER_1_3
Text HLabel 6600 3350 2    50   Input ~ 0
~TOWER_1_3
Text HLabel 6600 4400 2    50   Input ~ 0
~TOWER_1_1
$Comp
L Connector:TestPoint TP?
U 1 1 5ECBE561
P 5100 3300
AR Path="/5DFFBABC/5ECBE561" Ref="TP?"  Part="1" 
AR Path="/5EC20A43/5ECBE561" Ref="TP?"  Part="1" 
AR Path="/5EC8FFB8/5ECBE561" Ref="TP?"  Part="1" 
AR Path="/5ECB6469/5ECBE561" Ref="TP98"  Part="1" 
F 0 "TP98" H 4800 3450 50  0000 L CNN
F 1 "TestPoint" H 5158 3327 50  0001 L CNN
F 2 "" H 5300 3300 50  0001 C CNN
F 3 "~" H 5300 3300 50  0001 C CNN
	1    5100 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 2800 3100 3850
Wire Wire Line
	3100 3850 3100 4750
Connection ~ 3100 3850
Wire Wire Line
	3100 2800 3300 2800
Connection ~ 3100 2800
$Comp
L Connector:TestPoint TP?
U 1 1 5ECB8156
P 1350 4700
AR Path="/5DFFBABC/5ECB8156" Ref="TP?"  Part="1" 
AR Path="/5EC20A43/5ECB8156" Ref="TP?"  Part="1" 
AR Path="/5EC8FFB8/5ECB8156" Ref="TP?"  Part="1" 
AR Path="/5ECB6469/5ECB8156" Ref="TP97"  Part="1" 
F 0 "TP97" H 1050 4850 50  0000 L CNN
F 1 "TestPoint" H 1408 4727 50  0001 L CNN
F 2 "" H 1550 4700 50  0001 C CNN
F 3 "~" H 1550 4700 50  0001 C CNN
	1    1350 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 2750 1300 2800
Wire Wire Line
	1300 2800 1500 2800
Wire Wire Line
	1700 2800 3100 2800
Wire Wire Line
	1350 3800 1350 3850
Wire Wire Line
	1350 3850 1550 3850
Wire Wire Line
	1750 3850 3100 3850
Wire Wire Line
	1350 4700 1350 4750
Wire Wire Line
	1350 4750 1550 4750
Wire Wire Line
	1750 4750 3100 4750
$Comp
L Device:R_Small_US R?
U 1 1 5ECD8BC5
P 5400 3350
AR Path="/5DFFBABC/5ECD8BC5" Ref="R?"  Part="1" 
AR Path="/5EC20A43/5ECD8BC5" Ref="R?"  Part="1" 
AR Path="/5EC8FFB8/5ECD8BC5" Ref="R?"  Part="1" 
AR Path="/5ECB6469/5ECD8BC5" Ref="R?"  Part="1" 
F 0 "R?" V 5550 3350 50  0000 C CNN
F 1 "3k" V 5650 3350 50  0000 C CNN
F 2 "" H 5400 3350 50  0001 C CNN
F 3 "~" H 5400 3350 50  0001 C CNN
	1    5400 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 3300 5100 3350
Wire Wire Line
	5100 3350 5300 3350
Wire Wire Line
	5500 3350 6600 3350
Text Label 5750 4400 0    50   ~ 0
~TOWER_1_1
$Comp
L Connector:TestPoint TP?
U 1 1 5ECDB67B
P 5100 4350
AR Path="/5DFFBABC/5ECDB67B" Ref="TP?"  Part="1" 
AR Path="/5EC20A43/5ECDB67B" Ref="TP?"  Part="1" 
AR Path="/5EC8FFB8/5ECDB67B" Ref="TP?"  Part="1" 
AR Path="/5ECB6469/5ECDB67B" Ref="TP53"  Part="1" 
F 0 "TP53" H 4800 4500 50  0000 L CNN
F 1 "TestPoint" H 5158 4377 50  0001 L CNN
F 2 "" H 5300 4350 50  0001 C CNN
F 3 "~" H 5300 4350 50  0001 C CNN
	1    5100 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5ECDB681
P 5400 4400
AR Path="/5DFFBABC/5ECDB681" Ref="R?"  Part="1" 
AR Path="/5EC20A43/5ECDB681" Ref="R?"  Part="1" 
AR Path="/5EC8FFB8/5ECDB681" Ref="R?"  Part="1" 
AR Path="/5ECB6469/5ECDB681" Ref="R?"  Part="1" 
F 0 "R?" V 5550 4400 50  0000 C CNN
F 1 "3k" V 5650 4400 50  0000 C CNN
F 2 "" H 5400 4400 50  0001 C CNN
F 3 "~" H 5400 4400 50  0001 C CNN
	1    5400 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 4350 5100 4400
Wire Wire Line
	5100 4400 5300 4400
Wire Wire Line
	5500 4400 6600 4400
Text Notes 5300 3200 0    50   Italic 0
D199
Text Notes 1500 2650 0    50   Italic 0
D196
Text Notes 1500 3700 0    50   Italic 0
D197
Text Notes 1500 4600 0    50   Italic 0
D198
Text Notes 5300 4250 0    50   Italic 0
D115
Text HLabel 10000 2000 2    50   Input ~ 0
~TOWER_2_DYNAMIC
$Comp
L Connector:TestPoint TP?
U 1 1 5ECE6AD0
P 8250 2900
AR Path="/5DFFBABC/5ECE6AD0" Ref="TP?"  Part="1" 
AR Path="/5EC20A43/5ECE6AD0" Ref="TP?"  Part="1" 
AR Path="/5EC8FFB8/5ECE6AD0" Ref="TP?"  Part="1" 
AR Path="/5ECB6469/5ECE6AD0" Ref="TP99"  Part="1" 
F 0 "TP99" H 7950 3050 50  0000 L CNN
F 1 "TestPoint" H 8308 2927 50  0001 L CNN
F 2 "" H 8450 2900 50  0001 C CNN
F 3 "~" H 8450 2900 50  0001 C CNN
	1    8250 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5ECE6AD6
P 9100 2950
AR Path="/5DFFBABC/5ECE6AD6" Ref="R?"  Part="1" 
AR Path="/5EC20A43/5ECE6AD6" Ref="R?"  Part="1" 
AR Path="/5EC8FFB8/5ECE6AD6" Ref="R?"  Part="1" 
AR Path="/5ECB6469/5ECE6AD6" Ref="R?"  Part="1" 
F 0 "R?" V 9250 2950 50  0000 C CNN
F 1 "3k" V 9350 2950 50  0000 C CNN
F 2 "" H 9100 2950 50  0001 C CNN
F 3 "~" H 9100 2950 50  0001 C CNN
	1    9100 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	8250 2900 8250 2950
Wire Wire Line
	8250 2950 9000 2950
Text Label 8350 2000 0    50   ~ 0
~TOWER_2_1_C
$Comp
L Connector:TestPoint TP?
U 1 1 5ECE6AE0
P 8250 1950
AR Path="/5DFFBABC/5ECE6AE0" Ref="TP?"  Part="1" 
AR Path="/5EC20A43/5ECE6AE0" Ref="TP?"  Part="1" 
AR Path="/5EC8FFB8/5ECE6AE0" Ref="TP?"  Part="1" 
AR Path="/5ECB6469/5ECE6AE0" Ref="TP55"  Part="1" 
F 0 "TP55" H 7950 2100 50  0000 L CNN
F 1 "TestPoint" H 8308 1977 50  0001 L CNN
F 2 "" H 8450 1950 50  0001 C CNN
F 3 "~" H 8450 1950 50  0001 C CNN
	1    8250 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5ECE6AE6
P 9100 2000
AR Path="/5DFFBABC/5ECE6AE6" Ref="R?"  Part="1" 
AR Path="/5EC20A43/5ECE6AE6" Ref="R?"  Part="1" 
AR Path="/5EC8FFB8/5ECE6AE6" Ref="R?"  Part="1" 
AR Path="/5ECB6469/5ECE6AE6" Ref="R?"  Part="1" 
F 0 "R?" V 9250 2000 50  0000 C CNN
F 1 "3k" V 9350 2000 50  0000 C CNN
F 2 "" H 9100 2000 50  0001 C CNN
F 3 "~" H 9100 2000 50  0001 C CNN
	1    9100 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	8250 1950 8250 2000
Wire Wire Line
	8250 2000 9000 2000
Wire Wire Line
	9200 2000 9650 2000
Text Notes 9000 2800 0    50   Italic 0
D200
Text Notes 9000 1850 0    50   Italic 0
D133
Text Label 8400 2950 0    50   ~ 0
~TOWER_2_3_C
Wire Wire Line
	9650 2000 9650 2950
Wire Wire Line
	9650 2950 9200 2950
Connection ~ 9650 2000
Wire Wire Line
	9650 2000 10000 2000
Text HLabel 10000 4750 2    50   Input ~ 0
~TOWER_3_DYNAMIC
$Comp
L Connector:TestPoint TP?
U 1 1 5ED0AEAB
P 8250 5650
AR Path="/5DFFBABC/5ED0AEAB" Ref="TP?"  Part="1" 
AR Path="/5EC20A43/5ED0AEAB" Ref="TP?"  Part="1" 
AR Path="/5EC8FFB8/5ED0AEAB" Ref="TP?"  Part="1" 
AR Path="/5ECB6469/5ED0AEAB" Ref="TP100"  Part="1" 
F 0 "TP100" H 7950 5800 50  0000 L CNN
F 1 "TestPoint" H 8308 5677 50  0001 L CNN
F 2 "" H 8450 5650 50  0001 C CNN
F 3 "~" H 8450 5650 50  0001 C CNN
	1    8250 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5ED0AEB1
P 9100 5700
AR Path="/5DFFBABC/5ED0AEB1" Ref="R?"  Part="1" 
AR Path="/5EC20A43/5ED0AEB1" Ref="R?"  Part="1" 
AR Path="/5EC8FFB8/5ED0AEB1" Ref="R?"  Part="1" 
AR Path="/5ECB6469/5ED0AEB1" Ref="R?"  Part="1" 
F 0 "R?" V 9250 5700 50  0000 C CNN
F 1 "3k" V 9350 5700 50  0000 C CNN
F 2 "" H 9100 5700 50  0001 C CNN
F 3 "~" H 9100 5700 50  0001 C CNN
	1    9100 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	8250 5650 8250 5700
Wire Wire Line
	8250 5700 9000 5700
Text Label 8350 4750 0    50   ~ 0
~TOWER_3_1_C
$Comp
L Connector:TestPoint TP?
U 1 1 5ED0AEBA
P 8250 4700
AR Path="/5DFFBABC/5ED0AEBA" Ref="TP?"  Part="1" 
AR Path="/5EC20A43/5ED0AEBA" Ref="TP?"  Part="1" 
AR Path="/5EC8FFB8/5ED0AEBA" Ref="TP?"  Part="1" 
AR Path="/5ECB6469/5ED0AEBA" Ref="TP57"  Part="1" 
F 0 "TP57" H 7950 4850 50  0000 L CNN
F 1 "TestPoint" H 8308 4727 50  0001 L CNN
F 2 "" H 8450 4700 50  0001 C CNN
F 3 "~" H 8450 4700 50  0001 C CNN
	1    8250 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5ED0AEC0
P 9100 4750
AR Path="/5DFFBABC/5ED0AEC0" Ref="R?"  Part="1" 
AR Path="/5EC20A43/5ED0AEC0" Ref="R?"  Part="1" 
AR Path="/5EC8FFB8/5ED0AEC0" Ref="R?"  Part="1" 
AR Path="/5ECB6469/5ED0AEC0" Ref="R?"  Part="1" 
F 0 "R?" V 9250 4750 50  0000 C CNN
F 1 "3k" V 9350 4750 50  0000 C CNN
F 2 "" H 9100 4750 50  0001 C CNN
F 3 "~" H 9100 4750 50  0001 C CNN
	1    9100 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	8250 4700 8250 4750
Wire Wire Line
	8250 4750 9000 4750
Wire Wire Line
	9200 4750 9650 4750
Text Notes 9000 5550 0    50   Italic 0
D201
Text Notes 9000 4600 0    50   Italic 0
D195
Text Label 8400 5700 0    50   ~ 0
~TOWER_3_3_C
Wire Wire Line
	9650 4750 9650 5700
Wire Wire Line
	9650 5700 9200 5700
Connection ~ 9650 4750
Wire Wire Line
	9650 4750 10000 4750
Text Notes 850  1050 0    50   ~ 0
Testpoint #'s match the ones on the display board.
$EndSCHEMATC
