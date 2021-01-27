# Forfaits Québec

## Popups
Le client a fait ajouter plusieurs popups. Le code de ces popups est sous `/partials/` et sont `contestpopup.php`, `couponpopup.php` et `custompopup.php`.

Le code pour décider de quel popup qui est affiché est dans le `footer.php`. Tous les popups génèrent un cookie pour que sa s'affiche une seule fois par jour.

## Page Forfaits
Il y a 2 types de forfaits, qui sont gérés dans `single-forfaits.php`.

Les forfaits vedette (peu utilisés) et les forfaits normaux. La décision est prise via le champ Type (bouton radio) dans l'administration.

## Terminal
Un sous-site terminal.forfaits-quebec.com existe. C'est un site React qui appelle une API créée dans le site principal.

Le site est dans un autre compte sur le serveur, et dans une autre archive Git.

TODO: Explication de comment gérer/modifier l'API.