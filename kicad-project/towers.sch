EESchema Schematic File Version 4
LIBS:short-final-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 11 12
Title "Short Final Top"
Date "2020-05-10"
Rev "A"
Comp "Iskender Kushan (iskender.ee)"
Comment1 "Released under Attribution-ShareAlike 4.0 International License"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:LED_ALT D?
U 1 1 5DCA3321
P 3700 2950
AR Path="/5DCA3321" Ref="D?"  Part="1" 
AR Path="/5D7D4F90/5DCA3321" Ref="D?"  Part="1" 
AR Path="/5DC8E593/5DCA3321" Ref="D115"  Part="1" 
F 0 "D115" H 3693 3166 50  0000 C CNN
F 1 "R" H 3693 3075 50  0000 C CNN
F 2 "LED_SMD:LED_0201_0603Metric" H 3700 2950 50  0001 C CNN
F 3 "~" H 3700 2950 50  0001 C CNN
	1    3700 2950
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5DCA3327
P 3250 2650
AR Path="/5DCA3327" Ref="TP?"  Part="1" 
AR Path="/5D7D4F90/5DCA3327" Ref="TP?"  Part="1" 
AR Path="/5DC8E593/5DCA3327" Ref="TP53"  Part="1" 
F 0 "TP53" H 3308 2768 50  0000 L CNN
F 1 "TestPoint" H 3308 2677 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 3450 2650 50  0001 C CNN
F 3 "~" H 3450 2650 50  0001 C CNN
	1    3250 2650
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5DCA332D
P 3950 2100
AR Path="/5DCA332D" Ref="TP?"  Part="1" 
AR Path="/5D7D4F90/5DCA332D" Ref="TP?"  Part="1" 
AR Path="/5DC8E593/5DCA332D" Ref="TP51"  Part="1" 
F 0 "TP51" H 4008 2218 50  0000 L CNN
F 1 "TestPoint" H 4008 2127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 4150 2100 50  0001 C CNN
F 3 "~" H 4150 2100 50  0001 C CNN
	1    3950 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 2650 3250 2950
Wire Wire Line
	3250 2950 3550 2950
Wire Wire Line
	3850 2950 3950 2950
Text Label 3250 2950 1    50   ~ 0
t1-1-c
Text Label 4550 2250 0    50   ~ 0
towers-a
Text Notes 4150 2950 0    98   Italic 20
D
$Comp
L Device:LED_ALT D?
U 1 1 5DCA3DDB
P 3700 3800
AR Path="/5DCA3DDB" Ref="D?"  Part="1" 
AR Path="/5D7D4F90/5DCA3DDB" Ref="D?"  Part="1" 
AR Path="/5DC8E593/5DCA3DDB" Ref="D196"  Part="1" 
F 0 "D196" H 3693 4016 50  0000 C CNN
F 1 "R" H 3693 3925 50  0000 C CNN
F 2 "LED_SMD:LED_0201_0603Metric" H 3700 3800 50  0001 C CNN
F 3 "~" H 3700 3800 50  0001 C CNN
	1    3700 3800
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5DCA3DE1
P 3250 3500
AR Path="/5DCA3DE1" Ref="TP?"  Part="1" 
AR Path="/5D7D4F90/5DCA3DE1" Ref="TP?"  Part="1" 
AR Path="/5DC8E593/5DCA3DE1" Ref="TP59"  Part="1" 
F 0 "TP59" H 3308 3618 50  0000 L CNN
F 1 "TestPoint" H 3308 3527 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 3450 3500 50  0001 C CNN
F 3 "~" H 3450 3500 50  0001 C CNN
	1    3250 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 3500 3250 3800
Wire Wire Line
	3250 3800 3550 3800
Wire Wire Line
	3850 3800 3950 3800
Text Label 3250 3800 1    50   ~ 0
t1-2-c
Text Notes 4150 3800 0    98   Italic 20
D
$Comp
L Device:LED_ALT D?
U 1 1 5DCA492B
P 3700 4550
AR Path="/5DCA492B" Ref="D?"  Part="1" 
AR Path="/5D7D4F90/5DCA492B" Ref="D?"  Part="1" 
AR Path="/5DC8E593/5DCA492B" Ref="D199"  Part="1" 
F 0 "D199" H 3693 4766 50  0000 C CNN
F 1 "R" H 3693 4675 50  0000 C CNN
F 2 "LED_SMD:LED_0201_0603Metric" H 3700 4550 50  0001 C CNN
F 3 "~" H 3700 4550 50  0001 C CNN
	1    3700 4550
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5DCA4931
P 3250 4250
AR Path="/5DCA4931" Ref="TP?"  Part="1" 
AR Path="/5D7D4F90/5DCA4931" Ref="TP?"  Part="1" 
AR Path="/5DC8E593/5DCA4931" Ref="TP98"  Part="1" 
F 0 "TP98" H 3308 4368 50  0000 L CNN
F 1 "TestPoint" H 3308 4277 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 3450 4250 50  0001 C CNN
F 3 "~" H 3450 4250 50  0001 C CNN
	1    3250 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 4250 3250 4550
Wire Wire Line
	3250 4550 3550 4550
Wire Wire Line
	3850 4550 3950 4550
Text Label 3250 4550 1    50   ~ 0
t1-3-c
Text Notes 4150 4550 0    98   Italic 20
D
Text Notes 5950 4600 0    98   Italic 20
D
Text Label 5050 4600 1    50   ~ 0
t2-3-c
Wire Wire Line
	5650 4600 5750 4600
Wire Wire Line
	5050 4600 5350 4600
Wire Wire Line
	5050 4300 5050 4600
$Comp
L Connector:TestPoint TP?
U 1 1 5DCA6A8D
P 5050 4300
AR Path="/5DCA6A8D" Ref="TP?"  Part="1" 
AR Path="/5D7D4F90/5DCA6A8D" Ref="TP?"  Part="1" 
AR Path="/5DC8E593/5DCA6A8D" Ref="TP99"  Part="1" 
F 0 "TP99" H 5108 4418 50  0000 L CNN
F 1 "TestPoint" H 5108 4327 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5250 4300 50  0001 C CNN
F 3 "~" H 5250 4300 50  0001 C CNN
	1    5050 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DCA6A87
P 5500 4600
AR Path="/5DCA6A87" Ref="D?"  Part="1" 
AR Path="/5D7D4F90/5DCA6A87" Ref="D?"  Part="1" 
AR Path="/5DC8E593/5DCA6A87" Ref="D200"  Part="1" 
F 0 "D200" H 5493 4816 50  0000 C CNN
F 1 "R" H 5493 4725 50  0000 C CNN
F 2 "LED_SMD:LED_0201_0603Metric" H 5500 4600 50  0001 C CNN
F 3 "~" H 5500 4600 50  0001 C CNN
	1    5500 4600
	1    0    0    -1  
$EndComp
Text Notes 5950 3800 0    98   Italic 20
D
Text Label 5050 3800 1    50   ~ 0
t2-2-c
Wire Wire Line
	5650 3800 5750 3800
Wire Wire Line
	5050 3800 5350 3800
Wire Wire Line
	5050 3500 5050 3800
$Comp
L Connector:TestPoint TP?
U 1 1 5DCA6175
P 5050 3500
AR Path="/5DCA6175" Ref="TP?"  Part="1" 
AR Path="/5D7D4F90/5DCA6175" Ref="TP?"  Part="1" 
AR Path="/5DC8E593/5DCA6175" Ref="TP61"  Part="1" 
F 0 "TP61" H 5108 3618 50  0000 L CNN
F 1 "TestPoint" H 5108 3527 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5250 3500 50  0001 C CNN
F 3 "~" H 5250 3500 50  0001 C CNN
	1    5050 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DCA616F
P 5500 3800
AR Path="/5DCA616F" Ref="D?"  Part="1" 
AR Path="/5D7D4F90/5DCA616F" Ref="D?"  Part="1" 
AR Path="/5DC8E593/5DCA616F" Ref="D197"  Part="1" 
F 0 "D197" H 5493 4016 50  0000 C CNN
F 1 "R" H 5493 3925 50  0000 C CNN
F 2 "LED_SMD:LED_0201_0603Metric" H 5500 3800 50  0001 C CNN
F 3 "~" H 5500 3800 50  0001 C CNN
	1    5500 3800
	1    0    0    -1  
$EndComp
Text Notes 5950 2950 0    98   Italic 20
D
Text Label 5050 2950 1    50   ~ 0
t2-1-c
Wire Wire Line
	5650 2950 5750 2950
Wire Wire Line
	5050 2950 5350 2950
Wire Wire Line
	5050 2650 5050 2950
$Comp
L Connector:TestPoint TP?
U 1 1 5DCA584F
P 5050 2650
AR Path="/5DCA584F" Ref="TP?"  Part="1" 
AR Path="/5D7D4F90/5DCA584F" Ref="TP?"  Part="1" 
AR Path="/5DC8E593/5DCA584F" Ref="TP55"  Part="1" 
F 0 "TP55" H 5108 2768 50  0000 L CNN
F 1 "TestPoint" H 5108 2677 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5250 2650 50  0001 C CNN
F 3 "~" H 5250 2650 50  0001 C CNN
	1    5050 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DCA5849
P 5500 2950
AR Path="/5DCA5849" Ref="D?"  Part="1" 
AR Path="/5D7D4F90/5DCA5849" Ref="D?"  Part="1" 
AR Path="/5DC8E593/5DCA5849" Ref="D133"  Part="1" 
F 0 "D133" H 5493 3166 50  0000 C CNN
F 1 "R" H 5493 3075 50  0000 C CNN
F 2 "LED_SMD:LED_0201_0603Metric" H 5500 2950 50  0001 C CNN
F 3 "~" H 5500 2950 50  0001 C CNN
	1    5500 2950
	1    0    0    -1  
$EndComp
Text Notes 7900 4600 0    98   Italic 20
D
Text Label 7000 4600 1    50   ~ 0
t3-3-c
Wire Wire Line
	7600 4600 7700 4600
Wire Wire Line
	7000 4600 7300 4600
Wire Wire Line
	7000 4300 7000 4600
$Comp
L Connector:TestPoint TP?
U 1 1 5DCB3799
P 7000 4300
AR Path="/5DCB3799" Ref="TP?"  Part="1" 
AR Path="/5D7D4F90/5DCB3799" Ref="TP?"  Part="1" 
AR Path="/5DC8E593/5DCB3799" Ref="TP100"  Part="1" 
F 0 "TP100" H 7058 4418 50  0000 L CNN
F 1 "TestPoint" H 7058 4327 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 7200 4300 50  0001 C CNN
F 3 "~" H 7200 4300 50  0001 C CNN
	1    7000 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DCB379F
P 7450 4600
AR Path="/5DCB379F" Ref="D?"  Part="1" 
AR Path="/5D7D4F90/5DCB379F" Ref="D?"  Part="1" 
AR Path="/5DC8E593/5DCB379F" Ref="D201"  Part="1" 
F 0 "D201" H 7443 4816 50  0000 C CNN
F 1 "R" H 7443 4725 50  0000 C CNN
F 2 "LED_SMD:LED_0201_0603Metric" H 7450 4600 50  0001 C CNN
F 3 "~" H 7450 4600 50  0001 C CNN
	1    7450 4600
	1    0    0    -1  
$EndComp
Text Notes 7900 3800 0    98   Italic 20
D
Text Label 7000 3800 1    50   ~ 0
t3-2-c
Wire Wire Line
	7600 3800 7700 3800
Wire Wire Line
	7000 3800 7300 3800
Wire Wire Line
	7000 3500 7000 3800
$Comp
L Connector:TestPoint TP?
U 1 1 5DCB37B2
P 7000 3500
AR Path="/5DCB37B2" Ref="TP?"  Part="1" 
AR Path="/5D7D4F90/5DCB37B2" Ref="TP?"  Part="1" 
AR Path="/5DC8E593/5DCB37B2" Ref="TP97"  Part="1" 
F 0 "TP97" H 7058 3618 50  0000 L CNN
F 1 "TestPoint" H 7058 3527 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 7200 3500 50  0001 C CNN
F 3 "~" H 7200 3500 50  0001 C CNN
	1    7000 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DCB37B8
P 7450 3800
AR Path="/5DCB37B8" Ref="D?"  Part="1" 
AR Path="/5D7D4F90/5DCB37B8" Ref="D?"  Part="1" 
AR Path="/5DC8E593/5DCB37B8" Ref="D198"  Part="1" 
F 0 "D198" H 7443 4016 50  0000 C CNN
F 1 "R" H 7443 3925 50  0000 C CNN
F 2 "LED_SMD:LED_0201_0603Metric" H 7450 3800 50  0001 C CNN
F 3 "~" H 7450 3800 50  0001 C CNN
	1    7450 3800
	1    0    0    -1  
$EndComp
Text Notes 7900 2950 0    98   Italic 20
D
Text Label 7000 2950 1    50   ~ 0
t3-1-c
Wire Wire Line
	7600 2950 7700 2950
Wire Wire Line
	7000 2950 7300 2950
Wire Wire Line
	7000 2650 7000 2950
$Comp
L Connector:TestPoint TP?
U 1 1 5DCB37CB
P 7000 2650
AR Path="/5DCB37CB" Ref="TP?"  Part="1" 
AR Path="/5D7D4F90/5DCB37CB" Ref="TP?"  Part="1" 
AR Path="/5DC8E593/5DCB37CB" Ref="TP57"  Part="1" 
F 0 "TP57" H 7058 2768 50  0000 L CNN
F 1 "TestPoint" H 7058 2677 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 7200 2650 50  0001 C CNN
F 3 "~" H 7200 2650 50  0001 C CNN
	1    7000 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DCB37D1
P 7450 2950
AR Path="/5DCB37D1" Ref="D?"  Part="1" 
AR Path="/5D7D4F90/5DCB37D1" Ref="D?"  Part="1" 
AR Path="/5DC8E593/5DCB37D1" Ref="D195"  Part="1" 
F 0 "D195" H 7443 3166 50  0000 C CNN
F 1 "R" H 7443 3075 50  0000 C CNN
F 2 "LED_SMD:LED_0201_0603Metric" H 7450 2950 50  0001 C CNN
F 3 "~" H 7450 2950 50  0001 C CNN
	1    7450 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2100 3950 2250
Connection ~ 3950 3800
Wire Wire Line
	3950 3800 3950 4550
Wire Wire Line
	3950 2950 3950 3800
Connection ~ 3950 2950
Wire Wire Line
	5750 3800 5750 4600
Connection ~ 5750 3800
Wire Wire Line
	5750 2950 5750 3800
Connection ~ 5750 2950
Wire Wire Line
	3950 2250 5750 2250
Wire Wire Line
	5750 2250 5750 2950
Connection ~ 3950 2250
Wire Wire Line
	3950 2250 3950 2950
Wire Wire Line
	5750 2250 7700 2250
Wire Wire Line
	7700 2250 7700 2950
Connection ~ 5750 2250
Wire Wire Line
	7700 2950 7700 3800
Connection ~ 7700 2950
Wire Wire Line
	7700 3800 7700 4600
Connection ~ 7700 3800
Text Notes 9000 7000 0    197  ~ 39
Tower LEDs
$EndSCHEMATC
