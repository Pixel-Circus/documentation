# Includes #

## admin.php ##

Le code placé ici est pour modifier des éléments de l'administration comme le WYSIWYG, ou ajouter des types de fichiers acceptés dans les uploads. Présentement il y a 2 choses.

### my_mce_before_init_insert_formats ###

Ajoute des types de paragraphes différents qui ne sont pas dans Wordpress de base.

Présentement le paragraphe introductif et un auteur de citation.

### my_mce_buttons_2 ###

TODO: Pas trop sur c'est quoi ceci fait.

## enqueues.php ##

Utilisé pour "enqueue" les styles et scripts comme Wordpress le veut.

On a 3 fonctions.

`px_enqueue_admin` : Permet de enqueue des css/js dans l'administration Wordpress.

`px_js_variables`: Permet d'ajouter des variables au site qui seront disponibles dans le futur.

`wp_enqueue_scripts` : Enqueue des scripts et des styles pour le frontend. C'est le bon endroit si on veut ajouter le CSS qui charge les fonts de Fonts.com ou Google Fonts.

## helpers.php

Utilisé pour plusieurs fonctions aidant au frontend.

`px_id`: Donne l'ID d'une page dans la langue en cours. Utile pour des liens prédéfinis dans le code, pour qu'ils fonctionnent dans les autres langues.

`px_assets_url`: TODO: Je sais pas trop ce que cela fait.

`px_dropdown_navbar`,`px_flat_navbar`,`px_flat_nav`: Cette fonction appelle le menu et lui donne de la structure.

TODO: Voir si on réduit les options ici pour cleanup 3 fonctions qui vite comme sa, les 3 font la même chose.

`px_paginate_links` : Crée la pagination (1,2,3) dans les pages d'archives.

`pix_retirer_archive`: Retire le mot 'Archive' qui est ajouté automatiquement dans le titre des pages d'archives.

`px_trim_on_word`: Crée un résumé automatiquement selon le contenu. On lui donne un texte et une longueur maximale en mots, la fonction nous retourne le texte tronqué.

## json-endpoints.php ##

Contient les fonctions qui ajoutent ou modifient à l'API JSON.

## languages.php ##

Contient les fonctions en charge de la traduction. Contient la définition de la constante PX_LANG, qui est utilisée avec les fonctions __ et _e pour avoir un domaine.

Contient aussi le procédé qui charge les traductions et assigne le textdomain, et la définition de la constante ICL_LANGUAGE_CODE, qui permet d'accéder à la langue en cours dans le code.

## theme-setup.php ##

Sert au setup du thème. 

TODO: Voir si les choses ici peuvent changer de fichier. Tout est très disparate.

`add_theme_support` donne au thème des fonctionnalités wordpress, tel pouvoir utiliser un titre ou une image à la une.

### init ###

`new Breadcrumb` set le template de breadcrumb (Pas certain, à corriger)

Les 2 new suivant aussi pas certain.

`register_nav_menus` : Enregistre les menus possibles. Les menus enregistrés ici seront disponibles dans la sélection sous Apparence -> Menu

add filter sur le content: Permet d'entourer le content d'un div, et aussi si on veut modifier le contenu dans le futur.

TODO: Lignes 35-41 pas vraiment d'idée ce qu'ils font.

## typerocket-fields.php ##

Voir page typerocket de la documentation

## yoast-replace.php ##

Ce fichier permet de forcer la main de Yoast SEO lorsqu'il ne coopère pas.

Si on en a besoin, bâtir ses conditions dans les fonctions `force_SEO_Title` et `force_SEO_Description` et ensuite dé-commenter les hooks en bas du site.