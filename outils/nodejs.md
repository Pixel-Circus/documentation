# Utilisation de NodeJS

La grande majorité du temps, le projet viendra avec son installation nodeJS préfaite.

En gros, si dans les fichiers du site ou du thème on voit un package.json, il faudra faire un `npm i` ou `yarn install` dans le dossier qui contient package.json avant que le site fontionne correctement.

## Webpack

## Yarn vs Npm

Yarn est préférable a NPM.

## Legacy

### Gulp
Gulp est une méthode pour faire ses propres scripts pour NPM.

Voir pour un gulpfile.js dans le dossier. S'il est présent, les tâches du projet y sont très probablement.

Voir aussi le gulpconfig.sample.json, qu'il faut sauvegarder comme gulpconfig.json avec les configurations de votre environnement (juste le sauver directement sous gulpconfig.json fonctionne souvent.)


### Bower
Bower est un package system désuet qu'on utilisait avant (comme NPM). Si on voit un bower.json dans un projet faire comme avec node; un `bower install` dans le dossier contenant le fichier bower.json
