C ++
===========

Introduction
------------

Le C++ est un langage de programmation bas niveau. C'est le successeur du C de par son architecture permettant les objets. En contre partie, le C++ compilé sera théoriquement plus lourd que du C simple.

Précompilation
--------------

Avant la compilation d'un programme, il y a une précompilation qui s'opère. Celle-ci ajoute entre autres les **includes**. Cela dit, il y a une autre puissance sous-jacente. 

```C
#include "Arduino.h"

#define DEBUG true
#if DEBUG
#define DEBUG_BEGIN(x); Serial.begin(x);
#define DEBUG_PRINT(x); Serial.print(x);
#else
#define DEBUG_BEGIN(x);
#define DEBUG_PRINT(x);
#endif
```

Ce code permet de REMPLACER toutes les commandes définies par DEBUG* par Serial.begin et *.print.

Ainsi, si l'on définit *#define DEBUG false*, les commandes DEBUG_BEGIN(x) et DEBUG_PRINT(x) seront remplacés par RIEN. Nous aurons donc un code compilé plus léger!