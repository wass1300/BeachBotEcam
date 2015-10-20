import RPi.GPIO as G
import time

INFRAIN=22
LED=18

G.setmode(G.BCM)
G.setup(LED,G.OUT)
G.setup(INFRAIN,G.IN)

try:
 while True:
  if(G.input(INFRAIN)):
   G.output(LED,0)
  else:
   G.output(LED,1)
except KeyboardInterrupt:
 g.cleanup()
