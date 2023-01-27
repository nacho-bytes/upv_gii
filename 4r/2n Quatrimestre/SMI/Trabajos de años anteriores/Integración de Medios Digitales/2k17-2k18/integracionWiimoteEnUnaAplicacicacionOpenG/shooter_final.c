//gcc shooter_final.c -o final -lGL -lGLU -lglut -lm `pkg-config cwiid --cflags --libs`

/*
 * Shooter 3D
 */

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <GL/glut.h>  // GLUT, includes glu.h and gl.h
#include <GL/gl.h>
#include <math.h>     // Needed for sin, cos
#define PI 3.14159265f

#include <bluetooth/bluetooth.h>
#include <cwiid.h>

#define toggle_bit(bf,b)	\
	(bf) = ((bf) & b)		\
	       ? ((bf) & ~(b))	\
	       : ((bf) | (b))

void set_led_state(cwiid_wiimote_t *wiimote, unsigned char led_state);
void set_rpt_mode(cwiid_wiimote_t *wiimote, unsigned char rpt_mode);
void print_state(struct cwiid_state *state);

 void set_rpt_mode(cwiid_wiimote_t *wiimote, unsigned char rpt_mode){
   	if (cwiid_set_rpt_mode(wiimote, rpt_mode)) {
   		fprintf(stderr, "Error setting report mode\n");
   	}
 }



// Global variables
char title[] = "Shooter 3D";  // Windowed mode's title
int windowWidth  = 640;     // Windowed mode's width
int windowHeight = 480;     // Windowed mode's height
int windowPosX   = 50;      // Windowed mode's top-left corner x
int windowPosY   = 50;      // Windowed mode's top-left corner y

cwiid_wiimote_t *wiimote;
struct cwiid_state *state;
bdaddr_t bdaddr; /* bluetooth device address */

float raton[2];
float mover[2];

float ratio;

float numeroX;
float numeroY;
float numeroZ;

float fuerza = 0.05;
float caida = 0.02;

float ymin0;
float ymax0;
float xmin0;
float xmax0;

GLfloat miraRadius = 0.1f;   // Radius mira
GLfloat miraX;              // Mira center (x, y, z) position
GLfloat miraY;
GLfloat miraZ = -1.0f;

int puntostotal = 0;


float ancho_total_seccion_espacio;
float alto_total_seccion_espacio;
float relacionX, relacionY;
float espX, espY;


int 	GLwin;


GLfloat ballRadius = 0.5f;   // Radius of the bouncing ball
GLfloat ballX = 0.2f;         // Ball's center (x, y, z) position
GLfloat ballY = 2.5f;
GLfloat ballZ = -1.0f;


GLfloat shootRadius = 0.1f;   // Radius of the shoot ball
GLfloat shootX = 0.0f;         // Ball's center (x, y, z) position
GLfloat shootY = -0.7f;
GLfloat shootZ = 5.0f;

GLfloat dX = 0.0f;         // Distance to reduce
GLfloat dY = 0.0f;
GLfloat dZ = 0.0f;


int refreshMillis = 25;      // Refresh period in milliseconds




/* Initialize OpenGL Graphics */
void initGL() {
   glClearColor(0.0, 0.0, 0.0, 1.0); // Set background (clear) color to black
}




//funcion para mostrar la puntuación
void pintarLetr() {
         glPushMatrix();
         char puntos_texto[40];
         sprintf(puntos_texto,"Puntos: %i",puntostotal);
         glRasterPos3f(-0.2,3.5,0);
         for (int i=0; i<strlen(puntos_texto); i++) glutBitmapCharacter(GLUT_BITMAP_HELVETICA_10, puntos_texto[i]);
         glPopMatrix();
      }



/* Callback handler for window re-paint event */
void display(void)
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT) ;
        glPushMatrix() ;
	glRotatef(0.0,1.0,1.0,0.0) ;
	glTranslatef(0.0,0.0,0.0);


	//diana
	glPushMatrix() ;
	glTranslatef(ballX,ballY,ballZ);

	//se crea la diana
        glBegin(GL_TRIANGLE_FAN);
                    glColor3f(1.0f, 0.0f, 0.0f); // Red
                    glVertex3f(0.0f, 0.0f, 0.0f);       // Center of circle
                    int numSegments = 100;
                    GLfloat angle;
                    for (int i = 0; i <= numSegments; i++) { // Last vertex same as first vertex
                        angle = i * 2.0f * PI / numSegments;  // 180 deg for half circle   *2.0f --> 360º
                        glVertex3f(cos(angle) * ballRadius, sin(angle) * ballRadius, 0.0f);
                    }


                    glColor3f(0.0f, 0.0f, 1.0f);    //blue
                    glVertex3f(0.0f, 0.0f, 0.000001f);       // Center of circle
                    for (int i = 0; i <= numSegments; i++) { // Last vertex same as first vertex
                        angle = i * 2.0f * PI / numSegments;  // 180 deg for half circle   *2.0f --> 360º
                        glVertex3f(cos(angle) * (2*ballRadius/3), sin(angle) * (2*ballRadius/3), 0.000001f);
                    }

                    glColor3f(1.0f, 0.0f, 0.0f); //green
                    glVertex3f(0.0f, 0.0f, 0.000002f);       // Center of circle
                    for (int i = 0; i <= numSegments; i++) { // Last vertex same as first vertex
                        angle = i * 2.0f * PI / numSegments;  // 180 deg for half circle   *2.0f --> 360º
                        glVertex3f(cos(angle) * ballRadius/3, sin(angle) * ballRadius/3, 0.000002f);
                    }
	glEnd();
	glPopMatrix() ;


	//disparo
	glPushMatrix() ;
	glTranslatef(shootX,shootY,shootZ);
	//se crea el disparo
        glBegin(GL_TRIANGLE_FAN);
        glColor3f(0.0f, 0.0f, 1.0f);  // Red  para cambiar del color azul al rojo se quita el 1.0f del 3º argumento y se pone en el primero (R,G,B)
      	glVertex3f(0.0f, 0.0f, 0.0f);       // Center of circle
      	int numSec = 100;
      	GLfloat angl;
      	for (int i = 0; i <= numSec; i++) { // Last vertex same as first vertex
             angl = i * 2.0f * PI / numSec;  // 180 deg for half circle   *2.0f --> 360º
             glVertex3f(cos(angl) * shootRadius, sin(angl) * shootRadius, 0.0f);
     	 }
	glEnd();
	glPopMatrix() ;

	//mira
	glPushMatrix() ;
	glTranslatef(miraX,miraY,miraZ);
	//se crea el disparo
        glBegin(GL_TRIANGLE_FAN);
        glColor3f(0.0f, 0.0f, 1.0f);  // Red  para cambiar del color azul al rojo se quita el 1.0f del 3º argumento y se pone en el primero (R,G,B)
      	glVertex3f(0.0f, 0.0f, 0.0f);       // Center of circle
      	int numSeg = 100;
      	GLfloat ang;
      	for (int i = 0; i <= numSeg; i++) { // Last vertex same as first vertex
             ang = i * 2.0f * PI / numSeg;  // 180 deg for half circle   *2.0f --> 360º
             glVertex3f(cos(ang) * shootRadius, sin(ang) * shootRadius, 0.0f);
     	 }
	glEnd();
	glPopMatrix() ;

	pintarLetr();


	//final
        glPopMatrix() ;
	glutSwapBuffers() ;


}





void reshape(int w, int h) // the reshape function
{
   glutReshapeWindow(640,480);
   glViewport(0,0,(GLsizei)w,(GLsizei)h) ;
   glMatrixMode(GL_PROJECTION) ;
   glLoadIdentity() ;
   gluPerspective(60.0,(GLfloat)w/(GLfloat)h,1.0,30.0) ;
   glMatrixMode(GL_MODELVIEW) ;
   glLoadIdentity();
   glTranslatef(0.0,0.0,-6.6);



}




/////////calcular distancia entre centros///////////////////////
float distancia() {
   return sqrt( pow(ballZ - shootZ,2) + pow(ballY - shootY,2) +pow(ballX - shootX,2) );
}



/////////distancia entre puntos////////////////////////
float distanciaX() {
   return sqrt(pow(raton[0] - shootX,2) )/60;
}


float distanciaY() {
   return (sqrt( pow(raton[1] - shootY,2)  )/60);
}


float distanciaZ() {
   return sqrt( pow(ballZ - shootZ,2) )/60;
}

//posicionar las dianas en la escena
void diana(void){

	numeroX = drand48() * (9.0-0.0) - 4.5;
	numeroY = drand48() * (3.5-0.0);

	ballX = numeroX;
	ballY = numeroY;
	ballZ = -1.0;
}





//reposicionar el proyectil
void repintar(){

	shootX = 0.0;
	shootY = -0.7;
	shootZ = 5.0f;
}



/* Called back when the timer expired */
void Timer(int value) {
   glutPostRedisplay();    // Post a paint request to activate display()
   glutTimerFunc(refreshMillis, Timer, 0); // subsequent timer call at milliseconds
}


//posición de la mira
void mira(float x, float y){
	miraX= x;
	miraY= y;
}


//transformar las coordenadas de la pantalla a las del escena 3D
void mov(int x, int y)
{
	xmin0 = -(0.019*windowWidth)/2;
	xmax0 = (0.019*windowWidth)/2;
	ymax0 = (0.019*windowHeight)/2;
	ymin0 = -(0.019*windowHeight)/2;


	ancho_total_seccion_espacio = xmax0 - xmin0;
	alto_total_seccion_espacio = ymax0 - ymin0;

	relacionX = ancho_total_seccion_espacio/windowWidth;
	relacionY = alto_total_seccion_espacio/windowHeight;

	espX = x * relacionX + xmin0;
	espY = (windowHeight-y) * relacionY + ymin0;

	raton[0] = espX;
	raton[1] = espY;
	mira(raton[0], raton[1]);
}



/////función de la animación del disparo///////////////////////////
void shoot(void){ //usaremos raton[]
   if(shootZ > ballZ){
	if(shootZ > 1.0){

	if (raton[0]>=0.0 && raton[1]>=-0.7){
	    shootX += dX;
	    shootY += dY+fuerza;
	    shootZ -= dZ;
	}

	else if (raton[0]<=0.0 && raton[1]>=-0.7){
	    shootX -= dX;
	    shootY += dY+fuerza;
	    shootZ -= dZ;
	}

	else if (raton[0]<=0.0 && raton[1]<=-0.7){
	    shootX -= dX;
	    shootY -= dY-fuerza;
	    shootZ -= dZ;
	}

	else if (raton[0]>=0.0 && raton[1]<=-0.7){
	    shootX += dX;
	    shootY -= dY-fuerza;
	    shootZ -= dZ;
	}

	else if (raton[0]==0.0 && raton[1]>-0.7){
	    shootX -= dX;
	    shootY += dY+fuerza;
	    shootZ -= dZ;
	}
   }
else if(shootZ > 0.0){
	if (raton[0]>=0.0 && raton[1]>=-0.7){
	    shootX += dX;
	    shootY -= dY-caida/2;
	    shootZ -= dZ;
	}

	else if (raton[0]<=0.0 && raton[1]>=-0.7){
	    shootX -= dX;
	    shootY -= dY-caida/2;
	    shootZ -= dZ;
	}

	else if (raton[0]<=0.0 && raton[1]<=-0.7){
	    shootX -= dX;
	    shootY -= dY-caida/2;
	    shootZ -= dZ;
	}

	else if (raton[0]>=0.0 && raton[1]<=-0.7){
	    shootX += dX;
	    shootY -= dY-caida/2;
	    shootZ -= dZ;
	}

	else if (raton[0]==0.0 && raton[1]>-0.7){
	    shootX -= dX;
	    shootY -= dY-caida/2;
	    shootZ -= dZ;
	}
   }
else {
if (raton[0]>=0.0 && raton[1]>=-0.7){
	    shootX += dX;
	    shootY -= dY-caida;
	    shootZ -= dZ;
	}

	else if (raton[0]<=0.0 && raton[1]>=-0.7){
	    shootX -= dX;
	    shootY -= dY-caida;
	    shootZ -= dZ;
	}

	else if (raton[0]<=0.0 && raton[1]<=-0.7){
	    shootX -= dX;
	    shootY -= dY-caida;
	    shootZ -= dZ;
	}

	else if (raton[0]>=0.0 && raton[1]<=-0.7){
	    shootX += dX;
	    shootY -= dY-caida;
	    shootZ -= dZ;
	}

	else if (raton[0]==0.0 && raton[1]>-0.7){
	    shootX -= dX;
	    shootY -= dY-caida;
	    shootZ -= dZ;
	}
}
}



   else if (distancia() < ballRadius+shootRadius){

	if (distancia() > (2*ballRadius/3)){
		puntostotal +=10;
	}
	else if (distancia() > (2*ballRadius/3)){
		puntostotal +=30;
	}
	else    puntostotal +=50;
	glutIdleFunc(NULL);
	diana();
	repintar();
	glutPassiveMotionFunc(mov);


   }
   else if (distancia() >= ballRadius+shootRadius){

	glutIdleFunc(NULL);
	repintar();
	glutPassiveMotionFunc(mov);


   }

   glutPostRedisplay();


}






/////acción del ratón//////////////////////////////////////////////
void mouse(int button, int state, int x, int y)
{
xmin0 = -(0.018*windowWidth)/2;
xmax0 = (0.018*windowWidth)/2;
ymax0 = (0.019*windowHeight)/2;
ymin0 = -(0.019*windowHeight)/2;


ancho_total_seccion_espacio = xmax0 - xmin0;
alto_total_seccion_espacio = ymax0 - ymin0;

relacionX = ancho_total_seccion_espacio/windowWidth;
relacionY = alto_total_seccion_espacio/windowHeight;

espX = x * relacionX + xmin0;
espY = (windowHeight-y) * relacionY + ymin0;


raton[0] = espX;
raton[1] = espY;



   switch (button) {
      case GLUT_LEFT_BUTTON:


	if(state == GLUT_DOWN && shootZ == 5.0){
		glutPassiveMotionFunc(NULL);
		dZ= distanciaZ();
		dY= distanciaY();
		dX= distanciaX();
        	glutIdleFunc(shoot);
	}
         break;
      case GLUT_RIGHT_BUTTON:
            glutIdleFunc(repintar);
         break;
      case GLUT_MIDDLE_BUTTON:
            glutIdleFunc(NULL);
         break;
      default:
         break;
   }
}

void keyboard(unsigned char key, int x, int y)
{
	switch(key)
	{
		case 27:
			glutDestroyWindow(GLwin) ;
			exit(0) ;
			break ;

	}
}

void print_state(struct cwiid_state *state)
{
	int i;
	int valid_source = 0;

	printf("Report Mode:");
	if (state->rpt_mode & CWIID_RPT_STATUS) printf(" STATUS");
	if (state->rpt_mode & CWIID_RPT_BTN) printf(" BTN");
	if (state->rpt_mode & CWIID_RPT_ACC) printf(" ACC");
	if (state->rpt_mode & CWIID_RPT_IR) printf(" IR");
	if (state->rpt_mode & CWIID_RPT_NUNCHUK) printf(" NUNCHUK");
	if (state->rpt_mode & CWIID_RPT_CLASSIC) printf(" CLASSIC");
	if (state->rpt_mode & CWIID_RPT_BALANCE) printf(" BALANCE");
	if (state->rpt_mode & CWIID_RPT_MOTIONPLUS) printf(" MOTIONPLUS");
	printf("\n");

	printf("Active LEDs:");
	if (state->led & CWIID_LED1_ON) printf(" 1");
	if (state->led & CWIID_LED2_ON) printf(" 2");
	if (state->led & CWIID_LED3_ON) printf(" 3");
	if (state->led & CWIID_LED4_ON) printf(" 4");
	printf("\n");

	printf("Rumble: %s\n", state->rumble ? "On" : "Off");

	printf("Battery: %d%%\n",
	       (int)(100.0 * state->battery / CWIID_BATTERY_MAX));

	printf("Buttons: %X\n", state->buttons);

	printf("Acc: x=%d y=%d z=%d\n", state->acc[CWIID_X], state->acc[CWIID_Y],
	       state->acc[CWIID_Z]);

	printf("IR: ");
	for (i = 0; i < CWIID_IR_SRC_COUNT; i++) {
		if (state->ir_src[i].valid) {
			valid_source = 1;
			printf("(%d,%d) ", state->ir_src[i].pos[CWIID_X],
			                   state->ir_src[i].pos[CWIID_Y]);
		}
	}
	if (!valid_source) {
		printf("no sources detected");
	}
	printf("\n");

	switch (state->ext_type) {
	case CWIID_EXT_NONE:
		printf("No extension\n");
		break;
	case CWIID_EXT_UNKNOWN:
		printf("Unknown extension attached\n");
		break;
	case CWIID_EXT_NUNCHUK:
		printf("Nunchuk: btns=%.2X stick=(%d,%d) acc.x=%d acc.y=%d "
		       "acc.z=%d\n", state->ext.nunchuk.buttons,
		       state->ext.nunchuk.stick[CWIID_X],
		       state->ext.nunchuk.stick[CWIID_Y],
		       state->ext.nunchuk.acc[CWIID_X],
		       state->ext.nunchuk.acc[CWIID_Y],
		       state->ext.nunchuk.acc[CWIID_Z]);
		break;
	case CWIID_EXT_CLASSIC:
		printf("Classic: btns=%.4X l_stick=(%d,%d) r_stick=(%d,%d) "
		       "l=%d r=%d\n", state->ext.classic.buttons,
		       state->ext.classic.l_stick[CWIID_X],
		       state->ext.classic.l_stick[CWIID_Y],
		       state->ext.classic.r_stick[CWIID_X],
		       state->ext.classic.r_stick[CWIID_Y],
		       state->ext.classic.l, state->ext.classic.r);
		break;
	case CWIID_EXT_BALANCE:
		printf("Balance: right_top=%d right_bottom=%d "
		       "left_top=%d left_bottom=%d\n",
		       state->ext.balance.right_top,
		       state->ext.balance.right_bottom,
		       state->ext.balance.left_top,
		       state->ext.balance.left_bottom);
		break;
	case CWIID_EXT_MOTIONPLUS:
		printf("MotionPlus: angle_rate=(%d,%d,%d) low_speed=(%d,%d,%d)\n",
		       state->ext.motionplus.angle_rate[0],
		       state->ext.motionplus.angle_rate[1],
		       state->ext.motionplus.angle_rate[2]
		       /*state->ext.motionplus.low_speed[0],
		       state->ext.motionplus.low_speed[1],
		       state->ext.motionplus.low_speed[2]*/);
		break;
	}
}

void mando_wii(){ //debe ser void
		struct cwiid_state *state;


		if ( cwiid_get_state(wiimote, state) ) {
	  	fprintf(stderr, "Error getting state\n");
		}
		if(state->buttons == CWIID_BTN_B){ //boton gatillo o B
			printf("Se ha pulsado gatillo\n");
            print_state(state);
			printf("posicion X,Y del IR: %d,%d\n", state->ir_src[0].pos[CWIID_X], state->ir_src[0].pos[CWIID_Y]);
		}

}


/* Main function: GLUT runs as a console application starting at main() */
int main(int argc, char** argv) {

		int mando_disponible = 0;
    unsigned char rpt_mode = 0;

    /* Connect to address given on command-line, if present */
  	if (argc > 1) {
  		str2ba(argv[1], &bdaddr);
  	}
  	else {
  		bdaddr = *BDADDR_ANY;
  	}

    /* Connect to the wiimote */
  	printf("Put Wiimote in discoverable mode now (press 1+2)...\n");
  	if (!(wiimote = cwiid_open(&bdaddr, 0))) {
  		fprintf(stderr, "Unable to connect to wiimote\n");
  		fprintf(stderr, "Game starts, you can play with the mouse\n");
			mando_disponible = 0;
  	}

		if(wiimote != NULL) mando_disponible = 1;

   srand48(time(NULL));
   glutInit(&argc, argv);            // Initialize GLUT
   glutInitDisplayMode(GLUT_DOUBLE); // Enable double buffered mode
   glutInitWindowSize(windowWidth, windowHeight);  // Initial window width and height
   glutInitWindowPosition(windowPosX, windowPosY); // Initial window top-left corner (x, y)
   glutCreateWindow(title);      // Create window with given title
   glutDisplayFunc(display);     // Register callback handler for window re-paint
   glutKeyboardFunc(keyboard) ;
   glutReshapeFunc(reshape);     // Register callback handler for window re-shape
   glutMouseFunc(mouse);
	 if(mando_disponible == 1){
		 glutIdleFunc(mando_wii);
	 }
   glutPassiveMotionFunc(mov);
   glutTimerFunc(0, Timer, 0);   // First timer call immediately
   initGL();                     // Our own OpenGL initialization
   glutMainLoop();               // Enter event-processing loop
   return 0;
}

