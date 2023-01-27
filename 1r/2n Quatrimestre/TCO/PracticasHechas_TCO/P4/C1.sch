*version 9.1 851543822
u 19
V? 3
M? 2
@libraries
@analysis
.DC 1 0 0 0 0 0
+ 0 0 VGS
+ 0 4 0
+ 0 5 5
+ 0 6 0.1
+ 1 0 VGS
+ 1 4 0
+ 1 5 5
+ 1 6 1
.OP 0 
.LIB W:\1r INF\2n Quatrimestre\TCO\Practicas_TCO\P4\C1.lib
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PCBOARDS=PCB
a 0 u 13 0 0 0 hln 100 PSPICE=PSPICE
a 0 u 13 0 0 0 hln 100 XILINX=XILINX
@setup
unconnectedPins 0
connectViaLabel 0
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 1865 
@status
n 0 120:04:16:13:47:55;1589629675 e 
s 0 120:04:16:13:47:56;1589629676 e 
*page 1 0 970 720 iA
@ports
port 5 GND_EARTH 440 400 h
port 6 GND_EARTH 590 400 h
port 7 GND_EARTH 520 400 h
@parts
part 2 VDC 590 360 h
a 0 x 0:13 0 0 0 hln 100 PKGREF=VDS
a 1 xp 9 0 24 7 hcn 100 REFDES=VDS
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 1 u 13 0 -11 18 hcn 100 DC=10V
part 3 VDC 440 360 h
a 0 x 0:13 0 0 0 hln 100 PKGREF=VGS
a 1 xp 9 0 24 7 hcn 100 REFDES=VGS
a 0 sp 0 0 22 37 hln 100 PART=VDC
part 4 MbreakN3 490 340 h
a 0 sp 13 0 -18 40 hln 100 MODEL=MbreakN-X
a 0 u 0 0 0 0 hln 100 L=1u
a 0 a 0:13 0 0 0 hln 100 PKGREF=M1
a 0 ap 9 0 5 10 hln 100 REFDES=M1
a 0 u 0 0 0 0 hln 100 W=2u
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
@conn
w 9
s 520 360 520 400 8
w 11
s 440 360 440 340 10
s 440 340 490 340 12
w 15
s 520 320 590 320 14
s 590 320 590 360 16
@junction
j 440 400
+ s 5
+ p 3 -
j 590 400
+ p 2 -
+ s 6
j 520 360
+ p 4 s
+ w 9
j 520 400
+ s 7
+ w 9
j 440 360
+ p 3 +
+ w 11
j 490 340
+ p 4 g
+ w 11
j 520 320
+ p 4 d
+ w 15
j 590 360
+ p 2 +
+ w 15
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
t 18 t 6 630 240 870 420 0 574
1.- 3 curvas. 5V, 4V y 3V. Por la magnitud de K (mA/V^2).
2.- VGS=5V -> VDS=2.998V IDS=18mA
	VGS=4V -> VDS=2.0009V IDS=8mA
	VGS=3V -> VDS=1.0005V IDS=2mA
3.- K=2/(3-2)^2=2mA/V^2
4.- Ron=42.450m/5500.904u=84.747(ohm)
5.- No, si nos fijamos en la fórmula, esta depende de VGS.
6.- VGS=5V -> VDS=0.892V IDS=9.12mA (lineal)
	VGS=4V -> VDS=2V IDS=8mA (saturación)
	VGS=3V -> VDS=8V IDS=2mA (saturación)
7.- En cuanto al eje X sí, pero al no tener una RD no podríamos saber IDSmax.
8.- Las curvas están más juntas unas de otras.
9.- 2mA=2*(3-2)^2
	10mA=2*(4.2355-2)^2
