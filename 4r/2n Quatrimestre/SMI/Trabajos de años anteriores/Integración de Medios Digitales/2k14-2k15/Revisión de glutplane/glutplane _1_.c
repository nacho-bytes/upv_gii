
/* Copyright (c) Mark J. Kilgard, 1994. */

/* This program is freely distributable without licensing fees 
   and is provided without guarantee or warrantee expressed or 
   implied. This program is -not- in the public domain. */


/* Compilar el código para conseguir el ejecutable: */
/* gcc glutplane.c -o glutplane -lglut -lGLU -lGL -lalut -lopenal -lm */

#include <stdlib.h>
#include <stdio.h>
#ifndef WIN32
#include <unistd.h>
#else
#define random rand
#define srandom srand
#endif
#include <math.h>
#include <GL/glut.h>

/*Audio*/
#include <AL/alut.h>

/* Some <math.h> files do not define M_PI... */
#ifndef M_PI
#define M_PI 3.14159265
#endif
#ifndef M_PI_2
#define M_PI_2 1.57079632
#endif

GLboolean moving = GL_FALSE;
GLint vp[4];
float zRotation = 90.0;
float zoom = 1.0;
#define MAX_PLANES 15
int cont_Aviones = 3;

// highly evil global variables -- Audio -------------------------------------------
#define NUM_BUFFERS 15
#define NUM_SOURCES 15
#define NUM_ENVIRONMENTS 1

ALfloat listenerPos[] = { 0.0, 0.0, 4.0 };
ALfloat listenerVel[] = { 0.0, 0.0, 0.0 };
ALfloat listenerOri[] = { 0.0, 0.0, 1.0, 0.0, 1.0, 0.0 };

struct {
	ALfloat x, y, z;
} Posiciones[NUM_SOURCES];

ALfloat velocidadFuentes[] = {0.0, 0.0, 0.0};

ALuint buffer[NUM_BUFFERS];
ALuint source[NUM_SOURCES];
ALuint environment[NUM_ENVIRONMENTS];
int GLwin;

ALsizei size, freq;
ALenum format;
ALvoid *data;
int ch;

struct
{
  float speed;			/* zero speed means not flying */
  GLfloat red, green, blue;
  float theta;
  float x, y, z, angle;
} planes[MAX_PLANES];

#define v3f glVertex3f		/* v3f was the short IRIS GL name for glVertex3f */

void
dibujarAvion (int i, GLfloat red, GLfloat green, GLfloat blue)
{

  glPushMatrix ();
  glTranslatef (planes[i].x, planes[i].y, planes[i].z);
  glRotatef (290.0, 1.0, 0.0, 0.0);
  glRotatef (planes[i].angle, 0.0, 0.0, 1.0);
  glScalef (1.0 / 3.0, 1.0 / 4.0, 1.0 / 4.0);
  glTranslatef (0.0, -4.0, -1.5);

  glBegin (GL_TRIANGLE_STRIP);

/*   left wing */
  v3f (-7.0, 0.0, 2.0);
  v3f (-1.0, 0.0, 3.0);
  glColor3f (red = planes[i].red, green = planes[i].green, blue = 	     planes[i].blue);
  v3f (-1.0, 7.0, 3.0);

/*   left side */
  glColor3f (0.6 * red, 0.6 * green, 0.6 * blue);
  v3f (0.0, 0.0, 0.0);
  v3f (0.0, 8.0, 0.0);

/*   right sid */
  v3f (1.0, 0.0, 3.0);
  v3f (1.0, 7.0, 3.0);

/*   final tip of right wing */
  glColor3f (red, green, blue);
  v3f (7.0, 0.0, 2.0);
  glEnd ();
}

void
dibujarFuentesSonido ()
{
  int i = 0;
  for (i = 0; i<MAX_PLANES; i++) {
	  glPushMatrix ();
	  glTranslatef (Posiciones[i].x, Posiciones[i].y, Posiciones[i].z);
	  glColor3f (0.0, 0.0, 0.0);
	  glutWireCube (0.5);
	  glPopMatrix ();
  }
}

void
borrarFuentesSonido (int i) {
/*	  glPushMatrix ();*/
/*	  glTranslatef (Posiciones[i].x, Posiciones[i].y, Posiciones[i].z);*/
/*	  glColor3f (1.0, 1.0, 1.0);*/
/*	  glutWireCube (1.0);*/
/*	  glPopMatrix ();*/
}

void
dibujarFondo ()
{
  /* paint black to blue smooth shaded polygon for background */
  glDisable (GL_DEPTH_TEST);
  glShadeModel (GL_SMOOTH);
  glBegin (GL_POLYGON);
  glColor3f (0.9, 0.9, 1.0);
  v3f (-20, 20, -19);
  v3f (20, 20, -19);
  glColor3f (0.1, 0.2, 0.5);
  v3f (20, -20, -19);
  v3f (-20, -20, -19);
  glEnd ();
}

void
draw (void)
{
  GLfloat red, green, blue;
  int i = 0;

  glClear (GL_DEPTH_BUFFER_BIT);

/*  Paint background*/
  dibujarFondo ();

/*	Generar Avión en primera persona*/
/*  //dibujarAvion(0);*/
/*  //Definimos cámara*/
/*  gluLookAt(planes[0].x, planes[0].y, planes[0].z,   //Posicion de la cámara*/
/*  			0, 0, -10,	 //Punto al que miro*/
/*  			0, 1, 0		//vertical subjetiva*/
/*  );*/

  /*Paint fuentes de sonido */
  //dibujarFuentesSonido ();

  glPopMatrix ();

  /* paint planes */
  glEnable (GL_DEPTH_TEST);
  glShadeModel (GL_FLAT);
  for (i = 0; i < MAX_PLANES; i++)
    if (planes[i].speed != 0.0)
      {
	dibujarAvion (i, red, green, blue);
	glPopMatrix ();
      }
  glutSwapBuffers ();
}

void
reshape (int w, int h)
{
  glViewport (0, 0, (GLsizei) w, (GLsizei) h);
  glMatrixMode (GL_PROJECTION);
  glLoadIdentity ();
  glOrtho (-10.0, 10.0, -10.0, 10.0, -1.0, 1000.0);
  glMatrixMode (GL_MODELVIEW);
  glLoadIdentity ();
}


void
tick_per_plane (int i)
{
  float theta = planes[i].theta += planes[i].speed;
  planes[i].z = -9 + 4 * cos (theta);
  planes[i].x = 4 * sin (2 * theta);
  planes[i].y = sin (theta / 3.4) * 3;
  planes[i].angle =
    ((atan (2.0) + M_PI_2) * sin (theta) - M_PI_2) * 180 / M_PI;
  if (planes[i].speed < 0.0)
    planes[i].angle += 180;

/*	Posicionar las fuentes en sus respectivos aviones  */
  Posiciones[i].x = 4 * sin (2 * theta); 
  Posiciones[i].y = sin (theta / 3.4) * 3;
  Posiciones[i].z = -9 + 4 * cos (theta);
}

void
add_plane (void)
{
  int i;

  for (i = 0; i < MAX_PLANES; i++)
    if (planes[i].speed == 0)
      {

#define SET_COLOR(r,g,b) \
	planes[i].red=r; planes[i].green=g; planes[i].blue=b;

	switch (random () % 6)
	  {
	  case 0:
	    SET_COLOR (1.0, 0.0, 0.0);	/* red */
	    break;
	  case 1:
	    SET_COLOR (1.0, 1.0, 1.0);	/* white */
	    break;
	  case 2:
	    SET_COLOR (0.0, 1.0, 0.0);	/* green */
	    break;
	  case 3:
	    SET_COLOR (1.0, 0.0, 1.0);	/* magenta */
	    break;
	  case 4:
	    SET_COLOR (1.0, 1.0, 0.0);	/* yellow */
	    break;
	  case 5:
	    SET_COLOR (0.0, 1.0, 1.0);	/* cyan */
	    break;
	  }
	cont_Aviones++;
	planes[i].speed = ((float) (random () % 20)) * 0.001 + 0.02;
	if (random () & 0x1)
	  planes[i].speed *= -1;
	planes[i].theta = ((float) (random () % 257)) * 0.1111;
	tick_per_plane (i);
	if (!moving)
	  glutPostRedisplay ();
	return;
      }
}

void
remove_plane_i (int i) {
	planes[i].speed = 0;
    borrarFuentesSonido(i);
	if (!moving)
	  glutPostRedisplay ();
	return;
}

void
remove_plane (void)
{
  int i;
  cont_Aviones--;
  for (i = MAX_PLANES - 1; i >= 0; i--)
    if (planes[i].speed != 0)
      {
      planes[i].speed = 0;
	  
	  borrarFuentesSonido(i);
  
	if (!moving)
	  glutPostRedisplay ();
	return;
      }
}

void
tick (void)
{
  int i;

  for (i = 0; i < MAX_PLANES; i++)
    if (planes[i].speed != 0.0)
      tick_per_plane (i);
}

void
animate (void)
{
  tick ();
  glutPostRedisplay ();
}

void
visible (int state)
{
  if (state == GLUT_VISIBLE)
    {
      if (moving)
	glutIdleFunc (animate);
    }
  else
    {
      if (moving)
	glutIdleFunc (NULL);
    }
}

/* ARGSUSED1 */
void
keyboard (unsigned char ch, int x, int y)
{
  switch (ch)
    {
    case ' ':
      if (!moving)
	{
	  tick ();
	  glutPostRedisplay ();
	}
      break;
    case 'h':
    case 'H':
      printf
	(" 1 on 1, 4 off 1\n 2 on 2, 5 off 2\n 3 on 3, 6 off 3\n La posició del oient es canvia en les tecles del cursor o en 'asqz'\n");
      break;
    case '1':
      alSourcePlay (source[0]);
      printf ("1\n");
      break;
    case '2':
      alSourcePlay (source[1]);
      printf ("2\n");
      break;
    case '3':
      alSourcePlay (source[2]);
      printf ("3\n");
      break;
    case '4':
      alSourceStop (source[0]);
      printf ("4\n");
      break;
    case '5':
      alSourceStop (source[1]);
      printf ("5\n");
      break;
    case '6':
      alSourceStop (source[2]);
      printf ("6\n");
      break;
    case 'a':
    case 'A':
      listenerPos[0] -= 0.1;
      alListenerfv (AL_POSITION, listenerPos);
      break;
    case 's':
    case 'S':
      listenerPos[0] += 0.1;
      alListenerfv (AL_POSITION, listenerPos);
      break;
    case 'q':
    case 'Q':
      listenerPos[2] -= 0.1;
      alListenerfv (AL_POSITION, listenerPos);
      break;
    case 'z':
    case 'Z':
      listenerPos[2] += 0.1;
      alListenerfv (AL_POSITION, listenerPos);
      break;
    case 27:
      alSourceStop (source[2]);
      alSourceStop (source[1]);
      alSourceStop (source[0]);
      alutExit ();
      glutDestroyWindow (GLwin);
      exit (0);			/* ESC */
      break;
    }
  glutPostRedisplay ();
}

void
RecolorPlane (GLint hit)
{
#define SET_COLOR_REC(r,g,b) \
	planes[hit].red=r; planes[hit].green=g; planes[hit].blue=b;

  switch (random () % 6)
    {
    case 0:
      SET_COLOR_REC (1.0, 0.0, 0.0);	/* red */
      break;
    case 1:
      SET_COLOR_REC (1.0, 1.0, 1.0);	/* white */
      break;
    case 2:
      SET_COLOR_REC (0.0, 1.0, 0.0);	/* green */
      break;
    case 3:
      SET_COLOR_REC (1.0, 0.0, 1.0);	/* magenta */
      break;
    case 4:
      SET_COLOR_REC (1.0, 1.0, 0.0);	/* yellow */
      break;
    case 5:
      SET_COLOR_REC (0.0, 1.0, 1.0);	/* cyan */
      break;
    }
}

void
AvionOut(GLint hit) {
	remove_plane_i(hit);
}

static void
Render(GLenum mode)
{
  GLint i;

  for (i = 0; i < cont_Aviones; i++) {
    if (mode == GL_SELECT) {
      glLoadName(i);
    }
    float color[3];
    color[0] = planes[i].red;
    color[1] = planes[i].green;
    color[2] = planes[i].blue;
    glColor3fv(color);
    dibujarAvion(i, color[0], color[1], color[2]);
  }
}

static GLint
DoSelect(GLint x, GLint y)
{
  GLint hits;

  GLint avion[cont_Aviones];
  
  int i;
  for (i = 0; i<cont_Aviones; i++) {
  	avion[i] = i;
  }

  glSelectBuffer(MAX_PLANES, avion);
  glRenderMode(GL_SELECT);
  glInitNames();
  glPushName(~0);

  glPushMatrix();

  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  gluPickMatrix(x, 400 - y, 4, 4, vp);
  gluOrtho2D(-175, 175, -175, 175);
  glMatrixMode(GL_MODELVIEW);

  glClearColor(0.0, 0.0, 0.0, 0.0);
  glClear(GL_COLOR_BUFFER_BIT);

  Render(GL_SELECT);

  glPopMatrix();
  printf("Hits = %d\n", hits);
  hits = glRenderMode(GL_RENDER);
  
  if (hits <= 0) {
    return -1;
  }
  return avion[i];
}

void
Mouse (int button, int state, int mouseX, int mouseY)
{
  GLint hit;
  //GLint hit = 0;
  //GLint hit = 1;
  //GLint hit = 2;

  if (state == GLUT_DOWN)
    {
      hit = DoSelect((GLint) mouseX, (GLint) mouseY);
      printf("Hit = %d\n", hit);
      if (hit != -1)
	{
	  if (button == GLUT_LEFT_BUTTON)
	    {
	      RecolorPlane (hit);
	    }
	  if (button == GLUT_MIDDLE_BUTTON) {
	  	 AvionOut(hit);
	  }
	  glutPostRedisplay ();
	}
    }
}



#define ADD_PLANE	1
#define REMOVE_PLANE	2
#define MOTION_ON	3
#define MOTION_OFF	4
#define QUIT		5

void
menu (int item)
{
  switch (item)
    {
    case ADD_PLANE:
      add_plane ();
      break;
    case REMOVE_PLANE:
      remove_plane ();
      break;
    case MOTION_ON:
      moving = GL_TRUE;
      glutIdleFunc (animate);
      //glutChangeToMenuEntry(3, "Motion off", MOTION_OFF);
      break;
    case MOTION_OFF:
      moving = GL_FALSE;
      glutIdleFunc (NULL);
      //glutChangeToMenuEntry(3, "Motion", MOTION_ON);
      break;
    case QUIT:
      exit (0);
      break;
    }
}


// ===================================================================
// void init()
// ===================================================================
void
init (char *s1, char *s2, char *s3)	//void)
{
  alutInit (0, NULL);

  alListenerfv (AL_POSITION, listenerPos);
  alListenerfv (AL_VELOCITY, listenerVel);
  alListenerfv (AL_ORIENTATION, listenerOri);

  alGetError ();		// clear any error messages

  if (alGetError () != AL_NO_ERROR)
    {
      printf ("- Error creating buffers !!\n");
      exit (1);
    }
  else
    {
      printf ("init() - No errors yet.");

    }

  // Generate buffers, or else no sound will happen!
  alGenBuffers (NUM_BUFFERS, buffer);

  buffer[0] = alutCreateBufferFromFile (s1);

  buffer[1] = alutCreateBufferFromFile (s2);

  buffer[2] = alutCreateBufferFromFile (s3);

  alGetError ();		/* clear error */
  alGenSources (NUM_SOURCES, source);

  if (alGetError () != AL_NO_ERROR)
    {
      printf ("- Error creating sources !!\n");
      exit (2);
    }
  else
    {
      printf ("init - no errors after alGenSources\n");
    }

  int i;
  ALfloat posicion_i[3];
  for (i = 0; i<MAX_PLANES; i++) {
    posicion_i[0] = Posiciones[i].x;
    posicion_i[1] = Posiciones[i].y;
    posicion_i[2] = Posiciones[i].z;
  	alSourcef (source[i], AL_PITCH, 1.0f);
  	alSourcef (source[i], AL_GAIN, 1.0f);
  	alSourcefv (source[i], AL_POSITION, posicion_i);
  	alSourcefv (source[i], AL_VELOCITY, velocidadFuentes);
  	alSourcei (source[i], AL_BUFFER, buffer[0]);
  	alSourcei (source[i], AL_LOOPING, AL_TRUE);
  	if (i > 3) {
  		buffer[i] = alutCreateBufferFromFile (s2);
  	}
  }
  
}


int
main (int argc, char *argv[])
{

  if (argc < 3)
    {
      printf
	("Faltan los tres argumentos que indiquen qué ficheros de audio han de sonar asociados a las tres fuentes de audio que se definen en la escena\n\n\
Por ejemplo:\n\
%s /usr/share/sounds/KDE_Beep_Bottles.wav /usr/share/sounds/KDE_Beep_Beep.wav /usr/share/sounds/KDE_Beep_Ahem.wav\n",
	 argv[0]);
      exit (1);
    }
  else
    {
      printf
	("Las fuentes de sonido se activan con las teclas '1', '2' y '3'\n\
Las fuentes de sonido se desactivan con las teclas '4', '5' y '6'\n\
La posición del oyente se modifica con las teclas del cursor (también con 'a', 's', 'q' y 'z').\n\
ESC para terminar\n\n\n");
    }


  glutInit (&argc, argv);
  /* use multisampling if available */
  glutInitDisplayMode (GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH |
		       GLUT_MULTISAMPLE);
   glutInitWindowSize (400, 400); 

  //glutDisplayFunc(dibujarFondo);

  //initialise openAL
  alutInit (&argc, argv);

  GLwin = glutCreateWindow ("glutplane");
  init (argv[1], argv[2], argv[3]);

  glutDisplayFunc (draw);
  glutReshapeFunc (reshape);
  glutKeyboardFunc (keyboard);

  //Añadiendo ratón
  glutMouseFunc (Mouse);

  glutVisibilityFunc (visible);
  glutCreateMenu (menu);
  glutAddMenuEntry ("Add plane", ADD_PLANE);
  glutAddMenuEntry ("Remove plane", REMOVE_PLANE);
  glutAddMenuEntry ("Motion On", MOTION_ON);
  glutAddMenuEntry ("Motion Off", MOTION_OFF);
  glutAddMenuEntry ("Quit", QUIT);
  glutAttachMenu (GLUT_RIGHT_BUTTON);
  /* setup OpenGL state */
  glClearDepth (1.0);
  glClearColor (0.0, 0.0, 0.0, 0.0);
  glMatrixMode (GL_PROJECTION);
  glFrustum (-1.0, 1.0, -1.0, 1.0, 1.0, 20);
  glMatrixMode (GL_MODELVIEW);
  /* add three initial random planes */
  srandom (getpid ());
  add_plane ();
  add_plane ();
  add_plane ();
  /* start event processing */
  glutMainLoop ();
  return 0;			/* ANSI C requires main to return int. */
}
