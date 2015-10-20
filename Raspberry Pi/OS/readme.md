Système d'exploitation
======================

Le système d'exploitation tournant sur la raspberry est au choix des utilisateurs. 
Il y a d'une part les systèmes complets, tels que Raspbian et d'autre par les systèmes propres, tels que Archlinux. 
Quelle est la différence? Dans l'un nous avons un système complet, lourd, mais très compatible où tout est installé de base, 
même ce que l'on ne souhaite pas et dans l'autre, nous avons un système propre, qui tourne avec le minimum requis et où l'on installe que ce que l'on souhaite.

Raspbian
---------

Raspbian est un portage de la distrubituion **propre** et **stable** *Debian*.
Malheureusement, elle a été adaptée en tant que distribution basique pour "débutants", ce qui la rend lourde. Ce poids n'est pas la *quantité d'information* 
mais plutôt le nombre de *services* lancés pour facilité l'utilisation de l'utilisateur final.
Cela dit, les avantages sont nombreux puisque c'est la distribution de base, elle est LONGUEMENT documentée et tous les tutoriels trouvables sur le net peuvent faire l'affaire.

Archlinux
----------

Archlinux quant à lui est un système qui se *veut* propre et à la pointe de la technologie. 
En effet, Archlinux est basé sur un système de *rolling release*, ce qui lui procure un avantage d'être toujours à jour. 
En contre partie, Archlinux n'est pas adapté aux apprentis n'ayant que peu d'attrait pour Linux car nous devons constament nous informer quant aux nouveautés apportées au système. 
Heureusement, la documentation d'Archlinux est très complète et permet l'ajustement du système à nos besoins. 

Choix du système
----------------

**Raspbian est parfait pour le développement**, en effet, il a une interface graphique intégrée ainsi qu'un panel d'outils préinstallés impressionnants. Cela permet de, par exemple, tester la caméra sans avoir besoin d'une interface graphique pour afficher plusieurs images. (il est possible d'afficher une image via la console)

Par contre, Raspbian va nous "voler" des coups de clocks importants lors de l'application du robot. Il est adapté à une utilisation journalière mais pas à un système embarqué. Il va donc de soi qu'il est nécessaire de trouver une alternative.

La solution serait soit de prendre RiscOS qui est le PLUS LÉGER et le plus proche de la machine des systèmes d'exploitations -Not Linux-, ce qui n'est pas faisable dans notre cas puisque nous souhaitons utiliser OpenCV, ce qui n'est pas possible dans RiscOS, soit de prendre Archlinux qui est le plus configurable des systèmes.

Installation des systèmes
=========================

Raspbian & RiscOS
-----------------

Raspbian et RiscOS sont accessibles en téléchargement sur le [site de RaspberryPi](http://www.raspberrypi.org/downloads/) ainsi que sur silicium dans la partie "Projet robot".

Une fois téléchargée, il suffit d'extraire l'image qui est en .zip/.7z/.rar/... (vers une image en .iso/.img) pour enfin faire une copie bit à bit sur la carte SD. Sur windows, utilisez [Win32DiskImager](http://sourceforge.net/projects/win32diskimager/)  

Branchez votre carte SD. 

Programmez, jouez, appréciez.

Archlinux
----------

Pour l'installation d'archlinux, il vous faut tout d'abord une version de Linux, sans Linux, il vous sera difficile de le faire. Lancez donc un système *LIVE* **LINUX**. Pour ce faire, utilisez [Lili](http://www.linuxliveusb.com/fr/home) ou [Rufus](http://rufus.akeo.ie/). 
La distribution est au choix, Archlinux est une console, Debian/Ubuntu ont une interface graphique sur le LIVE CD (ou Live USB)

Une fois le système linux lancé, téléchargez la [dernière version d'Archlinux](http://archlinuxarm.org/platforms/armv6/raspberry-pi) sur leur site. 

* Déterminez l'emplacement de votre carte SD, soit c'est un lecteur SD intégré, il sera représenté en tant que `/dev/mmcblk0` soit `/dev/sdX` si c'est un lecteur de carte USB.

* Créez la table de partitions. Créez une partition de 100mo Bootable, en mode WIN95 FAT32 (LBA). Et une seconde avec le reste des gigas en mode Linux. Le programme est au choix, si vous avez Archlinux, vous pouvez utiliser fdisk (compliqué, expliqué sur Archlinux dans l'onglet Installation) ou cfdisk, qui fournit une interface graphique.

```
# cfdisk /dev/mmcblk0
```

* Formatez les partitions. Elles s'appelent /dev/mmcblk0py ou /dev/sdXy (X est le numéro du disque et y celui de la partition).

```bash
# mkfs.vfat /dev/mmcblk0p1
# mkfs.ext4 /dev/mmcblk0p2
```

* Créez le système sur la carte et montez le.

```
# mkdir /mnt/boot
# mkdir /mnt/sys
# mount /dev/mmcblk0p1 /mnt/boot
# mount /dev/mmcblk0p2 /mnt/sys
```

* Si vous n'aviez pas envore téléchargé l'image, faites le et extrayez la.

```
# cd /mnt/sys
# wget http://archlinuxarm.org/os/ArchLinuxARM-rpi-lasted.tar.gz
# bsdtar -xpf ArchLinuxARM-rpi-lasted.tar.gz -C /mnt/sys
# sync
```

* Déplacez les fichiers du dossier boot.

```
# mv /mnt/sys/boot/* /mnt/boot
```

* Synchronisez et démontez

```
# cd /
# sync
# umount /mnt/sys /mnt/boot
```

* Placez la carte SD et appréciez un système d'exploitation rapide et propre!

NOTE: Le mot de passe par défaut de l'utilisateur *root* est *root*

NOTE2: Les connxions série et SSH sont activées par défaut.