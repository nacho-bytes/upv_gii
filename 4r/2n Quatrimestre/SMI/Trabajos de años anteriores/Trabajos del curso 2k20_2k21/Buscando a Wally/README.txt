En primer lugar, tendremos que instalar pipenv con la siguiente instrucción:

pip install pipenv → descargar pipenv
pipenv install → instalar pipenv

(Las dos anteriores solo son necesarias la primera vez)

La siguiente instrucción ejecuta y nos introduce en un entorno necesario para la ejecución de programa.

pipenv shell → ejecución del shell de pipenv


A continuación, para continuar con el proceso, deberemos instalar las siguientes librerías, de otra forma, no permite ejecutar el programa:

pip install matplotlib
pip install tensorflow
pip install pillow

Para ejecutar el programa en consola, debemos ejecutar la orden python find_wally.py images/x.jpg, siendo la x un número entre 1 y 36, ya que en la carpeta imágenes tenemos solo 36 imágenes. Por supuesto se pueden añadir más y se accede a ellas con el comando find_wally.py images/x.jpg [2] donde x sea el nombre de la foto.