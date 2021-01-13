# Optimisation des sites web.

** Tout dans ce fichier est à être discuté dans un meeting de process

## Bonnes pratiques

#### Images

Dans le thème, ne pas utiliser de JPG/PNG. Toutes les images loadées par le thème devraient être loadées via SVG/WebP. Pas besoin de export les images en WebP dès le départ, le thème s'en charge (une image mise dans les sources comme image.jpg deviendra image.webp)

Afin de réduire le plus possible le score CLS, les blocs devraient avoir le mions de variance possible. Ce qui veut dire éviter les éléments ajoutés en JS et définir les tailles des images dans le code, comme ça elles prennent leur espace avant même que l'image soit loadée.

Essayer de ne pas charger les grosses images via CSS. Les images majeures devraient être loadées via un tag IMG pour qu'ils puissent être mis en lazyload par litespeed.

## Avoir son résultat

- Utiliser [GTMetrix](https://gtmetrix.com/) via le compte fpilon@pixelcircus.ca

## Comment lire son résultat

- GTMetrix Grade
  - C'est le grade GTMetrix, fait via un test lighthouse (Google Page Speed) modifié par GTMetrix pour, j'imagine, prioriser les choses qui sont réellement importantes.
  - On vise au moins B, et 90 pour les 2 scores.

- WebVitals
  - LCP et TBT sont très relié au temps de chargement de la page. Alors pour les améliorer, combiner les JS, CSS, lazyload les images et ajouter le plus possible d'éléments d'optimisation
  - CLS: Cette stat est un test à propos de comment ton layout change visiblement durant le load. Comme quand une image est pas encore loadée, finalement load et pousse le texte qui suit plus bas. Pour avoir un bon score, définir les tailles des images avant quelles chargent, et éviter d'avoir des éléments qui soudainement prennent leur espace via JS.

Faire le tour aussi de ses top issues, et voir ce qui est réglable rapidement.