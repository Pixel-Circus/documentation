# Normes de codage en CSS

https://codeguide.co/#css
https://manuals.gravitydept.com/code/css/naming
https://medium.com/@andersonorui_/bem-sass-and-bootstrap-9f89dc07d20f

Autoprefixer

## Reorder automatique des CSS

Dans VS Code, installer l'extention [PostCSS Sorting](https://marketplace.visualstudio.com/items?itemName=mrmlnc.vscode-postcss-sorting) et ajouter ceci dans le settings.json

Ensuite, une fois de temps en temps (chaque fois que on a pas mal fini les modifs dans un fichier SCSS ou CSS), faire rouler la commande `PostCSS Sorting: Run`

Voir la configuration à ajouter dans son VSCode [ici](config-postcss)

À rechercher: Reorder automatique des attributs CSS.

## SMACSS
Utiliser un principe de modules/modifiers.

En gros, chaque module doit pouvoir se tenir seul debout. Le module commence par le préfixe `px` et ensuite, si nécessaire, y ajouter des modifiers qui commencent par `is` ou `has`.

Exemple, la classe d'un module pourrait être `px-button is-blue`

Les noms de classe doivent être en Anglais le plus possible. Si le nom de classe serait un terme technique qui est difficile à savoir en un coup d'oeil (en gros si on a besoin de sortir Google Translate chaque fois tu vois le nom de classe, tu peux juste le mettre en francais)

## SASS

Dans le SASS, essayer le plus possible de utiliser des variables (De Bootstrap ou celles que on met nous même.)

Ne pas trop indenter le code. 2 ou 3 indentations devrait être la max.

https://sass-guidelin.es/

## Fonts

Pas vraiment de nécessité sur comment mettre la fonte. Même que selon le site, certains vont te donner un `<link>`, certains vont te demander un import.

Sa ne dérange pas. Mais ce qui est nécessaire c'est de placer (ou requérir via le fournisseur de fonts) un `font-display:swap` pour que la font puisse être loadée en asynchrone sans que sa casse les fontes.

## Normes CSS
- Tous les spacings devraient être des multiples de 8px.
- Tous les éléments qui peuvent etre interagis avec doivent avoir `cursor:pointer`
