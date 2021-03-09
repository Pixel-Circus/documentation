# Normes développement JavaScript

- Lorsque on hook un code sur scroll ou resize, aussi trigger le scroll/resize on page load.
- Le code de chaque module doit être séparé dans son propre .js, comme le sass. Le code contient aussi ses propres triggers pour scroll/resize/etc.
- Le code d'un module ne devrait pas influer sur un autre module.
## Bonnes pratiques jQuery

- Toujours utiliser `on`, `off` ou `once` pour ajouter des événements

## Pas de spaghetti dans functions.js, app.js, index.js...