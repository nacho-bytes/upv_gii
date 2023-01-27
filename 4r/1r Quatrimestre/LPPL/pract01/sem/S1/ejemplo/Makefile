###############################################################################
###  Ejemplo de FLEX: S E M - 1           2022-2023 <jmbenedi@prhlt.upv.es> ###
###############################################################################
# Directorios de trabajo
SRCDIR = src
INCDIR = include
# Opciones de compilacion
COPT = -Wall
CLIB = -lfl
OBJS = ./alex.o  ./principal.o 
#
cmc:	$(OBJS)
	gcc  $(OBJS)  -I$(INCDIR)  $(COPT)  $(CLIB) -o cmc
principal.o: $(SRCDIR)/principal.c
	gcc  -I$(INCDIR) $(COPT) -c $(SRCDIR)/principal.c
alex.o:	alex.c 
	gcc  -I$(INCDIR) $(COPT) -c alex.c
alex.c:	$(SRCDIR)/alex.l 
	flex -oalex.c $(SRCDIR)/alex.l 

clean:
	rm -f ./alex.c ./*.o  
###############################################################################
