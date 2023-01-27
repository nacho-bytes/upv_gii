*version 9.1 3080963635
u 37
M? 2
V? 2
R? 4
@libraries
@analysis
.LIB W:\1r INF\2n Quatrimestre\TCO\Practicas_TCO\P4\C2.lib
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
pageloc 1 0 2574 
@status
n 0 120:04:16:14:21:45;1589631705 e 
s 0 120:04:16:14:21:49;1589631709 e 
*page 1 0 970 720 iA
@ports
port 9 GND_EARTH 430 360 h
port 8 GND_EARTH 490 360 h
port 7 GND_EARTH 550 360 h
@parts
part 6 r 490 240 v
a 0 x 0:13 0 0 0 hln 100 PKGREF=RD
a 0 xp 9 0 15 0 hln 100 REFDES=RD
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
part 4 r 430 240 v
a 0 u 13 0 15 25 hln 100 VALUE=6k
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
part 5 r 430 350 v
a 0 u 13 0 15 25 hln 100 VALUE=4k
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 15 0 hln 100 REFDES=R2
part 2 MbreakN3 460 280 h
a 0 u 0 0 0 0 hln 100 L=1u
a 0 u 0 0 0 0 hln 100 W=2u
a 0 a 0:13 0 0 0 hln 100 PKGREF=M1
a 0 ap 9 0 5 10 hln 100 REFDES=M1
a 0 sp 13 0 -18 40 hln 100 MODEL=MbreakN-X
part 3 VDC 550 260 h
a 0 x 0:13 0 0 0 hln 100 PKGREF=VDD
a 1 xp 9 0 24 7 hcn 100 REFDES=VDD
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 1 u 13 0 -11 18 hcn 100 DC=10V
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
@conn
w 13
a 0 up 0:33 0 0 0 hln 100 V=
s 430 200 430 190 12
s 430 190 490 190 14
s 490 190 490 200 16
s 490 190 550 190 18
s 550 190 550 260 20
a 0 up 33 0 552 225 hlt 100 V=
w 23
a 0 up 0:33 0 0 0 hln 100 V=
s 490 240 490 260 22
a 0 up 33 0 492 250 hlt 100 V=
w 25
a 0 up 0:33 0 0 0 hln 100 V=
s 430 240 430 280 24
a 0 up 33 0 432 260 hlt 100 V=
s 430 280 460 280 26
s 430 280 430 310 28
w 31
a 0 up 0:33 0 0 0 hln 100 V=
s 430 350 430 360 30
a 0 up 33 0 432 355 hlt 100 V=
w 33
a 0 up 0:33 0 0 0 hln 100 V=
s 490 300 490 360 32
a 0 up 33 0 492 330 hlt 100 V=
w 35
a 0 up 0:33 0 0 0 hln 100 V=
s 550 300 550 360 34
a 0 up 33 0 552 330 hlt 100 V=
@junction
j 430 200
+ p 4 2
+ w 13
j 490 200
+ p 6 2
+ w 13
j 490 190
+ w 13
+ w 13
j 550 260
+ p 3 +
+ w 13
j 490 240
+ p 6 1
+ w 23
j 430 240
+ p 4 1
+ w 25
j 430 310
+ p 5 2
+ w 25
j 430 280
+ w 25
+ w 25
j 430 350
+ p 5 1
+ w 31
j 430 360
+ s 9
+ w 31
j 490 360
+ s 8
+ w 33
j 550 300
+ p 3 -
+ w 35
j 550 360
+ s 7
+ w 35
j 490 260
+ p 2 d
+ w 23
j 460 280
+ p 2 g
+ w 25
j 490 300
+ p 2 s
+ w 33
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
t 36 t 6 380 300 270 200 0 56
10.- Q(4V,2V,8mA)
11.- IG=0mA, I=1mA
12.- Son iguales.
