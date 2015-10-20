Gestion des moteurs par l'arduino
=================================

Les moteurs sont gérés par la RPi via l'I2C. Il faut donc voir ce que l'on va mettre dans le(s) byte(s) que la RPi va envoyer à l'arduino pour les commander. 

Choix du byte de commande
-------------------------

Pour ne pas surcharger l'I2C, on a intérêt à restreindre au maximum le nombre de byte à envoyer. Le mieux serait donc de ne devoir en envoyer un seul.

Il y a 5 commandes possible :

* Avance
* Recule
* Va à droite
* Va à gauche
* Stop

On a normalement besoin de 3 bits pour en choisir une. Une solution pour se limiter à 2 bits serait de ne pas considérer stop comme une commande possible. On pourrait mettre tout les bits à 0 quand on veut arrêter le robot. Du coup, il faudrait au moins un des bits restant qui ne soit pas à 0 dans la commande pour laquelle on mettrait 00 pour l'appeler. On peut faire en sorte que le paramètre que l'on va lui joindre ne soit jamais nul.

On peut se demander quel paramètre supplémentaire on pourrait envoyer. 

Un paramètre intéressant pour les points 3 et 4 pourrait être une notion de durée à appliquer à la commande. En effet, on pourrait ainsi dire de combien de degré on veut tourner (temps*vitesse à laquelle on tourne). Il faut évidemment connaitre la vitesse à laquelle on tourne, mais il suffira de la mesurer une fois. 

Un paramètre intéressant pour les points 1 et 2 serait une notion de vitesse (ou à nouveau une durée).

Pour moi, la structure du byte devrait ressembler à quelque chose comme ça :

* 11xx xxxx => avance, les x définissant une durée ou une vitesse 
* 00xx xxxx => recule, les x définissant une durée (qui par définission ne sera pas nulle, sinon on ne recule pas...)
* 01xx xxxx => droite, les x définissant un angle (via une durée : temps*vitesse à laquelle on tourne)
* 10xx xxxx => gauche, les x définissant un angle
* 0000 0000 => stop

Ensuite, il faut avoir une idée de la précision de la roue codeuse. Quelle est notre sensibilité? On pourrait donner le nombre d'impulsions à dénombrer?

Structure du code de commande `.ino`
------------------------------------

Pour le code, il faudra utiliser les données que le byte nous fournit afin de commander comme on veut les moteurs.

Credits
=======

Louis Defauw