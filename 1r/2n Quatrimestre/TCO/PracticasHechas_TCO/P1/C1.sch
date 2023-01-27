*version 9.1 4107892929
u 40
V? 2
R? 5
@libraries
@analysis
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
pageloc 1 0 2175 
@status
n 0 120:04:14:12:36:51;1589452611 e 
s 2832 120:04:14:12:36:55;1589452615 e 
*page 1 0 970 720 iA
@ports
port 3 GND_EARTH 270 410 h
port 4 GND_EARTH 480 410 h
@parts
part 2 VDC 270 340 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 24 7 hcn 100 REFDES=V1
a 1 u 13 0 -11 18 hcn 100 DC=15V
part 5 r 290 310 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 u 13 0 15 25 hln 100 VALUE=100
part 6 r 350 280 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 u 13 0 15 25 hln 100 VALUE=100
part 7 r 350 340 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R3
a 0 ap 9 0 15 0 hln 100 REFDES=R3
a 0 u 13 0 15 25 hln 100 VALUE=100
part 8 r 410 310 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R4
a 0 ap 9 0 15 0 hln 100 REFDES=R4
a 0 u 13 0 15 25 hln 100 VALUE=220
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
@conn
w 10
s 270 410 270 380 9
w 12
s 270 340 270 310 11
s 270 310 290 310 13
w 16
s 330 310 340 310 15
s 340 310 340 280 17
s 340 280 350 280 19
s 340 310 340 340 21
s 340 340 350 340 23
w 26
s 390 340 400 340 25
s 400 340 400 310 29
s 400 280 390 280 31
s 400 310 400 280 35
s 400 310 410 310 33
w 37
s 450 310 480 310 36
s 480 310 480 410 38
@junction
j 270 380
+ p 2 -
+ w 10
j 270 410
+ s 3
+ w 10
j 270 340
+ p 2 +
+ w 12
j 290 310
+ p 5 1
+ w 12
j 330 310
+ p 5 2
+ w 16
j 350 280
+ p 6 1
+ w 16
j 340 310
+ w 16
+ w 16
j 350 340
+ p 7 1
+ w 16
j 390 340
+ p 7 2
+ w 26
j 390 280
+ p 6 2
+ w 26
j 410 310
+ p 8 1
+ w 26
j 400 310
+ w 26
+ w 26
j 450 310
+ p 8 2
+ w 37
j 480 410
+ s 4
+ w 37
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
