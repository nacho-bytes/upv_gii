*version 9.1 878908207
u 51
D? 3
R? 2
V? 4
? 3
@libraries
@analysis
.TRAN 1 0 0 0
+0 10us
+1 2000us
.OP 0 
.STMLIB C2.stl
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
pageloc 1 0 2404 
@status
n 0 120:04:14:12:46:41;1589453201 e 
s 2832 120:04:14:12:46:41;1589453201 e 
*page 1 0 970 720 iA
@ports
port 7 GND_EARTH 340 400 h
port 6 GND_EARTH 450 400 h
port 5 GND_EARTH 550 400 h
@parts
part 3 D1N4148 450 380 v
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DO-35
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=D2
a 0 sp 11 0 15 55 hln 100 PART=D1N4148
a 0 ap 9 0 15 -5 hln 100 REFDES=D2
part 2 D1N4148 450 300 v
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DO-35
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=D1
a 0 ap 9 0 15 35 hln 100 REFDES=D1
a 0 sp 11 0 15 -5 hln 100 PART=D1N4148
part 9 VDC 550 270 h
a 1 u 13 0 -11 18 hcn 100 DC=5V
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V2
a 1 ap 9 0 24 7 hcn 100 REFDES=V2
part 4 r 360 320 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
part 40 VSIN 340 340 h
a 1 u 0 0 0 0 hcn 100 VAMPL=10V
a 1 u 0 0 0 0 hcn 100 FREQ=1kHz
a 1 u 0 0 0 0 hcn 100 VOFF=0V
a 0 a 0:13 0 0 0 hln 100 PKGREF=V3
a 1 ap 9 0 20 10 hcn 100 REFDES=V3
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
@conn
w 23
a 0 up 0:33 0 0 0 hln 100 V=
s 450 380 450 400 22
a 0 up 33 0 452 390 hlt 100 V=
w 27
a 0 up 0:33 0 0 0 hln 100 V=
s 450 270 450 260 26
s 450 260 550 260 28
a 0 up 33 0 500 259 hct 100 V=
s 550 260 550 270 30
w 25
a 0 up 0:33 0 0 0 hln 100 V=
s 550 310 550 400 35
a 0 up 33 0 552 355 hlt 100 V=
w 11
s 340 380 340 400 10
w 13
a 0 up 0:33 0 0 0 hln 100 V=
s 340 340 340 320 12
s 340 320 360 320 14
a 0 up 33 0 350 319 hct 100 V=
w 17
a 0 sr 0 0 0 0 hln 100 LABEL=Vs
a 0 up 0:33 0 0 0 hln 100 V=
s 480 320 450 320 38
a 0 sr 3 0 465 318 hcn 100 LABEL=Vs
a 0 up 33 0 465 319 hct 100 V=
s 450 320 450 300 18
s 450 320 450 350 20
s 400 320 450 320 43
@junction
j 340 400
+ s 7
+ w 11
j 450 380
+ p 3 1
+ w 23
j 450 400
+ s 6
+ w 23
j 450 270
+ p 2 2
+ w 27
j 550 270
+ p 9 +
+ w 27
j 550 310
+ p 9 -
+ w 25
j 550 400
+ s 5
+ w 25
j 340 380
+ p 40 -
+ w 11
j 400 320
+ p 4 2
+ w 17
j 450 300
+ p 2 1
+ w 17
j 450 350
+ p 3 2
+ w 17
j 450 320
+ w 17
+ w 17
j 360 320
+ p 4 1
+ w 13
j 340 340
+ p 40 +
+ w 13
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
