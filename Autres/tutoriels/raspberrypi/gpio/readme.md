Utilisation des GPIO
====================

Information
-------------
La RaspberryPi a une multitude de GPIOs. Ceux-ci fonctionnnent sous *3.3V* et il faut ABSOLUMENT éviter de brancher une tension de 5V dessus au risque de les casser. Faites donc bien attention à ne pas les court-circuiter avec les pins de 5V utilisées pour alimenter des éléments connectés.

Utilisation en python RPi.GPIO
------------------------------
Après avoir installé le paquet python.RPi.GPIO, il vous suffit d'importer la librairie pour accéder aux GPIO.

```python
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM) # mode de numérotation des pins des GPIO

MaPinIN = 18
MaPinOUT = 24
GPIO.setup(MaPinOUT,GPIO.OUT)
GPIO.setup(MaPinIN,GPIO.IN)

GPIO.output(MaPinOUT,False) # Nous pouvons mettre False, True, 0, 1, GPIO.LOW ou GPIO.HIGH

INPUT=GPIO.input(MaPinIN)
print(INPUT)

# http://sourceforge.net/p/raspberry-gpio-python/wiki/Inputs/
# WAITING, Le thread va dormir jusqu'à ce que RISING/FALLING/BOTH edge
GPIO.wait_for_edge(MaPinIn, GPIO.RISING)

# (BEST) Callback : Crée un second Thread pour gérer cet interruption
def my_callback_one(channel):
    print('Callback one')
    GPIO.remove_event_detect(channel)
    print('Callback one removed')

def my_callback_two(channel):
    print('Callback two')

GPIO.add_event_detect(channel, GPIO.RISING)
GPIO.add_event_callback(channel, my_callback_one)
GPIO.add_event_callback(channel, my_callback_two)

# PWM Mais... PAS une PWM Hardware! Sprouch CPU => Arduino
p = GPIO.PWM(channel, frequency)
p.start(dc)
p.ChangeFrequency(freq)
p.ChangeDutyCycle(dc)
p.stop()
```

Hardware PWM en python RPIO.PWM
-------------------------------
Une PWM hardware permet d'éviter d'utiliser le processeur. En effet, un élément interne à la RaspberryPi s'occupe de générer la PWM. Le CPU ne devra que modifier quelques valeurs du registres au début et à la fin du signal à la place de devoir réagir toutes les 10µs (PWM à 100kHz).

Pour ce faire, nous allons utiliser une autre librairie, nommée RPIO.
http://pythonhosted.org/RPIO/pwm_py.html

High level PWM

```python
from RPIO import PWM

servo = PWM.Servo()

# Set servo on GPIO17 to 1200µs (1.2ms)
servo.set_servo(17, 1200)

# Set servo on GPIO17 to 2000µs (2.0ms)
servo.set_servo(17, 2000)

# Clear servo on GPIO17
servo.stop_servo(17)
```

Low Level PWM

```python
from RPIO import PWM

# Setup PWM and DMA channel 0
PWM.setup()
PWM.init_channel(0)

# Add some pulses to the subcycle
PWM.add_channel_pulse(0, 17, 0, 50)
PWM.add_channel_pulse(0, 17, 100, 50)

# Stop PWM for specific GPIO on channel 0
PWM.clear_channel_gpio(0, 17)

# Shutdown all PWM and DMA activity
PWM.cleanup()
```

Votre JOB
=========
Le but est de pouvoir générer une PWM avec la RaspberryPi, ATTENTION, PAS TROP ÉVOLUÉE. Testez le moteur avec. 

*Générez une PWM avec une Arduino.*

Ajoutez la communication I²C à votre Arduino pour permettre à NodeJS de communiquer avec vous. 

Créez des fonctions qui lisent en continu certaines valeurs de registres écris via l'I²C, pour modifier la PWM en temps réel.

Credits
-------------
Alexis Paques

http://sourceforge.net/p/raspberry-gpio-python/wiki/Inputs/

http://arduino.cc/en/Tutorial/PWM