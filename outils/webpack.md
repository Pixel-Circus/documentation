# Webpack

Webpack est l'outil que nous utilisons pour compiler les assets frontend pour les sites. Pour nos projets Wordpress, nous utilisons une librairie nommée [WPack.io](https://wpack.io/). Cette librairie utilise à son tour Webpack qui est lui installé grâce à `npm`.

## WPACK.IO

Cette librairie est bâtie sur Webpack et est conçue pour fonctionner dans un environnement Wordpress. Elle a 2 fichiers de configuration `wpackio.project.js` qui est la configuration partagée par tous les développeurs et `wpackio.server.js` qui contient les informations pour permettre le live reload en local.

__Il est important que les valeurs `appName`, `slug` et `bannerConfig.name` correspondent au dossier WordPress du thème sinon le live reload ne fonctionnera pas.__

Les fichiers SCSS et JS sont automatiquement compilés et minifiés par la librairie. Les images sont aussi optimisées. Les fichiers de développement se retrouvent dans `assets_src` et les fichiers compilés dans `assets_dist`.

Comme Webpack crée des fichiers uniques à chaque compilation, il n'est pas possible de directement lier les fichiers assets compilés à l'aide de `wp_enqueue_*` dans Wordpress. Wpack.io corrige cette situation en fournissant un package Composer à inclure dans le projet [wpackio/enqueue](https://github.com/swashata/wpackio-enqueue). Cette partie est déjà en place dans le thème de base et ne nécessite aucun ajustement.

### Lignes de commandes

`npm run bootstrap`
C'est la commande qui permet de configurer son projet pour le développement local. À exécuter une fois après le checkout d'un projet.

`npm run build`
Compile tous les assets dans le dossier `assets_dist`.

`npm run start`
Lance un serveur Live Reload pour faire le développement avec mises à jour en temps réel.

`npm run archive`
Compile et prépare le thème pour une release. _(Pas vraiment utilisé)_ 

 
## C'est quoi qu'il y a dans le package.json?
 
package.json est le fichier de configuration pour `npm` qui installe wpack.io et webpack pour permettre de compiler les assets de nos sites Wordpress.
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
 

