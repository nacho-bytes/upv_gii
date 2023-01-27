#!/usr/bin/gnuplot -persist

# Tipo de fichero que se genera seguido de las opciones específicas de
# ese tipo de fichero. Os dejamos como ejemplo la generación de un
# fichero de tipo eps "encapsulated postscript" que es un formato
# vectorial que garantiza un escalado arbitráreo de las gráficas sin
# efectos de pixelado

set terminal postscript eps font "Helvetica,24"

# Otro tipo de fichero que puede generar gnuplot es JPEG, que es un
# tipo ampliamente conocido de mapa de bits (no vectorial), pero que
# no puede ser escalado arbitráreamente. Se puede generar con el
# comando: set terminal jpeg

#
# Nombre del fichero de salida
#

set terminal jpeg size 1280,960
set output "pca+gaussian-exp-k20.jpeg"

# Establece que los ejes estén en escala logarítmica para observar más
# fácilmente valores muy cercanos entre si

set logscale xy

#
# Rangos del eje x y del eje y
#

# set xrange [0.5:1]
# set yrange [4:7]

# set xrange [0.5e-9:1.5]
# set yrange [4:75]

set xrange [0.5e-9:1.5]
set yrange [4:25]

# Define los puntos de referencia (tics) sobre el eje x y el eje y
# entre paréntesis se indican separados por coma la etiqueta de texto
# entre comillas dobles y la posición en ese eje donde aparece la
# etiqueta

# set xtics ("0.1" 0.1, "0.2" 0.2, "0.3" 0.3, "0.4" 0.4, "0.5" 0.5, "0.6" 0.6, "0.7" 0.7, "0.8" 0.8, "0.9" 0.9, "0.95" 0.95, "0.99" 0.99)
# set ytics ("4" 4, "4.25" 4.25, "4.5" 4.5, "4.75" 4.75, "5" 5, "5.25" 5.25, "5.5" 5.5, "5.75" 5.75, "6" 6, "6.25" 6.25, "6.5" 6.5)

set xtics ("1e-9" 1e-9, "1e-8" 1e-8, "1e-7" 1e-7, "1e-6" 1e-6, "1e-5" 1e-5, "1e-4" 1e-4, "1e-3" 1e-3, "1e-2" 1e-2, "1e-1" 0.1, "1" 1)
set ytics ("5" 5, "10" 10, "15" 15, "20" 20, "25" 25, "30" 30, "35" 35, "40" 40, "45" 45, "50" 50, "55" 55, "60" 60, "65" 65, "70" 70, "75" 75)

# Definimos el texto que usamos para poner etiquetas en la gráfica:
# - El eje x "Dimensionalidad"
# - El eje y "Error (%)"
# - La línea horizontal que representa la tasa de error sin aplicar
#   PCA "Original"
# - El título de la gráfica "MNIST 1-NN"
#
# Después del texto que se muestra en la gráfica aparecen las
# coordenadas (at x,y) donde debe aparecer la etiqueta seguido de como
# se alinea el texto (right, left, center) e incluso el tipo y tamaño
# de la fuente: font "HelveticaBold,30"

# set label "Alpha" at 0.99,4.05 right
# set label "Error (%)" at 0.505,6.8 left
# set label "MNIST PCA+Gaussian" at 0.8,5.25 center font "HelveticaBold,30"

# set label "Alpha" at 0.8,4.2 right
# set label "Error (%)" at 0.8e-9,65 left
# set label "MNIST PCA+Gaussian" at 1e-3,20 center font "HelveticaBold,30"

set label "Alpha" at 0.8,4.2 right
set label "Error (%)" at 0.8e-9,24 left
set label "MNIST PCA+Gaussian" at 1e-3,12 center font "HelveticaBold,30"

# El comando plot representa las dos curvas que aparecen en la
# gráfica. La primera curva es la de PCA y la segunda, la Original,
# es decir, sin aplicar PCA.
#
# En ese comando plot la especificación de cada una de las curvas está
# separada por coma de la otra
# Primera: "pca+knn-exp.out" u 1:2 t "PCA" w lp lw 2 lt 1 ps 2.0
# Segunda: 2.52 not w l lw 4 lt 2
#
# Sobre la primera curva, el fichero pca+knn-exp.out es un fichero de
# texto con dos columnas. La primera columna es el número de
# dimensiones a los cuales proyectas y la segunda columna es la tasa
# de error del clasificador de 1 vecino más cercano cuando utilizas
# ese número de dimensiones.
#
# El comando plot para la primera curva se interpreta de la siguiente
# manera: el fichero pca+knn-exp.out se representa gráficamente
# mediante una curva usando (u) la columna 1 como eje x y la columna 2
# como eje y siendo el título de la curva "PCA", el tipo de curva es
# de una línea con los puntos experimentales sobre la misma "with
# linespoints" (w lp), el "linewidth" de la curva es 2 (lw 2), el
# "linetype" es la 1 (lt 1) y el "pointsize" es 2.0 (ps 2.0)
#
# El plot para la segunda curva es una línea horizontal cuyo valor
# constante es 2.52 para todo valor de x, no quiero título "notitle"
# (not) para esta curva, el tipo de curva es una línea "with line" (w
# l) cuyo linewidth es 4 (lw 4) y el tipo de línea es la 2 (lt 2)

set key outside
plot for [col=6:11] "pca+gaussian-exp-test.out" u 1:col t columnheader w lp lw 2

# Si quieres saber más sobre los anchos de línea, tipos de
# línea/punto, etc. ejecuta "gnuplot" desde el interprete de comandos,
# y dentro de gnuplot ejecuta el comando "test"
