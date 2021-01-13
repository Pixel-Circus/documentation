# Optimisation des sites web.

** Tout dans ce fichier est à être discuté dans un meeting de process

## Bonnes pratiques

### Images

Dans le thème, ne pas utiliser de JPG/PNG. Toutes les images loadées par le thème devraient être loadées via SVG/WebP. Pas besoin de export les images en WebP dès le départ, le thème s'en charge (une image mise dans les sources comme image.jpg deviendra image.webp)

Afin de réduire le plus possible le score CLS, les blocs devraient avoir le mions de variance possible. Ce qui veut dire éviter les éléments ajoutés en JS et définir les tailles des images dans le code, comme ça elles prennent leur espace avant même que l'image soit loadée.

Essayer de ne pas charger les grosses images via CSS. Les images majeures devraient être loadées via un tag IMG pour qu'ils puissent être mis en lazyload par litespeed.

### Fontes

Les fontes loadées via Font-Face doivent contenir `font-display: swap;`. Cette commande, en gros, donne un temps illimité a la fonte pour charger, et lorsqu'elle est chargée, remplace la fonte fallback pour la fonte chargée.

### Liens/Boutons

Les liens/boutons ne contentant pas de texte (comme ceux qui contiennent uniquement une icone) devraient avoir un aria-label associé pour les screenreaders.

### Forms

Les inputs ne devraient pas être seuls. Ils devraient être contenus via un Label.

## Avoir son résultat

- Utiliser [GTMetrix](https://gtmetrix.com/) via le compte fpilon@pixelcircus.ca
- Faire une analyse Pagespeed (Utiliser l'extention de Google Lighthouse peut être utile, sinon aller sur la page [Pagespeed](https://developers.google.com/speed/pagespeed/insights/) de google.)

## Comment lire son résultat

### GTMetrix

- GTMetrix Grade
  - C'est le grade GTMetrix, fait via un test lighthouse (Google Page Speed) modifié par GTMetrix pour, j'imagine, prioriser les choses qui sont réellement importantes.
  - On vise au moins B, et 90 pour les 2 scores.

- WebVitals
  - **LCP** et **TBT** sont très relié au temps de chargement de la page. Alors pour les améliorer, combiner les JS, CSS, lazyload les images et ajouter le plus possible d'éléments d'optimisation
  - **CLS:** Cette stat est un test à propos de comment ton layout change visiblement durant le load. Comme quand une image est pas encore loadée, finalement load et pousse le texte qui suit plus bas. Pour avoir un bon score, définir les tailles des images avant quelles chargent, et éviter d'avoir des éléments qui soudainement prennent leur espace via JS.

Faire le tour aussi de ses top issues, et voir ce qui est réglable rapidement.

### LightHouse/Pagespeed

- **Performance:** Peut être ignoré. Il varie beaucoup trop de test en test pour être utile.
- **Accessibilité:** Devrait être plus que 90. Est affecté par les aria-label et les inputs qui doivent être entourés d'un label écrit plus tôt.
- **Meilleures pratiques:** Devrait être au dessus de 80. On fait déjà pas mal tout sa, et les petites erreurs on a pas vraiment contrôle.
- **SEO:** Devrait être plus que 90. Yoast devrait amener sa presque parfait.

## Quand tout est réglé et en ligne

Aller apposer les scores dans le Google Sheet d'accès, dans la feuille *Accès personnels/Updates/Tests Optimisation* afin que on puisse track quels sites sont problématiques.