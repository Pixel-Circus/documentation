Web2PDF est un outil custom qui a été installé sur un [serveur OVH](serveur-ovh.html) pour permettre la génération de PDF à partir de page web. L'outil utilise le package Puppeteer de NodeJS. Puppeteer utilise une version de Chrome installée dans son package pour générer un PDF en utilisant la fonction d'impression PDF native de Chrome.

Il est donc possible de tester le rendu du PDF en ouvrant Chrome sur son ordinateur et en faisant un aperçu avant impression.

Cet outil est utilisé sur les projets suivants:

- Univins

## Utilisation

L'URL de l'outil est https://web2pdf.pixelcircusclient.com.

Pour l'utiliser, il faut appeler l'URL https://web2pdf.pixelcircusclient.com/generate.php?url=[URL DE LA PAGE]. _En ouvrant cet URL dans un navigateur, le PDF sera affiché.

Exemple d'une utilisation PHP pour sauvegarder le PDF:

```php
<?php
    $dest = PATH_TO_DESTINATION;
    $url = "URL DU HTML À GÉNÉRER EN PDF";
    $pdf = file_get_contents('https://web2pdf.pixelcircusclient.com/generate.php?url='.$url);
    file_put_contents($dest, $pdf);
```

## Configuration

L'outil utilise le whitelisting pour le sécuriser. Seulement les adresses IP autorisées peuvent générer un PDF et un PDF ne peut être généré que pour les noms de domaine qui sont autorisés.

Pour modifier la configuration, il faut se connecter au [serveur OVH](serveur-ovh.html) et modifier le fichier directement.