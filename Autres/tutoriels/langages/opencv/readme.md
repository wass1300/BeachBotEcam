OpenCV sous Python
===================

Installation
------------

#### Windows

**python**

[Installez python 2.7.8](https://www.python.org/ftp/python/2.7.8/python-2.7.8.msi) ( python > 3 car il y a pas assez de compatibilités)

**numpy**
[Installez Numpy](http://sourceforge.net/projects/numpy/files/NumPy/1.9.0/numpy-1.9.0-win32-superpack-python2.7.exe/download
) (version testée:1.9.0) ou via [sourceforge](http://sourceforge.net/projects/numpy/files/NumPy/1.9.0/)

**matplotlib**
[Installez matplotlib 1.4.0 pour python 2.7](https://downloads.sourceforge.net/project/matplotlib/matplotlib/matplotlib-1.4.0/matplotlib-1.4.0.win-amd64-py2.7.exe)

**opencv**
[Téléchargez l'entièreté du pack OpenCV](http://sourceforge.net/projects/opencvlibrary/files/latest/download?source=files) (version 2.4.10, pas la version 3.0 beta)

Ouvrez-là et on vous demandera un emplacement, sélectionnez un endroit temporaire. Allez dans .\opencv\build\python\2.7\x86\cv2.pyd et copiez le dans C:\python27\Lib\site-packages\cv2.pyd

Vous pouvez trouver cv2.pyd dans le dossier lib de tutoriels/langages/opencv/lib/windows. Si vous voulez utiliser pip pour installer une librairie manquante par la suite, exécutez get-pip.py.

#### Linux

    sudo apt-get install python-opencv python-scipy python-numpy python-setuptools python-matplotlib

Avec cela, tout sera prêt pour programmer! :D

Fonctions
---------

Commencez toujours vos fichiers par 

    #!/usr/bin/env python

Cela permet d'assurer que si on l'exécute via ./script.py, ça se lance comme si vous utilisiez la commande python script.py

Ensuite, introduisez les librairies nécessaires

```python
import numpy as np
import cv2
```

Commencez votre programme :

```python
cap = cv2.VideoCapture(0) # 0 est la source vidéo choisie
# cap = cv2.VideoCapture('video.flv') # La source peut être une vidéo
ret, img = cap.read() # lire le stream, la première image
# ret, img = cv2.read('image.jpg') # On peut tout aussi bien lire une image
```

Informations de l'image

```python
print img.shape # (480, 640, 3) = (Height, width, channels)
# Les canaux sont par exemple, le Bleu, le Vert et le Rouge
print img.size # 921600 = Taille totale des pixels
print img.dtype # uint8 = Valeur de l'encodage
```

Votre boucle principale

```python
while True:
    ret,img = cap.read()
    # ESC to quit
    k = cv2.waitKey(1) & 0xFF
    if k == 27:
        break
```

Après ceci, vous êtes prêts à faire vos modifications pour un flux vidéo. Si c'est pour une image seule, INUTILE de le faire tourner dans une boucle while! N'oubliez pas d'indenter après le while!

Convertir l'image dans un autre domaine de couleurs, HSV par exemple:

* H [0:179] = Hue = Teinte, en degrés, donne l'angle de la teinte sur un cercle de 360°. Pour OpenCV, c'est repris sur un axe de 180° parce que les variables utilisées sont entre 0 et 255. Cela améliore les performance en ne codant les pixels que sur 8 bits.
* S [0:255] = Saturation = La quantité de couleur, 0 c'est gris, 255, c'est trop coloré
* V [0:255] = Value = la brillance. 0 c'est noir, 255 c'est blanc.

Aide mémoire
* 0 ou 360 : rouge => 0 ou 179 (opencv)
* 60 : jaune  => 30 (opencv)
* 120 : magenta => 60 (opencv)
* 180 : cyan => 90 (opencv)
* 240 : bleu => 120 (opencv)
* 300 : vert => 150 (opencv)

```python
# Convert BGR to HSV
HSV = cv2.cvtColor(BGR, cv2.COLOR_BGR2HSV)
```

Créer un masque

```python
# Create an array with the minimal part to exclude
lowerb = np.array([0, 0, 0])
# Create an array with the maximal part to exclude
higherb = np.array([Bpos,Gpos,Rpos])

b = img[:,:,0] # Access blue via Numpy in term of INTENSITY

# Create the mask to apply on the main image
mask = cv2.inRange(BGR, lowerb, higherb)
```

Appliquer un treshold

```python
# Revert the mask and make it binary (ON/OFF)
# cv2.treshold(source, treshold_Value, max_value, type)
#http://docs.opencv.org/modules/imgproc/doc/miscellaneous_transformations.html#cv2.threshold
# The type could be : THRESH_BINARY_INV
ret,mask = cv2.threshold(mask,127,255,cv2.THRESH_BINARY)
```

Afficher une image

```python
# Show an image imshow(TitleOfTheWindow, Image)
cv2.imshow('image', image)
# Apply the mask on the BGR image 
# cv2.bitwise_and(Source1,Source2, [destination, [mask]])
# http://docs.opencv.org/modules/core/doc/operations_on_arrays.html?highlight=bitwise_and#cv2.bitwise_and
result = cv2.bitwise_and(BGR,BGR, mask=mask)
```

La dernière commande, si l'on sort de la boucle (via la touche ESC) qui permet de détruire toutes les images affichées et éteindre le programme.

```python
cv2.destroyAllWindows()
```

Interfaces
----------

Pour créer une interface en python, avec openCV, rien de plus simple!

Créez des barres de paramètres. (Nous définissons une fonction Nothing pour que le callback de la fonction ne nous gêne pas.)

```python
def nothing(x):
    pass
# create trackbars to change parameters
# cv2.createTrackbar(NameOfTheTrackbar, NameOfTheWindow, minRange, maxRange, callbackOnEdit)
cv2.createTrackbar('B','BGR colored',0,255,nothing)
```

Ensuite, dans votre boucle, lisez la et utilisez la valeur!

```python
    Bpos = cv2.getTrackbarPos('B','BGR colored')
```

Logiques d'utilisations
-----------------------

Nous avons plusieurs façons possibles de détecter un objet. 

* Travailler sur la couleur (BGR)
* Travailler sur la teinte (HSV)

Sous-méthodes

* Détecter LA couleur/teinte voulue
* Détecter les AUTRES couleurs/teintes et les supprimer. Cela permet de retirer le jaune/orange quand on veut le rouge.

Différences quand aux fonctions

* cv2.inRange, travail sur toutes les couleurs
* cv2.threshold, travail sur un seul cannal

*La méthode avec la couleur HSV est plus intuitive*

NOTE
--------

Un conseil serait de noter les commentaires des codes python en ANGLAIS pour éviter de mettre des accents, car python ne voudra pas l'interpréter (python 3+ l'accepte mais n'est pas compatible pour OpenCV ni pour NodeJS. Inutile de lancer deux instances de ceux-ci)

BEAUCOUP d'autres fonctions sont disponibles. Je ne faisais que préciser celles qui sont les plus importantes pour faire avancer le projet.

Exemples
---------

Les exemples se trouvent dans le dossier "exemples" des tutoriels

Crédits 
--------

Alexis Paques

http://docs.opencv.org/index.html
