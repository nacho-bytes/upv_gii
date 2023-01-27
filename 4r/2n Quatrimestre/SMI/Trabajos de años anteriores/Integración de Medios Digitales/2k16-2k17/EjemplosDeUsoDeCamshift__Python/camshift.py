#!/usr/bin/env python

import numpy as np
import cv2.cv as cv
import cv2
import sys
import time
import math
#--------------MOUSE CONTROL------------
#from Xlib import X, display
#---------------------------------------
#import pyautogui

def is_rect_nonzero(r):
    (_,_,w,h) = r
    return (w > 0) and (h > 0)

class CamShiftDemo:

    def __init__(self):
	#print (sys.path)
        self.capture = cv.CaptureFromCAM(0)
        cv.NamedWindow( "CamShiftDemo",1)
        cv.NamedWindow( "Histogram", 1 )
        
        cv.SetMouseCallback( "CamShiftDemo", self.on_mouse)
        self.drag_start = None      # Set to (x,y) when mouse starts drag
        self.track_window = None    # Set to rect when the mouse drag finishes
        print( "Keys:\n"
            "ESC - quit the program\n"
            "b - switch to/from backprojection view\n"
            "h - help\n"
            "To initialize tracking, drag across the object with the mouse\n" )

    def hue_histogram_as_image(self, hist):
        """ Returns a nice representation of a hue histogram """
        histimg_hsv = cv.CreateImage( (320,200), 8, 3)
        mybins = cv.CloneMatND(hist.bins)
        cv.Log(mybins, mybins)
        (_, hi, _, _) = cv.MinMaxLoc(mybins)
        cv.ConvertScale(mybins, mybins, 255. / hi)
        w,h = cv.GetSize(histimg_hsv)
        hdims = cv.GetDims(mybins)[0]
        for x in range(w):
            xh = (180 * x) / (w - 1)  # hue sweeps from 0-180 across the image
            val = int(mybins[int(hdims * x / w)] * h / 255)
            cv.Rectangle( histimg_hsv, (x, 0), (x, h-val), (xh,255,64), -1)
            cv.Rectangle( histimg_hsv, (x, h-val), (x, h), (xh,255,255), -1)
        histimg = cv.CreateImage( (320,200), 8, 3)
        cv.CvtColor(histimg_hsv, histimg, cv.CV_HSV2BGR)
        return histimg

    def on_mouse(self, event, x, y, flags, param):
        if event == cv.CV_EVENT_LBUTTONDOWN:
            self.drag_start = (x, y)
        if event == cv.CV_EVENT_LBUTTONUP:
            self.drag_start = None
            self.track_window = self.selection
        if self.drag_start:
            xmin = min(x, self.drag_start[0])
            ymin = min(y, self.drag_start[1])
            xmax = max(x, self.drag_start[0])
            ymax = max(y, self.drag_start[1])
            self.selection = (xmin, ymin, xmax - xmin, ymax - ymin)
            
    def run(self):
	#inizializzo font
	font = cv.InitFont(cv.CV_FONT_HERSHEY_SIMPLEX,1,1,0,3,8)
        hist = cv.CreateHist([180], cv.CV_HIST_ARRAY, [(0,180)], 1 )
       
        backproject_mode = False
        drawing_mode = False
        empezar_mode = False
        FREE_mode = True
        GAME1_mode = False
        GAME2_mode = False
        STOP_mode = False
        HELP_mode = False        
        tupleCord=()
        tupleDibujo=()
        tupleGame=()
        tupleColor=()      
        cont = 0
        punteggio = 0
        n = 0
        r1 = r2 = r3 = r4 = r5 = False
        f1 = f2 = f3 = f4 = f5 = f6 = f7 = f8 = f9 = final = False
        c1 = c2 = c3 = c4 = c5 = False
        
        #Inizia iterazione sui frame.
        while True:
            frame = cv.QueryFrame( self.capture )
            trackingState = False
            #Flip verticale su tutti i frame
            cv.Flip(frame, flipMode=1)
            # Convert to HSV and keep the hue
            hsv = cv.CreateImage(cv.GetSize(frame), 8, 3)
            cv.CvtColor(frame, hsv, cv.CV_BGR2HSV)
            self.hue = cv.CreateImage(cv.GetSize(frame), 8, 1)
            cv.Split(hsv, self.hue, None, None, None)
            # Compute back projection
            backproject = cv.CreateImage(cv.GetSize(frame), 8, 1)
            # Run the cam-shift
            cv.CalcArrBackProject( [self.hue], backproject, hist )
            if self.track_window and is_rect_nonzero(self.track_window):
                crit = ( cv.CV_TERMCRIT_EPS | cv.CV_TERMCRIT_ITER, 10, 1)
                (iters, (area, value, rect), track_box) = cv.CamShift(backproject, self.track_window, crit)
                self.track_window = rect

            # If mouse is pressed, highlight the current selected rectangle
            # and recompute the histogram
            if self.drag_start and is_rect_nonzero(self.selection):
		#resetto tuple cordinate per riniziare il disegno
		tupleCord = ()
                sub = cv.GetSubRect(frame, self.selection)
                save = cv.CloneMat(sub)
                cv.ConvertScale(frame, frame, 0.5)
                cv.Copy(save, sub)
                x,y,w,h = self.selection
                cv.Rectangle(frame, (x,y), (x+w,y+h), (255,255,255))
                sel = cv.GetSubRect(self.hue, self.selection )
                cv.CalcArrHist( [sel], hist, 0)
                (_, max_val, _, _) = cv.GetMinMaxHistValue( hist)
                if max_val != 0:
                    cv.ConvertScale(hist.bins, hist.bins, 255. / max_val)
            elif self.track_window and is_rect_nonzero(self.track_window):
                cv.EllipseBox( frame, track_box, cv.CV_RGB(0,255,0), 3, cv.CV_AA, 0 )
                #Inizia il tracking, setto trackingState
                trackingState = True
                #stampo trackingState=True
                cv.PutText(frame,"True",(500,460),font, (0,255,0))
                #assegno cordinate float
                (flX,flY) = track_box[0]
                #converto coordinate in int
                x = int(flX)
                y = int(flY)
  
		if (50 <= x <= 340) and (50 <= y <= 130) and (FREE_mode == True):
		  GAME1_mode = True
		  FREE_mode = False
		  
		if (50 <= x <= 340) and (150 <= y <= 230) and (FREE_mode == True):
		  GAME2_mode = True
		  FREE_mode = False		
                                                
            if not backproject_mode:
	        #disegno rettangoli 		
		if FREE_mode:
		  cv.Rectangle(frame,(50,50),(340,130),(255,255,255),-1)
		  cv.Rectangle(frame,(50,50),(340,130),(0,0,0),2)
		  cv.PutText(frame,"JUEGA!",(140,100),font, (0,0,0))		
		  cv.Rectangle(frame,(50,150),(340,230),(255,255,255),-1)
		  cv.Rectangle(frame,(50,150),(340,230),(0,0,0),2)
		  cv.PutText(frame,"DIBUJA!",(140,200),font, (0,0,0))

		if GAME1_mode:
		  if ( not empezar_mode ) :
		      cv.Rectangle(frame,(50,50),(590,430),(0,0,0),2)	
		      cv.Rectangle(frame,(51,51),(589,429),(255,255,255),-1)	
		      cv.PutText(frame,"Rellenas la figuras",(100,100),font, (0,0,0))
		      cv.PutText(frame,"E para empezar a jugar",(100,195),font, (0,0,0))
		      
		  else:
		    if (n == 0):
		      start_time = time.time()
		    if (0 < n and n < 130) and (not(r1 and r2 and r3 and r4 and r5)):
		      current_time = time.time()
		      tempo = str(int(current_time - start_time))
		      cv.PutText(frame,"Time:",(245,460),font, (255,255,255))
		      cv.PutText(frame,tempo,(330,460),font, (0,0,255))
		      cv.Rectangle(frame,(50,50),(150,125),(0,0,0),2)
		      cv.Rectangle(frame,(40,270),(140,345),(0,0,0),2)
		      cv.Rectangle(frame,(280,300),(380,375),(0,0,0),2)
		      cv.Rectangle(frame,(420,250),(520,375),(0,0,0),2)
		      cv.Rectangle(frame,(520,50),(620,125),(0,0,0),2)
		      if (50 <= x <= 150) and (50 <= y <= 125):
			r1 = True
		      if (40 <= x <= 140) and (270 <= y <= 345): 
			r2 = True
		      if (280 <= x <= 380) and (300 <= y <= 375): 
			r3 = True
		      if (420 <= x <= 520) and (250 <= y <= 375):
			r4 = True
		      if (520 <= x <= 620) and (50 <= y <= 125):
			r5 = True
		      if r1:
			cv.Rectangle(frame,(51,51),(149,124),(0,255,0),-1)
		      if r2:
			cv.Rectangle(frame,(41,271),(139,344),(255,0,0),-1)
		      if r3:
			cv.Rectangle(frame,(281,301),(379,374),(0,0,255),-1)
		      if r4:
			cv.Rectangle(frame,(421,251),(519,374),(0,255,255),-1)		      
		      if r5:
			cv.Rectangle(frame,(521,51),(619,124),(255,255,0),-1)	
			
		    if ((n > 130 and n < 260) and (not(c1 and c2 and c3 and c4 and c5))) or ((r1 and r2 and r3 and r4 and r5) and (not(c1 and c2 and c3 and c4 and c5))):
		      current_time = time.time()
		      tempo = str(int(current_time - start_time))
		      cv.PutText(frame,"Time:",(245,460),font, (255,255,255))
		      cv.PutText(frame,tempo,(330,460),font, (0,0,255))
		      cv.Circle(frame, (60, 60), 60, cv.CV_RGB(0,0,0),2,8,0)
		      cv.Circle(frame, (570, 120), 60, cv.CV_RGB(0,0,0),2,8,0)
		      cv.Circle(frame, (300, 200), 60, cv.CV_RGB(0,0,0),2,8,0)
		      cv.Circle(frame, (400, 350), 60, cv.CV_RGB(0,0,0),2,8,0)
		      cv.Circle(frame, (120, 300), 60, cv.CV_RGB(0,0,0),2,8,0)		      
		      d1 = math.sqrt(((x-60)*(x-60))+((y-60)*(y-60)))
		      d2 = math.sqrt(((x-570)*(x-570))+((y-120)*(y-120)))
		      d3 = math.sqrt(((x-300)*(x-300))+((y-200)*(y-200)))
		      d4 = math.sqrt(((x-400)*(x-400))+((y-350)*(y-350)))
		      d5 = math.sqrt(((x-120)*(x-120))+((y-300)*(y-300)))		      
		      if (d1 < 60):
			c1 = True
		      if (d2 < 60):
			c2 = True
		      if (d3 < 60):
			c3 = True
		      if (d4 < 60):
			c4 = True 
		      if (d5 < 60):
			c5 = True
			
		      if c1:
			cv.Circle(frame, (60, 60), 59, cv.CV_RGB(0,255,0),-1,8,0)
		      if c2:
			cv.Circle(frame, (570, 120), 59, cv.CV_RGB(255,0,0),-1,8,0)		    
		      if c3:
			cv.Circle(frame, (300, 200), 59, cv.CV_RGB(0,0,255),-1,8,0)
		      if c4:
			cv.Circle(frame, (400, 350), 59, cv.CV_RGB(0,255,255),-1,8,0)
		      if c5:
			cv.Circle(frame, (120, 300), 59, cv.CV_RGB(255,255,0),-1,8,0)
	    
		    if ((n>260)and(n<390)and(not final)) or ((not(f1 and f2 and f3 and f4 and f5 and f6 and f7 and f8 and f9)and(c1 and c2 and c3 and c4 and c5)and(n<390))):
		    #if (((n > 200)and(n < 400))and(not(f1 and f2 and f3 and f4 and f5 and f6 and f7 and f8 and f9)))or((c1 and c2 and c3 and c4 and c5)and(not(f1 and f2 and f3 and f4 and f5 and f6 and f7 and f8 and f9))):
		      current_time = time.time()
		      tempo = str(int(current_time - start_time))
		      cv.PutText(frame,"Time:",(245,460),font, (255,255,255))
		      cv.PutText(frame,tempo,(330,460),font, (0,0,255))
		      cv.Rectangle(frame,(60,60),(160,135),(0,0,0),2)
		      cv.Rectangle(frame,(60,290),(160,365),(0,0,0),2)
		      cv.Rectangle(frame,(280,300),(380,375),(0,0,0),2)
		      cv.Rectangle(frame,(420,50),(620,125),(0,0,0),2)
		      cv.Rectangle(frame,(500,330),(550,380),(0,0,0),2)		      
		      cv.Rectangle(frame,(300,200),(400,260),(0,0,0),2)
		      cv.Rectangle(frame,(500,20),(550,40),(0,0,0),2)
		      cv.Rectangle(frame,(300,100),(340,125),(0,0,0),2)
		      cv.Rectangle(frame,(20,400),(80,440),(0,0,0),2)
		      
		      if (60 <= x <= 160) and (60 <= y <= 135):
			f1 = True
		      if (60 <= x <= 160) and (290 <= y <= 365): 
			f2 = True
		      if (280 <= x <= 380) and (300 <= y <= 375): 
			f3 = True
		      if (420 <= x <= 620) and (50 <= y <= 125):
			f4 = True
		      if (500 <= x <= 550) and (330 <= y <= 380):
			f5 = True
		      if (300 <= x <= 400) and (200 <= y <= 260): 
			f6 = True
		      if (500 <= x <= 550) and (20 <= y <= 40): 
			f7 = True
		      if (300 <= x <= 340) and (100 <= y <= 125): 
			f8 = True
		      if (20 <= x <= 80) and (400 <= y <= 440): 
			f9 = True
			
		      if f1:
			cv.Rectangle(frame,(61,61),(159,134),(0,255,0),-1)
		      if f2:
			cv.Rectangle(frame,(61,291),(159,364),(255,0,0),-1)
		      if f3:
			cv.Rectangle(frame,(281,301),(379,374),(0,0,255),-1)
		      if f4:
			cv.Rectangle(frame,(421,51),(619,124),(0,255,255),-1)		      
		      if f5:
			cv.Rectangle(frame,(501,331),(549,379),(255,255,0),-1)		
		      if f6:
			cv.Rectangle(frame,(301,201),(399,259),(255,70,14),-1)	
		      if f7:
			cv.Rectangle(frame,(501,21),(549,39),(100,255,0),-1)	
		      if f8:
			cv.Rectangle(frame,(301,101),(339,124),(255,0,100),-1)	
		      if f9:
			cv.Rectangle(frame,(21,401),(79,439),(240,255,30),-1)	
		    
		    if (((n == 390) or (f1 and f2 and f3 and f4 and f5 and f6 and f7 and f8 and f9)) and (not final)):
		      #f1 = f2 = f3 = f4 = f5 = f6 = f7 = f8 = f9 = False
		      current_time = time.time()
		      tempo = str(int(current_time - start_time))		
		      tupleResult=(r1,r2,r3,r4,r5,c1,c2,c3,c4,c5,f1,f2,f3,f4,f5,f6,f7,f8,f9)
		      for a in tupleResult:
			if a == True:
			  punteggio = punteggio + 1
		      final = True
		    
		    if ((n > 390)or(final)):
		      cv.Rectangle(frame,(50,50),(590,430),(0,0,0),2)	
		      cv.Rectangle(frame,(51,51),(589,429),(255,255,255),-1)	
		      cv.PutText(frame,"Tiempo:",(100,100),font, (0,0,0))
		      cv.PutText(frame,tempo,(220,100),font, (0,0,0))
		      cv.PutText(frame,"sec",(260,100),font, (0,0,0))
		      cv.PutText(frame,"Dibujos rellenados:",(100,195),font, (0,0,0))
		      if (punteggio < 10):
			cv.PutText(frame,str(punteggio),(410,195),font, (0,0,0))
		      else: cv.PutText(frame,str(punteggio),(400,195),font, (0,0,0))
		      cv.PutText(frame,"/19",(440,195),font, (0,0,0))
		      cv.PutText(frame,"S para salir",(100,290),font, (0,0,0))		      
		    n = n+1
		      			
		if GAME2_mode:
		  if (HELP_mode):
		    cv.Rectangle(frame,(0,0),(540,60),(255,255,255),-1)
		    cv.Rectangle(frame,(0,0),(540,60),(0,0,0),2)
		    cv.PutText(frame,"L:Limpiar - S:Salir - D:Dibuja" ,(20,40),font, (0,0,0))		  
		  color = cv.CV_RGB(0,0,0)
		  cv.Rectangle(frame,(570,0),(640,70),(0,255,0),-1)
		  cv.Line(frame,(570,71),(640,71),(0,0,0), 1, 8, 0)
		  cv.Rectangle(frame,(570,72),(640,142),(255,0,0),-1)
		  cv.Line(frame,(570,143),(640,143),(0,0,0), 1, 8, 0)
		  cv.Rectangle(frame,(570,144),(640,214),(0,0,255),-1)
		  cv.Line(frame,(570,215),(640,215),(0,0,0), 1, 8, 0)
		  cv.Rectangle(frame,(570,216),(640,286),(255,255,0),-1)
		  cv.Line(frame,(570,287),(640,287),(0,0,0), 1, 8, 0)
		  cv.Rectangle(frame,(570,288),(640,358),(0,255,255),-1)
		  cv.Line(frame,(570,359),(640,359),(0,0,0), 1, 8, 0)
		  cv.Line(frame,(569,0),(569,359),(0,0,0), 1, 8, 0)		  
		  if (570 <= x <= 640) and (0 <= y <= 70):
		    color = cv.CV_RGB(0,255,0)
		  if (570 <= x <= 640) and (72 <= y <= 142):
		    color = cv.CV_RGB(0,0,255)
		  if (570 <= x <= 640) and (144 <= y <= 214):
		    color = cv.CV_RGB(255,0,0)
		  if (570 <= x <= 640) and (216 <= y <= 286):
		    color = cv.CV_RGB(0,255,255)
		  if (570 <= x <= 640) and (288 <= y <= 358):
		    color = cv.CV_RGB(255,255,0)
		  
		  if (drawing_mode == True):
		    cordinate = (x,y)
		    tupleAux = (cordinate,)
		    tupleCord = tupleCord + tupleAux
		    #print "tupleColor"
		    #print len(tupleColor)
		    #tupleColorAux = (color,)
		    #tupleColor = tupleColor + tupleColorAux
		    #print "tupleColor2"
		    #print len(tupleColor)
		    for a,b in tupleCord:
		      #colore = tupleColor[cont]
		      cv.Circle(frame, (a, b), 5, color ,-1,8,0)
		      #cont = cont + 1
		    tupleDibujo = tupleCord
		  
		  for a,b in tupleDibujo:
		    cv.Circle(frame, (a,b), 5, color,-1,8,0)
		  
		if STOP_mode:
		  GAME1_mode = False
		  GAME2_mode = False
		  FREE_mode = True
		  tupleGame = ()
		  n = punteggio = 0
		  STOP_mode = not STOP_mode
		  f1 = f2 = f3 = f4 = f5 = f6 = f7 = f8 = f9 = final = False
		  c1 = c2 = c3 = c4 = c5 = False
		  r1 = r2 = r3 = r4 = r5 = False
	
		cv.PutText(frame,"Tracked:",(370,460),font, (255,255,255))
		if trackingState == False:
		    cv.PutText(frame,"False" ,(500,460),font, (0,0,255))
		    cv.PutText(frame,"Captura un color con el raton" ,(100,400),font, (0,0,255))
                cv.ShowImage( "CamShiftDemo", frame)
            else:
                cv.ShowImage( "CamShiftDemo", backproject)
		cv.ShowImage( "Histogram", self.hue_histogram_as_image(hist))

            c = cv.WaitKey(7) % 0x100
            if c == 27:
                break
            elif c == ord("b"):
                backproject_mode = not backproject_mode
            elif c == ord("e"):
		empezar_mode = True
            elif c == ord("d"):
		drawing_mode = not drawing_mode
	    elif c == ord("l"):
		tupleDibujo=()
		tupleCord=()
	    elif c == ord("s"):
		STOP_mode = True
	    elif c == ord("h"):
		HELP_mode = not HELP_mode
		
if __name__=="__main__":
    demo = CamShiftDemo()
    demo.run()
    cv.DestroyAllWindows()
