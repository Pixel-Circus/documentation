# Ne pas réinventer la roue

Afin de favoriser la maintenance et la mise à jour des projets, il est toujours préférable de sélectionner des solutions existantes qui ne sont pas désuètes.

Autant dans les sites React que Wordpress, tous les nouveaux éléments sont intégrés via components. Si un component est pareil ou même semblable à un site précédent, il est préférable d'aller le chercher de l'autre site. Bootstrap a aussi sa propre librairie de composantes qui est préférable à utiliser plutôt que de coder de rien.

Il ne faut créer une nouvelle solution qu'en dernière mesure.

# La clarté

L'interface de gestion du client devrait être la plus simple possible à gérer. Les éléments doivent être utilisés pour leur utilisation normale. Une page est une page, et n'est pas faite pour être uniquement composante d'une autre page, par exemple.

### Exemple de chose déjà vue dans d'autres projets, à ne pas répliquer

Sur l'accueil, il y a 3 vignettes sans lien. L'intégrateur avait créé 3 sous pages à la page d'accueil qui ne faisaient que contenir les contenus des 3 vignettes. Ces pages n'avaient aucune autre utilité que cela, et bien qu'elles soient dans la sitemap (et accessibles via l'URL directe) ces pages étaient inutiles.

La solution: Faire un custom field pour les vignettes.

# Le filet de sécurité

Le client, en faisant ses modifications, ne devrait pas pouvoir accidentellement causer un bug massif de son site. Les éléments comme les repeater ou les images devraient avoir un fallback ou disparaître sans problème s'ils sont laissés vides.

Toute option qui pourrait être dangereuse si modifiée devrait être dans une sous page d'options de l'administration séparée, pour que le client ne puisse pas 'tomber dessus par erreur'