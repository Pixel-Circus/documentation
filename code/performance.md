# Performance des sites #

Avant de commencer les tests, ajouter une ligne dans le Google Sheets d'accès, sous la page Accès Personnels/Updates/Tests Optimisation. Faire les 3 tests, et y noter les scores.

## Tests
### Lighthouse/PageSpeed
Tester le site avec lighthouse (les liens pour avoir les tests sont dans le Google Sheets)

TBD: Les scores. Personnellement, la performance peut être ignorée (varie largement sur lighthouse/pagespeed, et est testé avec les 2 autres services.) Accessibilité et Best Practices sont les plus clean et analysables.
### GTMetrix
Les sites, à la mise en ligne, devraient être testés via [GTMetrix](https://gtmetrix.com/)

Pour les sites que nous hébergeons, on vise une performance de au moins 85 dans PageSpeed.

### Pingdom
Tester le site avec Pingdom

TBD: Voir quel score on vise.
## Bonnes pratiques durant l'intégration pour aider à la performance

- Même si on ajoute des images en JPG ou PNG, le webpack nous les convertit en .WEBP. Utiliser ces versions des images, préférablement.
- Pour les logos/images en vecteurs, favoriser l'import de SVG au lieu d'utiliser un PNG.
- Pour les images, préférer charger l'image via un tag HTML `<img>` et non pas un `background-image` CSS. Litespeed convertit les images téléversées par le client en WEBP, mais peut seulement toucher à celles dans le HTML, et non pas celles chargées en JS ou CSS.
- À la mise en ligne, créer un sous domaine CDN (le nom n'est pas trop important, mais static ou cdn est préférable) et charger les images via ce CDN via la configuration WP_CONTENT_URL
- Le plugin LightSpeed Cache doit être installé et configuré à la mise en ligne.

### Lighthouse
- Vérifier ses liens qui sont uniquement une icône. Leur ajouter un aria-label.
- Les inputs des formulaires ne devraient pas être laissés sans labels.

### Gzipping
Le serveur devrait faire ceci d'emblée.

#### To write ####
YUI

