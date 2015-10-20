Utiliser un adaptateur HDMI vers VGA 
===================================================

Introduction
------------
Quand nous disposons uniquement d'une entrée VGA il est obligatoire d'utiliser un adaptateur HDMI vers VGA . 
L'adaptateur se charge de convertir le signal numérique de HDMI vers un signal analogique mais il faut changer quelques configurations de l'affichage pour pouvoir l'utiliser .



Modification du fichier config.txt 
-------------------------
Il suffit de modifier le fichier /boot/config.txt et de retirer certaines lignes mise automatiquement en commentaire . 

```bash
# For more options and information see 
# http://www.raspberrypi.org/documentation/configuration/config-txt.md
# Some settings may impact device functionality. See link above for details

# uncomment if you get no picture on HDMI for a default "safe" mode
#hdmi_safe=1

# uncomment this if your display has a black border of unused pixels visible
# and your display can output without overscan
#disable_overscan=1

# uncomment the following to adjust overscan. Use positive numbers if console
# goes off screen, and negative if there is too much border
#overscan_left=16
#overscan_right=16
#overscan_top=16
#overscan_bottom=16

# uncomment to force a console size. By default it will be display's size minus
# overscan.
#framebuffer_width=1280
#framebuffer_height=720

# uncomment if hdmi display is not detected and composite is being output
hdmi_force_hotplug=1
#On retire la mise en commentaire 


# uncomment to force a specific HDMI mode (this will force VGA)
hdmi_group=2
hdmi_mode=16
#On retire la mise en commentaire et on change les valeurs 
#Chercher sa configuration sur le site : #http://www.raspberrypi.org/documentation/configuration/config-txt.md

# uncomment to force a HDMI mode rather than DVI. This can make audio work in
# DMT (computer monitor) modes
hdmi_drive=2
#On retire la mise en commentaire 


# uncomment to increase signal to HDMI, if you have interference, blanking, or
# no display
#config_hdmi_boost=4

# uncomment for composite PAL
#sdtv_mode=2

#uncomment to overclock the arm. 700 MHz is the default.
#arm_freq=800

gpu_mem=16
start_x=0
```


Crédits
--------

Nehri Nabil

http://www.pobot.org/Sortie-VGA-pour-la-Raspberry-Pi.html

http://www.raspberrypi.org/documentation/configuration/config-txt.md : On y trouve toutes les informations nécessaire pour changer 
sa configuration