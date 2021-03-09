# React

- Le code n'est pas en React Natif. Nous utilisons du HTML.
- Aucune obligation du type de react à utiliser (pré ou post 16.8.0)
## Plugins Reacts communs

- Axios, pour les requêtes de data à un json.
- node-sass pour pouvoir importer du SASS dans des components React.
- redux pour les variables d'application en entier.
- Helmet pour modifier le `<head>`
- @reach/router pour le routing
- bootstrap react, pour pouvoir utiliser Twitter Bootstrap dans une application React

## Structure du projet
- Tout est dans `/src/`

### app.js
Le fichier de base app.js est surtout uniquement utilisé pour le routing et certains setups génériques à l'app au complet.

### /assets/
Contient toutes les images sous images, les scss généraux sous /scss/

### /components/
Contient les petits modules, les pièces de puzzle qui bâtissent le site. Chaque module doit être un petit élément du site, et doit pouvoir se tenir debout par lui-même.

Les modules dans components ne devraient pas appeler d'autres components.

Chaque module est contenu dans son propre dossier, contenant le JS du module, et le SCSS de tout ce qui est relié à ce module.

### /container/
Contient des modules moyens. La différence majeure avec les components c'est que les containers doivent travailler avec leur propre States (alors que les components se font uniquement passer des props et si ils ont des choses qui changent, le state est géré ailleurs)

### /templates/
Même structure que les modules, mais ici c'est des pages entières, bâties via des modules de components/containers. C'est aussi dans ces fichiers que seront gérés les appels nécessaires via axiom et les setups généraux de page.

### /functions/

Contient les fonctions JS qui peuvent-être nécessaires dans de multiples modules sans être ouvertement reliés à ce module. Exemple: Une fonction qui permet de prendre une string et en faire un slug.

### /actionCreator/ et /reducers/

Contient le code nécessaire pour permettre l'utilisation de reducers Redux, si nécessaire.

## NextJS

TODO À écrire