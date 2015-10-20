Objectifs Caméra
================

Nous utiliserons possiblement une image plus petite pour éviter de devoir faire trop de conversions inutiles. En effet, si nous utilisons une image de 240*180 pour avoir des valeurs de x et y inférieures à 255 et coder ces positions sur 2 bytes. De plus, ça quadruple le processing des images. (Si nécessaire)

Définir la taille de l'image prise
----------------------------------

Si possible, diminuer la taille de l'image prise (via les paramètres OpenCV) pour ne pas capturer une image de 640*480 mais 240*180.

Détection d'objets
------------------

Détecter un objet et donner sa position/couleur sur l'image.

Forme
-------

Détecter la forme des objets du plateau.

* Balles
  * Tennis
  * Ping Pong
* Spots pour balle de tennis
* Gobelets
* Zones du plateau
* Distributeurs de popcorn
* Claps claps

Line Tracking
--------------

Nous chercherons un autre système que la caméra car elle est positionnée en hauteur et nous n'avons pas accès à la ligne sous nous.

Placement de la caméra
----------------------

Trouver l'emplacement idéal de la caméra.

Retour de données en SPI
-------------------------

Camera ==JPEG=> Python-opencv => [forme, couleur, position] => Transformation en Hexa [Forme&Couleur, PositionX, PositionY] ==SPI=> Arduino

Crédits
---------

Alexis Paques

Nabil Nehri