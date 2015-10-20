Utilisation de l'Arduino Pro Mini
=================================

Ce fichier résume, en fonction de ce qui nous intéresse, ce qui est dit sur le [site officiel](http://arduino.cc/en/Guide/ArduinoProMini).

**Nous utiliserons probablement une Funduino.**

Généralités
-----------
Il existe 2 versions de l'arduino pro mini, une qui tourne avec du 5V et une qui tourne avec du 3V3. Il faudra donc choisir ce qu'il nous arrange le mieux en fonction de la raspberry pi.

Uploading Sketches
------------------
The board comes without built-in USB circuitry, so an off-board USB-to-TTL serial convertor must be used to upload sketches. This can be a FTDI TTL-232R USB - TTL Level Serial Converter Cable for the 5V Arduino Mini Pro), or a FTDI TTL-232R-3V3 USB - TTL Level Serial Converter Cable or the SparkFun FTDI Basic Breakout Board for a 3.3V Arduino Mini Pro. 

**Attention, l'adaptadeur utilisé dépend de la tension d'utilisation de l'arduino.**

If using the FTDI cable on Windows, you'll need to make one configuration change to enable the auto-reset. With the board connected, open the Device Manager (in Control Panels > System > Hardware), and find the USB Serial Port under Ports. Right-click and select properties, then go to Port Settings > Advanced and check Set RTS on Close under Miscellaneous Options.
For the 3.3V versions of the Arduino Pro Mini, select Arduino Pro or Pro Mini (3.3V, 8 MHz) w/ ATmega328 or Arduino Pro or Pro Mini (3.3V, 8 MHz) w/ ATmega168 from the Tools > Board menu (depending on the microcontroller on your board). For the 5V versions of the Arduino Pro Mini, select Arduino Duemilanove or Nano w/ ATmega328 or Arduino Diecimila, Duemilanove, or Nano w/ ATmega168.

**Il faut donc aussi faire attention au niveau software.**

Power
-----
The board can be powered through USB via the six-pin programming header, or from a regulated 5V or 3.3V (depending on the model) supply applied to the VCC pin or an unregulated supply on the RAW pin.

Crédits
--------
Louis Defauw

http://arduino.cc/en/Guide/ArduinoProMini