SPI sur Raspberry en Python
===========================
Introduction
------------
Le SPI est un protocole de communication nécéssitant 4 fils pour fonctionner. Pour chaque esclave il faut au moins un fil de plus. Si nous utilisons 3 Arduinos, il nous faudra au MOINS 6 fils. Ce n'est pas, d'après moi, la solution idéale.

NodeJS
-------
Nous pourrions créer un serveur NodeJS. Il ferait le lien entre le programme python et les arduinos. De plus, NodeJS n'utilise pas de ressources au repos.

Crédits
--------
Alexis Paques