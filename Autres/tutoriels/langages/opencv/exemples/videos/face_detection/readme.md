Face Detection
===============

Introduction
---------------

OpenCV chercher et reconnaitra les visages via face.xml, qui est un fichier "HAAR". Il va donc comprendre et interpreter des paramètres selon des valeurs TRESHOLD. Et si ça marche, EST PASSANT CE MOS!
Les fichiers HAAR sont générés via des images avec un visage (au moins 5000) et des images sans visage (au moins 3000). Ensuite on génère une panoplie d'images de tests avec des têtes et d'autres sans, avec des inclinaisons, ect. Ensuite, il, grâce à certains scripts, on fait "apprendre" les visages au programme. Il enregistre sa session dans un fichier XML.

Pour plus d'informations : http://note.sonots.com/SciSoftware/haartraining.html

Utilisation
---------------
Il suffit de lancer la commande

    > python facedetect.py --cascade=face.xml 0


Credits
---------------
Tous les crédits reviennent à Intel et http://www.technolabsz.com/2013/03/how-to-easily-install-opencv-on.html