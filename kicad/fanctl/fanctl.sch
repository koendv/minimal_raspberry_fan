EESchema Schematic File Version 4
LIBS:fanctl-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Raspberry Fan Controller"
Date "2019-03-09"
Rev "0"
Comp ""
Comment1 "Koen De Vleeschauwer"
Comment2 "Released under the Creative Commons Attribution-ShareAlike 4.0 license."
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+5V #PWR04
U 1 1 580C1B61
P 4300 1500
F 0 "#PWR04" H 4300 1350 50  0001 C CNN
F 1 "+5V" H 4300 1640 50  0000 C CNN
F 2 "" H 4300 1500 50  0000 C CNN
F 3 "" H 4300 1500 50  0000 C CNN
	1    4300 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 580C1D11
P 4300 2000
F 0 "#PWR03" H 4300 1750 50  0001 C CNN
F 1 "GND" H 4300 1850 50  0000 C CNN
F 2 "" H 4300 2000 50  0000 C CNN
F 3 "" H 4300 2000 50  0000 C CNN
	1    4300 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR01
U 1 1 580C1BC1
P 3600 1500
F 0 "#PWR01" H 3600 1350 50  0001 C CNN
F 1 "+3.3V" H 3600 1640 50  0000 C CNN
F 2 "" H 3600 1500 50  0000 C CNN
F 3 "" H 3600 1500 50  0000 C CNN
	1    3600 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1800 2550 1800
Wire Wire Line
	2550 1900 3700 1900
Text Label 2550 1800 0    50   ~ 0
GPIO2(SDA1)
Text Label 2550 1900 0    50   ~ 0
GPIO3(SCL1)
$Comp
L fan_ctrl:LTC1695CS5 U1
U 1 1 5C828924
P 6400 1800
F 0 "U1" H 6100 2050 50  0000 L CNN
F 1 "LTC1695CS5" H 6450 1450 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-5_HandSoldering" H 6400 1300 50  0001 C CNN
F 3 "" H 6400 1700 50  0001 C CNN
	1    6400 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5C82A86D
P 6400 2400
F 0 "#PWR07" H 6400 2150 50  0001 C CNN
F 1 "GND" H 6400 2250 50  0000 C CNN
F 2 "" H 6400 2400 50  0000 C CNN
F 3 "" H 6400 2400 50  0000 C CNN
	1    6400 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2200 6400 2300
Wire Wire Line
	6000 1800 4800 1800
Wire Wire Line
	6000 1900 4800 1900
Text Label 4800 1800 0    50   ~ 0
GPIO2(SDA1)
Text Label 4800 1900 0    50   ~ 0
GPIO3(SCL1)
$Comp
L Device:CP C2
U 1 1 5C8411FE
P 7100 2050
F 0 "C2" H 7000 2200 50  0000 L CNN
F 1 "4u7 20V ESR 1R" V 7250 1650 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-12_Kemet-T_Pad1.50x2.35mm_HandSolder" H 7138 1900 50  0001 C CNN
F 3 "~" H 7100 2050 50  0001 C CNN
	1    7100 2050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5C841393
P 7900 1800
F 0 "J2" H 7850 1900 50  0000 L CNN
F 1 "FAN" H 7900 1600 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7900 1800 50  0001 C CNN
F 3 "~" H 7900 1800 50  0001 C CNN
	1    7900 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5C841427
P 5800 1550
F 0 "C1" H 5700 1700 50  0000 L CNN
F 1 "4u7 20V ESR 1R" V 5950 1350 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-12_Kemet-T_Pad1.50x2.35mm_HandSolder" H 5838 1400 50  0001 C CNN
F 3 "~" H 5800 1550 50  0001 C CNN
	1    5800 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 5C842D8A
P 6400 1250
F 0 "#PWR06" H 6400 1100 50  0001 C CNN
F 1 "+5V" H 6400 1390 50  0000 C CNN
F 2 "" H 6400 1250 50  0000 C CNN
F 3 "" H 6400 1250 50  0000 C CNN
	1    6400 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1250 6400 1400
Wire Wire Line
	6800 1800 7100 1800
Wire Wire Line
	7100 1900 7100 1800
Connection ~ 7100 1800
Wire Wire Line
	7100 1800 7700 1800
$Comp
L power:GND #PWR012
U 1 1 5C84DE0F
P 7100 2300
F 0 "#PWR012" H 7100 2050 50  0001 C CNN
F 1 "GND" H 7100 2150 50  0000 C CNN
F 2 "" H 7100 2300 50  0000 C CNN
F 3 "" H 7100 2300 50  0000 C CNN
	1    7100 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5C84DE41
P 7600 2000
F 0 "#PWR013" H 7600 1750 50  0001 C CNN
F 1 "GND" H 7600 1850 50  0000 C CNN
F 2 "" H 7600 2000 50  0000 C CNN
F 3 "" H 7600 2000 50  0000 C CNN
	1    7600 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 1400 6400 1400
Connection ~ 6400 1400
Wire Wire Line
	6400 1400 6400 1500
Wire Wire Line
	5800 1700 5800 2300
Wire Wire Line
	5800 2300 6400 2300
Connection ~ 6400 2300
Wire Wire Line
	6400 2300 6400 2400
Wire Wire Line
	7100 2200 7100 2300
Wire Wire Line
	7700 1900 7600 1900
Wire Wire Line
	7600 1900 7600 2000
Text Notes 5800 3100 0    50   ~ 0
J1 is Raspberry GPIO header, pins 1-6.\nJ2 is Fan, 5V DC, 40x40mm, 2 wire, brushless, 1W max. 
Text Label 7250 1800 0    50   ~ 0
VFAN
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J1
U 1 1 5D674065
P 3900 1800
F 0 "J1" H 3950 2117 50  0000 C CNN
F 1 "GPIO" H 3950 2026 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x03_P2.54mm_Vertical" H 3900 1800 50  0001 C CNN
F 3 "~" H 3900 1800 50  0001 C CNN
	1    3900 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 1900 4300 1900
Wire Wire Line
	4300 1900 4300 2000
Wire Wire Line
	3700 1700 3600 1700
Wire Wire Line
	3600 1700 3600 1500
Wire Wire Line
	4200 1700 4300 1700
Wire Wire Line
	4300 1700 4300 1500
Wire Wire Line
	4200 1800 4300 1800
Wire Wire Line
	4300 1800 4300 1700
Connection ~ 4300 1700
$EndSCHEMATC
