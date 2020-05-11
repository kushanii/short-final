EESchema Schematic File Version 4
LIBS:short-final-wiring-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 10
Title "Short Final Wiring"
Date "2020-05-10"
Rev "A"
Comp "Iskender Kushan (iskender.ee)"
Comment1 "Released under Attribution-ShareAlike 4.0 International License"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 1850 950  950  550 
U 5DFFBBF9
F0 "current-sources" 79
F1 "current-sources.sch" 79
$EndSheet
$Sheet
S 6850 1050 1100 750 
U 5EC20A4B
F0 "static-leds" 79
F1 "static-leds.sch" 79
F2 "static-leds" I L 6850 1250 50 
$EndSheet
Wire Wire Line
	5650 1250 6850 1250
$Sheet
S 1850 1950 950  1150
U 5ECB6469
F0 "towers" 79
F1 "towers.sch" 79
F2 "~TOWER_STATIC_LEDS" I R 2800 2150 50 
F3 "~TOWER_1_3" I R 2800 2450 50 
F4 "~TOWER_1_1" I R 2800 2350 50 
F5 "~TOWER_2_DYNAMIC" I R 2800 2750 50 
F6 "~TOWER_3_DYNAMIC" I R 2800 2850 50 
$EndSheet
Wire Wire Line
	2800 2150 4600 2150
Wire Wire Line
	2800 2350 4600 2350
Wire Wire Line
	4600 2450 2800 2450
Wire Wire Line
	2800 2750 4600 2750
Wire Wire Line
	4600 2850 2800 2850
$Sheet
S 1850 3600 950  550 
U 5ED1E3F3
F0 "photodiode" 79
F1 "photodiode.sch" 79
F2 "light-sda" B R 2800 3800 50 
F3 "light-scl" I R 2800 3900 50 
$EndSheet
Wire Wire Line
	2800 3900 4600 3900
Wire Wire Line
	4600 3800 2800 3800
$Sheet
S 6850 2400 1100 2200
U 5EC8FFB8
F0 "guide-leds" 79
F1 "guide-leds.sch" 79
F2 "~g4" I L 6850 3150 50 
F3 "~g3" I L 6850 3050 50 
F4 "~g6" I L 6850 3350 50 
F5 "~g5" I L 6850 3250 50 
F6 "~g2" I L 6850 2950 50 
F7 "~g1" I L 6850 2850 50 
F8 "~g8" I L 6850 3550 50 
F9 "~g7" I L 6850 3450 50 
F10 "~g9" I L 6850 3650 50 
$EndSheet
$Sheet
S 6850 5000 1100 1150
U 5ED3B773
F0 "dynamic-plane-leds" 79
F1 "dynamic-plane-leds.sch" 79
$EndSheet
$Sheet
S 4600 1050 1050 5450
U 5DFFBABC
F0 "teensy" 79
F1 "teensy.sch" 79
F2 "~TOWER_STATIC_LEDS" O L 4600 2150 50 
F3 "~TOWER_1_3" O L 4600 2450 50 
F4 "~TOWER_2_DYNAMIC" O L 4600 2750 50 
F5 "~TOWER_3_DYNAMIC" O L 4600 2850 50 
F6 "~TOWER_1_1" O L 4600 2350 50 
F7 "light-sda" B L 4600 3800 50 
F8 "light-scl" O L 4600 3900 50 
F9 "static-leds" O R 5650 1250 50 
F10 "~g3" O R 5650 3050 50 
F11 "~g4" O R 5650 3150 50 
F12 "~g6" O R 5650 3350 50 
F13 "papi-leds" O L 4600 5700 50 
F14 "hv-boost-en" O L 4600 4800 50 
F15 "~g5" O R 5650 3250 50 
F16 "~g1" O R 5650 2850 50 
F17 "~g7" O R 5650 3450 50 
F18 "~g8" O R 5650 3550 50 
F19 "~g9" O R 5650 3650 50 
F20 "~g2" O R 5650 2950 50 
$EndSheet
$Sheet
S 1700 5500 1100 850 
U 5ED756A2
F0 "papi-leds" 79
F1 "papi-leds.sch" 79
F2 "papi-leds" I R 2800 5700 50 
$EndSheet
$Sheet
S 1850 4600 950  500 
U 5EBB171F
F0 "power" 79
F1 "power.sch" 79
F2 "hv-boost-en" I R 2800 4800 50 
$EndSheet
Wire Wire Line
	2800 4800 4600 4800
Wire Wire Line
	4600 5700 2800 5700
Wire Wire Line
	5650 3450 6850 3450
Wire Wire Line
	5650 3250 6850 3250
Wire Wire Line
	5650 3550 6850 3550
Wire Wire Line
	5650 3650 6850 3650
Wire Wire Line
	5650 3350 6850 3350
Wire Wire Line
	5650 3150 6850 3150
Wire Wire Line
	5650 3050 6850 3050
Wire Wire Line
	5650 2850 6850 2850
Wire Wire Line
	5650 2950 6850 2950
Text Notes 10900 1250 2    157  ~ 31
Short Final Wiring
$EndSCHEMATC
