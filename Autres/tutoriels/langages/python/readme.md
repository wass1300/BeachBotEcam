Tutoriel python
==================
Installation
-------------

### Windows
Il vous suffit de télécharger le moteur python depuis leur site.
https://www.python.org/

### Linux
Selon votre distribution, utilisez la commande d'ajout de paquet.

    > sudo apt-get search python
    > sudo apt-get install pythonX.X.X

    > pacman -Ss python
    > pacman -S pythonX.X.X

Le langage
-------------

### Commentaires
Les commentaires sont indiqués avec un "#" ou un triple guillemet.

```python
# Cette ligne est commentée
""" Moi aussi tu sais? """
```
### Variables
Les variables ne doivent pas être déclarées et leur type est automatique. Pour demander quelque chose à l'utilisateur, utilisez input et pour montrer le résultat, utilisez print.

Le "%s" défini comment le programme doit comprendre la variable pour la monter à l'utilisateur.

```python
name = input('What is your name?\n')
print('Hi, %s.' % name)
```
### Indentations
Les indentations, contrairement à beaucoup de langages font partie INTÉGRANTE du programme. Cela force l'utilisateur à avoir une certaine rigueur dans son programme et permet d'avoir toujours de beaux codes bien indentés en python. De base, préférez une indentation de *4 espaces*!

### Conditions
Les conditions sont comme n'importe quel autre langage sauf que l'on ne devra pas fermer, il suffit de désindenter.

```python
if (   
       cond1 == 'val1' and cond2 == 'val2' and 
       cond3 == 'val3' and cond4 == 'val4'
   ):
    do_something
```

### Boucles
Un avantage au python est l'utilisation possible d'un mot clé "range" pour, à la MatLab faire des suites de nombres rapidement.

```python
try:
    while True:
        print("STOPPEZ MOI AVEC CTRL+C!")
        Sleep(1)
KeyboardInterrupt:
    print("Merci")
```

```python
for num in range(10):
    print(num)
```

### Fonctions
Nous définissons une fonction via def et nous utilisons comme n'importe quelle fonction.

```python
def carre(n):
    resultat = n*n
    return resultat
carre(5)
```

```python
def fib(n):
    a, b = 0, 1
    while a < n:
        print(a, end=' ')
        a, b = b, a+b
    print()
fib(1000)
```

### Librairies
Pour importer une librairie, utilisez la commande "import". Pour l'utiliser il vous suffira d'utiliser le nom de la librairie [point] la fonction à utiliser. Précisez le mot clé "AS" pour sous-traiter

```python
import RPi.GPIO as GPIO
import time

CaptureDeTemps=time.time()
GPIO.setmode(GPIO.BCM)
```

Credits
-------------
Alexis Paques
https://www.python.org/