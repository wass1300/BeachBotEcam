Le langage Markdown
====================

Introduction
------------

Le langage Markdown permet de mettre en page du texte juste avec une syntaxe de caractères. Cela évite de devoir prendre sa souris en main ou de devoir créer un thème. En effet, ce thème est universel pour tout le serveur. Il est utilisé sur tous les serveurs Git, mais aussi sur les sites d'entre-aide tels que StackOverflow.

C'est ce langage qui permet d'écrire ce tutoriel.

De base, lorsque l'on ouvre le Git via le site, il nous montre le fichier "readme.md". Son extension précise le langage, Markdown. Cela peut être utilisé pour donner des informations sur chacun des dossiers d'un Git.


Markdown Cheatsheet
--------------------

Dans la suite du tutoriel, j'ai essayé de reprendre ce qui nous sera le plus utile. Le tutoriel est principalement repris de : [https://github.com/adam-p](https://github.com/adam-p/markdown-here/wiki/Markdown-Here-Cheatsheet), plus d'information son disponible sur cette CheatSheet.

Si vous voulez tester votre code, vous pouvez vous rendre [ici](http://markdown-here.com/livedemo.html). (Attention ce n'est pas exactement la même version de markdown qui est diponible sur le site, on peut donc avoir des erreurs de compatibilité.)


### Table of Contents
1. Headers
2. Lists
3. Links
4. Code and Syntax Highlighting
5. Tables
6. Blockquotes


### Headers
```markdown
# H1 
## H2
### H3
#### H4
##### H5
###### H6

Alternatively, for H1 and H2, an underline-ish style:

Alt-H1
======

Alt-H2
------
```

# H1 
## H2
### H3
#### H4
##### H5
###### H6

Alternatively, for H1 and H2, an underline-ish style:

Alt-H1
======

Alt-H2
------


### Lists
```markdown
1. First ordered list item
2. Another item
  * Unordered sub-list. 
1. Actual numbers don't matter, just that it's a number
  1. Ordered sub-list
4. And another item.  

   Some text that should be aligned with the above item.

* Unordered list can use asterisks
- Or minuses
+ Or pluses
```

1. First ordered list item
2. Another item
  * Unordered sub-list. 
1. Actual numbers don't matter, just that it's a number
  1. Ordered sub-list
4. And another item.  

   Some text that should be aligned with the above item.

* Unordered list can use asterisks
- Or minuses
+ Or pluses


### Links
There are two ways to create links.

    [I'm an inline-style link](https://www.google.com)
    
    [I'm a reference-style link][Arbitrary case-insensitive reference text]
    
    [You can use numbers for reference-style link definitions][1]
    
    Or leave it empty and use the [link text itself]
    
    Some text to show that the reference links can follow later.
    
    [arbitrary case-insensitive reference text]: https://www.mozilla.org
    [1]: http://slashdot.org
    [link text itself]: http://www.reddit.com


[I'm an inline-style link](https://www.google.com)

[I'm a reference-style link][Arbitrary case-insensitive reference text]

[You can use numbers for reference-style link definitions][1]

Or leave it empty and use the [link text itself]

Some text to show that the reference links can follow later.

[arbitrary case-insensitive reference text]: https://www.mozilla.org
[1]: http://slashdot.org
[link text itself]: http://www.reddit.com


### Code and Syntax Highlighting
```markdown
Inline `code` has `back-ticks around` it.
```

Inline `code` has `back-ticks around` it.

Blocks of code are either fenced by lines with three back-ticks ```, or are indented with four spaces. I recommend only using the fenced code blocks -- they're easier and only they support syntax highlighting.

    ```javascript
    var s = "JavaScript syntax highlighting";
    alert(s);
    ```
    
    ```python
    s = "Python syntax highlighting"
    print s
    ```
    
    ```
    No language indicated, so no syntax highlighting. 
    But let's throw in a <b>tag</b>.
    ```

The result :

```javascript
var s = "JavaScript syntax highlighting";
alert(s);
```
 
```python
s = "Python syntax highlighting"
print s
```
 
```
No language indicated, so no syntax highlighting. 
But let's throw in a <b>tag</b>.
```


### Tables
```markdown
Colons can be used to align columns.

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

The outer pipes (|) are optional, and you don't need to make the raw Markdown line up prettily. You can also use inline Markdown.

Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3
```

Colons can be used to align columns.

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

The outer pipes (|) are optional, and you don't need to make the raw Markdown line up prettily. You can also use inline Markdown.

Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3


### Blockquotes
```markdown
> Blockquotes are very handy in email to emulate reply text.
> This line is part of the same quote.

Quote break.

> This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can *put* **Markdown** into a blockquote. 
```

> Blockquotes are very handy in email to emulate reply text.
> This line is part of the same quote.

Quote break.

> This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can *put* **Markdown** into a blockquote. 


Credits
------------
Alexis Paques

Defauw Louis

[https://github.com/adam-p](https://github.com/adam-p/markdown-here/wiki/Markdown-Here-Cheatsheet "CheatSheet")