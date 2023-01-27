*version 9.1 1657219352
u 40
D? 5
R? 2
V? 3
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
pageloc 1 0 2115 
@status
n 0 120:04:14:12:39:33;1589452773 e 
s 2832 120:04:14:12:39:33;1589452773 e 
*page 1 0 970 720 iA
@ports
port 6 GND_EARTH 510 340 h
port 7 GND_EARTH 330 400 h
port 8 GND_EARTH 300 400 h
@parts
part 4 r 430 300 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
part 9 VDC 300 340 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V2
a 1 ap 9 0 24 7 hcn 100 REFDES=V2
a 1 u 13 0 -11 18 hcn 100 DC=5V
part 5 VDC 510 260 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 24 7 hcn 100 REFDES=V1
a 1 u 13 0 -11 18 hcn 100 DC=5V
part 38 D1N4148 380 320 u
a 0 sp 11 0 15 25 hln 100 PART=D1N4148
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DO-35
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=D1
a 0 xp 9 0 15 0 hln 100 REFDES=D1
part 39 D1N4148 380 360 u
a 0 sp 11 0 15 25 hln 100 PART=D1N4148
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DO-35
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=D2
a 0 xp 9 0 15 0 hln 100 REFDES=D2
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
@conn
w 11
s 510 340 510 300 10
w 13
s 510 260 510 250 12
s 510 250 430 250 14
s 430 250 430 260 16
w 37
s 300 380 300 400 36
w 33
s 350 360 330 360 32
s 330 360 330 400 34
w 29
s 350 320 300 320 28
s 300 320 300 340 30
w 19
a 0 sr 0 0 0 0 hln 100 LABEL=S
s 430 320 460 320 26
a 0 sr 3 0 445 318 hcn 100 LABEL=S
s 430 300 430 320 18
s 430 320 380 320 20
s 430 320 430 360 22
s 430 360 380 360 24
@junction
j 510 300
+ p 5 -
+ w 11
j 510 340
+ s 6
+ w 11
j 510 260
+ p 5 +
+ w 13
j 430 260
+ p 4 2
+ w 13
j 430 300
+ p 4 1
+ w 19
j 430 320
+ w 19
+ w 19
j 300 340
+ p 9 +
+ w 29
j 330 400
+ s 7
+ w 33
j 300 380
+ p 9 -
+ w 37
j 300 400
+ s 8
+ w 37
j 350 320
+ p 38 2
+ w 29
j 380 320
+ p 38 1
+ w 19
j 350 360
+ p 39 2
+ w 33
j 380 360
+ p 39 1
+ w 19
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
