*version 9.1 1061404031
u 37
Q? 2
R? 4
V? 4
@libraries
@analysis
.DC 0 0 0 0 1 1
+ 0 0 V2
+ 0 4 0V
+ 0 5 5V
+ 0 6 0.1V
.OP 1 
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
pageloc 1 0 2338 
@status
n 0 120:04:14:13:05:55;1589454355 e 
s 2832 120:04:14:13:05:59;1589454359 e 
*page 1 0 970 720 iA
@ports
port 5 GND_EARTH 480 430 h
@parts
part 3 r 480 310 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 u 13 0 15 25 hln 100 VALUE=1k
part 7 r 400 350 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 u 13 0 15 25 hln 100 VALUE=220k
a 0 x 0:13 0 0 0 hln 100 PKGREF=R2
a 0 xp 9 0 15 0 hln 100 REFDES=R2
part 4 VDC 550 330 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 24 7 hcn 100 REFDES=V1
a 1 u 13 0 -11 18 hcn 100 DC=5V
part 2 QbreakN3 460 350 h
a 0 sp 0 0 0 50 hln 100 PART=QbreakN3
a 0 a 0:13 0 0 0 hln 100 PKGREF=Q1
a 0 ap 9 0 5 5 hln 100 REFDES=Q1
part 8 VDC 370 360 h
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
a 0 up 0:33 0 0 0 hln 100 V=
s 440 350 460 350 9
a 0 up 33 0 450 374 hct 100 V=
w 12
a 0 sr 0 0 0 0 hln 100 LABEL=Vs
a 0 up 0:33 0 0 0 hln 100 V=
s 480 320 500 320 33
a 0 sr 3 0 490 318 hcn 100 LABEL=Vs
a 0 up 33 0 515 304 hct 100 V=
s 480 330 480 320 11
s 480 320 480 310 35
w 14
a 0 up 0:33 0 0 0 hln 100 V=
s 480 270 550 270 13
a 0 up 33 0 525 279 hct 100 V=
s 550 270 550 330 15
w 26
a 0 up 0:33 0 0 0 hln 100 V=
s 370 360 370 350 25
s 370 350 400 350 27
a 0 up 33 0 350 344 hct 100 V=
w 30
a 0 up 0:33 0 0 0 hln 100 V=
s 370 400 370 410 29
s 550 370 550 410 17
s 550 410 480 410 19
s 480 410 480 370 21
s 480 410 480 430 23
s 370 410 480 410 31
a 0 up 33 0 425 419 hct 100 V=
@junction
j 440 350
+ p 7 2
+ w 10
j 480 310
+ p 3 1
+ w 12
j 480 270
+ p 3 2
+ w 14
j 550 330
+ p 4 +
+ w 14
j 480 320
+ w 12
+ w 12
j 460 350
+ p 2 b
+ w 10
j 480 330
+ p 2 c
+ w 12
j 400 350
+ p 7 1
+ w 26
j 480 410
+ w 30
+ w 30
j 550 370
+ p 4 -
+ w 30
j 480 430
+ s 5
+ w 30
j 480 370
+ p 2 e
+ w 30
j 370 360
+ p 8 +
+ w 26
j 370 400
+ p 8 -
+ w 30
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
