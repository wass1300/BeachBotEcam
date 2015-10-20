NodeJS -- I²C & Python communication
======================================
Introduction
------------
NodeJS est un logiciel permettant de créer un serveur en Javascript. Son avantage principal se situe dans son principe même, c'est un moteur évènementiel qui ne réagira donc que lors d'évènements. En dehors de ces évènements, le CPU ne sera pas surchargé!

RaspberryPi => Python => NodeJS => Arduino's

NodeJS & I²C
------------
Il faut installer différentes parties, NodeJS, la communication python<->NodeJS ainsi que de configurer la RaspberryPi pour permettre le I²C.

NodeJS, son module et I²C tools 
```bash
 # Installation de NodeJS
$ sudo apt-get install nodejs i2c-tools
 # Installation du module I²C de NodeJS
$ npm install rasp2c
```

Commentez la ligne **blacklist i2c-bcm2708**
```bash
$ sudo nano /etc/modprobe.d/raspi-blacklist.conf
```

Chargez les modules et vérifier qu'ils soient chargés via lsmod
```bash
$ modprobe i2c-bcm2708
$ modprobe i2c_dev
$ lsmod
```

Ajoutez les modules au démarrage
```bash
$ sudo nano /etc/modules

snd_bcm2835
i2c-bcm2708
i2c-dev
```

Ajoutez-vous au groupe i²c de la raspberry pour pouvoir l'utiliser
```bash
$ sudo usermod -aG i2c pi
```

Créez votre script NodeJS
```javascript
var rasp2c = require('rasp2c');

// Detect devices on the I2C Bus
rasp2c.detect(function(err, result) {
  if (err) {
    console.log(err);
  } else {
    console.log(result);
  }
});

// Dump the addresses 0x11 - 0x15 of the I2C device at address 0xa1 on the I2C bus
rasp2c.dump('0xa1', '0x11-0x15', function(err, result) {
  if (err) {
    console.log(err);
  } else {
    console.log(result);
  }
});

// Set the address 0x11 of the I2C device at address 0xa1 on the I2C bus to 0xff
rasp2c.set('0xa1', '0x11', '0xff', function(err, result) {
  if (err) {
    console.log(err);
  } else {
    console.log(result);
  }
});
```

Lancez votre serveur
```bash
node example.je
```

NodeJS <-> Python via ZeroRPC
-----------------

Installez ZeroRPC sur le Python & NodeJS
```bash
$ pip install zerorpc
$ npm install zerorpc
```

Créez un serveur NodeJS
```javascript
var zerorpc = require("zerorpc");

var server = new zerorpc.Server({
    hello: function(name, reply) {
        reply("Hello, " + name);
    }
});

server.bind("tcp://0.0.0.0:4242");
```

Lancez votre serveur NodeJS comme précédemment
```bash
node example.je
```

Créez votre client Python
```python
import zerorpc

c = zerorpc.Client()
c.connect("tcp://127.0.0.1:4242")
print c.hello("RPC")
```


Votre JOB
=========
Le but désormais est d'intégrer les deux langages pour pouvoir appeler le code Javascript via un serveur python pour envoyer des requêtes aux RaspberryPi.

Crédits
--------
Alexis Paques

http://www.instructables.com/id/Raspberry-Pi-I2C-Python/

http://www.instructables.com/id/I2C-between-Arduinos/

https://www.npmjs.org/package/python-shell

http://alexandre.alapetite.fr/doc-alex/raspberrypi-nodejs-arduino/

https://github.com/ni-c/node-rasp2c

http://nodejs.org

http://zerorpc.dotcloud.com/

http://www.pihomeserver.fr/2013/08/13/raspberry-pi-home-server-arduino-lier-les-deux-via-bus-i2c/