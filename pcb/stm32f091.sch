EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "STM32F091 Dev Board"
Date "2020-06-22"
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
P 10150 1200
F 0 "R3" H 10218 1246 50  0000 L CNN
F 1 "100K" H 10218 1155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10190 1190 50  0001 C CNN
F 3 "" H 10150 1200 50  0001 C CNN
	1    10150 1200
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5ED97CD6
P 9850 1350
F 0 "SW1" H 9850 1543 50  0000 C CNN
F 1 "SW_Push" H 9850 1544 50  0001 C CNN
F 2 "Button_Switch_SMD:SW_SPST_PTS645" H 9850 1550 50  0001 C CNN
F 3 "" H 9850 1550 50  0001 C CNN
	1    9850 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 1350 10150 1350
Connection ~ 10150 1350
$Comp
L power:GND #PWR0101
U 1 1 5ED98EE6
P 10150 1650
F 0 "#PWR0101" H 10150 1400 50  0001 C CNN
F 1 "GND" H 10155 1477 50  0001 C CNN
F 2 "" H 10150 1650 50  0001 C CNN
F 3 "" H 10150 1650 50  0001 C CNN
	1    10150 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5ED98F64
P 9650 1350
F 0 "#PWR0102" H 9650 1100 50  0001 C CNN
F 1 "GND" H 9655 1177 50  0001 C CNN
F 2 "" H 9650 1350 50  0001 C CNN
F 3 "" H 9650 1350 50  0001 C CNN
	1    9650 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 1350 10550 1350
Text Label 10350 1350 0    50   ~ 0
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
Wire Wire Line
	1950 1300 2500 1300
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
Wire Wire Line
	1450 1300 1350 1300
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
	950  3550 1250 3550
Wire Wire Line
	1250 3550 1650 3550
Connection ~ 1250 3550
Connection ~ 1650 3550
Wire Wire Line
	950  3250 1250 3250
Wire Wire Line
	1350 3250 1250 3250
Connection ~ 1250 3250
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5EDC3E22
P 1350 1700
F 0 "#FLG0101" H 1350 1775 50  0001 C CNN
F 1 "PWR_FLAG" V 1350 1827 50  0000 L CNN
F 2 "" H 1350 1700 50  0001 C CNN
F 3 "~" H 1350 1700 50  0001 C CNN
	1    1350 1700
	0    -1   -1   0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5EDC4FA2
P 2600 1000
F 0 "#FLG0102" H 2600 1075 50  0001 C CNN
F 1 "PWR_FLAG" H 2600 1150 50  0000 C CNN
F 2 "" H 2600 1000 50  0001 C CNN
F 3 "~" H 2600 1000 50  0001 C CNN
	1    2600 1000
	0    1    1    0   
$EndComp
Connection ~ 2600 1000
Text Label 1000 1300 0    50   ~ 0
U5V
Text Label 2150 1300 0    50   ~ 0
U5V
$Comp
L Diode:BAT60A D1
U 1 1 5EDEB2B3
P 1650 1700
F 0 "D1" H 1650 1483 50  0000 C CNN
F 1 "BAT60JFILM" H 1650 1574 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323" H 1650 1525 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/Infineon-BAT60ASERIES-DS-v01_01-en.pdf?fileId=db3a304313d846880113def70c9304a9" H 1650 1700 50  0001 C CNN
	1    1650 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	1350 1300 1350 1700
Wire Wire Line
	1350 1700 1500 1700
Connection ~ 1350 1300
Wire Wire Line
	1350 1300 1000 1300
Wire Wire Line
	2500 1700 2350 1700
Connection ~ 1350 1700
$Comp
L power:+5V #PWR0110
U 1 1 5EDF8A88
P 2500 1700
F 0 "#PWR0110" H 2500 1550 50  0001 C CNN
F 1 "+5V" H 2515 1873 50  0000 C CNN
F 2 "" H 2500 1700 50  0001 C CNN
F 3 "" H 2500 1700 50  0001 C CNN
	1    2500 1700
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
	6800 1700 7250 1700
Wire Wire Line
	6800 1800 7250 1800
Wire Wire Line
	6800 1900 7250 1900
Wire Wire Line
	6800 2000 7250 2000
Wire Wire Line
	6800 2100 7250 2100
Wire Wire Line
	6800 2200 7250 2200
Wire Wire Line
	6800 2300 7250 2300
Wire Wire Line
	6800 2400 7250 2400
Wire Wire Line
	6800 2500 7250 2500
Wire Wire Line
	6800 2600 7250 2600
Wire Wire Line
	6800 2700 7250 2700
Wire Wire Line
	6800 2800 7250 2800
Wire Wire Line
	6800 2900 7250 2900
Wire Wire Line
	6800 3000 7250 3000
Wire Wire Line
	6800 3200 7250 3200
Wire Wire Line
	6800 3300 7250 3300
Wire Wire Line
	6800 3400 7250 3400
Wire Wire Line
	6800 3500 7250 3500
Wire Wire Line
	6800 3600 7250 3600
Wire Wire Line
	6800 3700 7250 3700
Wire Wire Line
	6800 3800 7250 3800
Wire Wire Line
	6800 3900 7250 3900
Wire Wire Line
	6800 4000 7250 4000
Wire Wire Line
	6800 4100 7250 4100
Wire Wire Line
	6800 4200 7250 4200
Wire Wire Line
	6800 4300 7250 4300
Wire Wire Line
	6800 4400 7250 4400
Wire Wire Line
	6800 4500 7250 4500
Wire Wire Line
	6800 4600 7250 4600
Wire Wire Line
	6800 4700 7250 4700
Wire Wire Line
	5500 2600 5050 2600
Wire Wire Line
	5500 2700 5050 2700
Wire Wire Line
	5500 3000 5050 3000
Wire Wire Line
	5500 3200 5050 3200
Wire Wire Line
	5500 3300 5050 3300
Wire Wire Line
	5500 3400 5050 3400
Wire Wire Line
	5500 3500 5050 3500
Wire Wire Line
	5500 3600 5050 3600
Wire Wire Line
	5500 3700 5050 3700
Wire Wire Line
	5500 3800 5050 3800
Wire Wire Line
	5500 3900 5050 3900
Wire Wire Line
	5500 4000 5050 4000
Wire Wire Line
	5500 4100 5050 4100
Wire Wire Line
	5500 4200 5050 4200
Wire Wire Line
	5500 4300 5050 4300
Wire Wire Line
	5500 4400 5050 4400
Wire Wire Line
	5500 4500 5050 4500
Wire Wire Line
	5500 4600 5050 4600
Wire Wire Line
	5500 4700 5050 4700
Wire Wire Line
	5500 1500 5050 1500
Text Label 7050 1500 0    50   ~ 0
PA0
Text Label 7050 1600 0    50   ~ 0
PA1
Text Label 7050 1700 0    50   ~ 0
PA2
Text Label 7050 1800 0    50   ~ 0
PA3
Text Label 7050 1900 0    50   ~ 0
PA4
Text Label 7050 2000 0    50   ~ 0
PA5
Text Label 7050 2100 0    50   ~ 0
PA6
Text Label 7050 2200 0    50   ~ 0
PA7
Text Label 7050 2300 0    50   ~ 0
PA8
Text Label 7050 2400 0    50   ~ 0
PA9
Text Label 7050 2500 0    50   ~ 0
PA10
Text Label 7050 2600 0    50   ~ 0
PA11
Text Label 7050 2700 0    50   ~ 0
PA12
Text Label 7050 2800 0    50   ~ 0
PA13
Text Label 7050 2900 0    50   ~ 0
PA14
Text Label 7050 3000 0    50   ~ 0
PA15
Text Label 7050 3200 0    50   ~ 0
PB0
Text Label 7050 3300 0    50   ~ 0
PB1
Text Label 7050 3400 0    50   ~ 0
PB2
Text Label 7050 3500 0    50   ~ 0
PB3
Text Label 7050 3600 0    50   ~ 0
PB4
Text Label 7050 3700 0    50   ~ 0
PB5
Text Label 7050 3800 0    50   ~ 0
PB6
Text Label 7050 3900 0    50   ~ 0
PB7
Text Label 7050 4000 0    50   ~ 0
PB8
Text Label 7050 4100 0    50   ~ 0
PB9
Text Label 7050 4200 0    50   ~ 0
PB10
Text Label 7050 4300 0    50   ~ 0
PB11
Text Label 7050 4400 0    50   ~ 0
PB12
Text Label 7050 4500 0    50   ~ 0
PB13
Text Label 7050 4600 0    50   ~ 0
PB14
Text Label 7050 4700 0    50   ~ 0
PB15
Text Label 5150 3200 0    50   ~ 0
PC0
Text Label 5150 3300 0    50   ~ 0
PC1
Text Label 5150 3400 0    50   ~ 0
PC2
Text Label 5150 3500 0    50   ~ 0
PC3
Text Label 5150 3600 0    50   ~ 0
PC4
Text Label 5150 3700 0    50   ~ 0
PC5
Text Label 5150 3800 0    50   ~ 0
PC6
Text Label 5150 3900 0    50   ~ 0
PC7
Text Label 5150 4000 0    50   ~ 0
PC8
Text Label 5150 4100 0    50   ~ 0
PC9
Text Label 5150 4200 0    50   ~ 0
PC10
Text Label 5150 4300 0    50   ~ 0
PC11
Text Label 5150 4400 0    50   ~ 0
PC12
Text Label 5150 4500 0    50   ~ 0
PC13
Text Label 5150 4600 0    50   ~ 0
PC14
Text Label 5150 4700 0    50   ~ 0
PC15
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
Wire Wire Line
	6300 1300 6300 1000
Wire Wire Line
	5900 4900 6000 4900
Wire Wire Line
	6000 4900 6100 4900
Connection ~ 6000 4900
Wire Wire Line
	6100 4900 6200 4900
Connection ~ 6100 4900
Wire Wire Line
	6200 4900 6300 4900
Connection ~ 6200 4900
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
P 2350 1850
F 0 "R1" H 2418 1896 50  0000 L CNN
F 1 "5.1k" H 2418 1805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2390 1840 50  0001 C CNN
F 3 "" H 2350 1850 50  0001 C CNN
	1    2350 1850
	1    0    0    -1  
$EndComp
Connection ~ 2350 1700
Wire Wire Line
	2350 1700 1800 1700
$Comp
L Device:LED_Small_ALT LD1
U 1 1 5EFAAEE8
P 2350 2100
F 0 "LD1" V 2396 2030 50  0000 R CNN
F 1 "LED_Red" V 2305 2030 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 2350 2100 50  0001 C CNN
F 3 "" V 2350 2100 50  0001 C CNN
	1    2350 2100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5EFAB7DD
P 2350 2200
F 0 "#PWR0115" H 2350 1950 50  0001 C CNN
F 1 "GND" H 2355 2027 50  0001 C CNN
F 2 "" H 2350 2200 50  0001 C CNN
F 3 "" H 2350 2200 50  0001 C CNN
	1    2350 2200
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
P 2500 1700
F 0 "#FLG0103" H 2500 1775 50  0001 C CNN
F 1 "PWR_FLAG" V 2500 1828 50  0000 L CNN
F 2 "" H 2500 1700 50  0001 C CNN
F 3 "~" H 2500 1700 50  0001 C CNN
	1    2500 1700
	0    1    1    0   
$EndComp
Connection ~ 2500 1700
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
Text Notes 1700 2150 0    50   ~ 0
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
Wire Wire Line
	1650 3550 2050 3550
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
Connection ~ 2050 3550
Wire Wire Line
	2050 3550 2350 3550
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
P 10150 1500
F 0 "C11" H 10250 1400 50  0000 L CNN
F 1 ".1uF" H 9900 1400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10188 1350 50  0001 C CNN
F 3 "" H 10150 1500 50  0001 C CNN
	1    10150 1500
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
Text Label 2400 5800 0    50   ~ 0
XPC15
Text Label 4250 5800 0    50   ~ 0
XPF0
Text Label 5200 5800 0    50   ~ 0
XPF1
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
P 10150 1050
F 0 "#PWR0122" H 10150 900 50  0001 C CNN
F 1 "+3V0" H 10165 1223 50  0000 C CNN
F 2 "" H 10150 1050 50  0001 C CNN
F 3 "" H 10150 1050 50  0001 C CNN
	1    10150 1050
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
	5400 5800 5050 5800
Wire Wire Line
	4250 5900 4550 5900
Wire Wire Line
	4250 5800 4550 5800
Wire Wire Line
	2350 5900 2650 5900
Wire Wire Line
	2350 5800 2650 5800
Wire Wire Line
	1400 5900 1850 5900
Wire Wire Line
	1400 5800 1850 5800
Text Label 1450 5800 0    50   ~ 0
XPC14
Text Label 1450 5900 0    50   ~ 0
PC14
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J4
U 1 1 5F2DE9C8
P 2050 5900
F 0 "J4" H 2100 6217 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 2100 6126 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x03_P1.27mm_Vertical" H 2050 5900 50  0001 C CNN
F 3 "~" H 2050 5900 50  0001 C CNN
	1    2050 5900
	1    0    0    -1  
$EndComp
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
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J5
U 1 1 5F34FBF4
P 4750 5900
F 0 "J5" H 4800 6217 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 4800 6126 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x03_P1.27mm_Vertical" H 4750 5900 50  0001 C CNN
F 3 "~" H 4750 5900 50  0001 C CNN
	1    4750 5900
	1    0    0    -1  
$EndComp
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
Text Label 10300 2400 0    50   ~ 0
BOOT0
Wire Wire Line
	9950 2400 10550 2400
Text Label 10050 2400 0    50   ~ 0
PF11
$Comp
L power:GND #PWR0129
U 1 1 5FA2DF1A
P 9650 2400
F 0 "#PWR0129" H 9650 2150 50  0001 C CNN
F 1 "GND" H 9655 2227 50  0001 C CNN
F 2 "" H 9650 2400 50  0001 C CNN
F 3 "" H 9650 2400 50  0001 C CNN
	1    9650 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R10
U 1 1 5FDF31D4
P 9800 2400
F 0 "R10" V 9595 2400 50  0000 C CNN
F 1 "100K" V 9686 2400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9840 2390 50  0001 C CNN
F 3 "" H 9800 2400 50  0001 C CNN
	1    9800 2400
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
Wire Notes Line
	9250 600  11100 600 
Wire Notes Line
	11100 1900 9250 1900
Wire Notes Line
	9250 2700 11100 2700
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
Text Notes 2650 1550 0    50   ~ 0
(nominal: 4.6 V)
Text Notes 2800 3000 0    50   ~ 0
(nominal: 2.95 V)
Wire Wire Line
	4850 2800 5500 2800
Text Label 4850 2800 0    50   ~ 0
BOOT0
$Comp
L Diode:BAT60A D?
U 1 1 61AAE270
P 1650 3700
F 0 "D?" V 1600 3500 50  0000 C CNN
F 1 "BAT60JFILM" V 1500 3450 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323" H 1650 3525 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/Infineon-BAT60ASERIES-DS-v01_01-en.pdf?fileId=db3a304313d846880113def70c9304a9" H 1650 3700 50  0001 C CNN
	1    1650 3700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1650 3900 1650 3850
Wire Notes Line
	11100 600  11100 6450
Wire Notes Line
	9250 600  9250 6450
$EndSCHEMATC
