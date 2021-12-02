EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Group 28"
Date "2021-11-30"
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R_US R3
U 1 1 5ED96BFE
P 10450 1150
F 0 "R3" H 10518 1196 50  0000 L CNN
F 1 "100K" H 10518 1105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10490 1140 50  0001 C CNN
F 3 "" H 10450 1150 50  0001 C CNN
	1    10450 1150
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5ED97CD6
P 10150 1300
F 0 "SW1" H 10150 1493 50  0000 C CNN
F 1 "SW_Push" H 10150 1494 50  0001 C CNN
F 2 "Button_Switch_SMD:SW_SPST_PTS645" H 10150 1500 50  0001 C CNN
F 3 "" H 10150 1500 50  0001 C CNN
	1    10150 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 1300 10450 1300
Connection ~ 10450 1300
$Comp
L power:GND #PWR0101
U 1 1 5ED98EE6
P 10450 1600
F 0 "#PWR0101" H 10450 1350 50  0001 C CNN
F 1 "GND" H 10455 1427 50  0001 C CNN
F 2 "" H 10450 1600 50  0001 C CNN
F 3 "" H 10450 1600 50  0001 C CNN
	1    10450 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5ED98F64
P 9950 1300
F 0 "#PWR0102" H 9950 1050 50  0001 C CNN
F 1 "GND" H 9955 1127 50  0001 C CNN
F 2 "" H 9950 1300 50  0001 C CNN
F 3 "" H 9950 1300 50  0001 C CNN
	1    9950 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 1300 10850 1300
Text Label 10650 1300 0    50   ~ 0
NRST
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J3
U 1 1 5EDAE31F
P 1650 1100
F 0 "J3" H 1700 1517 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 1700 1426 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x05_P2.54mm_Vertical" H 1650 1100 50  0001 C CNN
F 3 "~" H 1650 1100 50  0001 C CNN
	1    1650 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 900  1000 900 
Wire Wire Line
	1450 1200 1000 1200
Wire Wire Line
	1950 900  2500 900 
Wire Wire Line
	1950 1100 2500 1100
Wire Wire Line
	1950 1200 2500 1200
Text Label 1000 900  0    50   ~ 0
NRST
$Comp
L power:GND #PWR0106
U 1 1 5EDB2A83
P 850 1000
F 0 "#PWR0106" H 850 750 50  0001 C CNN
F 1 "GND" H 855 827 50  0001 C CNN
F 2 "" H 850 1000 50  0001 C CNN
F 3 "" H 850 1000 50  0001 C CNN
	1    850  1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5EDB2DDB
P 2600 1000
F 0 "#PWR0107" H 2600 750 50  0001 C CNN
F 1 "GND" H 2605 827 50  0001 C CNN
F 2 "" H 2600 1000 50  0001 C CNN
F 3 "" H 2600 1000 50  0001 C CNN
	1    2600 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  1000 1450 1000
Wire Wire Line
	1950 1000 2600 1000
Text Label 2100 900  0    50   ~ 0
SWDIO_IN
Text Label 2100 1100 0    50   ~ 0
SWCLK_IN
Text Label 1000 1200 0    50   ~ 0
V3.3_IN
Text Label 2150 1200 0    50   ~ 0
V3.3_IN
$Comp
L Device:C C3
U 1 1 5EDB6282
P 1250 3400
F 0 "C3" H 1200 3150 50  0000 L CNN
F 1 ".1uF" H 1000 3300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1288 3250 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/Samsung-Electro-Mechanics-CL21C101JBANNNC_C1790.pdf" H 1250 3400 50  0001 C CNN
	1    1250 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5EDBBF15
P 1650 3900
F 0 "#PWR0108" H 1650 3650 50  0001 C CNN
F 1 "GND" H 1655 3727 50  0001 C CNN
F 2 "" H 1650 3900 50  0001 C CNN
F 3 "" H 1650 3900 50  0001 C CNN
	1    1650 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  3550 1100 3550
Wire Wire Line
	950  3250 1250 3250
Wire Wire Line
	1350 3250 1250 3250
Connection ~ 1250 3250
Wire Wire Line
	2750 1850 2600 1850
$Comp
L power:+5V #PWR0110
U 1 1 5EDF8A88
P 2750 1850
F 0 "#PWR0110" H 2750 1700 50  0001 C CNN
F 1 "+5V" H 2765 2023 50  0000 C CNN
F 2 "" H 2750 1850 50  0001 C CNN
F 3 "" H 2750 1850 50  0001 C CNN
	1    2750 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0111
U 1 1 5EDF9167
P 950 3250
F 0 "#PWR0111" H 950 3100 50  0001 C CNN
F 1 "+5V" H 965 3423 50  0000 C CNN
F 2 "" H 950 3250 50  0001 C CNN
F 3 "" H 950 3250 50  0001 C CNN
	1    950  3250
	1    0    0    -1  
$EndComp
Connection ~ 950  3250
$Comp
L Diode:BAT60A D2
U 1 1 5EDF967B
P 2500 3250
F 0 "D2" H 2500 3033 50  0000 C CNN
F 1 "BAT60JFILM" H 2500 3124 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323" H 2500 3075 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/Infineon-BAT60ASERIES-DS-v01_01-en.pdf?fileId=db3a304313d846880113def70c9304a9" H 2500 3250 50  0001 C CNN
	1    2500 3250
	-1   0    0    1   
$EndComp
Wire Wire Line
	2650 3250 2850 3250
Wire Wire Line
	6800 1900 7250 1900
Wire Wire Line
	6800 2800 7250 2800
Wire Wire Line
	6800 2900 7250 2900
Wire Wire Line
	6800 3700 7250 3700
Wire Wire Line
	6800 4600 7250 4600
Wire Wire Line
	5500 2600 5050 2600
Wire Wire Line
	5500 2700 5050 2700
Wire Wire Line
	5500 3000 5050 3000
Wire Wire Line
	5500 1500 5050 1500
Text Label 7050 1900 0    50   ~ 0
PA4
Text Label 7050 2800 0    50   ~ 0
PA13
Text Label 7050 2900 0    50   ~ 0
PA14
Text Label 7250 4600 2    50   ~ 0
PB14
Text Label 5150 2600 0    50   ~ 0
PF0
Text Label 5150 2700 0    50   ~ 0
PF1
Text Label 5150 2800 0    50   ~ 0
PF11
Text Label 5150 3000 0    50   ~ 0
PD2
Text Label 5150 1500 0    50   ~ 0
NRST
Wire Wire Line
	5900 1300 5900 1150
Wire Wire Line
	5900 1150 6000 1150
Wire Wire Line
	6400 1150 6400 1300
Wire Wire Line
	6000 1300 6000 1150
Connection ~ 6000 1150
Wire Wire Line
	6000 1150 6100 1150
Wire Wire Line
	6100 1300 6100 1150
Connection ~ 6100 1150
Wire Wire Line
	6100 1150 6200 1150
Wire Wire Line
	6200 1300 6200 1150
Connection ~ 6200 1150
Wire Wire Line
	6200 1150 6400 1150
Connection ~ 6100 4900
$Comp
L power:GND #PWR0114
U 1 1 5EF55F72
P 6100 4900
F 0 "#PWR0114" H 6100 4650 50  0001 C CNN
F 1 "GND" H 6105 4727 50  0001 C CNN
F 2 "" H 6100 4900 50  0001 C CNN
F 3 "" H 6100 4900 50  0001 C CNN
	1    6100 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R1
U 1 1 5EFA9F0F
P 2600 2000
F 0 "R1" H 2668 2046 50  0000 L CNN
F 1 "5.1k" H 2668 1955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2640 1990 50  0001 C CNN
F 3 "" H 2600 2000 50  0001 C CNN
	1    2600 2000
	1    0    0    -1  
$EndComp
Connection ~ 2600 1850
$Comp
L Device:LED_Small_ALT LD1
U 1 1 5EFAAEE8
P 2600 2250
F 0 "LD1" V 2646 2180 50  0000 R CNN
F 1 "LED_Red" V 2555 2180 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 2600 2250 50  0001 C CNN
F 3 "" V 2600 2250 50  0001 C CNN
	1    2600 2250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5EFAB7DD
P 2600 2350
F 0 "#PWR0115" H 2600 2100 50  0001 C CNN
F 1 "GND" H 2605 2177 50  0001 C CNN
F 2 "" H 2600 2350 50  0001 C CNN
F 3 "" H 2600 2350 50  0001 C CNN
	1    2600 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R2
U 1 1 5EFAD91C
P 2850 3400
F 0 "R2" H 2918 3446 50  0000 L CNN
F 1 "1k" H 2918 3355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2890 3390 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/Uniroyal-Elec-0805W8F3001T5E_C17661.pdf" H 2850 3400 50  0001 C CNN
	1    2850 3400
	1    0    0    -1  
$EndComp
Connection ~ 2850 3250
$Comp
L Device:LED_Small_ALT LD2
U 1 1 5EFADFE5
P 2850 3650
F 0 "LD2" V 2896 3580 50  0000 R CNN
F 1 "LED_Green" V 2805 3580 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 2850 3650 50  0001 C CNN
F 3 "" V 2850 3650 50  0001 C CNN
	1    2850 3650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5EFAE6BC
P 2850 3750
F 0 "#PWR0116" H 2850 3500 50  0001 C CNN
F 1 "GND" H 2855 3577 50  0001 C CNN
F 2 "" H 2850 3750 50  0001 C CNN
F 3 "" H 2850 3750 50  0001 C CNN
	1    2850 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal X1
U 1 1 5F938156
P 2100 6400
F 0 "X1" H 2100 6668 50  0000 C CNN
F 1 "32.768kHz(12.5pF)" H 2100 6577 50  0000 C CNN
F 2 "local_models:ECX-.327-CDX-1293" H 2100 6400 50  0001 C CNN
F 3 "" H 2100 6400 50  0001 C CNN
	1    2100 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 6400 1850 6400
Wire Wire Line
	1850 6400 1850 6550
Wire Wire Line
	2250 6400 2350 6400
Wire Wire Line
	2350 6400 2350 6550
Wire Wire Line
	1850 6850 2100 6850
$Comp
L power:GND #PWR0127
U 1 1 5F968565
P 2100 6850
F 0 "#PWR0127" H 2100 6600 50  0001 C CNN
F 1 "GND" H 2105 6677 50  0001 C CNN
F 2 "" H 2100 6850 50  0001 C CNN
F 3 "" H 2100 6850 50  0001 C CNN
	1    2100 6850
	1    0    0    -1  
$EndComp
Connection ~ 2100 6850
Wire Wire Line
	2100 6850 2350 6850
Text Label 2450 5900 0    50   ~ 0
PC15
$Comp
L Device:Crystal X2
U 1 1 5F99C294
P 4800 6400
F 0 "X2" H 4800 6668 50  0000 C CNN
F 1 "8MHz(20pF)" H 4800 6577 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_3225-4Pin_3.2x2.5mm" H 4800 6400 50  0001 C CNN
F 3 "" H 4800 6400 50  0001 C CNN
	1    4800 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 5F99C29A
P 4550 6700
F 0 "C14" H 4500 6450 50  0000 L CNN
F 1 "20pF" H 4350 6600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4588 6550 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/Samsung-Electro-Mechanics-CL21C200JBANNNC_C1798.pdf" H 4550 6700 50  0001 C CNN
	1    4550 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 6400 4550 6400
Wire Wire Line
	4550 6400 4550 6550
Wire Wire Line
	4950 6400 5050 6400
Wire Wire Line
	5050 6400 5050 6550
Wire Wire Line
	4550 6850 4800 6850
$Comp
L power:GND #PWR0128
U 1 1 5F99C2AB
P 4800 6850
F 0 "#PWR0128" H 4800 6600 50  0001 C CNN
F 1 "GND" H 4805 6677 50  0001 C CNN
F 2 "" H 4800 6850 50  0001 C CNN
F 3 "" H 4800 6850 50  0001 C CNN
	1    4800 6850
	1    0    0    -1  
$EndComp
Connection ~ 4800 6850
Wire Wire Line
	4800 6850 5050 6850
Text Label 4250 5900 0    50   ~ 0
PF0
Text Label 5250 5900 0    50   ~ 0
PF1
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5FA92925
P 2750 1850
F 0 "#FLG0103" H 2750 1925 50  0001 C CNN
F 1 "PWR_FLAG" V 2750 1978 50  0000 L CNN
F 2 "" H 2750 1850 50  0001 C CNN
F 3 "~" H 2750 1850 50  0001 C CNN
	1    2750 1850
	0    1    1    0   
$EndComp
Connection ~ 2750 1850
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 5FAB6C09
P 2850 3250
F 0 "#FLG0104" H 2850 3325 50  0001 C CNN
F 1 "PWR_FLAG" V 2850 3378 50  0000 L CNN
F 2 "" H 2850 3250 50  0001 C CNN
F 3 "~" H 2850 3250 50  0001 C CNN
	1    2850 3250
	0    1    1    0   
$EndComp
NoConn ~ 1450 1100
Text Label 7250 2800 0    50   ~ 0
SWDIO_IN
Text Label 7250 2900 0    50   ~ 0
SWCLK_IN
Text Notes 2900 2250 0    50   ~ 0
1.8V @ 0.7mA
Text Notes 2900 3800 0    50   ~ 0
2V @ 0.18mA
$Comp
L Device:C C1
U 1 1 5FC37E3D
P 950 3400
F 0 "C1" H 900 3150 50  0000 L CNN
F 1 "22uF" H 750 3300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 988 3250 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/Samsung-Electro-Mechanics-CL21A226MAQNNNE_C45783.pdf" H 950 3400 50  0001 C CNN
	1    950  3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5FC440CB
P 2350 3400
F 0 "C2" H 2300 3150 50  0000 L CNN
F 1 "22uF" H 2150 3300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2388 3250 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/Samsung-Electro-Mechanics-CL21A226MAQNNNE_C45783.pdf" H 2350 3400 50  0001 C CNN
	1    2350 3400
	1    0    0    -1  
$EndComp
Connection ~ 2350 3250
Wire Wire Line
	1950 3250 2050 3250
$Comp
L Device:C C4
U 1 1 5FC45CAA
P 2050 3400
F 0 "C4" H 2000 3150 50  0000 L CNN
F 1 ".1uF" H 1800 3300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2088 3250 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/Samsung-Electro-Mechanics-CL21C101JBANNNC_C1790.pdf" H 2050 3400 50  0001 C CNN
	1    2050 3400
	1    0    0    -1  
$EndComp
Connection ~ 2050 3250
Wire Wire Line
	2050 3250 2350 3250
Wire Wire Line
	2050 3550 2200 3550
Wire Wire Line
	1050 4700 1300 4700
Wire Wire Line
	1050 5000 1300 5000
$Comp
L Device:C C6
U 1 1 5FC4826B
P 1300 4850
F 0 "C6" H 1250 4600 50  0000 L CNN
F 1 ".1uF" H 1050 4750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1338 4700 50  0001 C CNN
F 3 "" H 1300 4850 50  0001 C CNN
	1    1300 4850
	1    0    0    -1  
$EndComp
Connection ~ 1300 4700
Wire Wire Line
	1300 4700 1550 4700
Connection ~ 1300 5000
Wire Wire Line
	1300 5000 1550 5000
$Comp
L Device:C C7
U 1 1 5FC48AAE
P 1550 4850
F 0 "C7" H 1500 4600 50  0000 L CNN
F 1 ".1uF" H 1300 4750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1588 4700 50  0001 C CNN
F 3 "" H 1550 4850 50  0001 C CNN
	1    1550 4850
	1    0    0    -1  
$EndComp
Connection ~ 1550 4700
Connection ~ 1550 5000
$Comp
L Device:C C8
U 1 1 5FC4907D
P 1800 4850
F 0 "C8" H 1750 4600 50  0000 L CNN
F 1 ".1uF" H 1550 4750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1838 4700 50  0001 C CNN
F 3 "" H 1800 4850 50  0001 C CNN
	1    1800 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 5FC4E197
P 2250 4850
F 0 "C9" H 2200 4600 50  0000 L CNN
F 1 ".1uF" H 2000 4750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2288 4700 50  0001 C CNN
F 3 "" H 2250 4850 50  0001 C CNN
	1    2250 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 4700 1800 4700
Wire Wire Line
	1550 5000 1800 5000
Connection ~ 1800 4700
Wire Wire Line
	1800 4700 1950 4700
Connection ~ 1800 5000
$Comp
L Device:C C11
U 1 1 5FC6C6A4
P 10450 1450
F 0 "C11" H 10550 1350 50  0000 L CNN
F 1 ".1uF" H 10200 1350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10488 1300 50  0001 C CNN
F 3 "" H 10450 1450 50  0001 C CNN
	1    10450 1450
	1    0    0    -1  
$EndComp
Connection ~ 2250 4700
Wire Wire Line
	2250 4700 2550 4700
Wire Wire Line
	2150 4700 2250 4700
Wire Wire Line
	1800 5000 2000 5000
$Comp
L Device:C C13
U 1 1 5FD0BE05
P 2350 6700
F 0 "C13" H 2300 6450 50  0000 L CNN
F 1 "12pF" H 2150 6600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2388 6550 50  0001 C CNN
F 3 "" H 2350 6700 50  0001 C CNN
	1    2350 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 5FD10111
P 5050 6700
F 0 "C15" H 5000 6450 50  0000 L CNN
F 1 "20pF" H 4850 6600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5088 6550 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/Samsung-Electro-Mechanics-CL21C200JBANNNC_C1798.pdf" H 5050 6700 50  0001 C CNN
	1    5050 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:Ferrite_Bead_Small FB1
U 1 1 5EDA0C9B
P 2050 4700
F 0 "FB1" V 1900 4750 50  0000 C CNN
F 1 "Ferrite Bead" V 1800 4700 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1980 4700 50  0001 C CNN
F 3 "" H 2050 4700 50  0001 C CNN
	1    2050 4700
	0    1    1    0   
$EndComp
Text Notes 1750 4400 0    50   ~ 0
600Ohm @ 100MHz\n.3 Ohm DCR, 500 mA
Connection ~ 5050 6400
$Comp
L Device:R_US R11
U 1 1 5FF58AF6
P 5200 6400
F 0 "R11" V 4995 6400 50  0000 C CNN
F 1 "390" V 5086 6400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5240 6390 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/Uniroyal-Elec-0805W8F0000T5E_C17477.pdf" H 5200 6400 50  0001 C CNN
F 4 "C17477" V 5200 6400 50  0001 C CNN "LCSC"
	1    5200 6400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0130
U 1 1 60283AE3
P 2000 5000
F 0 "#PWR0130" H 2000 4750 50  0001 C CNN
F 1 "GND" H 2005 4827 50  0001 C CNN
F 2 "" H 2000 5000 50  0001 C CNN
F 3 "" H 2000 5000 50  0001 C CNN
	1    2000 5000
	1    0    0    -1  
$EndComp
Connection ~ 2000 5000
Wire Wire Line
	2000 5000 2250 5000
$Comp
L power:+3V0 #PWR0103
U 1 1 5EE41C60
P 2850 3250
F 0 "#PWR0103" H 2850 3100 50  0001 C CNN
F 1 "+3V0" H 2865 3423 50  0000 C CNN
F 2 "" H 2850 3250 50  0001 C CNN
F 3 "" H 2850 3250 50  0001 C CNN
	1    2850 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+3V0 #PWR0104
U 1 1 5EE49FD7
P 1050 4700
F 0 "#PWR0104" H 1050 4550 50  0001 C CNN
F 1 "+3V0" H 1065 4873 50  0000 C CNN
F 2 "" H 1050 4700 50  0001 C CNN
F 3 "" H 1050 4700 50  0001 C CNN
	1    1050 4700
	1    0    0    -1  
$EndComp
Connection ~ 1050 4700
Text Label 2350 4700 0    50   ~ 0
3VA
Text Label 6300 1100 0    50   ~ 0
3VA
$Comp
L power:+3V0 #PWR0105
U 1 1 5EE6658E
P 5900 1150
F 0 "#PWR0105" H 5900 1000 50  0001 C CNN
F 1 "+3V0" H 5915 1323 50  0000 C CNN
F 2 "" H 5900 1150 50  0001 C CNN
F 3 "" H 5900 1150 50  0001 C CNN
	1    5900 1150
	1    0    0    -1  
$EndComp
Connection ~ 5900 1150
$Comp
L power:+3V0 #PWR0122
U 1 1 5EE820EA
P 10450 1000
F 0 "#PWR0122" H 10450 850 50  0001 C CNN
F 1 "+3V0" H 10465 1173 50  0000 C CNN
F 2 "" H 10450 1000 50  0001 C CNN
F 3 "" H 10450 1000 50  0001 C CNN
	1    10450 1000
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0105
U 1 1 5EE9EE65
P 2550 4700
F 0 "#FLG0105" H 2550 4775 50  0001 C CNN
F 1 "PWR_FLAG" V 2550 4828 50  0000 L CNN
F 2 "" H 2550 4700 50  0001 C CNN
F 3 "~" H 2550 4700 50  0001 C CNN
	1    2550 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	5400 5900 5050 5900
Wire Wire Line
	4250 5900 4550 5900
Wire Wire Line
	2350 5900 2650 5900
Wire Wire Line
	1400 5900 1850 5900
Text Label 1450 5900 0    50   ~ 0
PC14
Wire Wire Line
	1850 6000 1550 6000
Wire Wire Line
	1550 6000 1550 6400
Wire Wire Line
	1550 6400 1850 6400
Connection ~ 1850 6400
Wire Wire Line
	2600 6000 2600 6400
Wire Wire Line
	2600 6400 2350 6400
Wire Wire Line
	2350 6000 2600 6000
Connection ~ 2350 6400
Wire Wire Line
	4550 6000 4250 6000
Wire Wire Line
	4250 6000 4250 6400
Wire Wire Line
	4250 6400 4550 6400
Connection ~ 4550 6400
Wire Wire Line
	5350 6400 5450 6400
Wire Wire Line
	5450 6400 5450 6000
Wire Wire Line
	5450 6000 5050 6000
Text Label 10650 2250 0    50   ~ 0
BOOT0
Wire Wire Line
	10300 2250 10900 2250
Text Label 10400 2250 0    50   ~ 0
PF11
$Comp
L power:GND #PWR0129
U 1 1 5FA2DF1A
P 10000 2250
F 0 "#PWR0129" H 10000 2000 50  0001 C CNN
F 1 "GND" H 10005 2077 50  0001 C CNN
F 2 "" H 10000 2250 50  0001 C CNN
F 3 "" H 10000 2250 50  0001 C CNN
	1    10000 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R10
U 1 1 5FDF31D4
P 10150 2250
F 0 "R10" V 9945 2250 50  0000 C CNN
F 1 "100K" V 10036 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10190 2240 50  0001 C CNN
F 3 "" H 10150 2250 50  0001 C CNN
	1    10150 2250
	0    1    1    0   
$EndComp
Wire Notes Line
	3550 4050 600  4050
Wire Notes Line
	600  2600 3550 2600
Wire Notes Line
	3550 550  600  550 
Wire Notes Line
	6050 5300 6050 7450
Wire Notes Line
	600  5300 6050 5300
Wire Notes Line
	3550 550  3550 7450
Wire Notes Line
	600  550  600  7450
Wire Notes Line
	600  7450 6050 7450
$Comp
L Device:C C5
U 1 1 5FC47BBA
P 1050 4850
F 0 "C5" H 1000 4600 50  0000 L CNN
F 1 ".1uF" H 800 4750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1088 4700 50  0001 C CNN
F 3 "" H 1050 4850 50  0001 C CNN
	1    1050 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 5F938E16
P 1850 6700
F 0 "C12" H 1800 6450 50  0000 L CNN
F 1 "12pF" H 1650 6600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1888 6550 50  0001 C CNN
F 3 "" H 1850 6700 50  0001 C CNN
	1    1850 6700
	1    0    0    -1  
$EndComp
Text Notes 2900 1700 0    50   ~ 0
(nominal: 4.6 V)
Text Notes 2800 3000 0    50   ~ 0
(nominal: 2.95 V)
Wire Wire Line
	4850 2800 5500 2800
Text Label 4850 2800 0    50   ~ 0
BOOT0
Wire Wire Line
	1650 3900 1650 3850
Text Label 7050 3700 0    50   ~ 0
PB5
Text Label 7050 3500 0    50   ~ 0
PB3
Wire Wire Line
	6800 3500 7250 3500
Wire Wire Line
	6800 4000 7250 4000
Wire Wire Line
	6800 3800 7250 3800
Text Label 7050 4000 0    50   ~ 0
PB8
Text Label 7050 3900 0    50   ~ 0
PB7
Wire Wire Line
	6800 3900 7250 3900
Text Label 7050 3800 0    50   ~ 0
PB6
Wire Wire Line
	9000 3350 8000 3350
$Comp
L Connector_Generic:Conn_01x06 J8
U 1 1 61A9002D
P 9200 3250
F 0 "J8" H 9118 2725 50  0000 C CNN
F 1 "LCD" H 9118 2816 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 9200 3250 50  0001 C CNN
F 3 "~" H 9200 3250 50  0001 C CNN
	1    9200 3250
	1    0    0    1   
$EndComp
Wire Wire Line
	8000 3450 8000 3500
Wire Wire Line
	9000 3450 8000 3450
Wire Wire Line
	9000 3250 8200 3250
Wire Wire Line
	8200 3150 9000 3150
Wire Wire Line
	9000 3050 8200 3050
Wire Wire Line
	8200 2950 9000 2950
Text Label 8200 2950 0    50   ~ 0
PB3
Text Label 8650 2950 0    50   ~ 0
SPI_SCK
Text Label 8650 3050 0    50   ~ 0
SPI_CS
Text Label 8200 3050 0    50   ~ 0
PB8
Text Label 8200 3150 0    50   ~ 0
PB14
Text Label 8650 3150 0    50   ~ 0
LCD_DC
Text Label 8200 3250 0    50   ~ 0
PB5
Text Label 8650 3250 0    50   ~ 0
SPI_MOSI
$Comp
L power:+5V #PWR0109
U 1 1 61AC7A7A
P 8000 3350
F 0 "#PWR0109" H 8000 3200 50  0001 C CNN
F 1 "+5V" H 8015 3523 50  0000 C CNN
F 2 "" H 8000 3350 50  0001 C CNN
F 3 "" H 8000 3350 50  0001 C CNN
	1    8000 3350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J9
U 1 1 61AC8CE8
P 10650 5800
F 0 "J9" H 10730 5792 50  0000 L CNN
F 1 "Keypad" H 10730 5701 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 10650 5800 50  0001 C CNN
F 3 "~" H 10650 5800 50  0001 C CNN
	1    10650 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 5900 9450 5900
$Comp
L power:GND #PWR0112
U 1 1 61ACB46F
P 9450 6050
F 0 "#PWR0112" H 9450 5800 50  0001 C CNN
F 1 "GND" H 9455 5877 50  0001 C CNN
F 2 "" H 9450 6050 50  0001 C CNN
F 3 "" H 9450 6050 50  0001 C CNN
	1    9450 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 6000 9450 6050
Wire Wire Line
	10450 6000 9450 6000
$Comp
L power:+5V #PWR0113
U 1 1 61ACB47B
P 9450 5900
F 0 "#PWR0113" H 9450 5750 50  0001 C CNN
F 1 "+5V" H 9465 6073 50  0000 C CNN
F 2 "" H 9450 5900 50  0001 C CNN
F 3 "" H 9450 5900 50  0001 C CNN
	1    9450 5900
	1    0    0    -1  
$EndComp
$Comp
L power:+3V0 #PWR0117
U 1 1 61ADBAFE
P 10400 5250
F 0 "#PWR0117" H 10400 5100 50  0001 C CNN
F 1 "+3V0" H 10415 5423 50  0000 C CNN
F 2 "" H 10400 5250 50  0001 C CNN
F 3 "" H 10400 5250 50  0001 C CNN
	1    10400 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R5
U 1 1 61ADC87F
P 10400 5450
F 0 "R5" H 10468 5496 50  0000 L CNN
F 1 "470" H 10468 5405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10440 5440 50  0001 C CNN
F 3 "" H 10400 5450 50  0001 C CNN
	1    10400 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R4
U 1 1 61ADDAAD
P 10300 5450
F 0 "R4" H 10368 5496 50  0000 L CNN
F 1 "470" H 10368 5405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10340 5440 50  0001 C CNN
F 3 "" H 10300 5450 50  0001 C CNN
	1    10300 5450
	-1   0    0    1   
$EndComp
Wire Wire Line
	10300 5300 10400 5300
Wire Wire Line
	10400 5250 10400 5300
Connection ~ 10400 5300
Wire Wire Line
	10300 5600 10300 5700
Wire Wire Line
	10300 5700 10450 5700
Wire Wire Line
	10450 5800 10400 5800
Wire Wire Line
	10400 5800 10400 5600
Wire Wire Line
	10300 5700 9600 5700
Connection ~ 10300 5700
Wire Wire Line
	9600 5800 10400 5800
Connection ~ 10400 5800
Text Label 9600 5700 0    50   ~ 0
PB6
Text Label 9600 5800 0    50   ~ 0
PB7
Text Label 9900 5700 0    50   ~ 0
I2C_SCL
Text Label 9900 5800 0    50   ~ 0
I2C_SDA
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 61B03F1B
P 8700 5050
F 0 "J2" H 8780 5042 50  0000 L CNN
F 1 "Audio" H 8780 4951 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 8700 5050 50  0001 C CNN
F 3 "~" H 8700 5050 50  0001 C CNN
	1    8700 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 61B050FA
P 8250 4950
F 0 "C10" V 8021 4950 50  0000 C CNN
F 1 "1uF" V 8112 4950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8250 4950 50  0001 C CNN
F 3 "~" H 8250 4950 50  0001 C CNN
	1    8250 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	8350 4950 8400 4950
Wire Wire Line
	8500 5050 8400 5050
Wire Wire Line
	8400 5050 8400 4950
Connection ~ 8400 4950
Wire Wire Line
	8400 4950 8500 4950
Wire Wire Line
	8500 5150 8400 5150
Wire Wire Line
	8400 5150 8400 5250
Wire Wire Line
	8500 5250 8400 5250
Connection ~ 8400 5250
Wire Wire Line
	8400 5250 7950 5250
$Comp
L power:GND #PWR0118
U 1 1 61B1AA5E
P 7950 5300
F 0 "#PWR0118" H 7950 5050 50  0001 C CNN
F 1 "GND" H 7955 5127 50  0001 C CNN
F 2 "" H 7950 5300 50  0001 C CNN
F 3 "" H 7950 5300 50  0001 C CNN
	1    7950 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 5250 7950 5300
Wire Wire Line
	8150 4950 7600 4950
Text Label 7600 4950 0    50   ~ 0
PA4
Text Label 7950 4950 0    50   ~ 0
DAC
Wire Wire Line
	8500 5950 8400 5950
Wire Wire Line
	8400 5950 8400 6050
Wire Wire Line
	8500 6050 8400 6050
Connection ~ 8400 6050
Wire Wire Line
	8400 6050 7950 6050
$Comp
L power:GND #PWR0119
U 1 1 61B53CAF
P 7950 6100
F 0 "#PWR0119" H 7950 5850 50  0001 C CNN
F 1 "GND" H 7955 5927 50  0001 C CNN
F 2 "" H 7950 6100 50  0001 C CNN
F 3 "" H 7950 6100 50  0001 C CNN
	1    7950 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 6050 7950 6100
NoConn ~ 8500 5550
Wire Wire Line
	8500 5750 7950 5750
Text Label 7950 5750 0    50   ~ 0
PD2
Wire Wire Line
	8500 5650 7950 5650
Text Label 7950 5650 0    50   ~ 0
PC12
$Comp
L Connector_Generic:Conn_01x06 J6
U 1 1 61B4C8B1
P 8700 5850
F 0 "J6" H 8800 5750 50  0000 C CNN
F 1 "UART" H 8850 5850 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 8700 5850 50  0001 C CNN
F 3 "~" H 8700 5850 50  0001 C CNN
	1    8700 5850
	1    0    0    1   
$EndComp
NoConn ~ 8500 5850
Wire Wire Line
	5500 4400 5000 4400
Text Label 5000 4400 0    50   ~ 0
PC12
Wire Wire Line
	9050 4450 9050 4500
Wire Wire Line
	9050 4250 9050 4200
$Comp
L power:GND #PWR0120
U 1 1 61A9582D
P 8000 3500
F 0 "#PWR0120" H 8000 3250 50  0001 C CNN
F 1 "GND" H 8005 3327 50  0001 C CNN
F 2 "" H 8000 3500 50  0001 C CNN
F 3 "" H 8000 3500 50  0001 C CNN
	1    8000 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C16
U 1 1 61B929DE
P 9050 4350
F 0 "C16" H 9142 4396 50  0000 L CNN
F 1 "10uF" H 9142 4305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9050 4350 50  0001 C CNN
F 3 "~" H 9050 4350 50  0001 C CNN
	1    9050 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C17
U 1 1 61B971FF
P 9350 4350
F 0 "C17" H 9442 4396 50  0000 L CNN
F 1 "10uF" H 9442 4305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9350 4350 50  0001 C CNN
F 3 "~" H 9350 4350 50  0001 C CNN
	1    9350 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 4200 9200 4200
Wire Wire Line
	9350 4200 9350 4250
Wire Wire Line
	9050 4500 9200 4500
Wire Wire Line
	9350 4500 9350 4450
Wire Wire Line
	9200 4200 9200 4150
Connection ~ 9200 4200
Wire Wire Line
	9200 4200 9350 4200
Wire Wire Line
	9200 4500 9200 4550
Connection ~ 9200 4500
Wire Wire Line
	9200 4500 9350 4500
$Comp
L power:GND #PWR0121
U 1 1 61BB0FAC
P 9200 4550
F 0 "#PWR0121" H 9200 4300 50  0001 C CNN
F 1 "GND" H 9205 4377 50  0001 C CNN
F 2 "" H 9200 4550 50  0001 C CNN
F 3 "" H 9200 4550 50  0001 C CNN
	1    9200 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0123
U 1 1 61BB12A2
P 9200 4150
F 0 "#PWR0123" H 9200 4000 50  0001 C CNN
F 1 "+5V" H 9215 4323 50  0000 C CNN
F 2 "" H 9200 4150 50  0001 C CNN
F 3 "" H 9200 4150 50  0001 C CNN
	1    9200 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 4450 9800 4500
Wire Wire Line
	9800 4250 9800 4200
$Comp
L Device:C_Small C18
U 1 1 61C02F86
P 9800 4350
F 0 "C18" H 9892 4396 50  0000 L CNN
F 1 "10uF" H 9892 4305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9800 4350 50  0001 C CNN
F 3 "~" H 9800 4350 50  0001 C CNN
	1    9800 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C19
U 1 1 61C02F90
P 10100 4350
F 0 "C19" H 10192 4396 50  0000 L CNN
F 1 "10uF" H 10192 4305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10100 4350 50  0001 C CNN
F 3 "~" H 10100 4350 50  0001 C CNN
	1    10100 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 4200 9950 4200
Wire Wire Line
	10100 4200 10100 4250
Wire Wire Line
	9800 4500 9950 4500
Wire Wire Line
	10100 4500 10100 4450
Wire Wire Line
	9950 4200 9950 4150
Connection ~ 9950 4200
Wire Wire Line
	9950 4200 10100 4200
Wire Wire Line
	9950 4500 9950 4550
Connection ~ 9950 4500
Wire Wire Line
	9950 4500 10100 4500
$Comp
L power:GND #PWR0124
U 1 1 61C02FA4
P 9950 4550
F 0 "#PWR0124" H 9950 4300 50  0001 C CNN
F 1 "GND" H 9955 4377 50  0001 C CNN
F 2 "" H 9950 4550 50  0001 C CNN
F 3 "" H 9950 4550 50  0001 C CNN
	1    9950 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0125
U 1 1 61C02FAE
P 9950 4150
F 0 "#PWR0125" H 9950 4000 50  0001 C CNN
F 1 "+5V" H 9965 4323 50  0000 C CNN
F 2 "" H 9950 4150 50  0001 C CNN
F 3 "" H 9950 4150 50  0001 C CNN
	1    9950 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 4450 10500 4500
Wire Wire Line
	10500 4250 10500 4200
$Comp
L Device:C_Small C20
U 1 1 61C0C7C9
P 10500 4350
F 0 "C20" H 10592 4396 50  0000 L CNN
F 1 "0.1uF" H 10592 4305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10500 4350 50  0001 C CNN
F 3 "~" H 10500 4350 50  0001 C CNN
	1    10500 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C21
U 1 1 61C0C7CF
P 10800 4350
F 0 "C21" H 10892 4396 50  0000 L CNN
F 1 "0.1uF" H 10892 4305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10800 4350 50  0001 C CNN
F 3 "~" H 10800 4350 50  0001 C CNN
	1    10800 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 4200 10650 4200
Wire Wire Line
	10800 4200 10800 4250
Wire Wire Line
	10500 4500 10650 4500
Wire Wire Line
	10800 4500 10800 4450
Wire Wire Line
	10650 4200 10650 4150
Connection ~ 10650 4200
Wire Wire Line
	10650 4200 10800 4200
Wire Wire Line
	10650 4500 10650 4550
Connection ~ 10650 4500
Wire Wire Line
	10650 4500 10800 4500
$Comp
L power:GND #PWR0126
U 1 1 61C0C7DF
P 10650 4550
F 0 "#PWR0126" H 10650 4300 50  0001 C CNN
F 1 "GND" H 10655 4377 50  0001 C CNN
F 2 "" H 10650 4550 50  0001 C CNN
F 3 "" H 10650 4550 50  0001 C CNN
	1    10650 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0131
U 1 1 61C0C7E5
P 10650 4150
F 0 "#PWR0131" H 10650 4000 50  0001 C CNN
F 1 "+5V" H 10665 4323 50  0000 C CNN
F 2 "" H 10650 4150 50  0001 C CNN
F 3 "" H 10650 4150 50  0001 C CNN
	1    10650 4150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J10
U 1 1 61C1E983
P 10700 3150
F 0 "J10" H 10780 3142 50  0000 L CNN
F 1 "Touch" H 10780 3051 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 10700 3150 50  0001 C CNN
F 3 "~" H 10700 3150 50  0001 C CNN
	1    10700 3150
	1    0    0    -1  
$EndComp
NoConn ~ 1450 1300
$Comp
L Connector:USB_B_Micro J1
U 1 1 61C3919D
P 1350 2050
F 0 "J1" H 1050 2100 50  0000 C CNN
F 1 "USB_B_Micro" H 900 2200 50  0000 C CNN
F 2 "Connector_USB:USB_Micro-B_Molex_47346-0001" H 1500 2000 50  0001 C CNN
F 3 "~" H 1500 2000 50  0001 C CNN
	1    1350 2050
	1    0    0    -1  
$EndComp
NoConn ~ 1650 2050
NoConn ~ 1650 2150
NoConn ~ 1650 2250
Wire Wire Line
	1250 2450 1300 2450
$Comp
L power:GND #PWR0132
U 1 1 61CBAB5A
P 1300 2450
F 0 "#PWR0132" H 1300 2200 50  0001 C CNN
F 1 "GND" H 1305 2277 50  0001 C CNN
F 2 "" H 1300 2450 50  0001 C CNN
F 3 "" H 1300 2450 50  0001 C CNN
	1    1300 2450
	1    0    0    -1  
$EndComp
Connection ~ 1300 2450
Wire Wire Line
	1300 2450 1350 2450
Wire Wire Line
	9700 3050 10500 3050
Text Label 9700 3050 0    50   ~ 0
PA0
Wire Wire Line
	10500 3150 9700 3150
Wire Wire Line
	9700 3250 10500 3250
Wire Wire Line
	10500 3350 9700 3350
Text Label 9700 3150 0    50   ~ 0
PA1
Text Label 9700 3250 0    50   ~ 0
PA2
Text Label 9700 3350 0    50   ~ 0
PA3
$Comp
L power:+3V0 #PWR0133
U 1 1 61D15E46
P 7400 1250
F 0 "#PWR0133" H 7400 1100 50  0001 C CNN
F 1 "+3V0" H 7415 1423 50  0000 C CNN
F 2 "" H 7400 1250 50  0001 C CNN
F 3 "" H 7400 1250 50  0001 C CNN
	1    7400 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 1350 7550 1350
Wire Wire Line
	8100 1550 7700 1550
Text Label 7550 1550 0    50   ~ 0
SD_SPI_MISO
Text Label 7550 1350 0    50   ~ 0
SD_SPI_CLK
Wire Wire Line
	8100 1450 7400 1450
Wire Wire Line
	7400 1450 7400 1550
$Comp
L power:GND #PWR0134
U 1 1 61D31FF4
P 7400 1550
F 0 "#PWR0134" H 7400 1300 50  0001 C CNN
F 1 "GND" H 7405 1377 50  0001 C CNN
F 2 "" H 7400 1550 50  0001 C CNN
F 3 "" H 7400 1550 50  0001 C CNN
	1    7400 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 1250 8100 1250
Wire Wire Line
	8100 1150 7550 1150
Text Label 7550 1150 0    50   ~ 0
SD_SPI_MOSI
Wire Wire Line
	8100 1050 7550 1050
Text Label 7550 1050 0    50   ~ 0
SD_SPI_CS
$Comp
L Connector:Micro_SD_Card J7
U 1 1 61CE0D0A
P 9000 1250
F 0 "J7" H 8950 1967 50  0000 C CNN
F 1 "Micro_SD_Card" H 8950 1876 50  0000 C CNN
F 2 "Connector_Card:microSD_HC_Wuerth_693072010801" H 10150 1550 50  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/693072010801.pdf" H 9000 1250 50  0001 C CNN
	1    9000 1250
	1    0    0    -1  
$EndComp
NoConn ~ 8100 950 
NoConn ~ 8100 1650
$Comp
L power:GND #PWR0135
U 1 1 61D81708
P 9800 1900
F 0 "#PWR0135" H 9800 1650 50  0001 C CNN
F 1 "GND" H 9805 1727 50  0001 C CNN
F 2 "" H 9800 1900 50  0001 C CNN
F 3 "" H 9800 1900 50  0001 C CNN
	1    9800 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 1900 9800 1850
Wire Wire Line
	5500 3400 4850 3400
Wire Wire Line
	5500 3500 4850 3500
Text Label 4850 3400 0    50   ~ 0
SD_SPI_MISO
Text Label 4850 3500 0    50   ~ 0
SD_SPI_MOSI
Wire Wire Line
	6800 4400 7250 4400
Wire Wire Line
	6800 4500 7250 4500
Text Label 7250 4400 2    50   ~ 0
SD_SPI_CS
Text Label 7250 4500 2    50   ~ 0
SD_SPI_CLK
NoConn ~ 6800 2000
NoConn ~ 6800 2100
NoConn ~ 6800 2200
NoConn ~ 6800 2300
NoConn ~ 6800 2400
NoConn ~ 6800 2500
NoConn ~ 6800 2600
NoConn ~ 6800 2700
NoConn ~ 6800 3000
NoConn ~ 6800 3200
NoConn ~ 6800 3300
NoConn ~ 6800 3400
NoConn ~ 6800 3600
NoConn ~ 6800 4100
NoConn ~ 6800 4200
NoConn ~ 6800 4300
NoConn ~ 6800 4700
NoConn ~ 5500 4500
NoConn ~ 5500 4300
NoConn ~ 5500 4200
NoConn ~ 5500 4100
NoConn ~ 5500 4000
NoConn ~ 5500 3900
NoConn ~ 5500 3800
NoConn ~ 5500 3700
NoConn ~ 5500 3600
NoConn ~ 5500 3300
NoConn ~ 5500 3200
Wire Wire Line
	1250 3550 1100 3550
Wire Wire Line
	1100 3550 1100 3850
Wire Wire Line
	1100 3850 1650 3850
Connection ~ 1650 3850
Wire Wire Line
	1650 3850 2200 3850
Wire Wire Line
	2200 3850 2200 3550
Connection ~ 2200 3550
Wire Wire Line
	2200 3550 2350 3550
Connection ~ 1100 3550
$Comp
L Diode:BAT60A D3
U 1 1 61AAE270
P 1650 3700
F 0 "D3" V 1600 3500 50  0000 C CNN
F 1 "BAT60JFILM" V 1550 3450 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323" H 1650 3525 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/Infineon-BAT60ASERIES-DS-v01_01-en.pdf?fileId=db3a304313d846880113def70c9304a9" H 1650 3700 50  0001 C CNN
	1    1650 3700
	0    -1   -1   0   
$EndComp
NoConn ~ 1950 1300
Text Label 7200 1500 2    50   ~ 0
PA0
Text Label 7200 1600 2    50   ~ 0
PA1
Text Label 7200 1700 2    50   ~ 0
PA2
Text Label 7200 1800 2    50   ~ 0
PA3
Wire Wire Line
	6300 1300 6300 1000
Wire Wire Line
	6100 4900 6200 4900
Wire Wire Line
	6200 4900 6300 4900
Connection ~ 6200 4900
Wire Wire Line
	5900 4900 6000 4900
Wire Wire Line
	6000 4900 6100 4900
Connection ~ 6000 4900
$Comp
L MCU_ST_STM32F0:STM32F091RCTx U2
U 1 1 5EE02F8A
P 6200 3100
F 0 "U2" H 5450 4200 50  0000 C CNN
F 1 "STM32F091RCTx" H 6050 4200 50  0000 C CNN
F 2 "Package_QFP:LQFP-64_10x10mm_P0.5mm" H 5600 1400 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00115237.pdf" H 6200 3100 50  0001 C CNN
	1    6200 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 1500 7250 1500
Wire Wire Line
	6800 1600 7250 1600
Wire Wire Line
	7250 1700 6800 1700
Wire Wire Line
	6800 1800 7250 1800
Text Label 5000 4600 0    50   ~ 0
PC14
Text Label 5000 4700 0    50   ~ 0
PC15
Wire Wire Line
	5000 4600 5500 4600
Wire Wire Line
	5500 4700 5000 4700
Wire Wire Line
	1850 5900 1850 6000
Wire Wire Line
	2350 5900 2350 6000
Wire Wire Line
	4550 5900 4550 6000
Wire Wire Line
	5050 5900 5050 6000
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 62019E02
P 1650 3550
F 0 "#FLG0101" H 1650 3625 50  0001 C CNN
F 1 "PWR_FLAG" H 1350 3700 50  0000 L CNN
F 2 "" H 1650 3550 50  0001 C CNN
F 3 "~" H 1650 3550 50  0001 C CNN
	1    1650 3550
	0    -1   -1   0   
$EndComp
Connection ~ 1650 3550
$Comp
L Regulator_Linear:LD1117S33TR_SOT223 U1
U 1 1 5EDB56F5
P 1650 3250
F 0 "U1" H 1650 3492 50  0000 C CNN
F 1 "LD1117S33TR_SOT223" H 1650 3401 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 1650 3450 50  0001 C CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00000544.pdf" H 1750 3000 50  0001 C CNN
	1    1650 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1850 2600 1850
$Comp
L Device:R_US R6
U 1 1 61C2579F
P 7700 1850
F 0 "R6" H 7768 1896 50  0000 L CNN
F 1 "10K" H 7768 1805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7740 1840 50  0001 C CNN
F 3 "" H 7700 1850 50  0001 C CNN
	1    7700 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+3V0 #PWR01
U 1 1 61C272C2
P 7500 2000
F 0 "#PWR01" H 7500 1850 50  0001 C CNN
F 1 "+3V0" H 7515 2173 50  0000 C CNN
F 2 "" H 7500 2000 50  0001 C CNN
F 3 "" H 7500 2000 50  0001 C CNN
	1    7500 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 2000 7700 2000
Wire Wire Line
	7700 1700 7700 1550
Connection ~ 7700 1550
Wire Wire Line
	7700 1550 7550 1550
$EndSCHEMATC
