*version 9.1 34309676
u 33
M? 2
V? 3
R? 2
@libraries
@analysis
.DC 1 0 0 0 1 1
+ 0 0 Vi
+ 0 4 0
+ 0 5 5
+ 0 6 0.01
.OP 0 
.LIB W:\1r INF\2n Quatrimestre\TCO\Practicas_TCO\P5\C1.lib
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
pageloc 1 0 1854 
@status
n 0 120:04:16:16:54:16;1589640856 e 
s 0 120:04:16:16:54:16;1589640856 e 
c 120:04:16:16:59:55;1589641195
*page 1 0 970 720 iA
@ports
port 6 GND_EARTH 380 350 h
port 7 GND_EARTH 460 350 h
port 8 GND_EARTH 520 350 h
@parts
part 4 VDC 380 300 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 x 0:13 0 0 0 hln 100 PKGREF=Vi
a 1 xp 9 0 24 7 hcn 100 REFDES=Vi
part 3 VDC 520 270 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 1 u 13 0 -11 18 hcn 100 DC=5V
a 0 x 0:13 0 0 0 hln 100 PKGREF=VDD
a 1 xp 9 0 24 7 hcn 100 REFDES=VDD
part 2 MbreakN3 430 290 h
a 0 u 0 0 0 0 hln 100 L=1u
a 0 u 0 0 0 0 hln 100 W=2u
a 0 a 0:13 0 0 0 hln 100 PKGREF=M1
a 0 ap 9 0 5 10 hln 100 REFDES=M1
a 0 sp 13 0 -18 40 hln 100 MODEL=MbreakN-X
part 5 r 460 250 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 x 0:13 0 0 0 hln 100 PKGREF=RD
a 0 xp 9 0 15 0 hln 100 REFDES=RD
a 0 u 13 0 15 25 hln 100 VALUE=90k
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
@conn
w 10
s 380 350 380 340 9
w 12
s 380 300 380 290 11
s 380 290 430 290 13
w 16
s 460 310 460 350 15
w 18
s 520 350 520 310 17
w 20
s 520 270 520 200 19
s 520 200 460 200 21
s 460 200 460 210 23
w 26
a 0 sr 0 0 0 0 hln 100 LABEL=Vo
s 460 260 480 260 31
a 0 sr 3 0 470 258 hcn 100 LABEL=Vo
s 460 250 460 260 25
s 460 260 460 270 30
@junction
j 380 340
+ p 4 -
+ w 10
j 380 350
+ s 6
+ w 10
j 380 300
+ p 4 +
+ w 12
j 430 290
+ p 2 g
+ w 12
j 460 310
+ p 2 s
+ w 16
j 460 350
+ s 7
+ w 16
j 520 310
+ p 3 -
+ w 18
j 520 350
+ s 8
+ w 18
j 520 270
+ p 3 +
+ w 20
j 460 210
+ p 5 2
+ w 20
j 460 270
+ p 2 d
+ w 26
j 460 250
+ p 5 1
+ w 26
j 460 260
+ w 26
+ w 26
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
t 27 t 6 100 150 340 290 0 10
1.- Voh=5V
