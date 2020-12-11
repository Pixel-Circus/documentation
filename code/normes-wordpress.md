# Normes Wordpress #

## Templates ##
Tous les templates (qui ne sont pas natifs à Wordpress) doivent être placés dans le sous-dossier template.

## Components ##
Tout le code des components (SCSS et JS) doit être placé sous le dossier assets_src/components. Le fichier PHP relié, si c'est un component qui n'est pas un layout, devrait être contenu aussi dans ce dossier.

## Header/Footer ##
Les fichiers header.php et footer.php ne doivent pas contenir de code structurel. Le fichier header.php contiendra tout le début de la page en html (le `<head>` et le contenu qui doit être au tout début du `<body>` mais qui n'est pas la structure en tant que tel). Footer doit être utilisé pour fermer la page et si certains éléments doivent être include, comme un popup.

Le code structurel qui compose l'entête/le menu et le pied de page doivent être mis dans `partials/top.php` et `partials/bottom.php`

## Typerocket ##
Typerocket doit être ajouté comme plugin.

Les custom fields peuvent être ajoutés dans `includes/typerocket-fields.php`
