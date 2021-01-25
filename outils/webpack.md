# Webpack
 
Tout est dans le package.json
 
## C'est quoi qui a dans le package.json?
 
### name, version et private
 
C'est 3 éléments qui ne sont pas très importants. Les laisser tels quels.
 
### devDependencies et dependencies
Ces deux listes contiennent tous les éléments à télécharger pour faire fonctionner le site.
 
Ce qui a dans dependencies sera compressé avec tout le JS pour être utilisé en production.
 
Ce qui a dans devDependencies sont les choses juste nécessaires pour lorsqu'on développe en local. Exemple, les plugins nécessaires pour compresser les images.
 
### Scripts
Ce sont des lignes de commande. Lorsque le script est appelé, les lignes reliées seront exécutées comme si les commandes étaient écrites dans une interface de ligne de commande placée dans ce dossier en particulier. Chaque ligne est séparée par `&&`.
 
## Comment ajoute-t-on un module JS à l'installation?
 
C'est simple. Premièrement, trouver le package voulu sur [npm](https://www.npmjs.com/). Ensuite, exécuter la ligne `npm i [nom du module]` dans le même dossier que le package.json. Le package s'installera et écrira la ligne nécessaire dans le package.json.
 
Ensuite, l'élément du package sera accessible dans le JS.
 

