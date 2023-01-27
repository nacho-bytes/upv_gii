*version 9.1 325451157
u 57
V? 3
R? 6
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
pageloc 1 0 2830 
@status
n 0 120:04:13:13:21:35;1589368895 e 
s 0 120:04:13:13:21:35;1589368895 e 
*page 1 0 970 720 iA
@ports
port 3 GND_EARTH 270 410 h
port 40 GND_EARTH 530 410 h
port 4 GND_EARTH 450 410 h
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
part 41 r 500 310 u
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 u 13 0 15 25 hln 100 VALUE=220
a 0 a 0:13 0 0 0 hln 100 PKGREF=R5
a 0 ap 9 0 15 0 hln 100 REFDES=R5
part 8 r 450 390 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R4
a 0 ap 9 0 15 0 hln 100 REFDES=R4
a 0 u 13 0 15 25 hln 100 VALUE=220
part 42 VDC 530 350 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V2
a 1 ap 9 0 24 7 hcn 100 REFDES=V2
a 1 u 13 0 -11 18 hcn 100 DC=5V
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
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
s 400 310 400 280 45
s 400 310 450 310 43
s 450 310 460 310 48
s 450 310 450 350 46
w 50
s 500 310 530 310 49
s 530 310 530 350 51
w 54
s 530 390 530 410 53
w 56
s 450 390 450 410 55
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
j 460 310
+ p 41 2
+ w 26
j 400 310
+ w 26
+ w 26
j 450 350
+ p 8 2
+ w 26
j 450 310
+ w 26
+ w 26
j 500 310
+ p 41 1
+ w 50
j 530 350
+ p 42 +
+ w 50
j 530 390
+ p 42 -
+ w 54
j 530 410
+ s 40
+ w 54
j 450 390
+ p 8 1
+ w 56
j 450 410
+ s 4
+ w 56
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
