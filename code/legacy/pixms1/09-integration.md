# Fonctions utiles à l'intégration

Dossiers utiles
---------------

### assets

Ce dossier contient des librairies JS/CSS provenant du web (third party) comme jQuery, Backbone, Chosen, jqTransform…

### js

Ce dossier contient les fichiers JS pour le projet. Ils sont séparés par [contexte](02-contextes). Dans le dossier frontend, il est possible de retrouver des fichiers nommés **functions.js** et **main.js**. Ces fichiers sont globaux à tout le site. Les autres fichiers suivent généralement la nomenclature **controller.js** ou **controller-method.js**. Par exemple, si le fichier JS est utilisé sur une page du controller Events, le fichier se nommera events.js.

### scss

Ce dossier contient les fichiers SCSS pour le projet. Ils sont séparés par [contexte](02-contextes) et le CSS est généré dans le dossier _css_.

Des fonctions et des mixins globales sont définies dans scss/_helpers.scss. Voir ci-dessous la documentation de ce fichier.

#### Organisation du dossier scss/frontend

*   **base.scss**  
    Contient le reset CSS et les styles de base du site, c'est-à-dire les styles appliqués directement sur les éléments: body, p, ul, h1…h6, input…
*   **styles.scss**  
    Contient des styles globals à tout le site et réutilisable.
*   **print.scss**  
    Le nom s'explique de lui-même. Contient les styles pour l'impression
*   **parts**  
    Contient les SCSS partiels (qui débutent par un underscore) et peuvent reprendre le nom de la part dans les views (application/frontend/views/parts).
*   **layouts**  
    Contient le SCSS propre au layout actuel de la page. Les layouts sont expliqués un peu plus tard.
*   **contents**  
    Contient le SCSS propre au content actuel de la page. Ce concept est expliqué un peu plus tard.

### application/controllers/frontend

Contient les controllers. Pour identifier le controller et la méthode utilisés pour une page, se fier aux classes sur le body de sa source. C'est dans le controller que les variables et les scripts pour la page sont ajoutés.

### application/language

Contient les traductions du site. Voir l'article sur la [gestion des langues](06-langues).

### application/helpers

Contient des fonctions qui peuvent être utiles à l'intégration. Voir la section Fonctions utiles plus loin dans la page.

### application/views/frontend

Contient le HTML utilisé pour générer la page.

*   **template.php**  
    Contient la structure HTML: le doctype, les tags html, head, body, script et link, les metas et le HTML partagé par toutes les pages. C'est aussi le template qui s'occupe de charger le bon layout.
*   **parts**  
    Contient des fichiers réutilisables par plusieurs layouts ou contents comme le header, le footer, les menus… Ces fichiers sont chargés avec `$this->load->view();` qui est expliqué vers la fin de l'article.
*   **layouts**  
    Contient les layouts. Les layouts sont des views qui s'occupent de la structure de la page. Ils chargent des parts pour le header, le footer et les menus, par exemple, en plus de s'occuper de charger le content ($content_view) de la page actuelle. Les layouts les plus communs sont general.php (header, footer, sidebar,content), home.php (header, footer) et empty.php (content seulement, utile pour les fancybox).
*   **contents**  
    Les contents sont généralement associés à une paire controller/méthode. Par exemple, si le controller actuel est Events et la méthode details, le content utilisé, dans la plupart des cas, sera events-details.php. Si ça ne semble pas être le cas, voir l'appel à la fonction Pixms::display dans la méthode du controller.

Fonctions utiles
----------------

*   **Pixms::display(« layout », « content »);**  
    C'est généralement la dernière ligne dans la méthode du controller. Elle lance l'affichage de la page par un layout et un content view. La plupart du temps le layout est « general » et le content view reprend la structure « controller-methode ».
*   **Pixms::manage_page(PAGE_URI);** ou **Pixms::manage_page($news, « news »);**  
    Cette ligne est présente dans beaucoup de méthodes de controller et s'occupe de définir plusieurs variables pour l'affichage de la page: le titre, les metas (title, description, canonical) et le breadcrumb.
*   **Pixms::add_script($path);**  
    Permet d'ajouter un fichier JavaScript à une page. Le path passé en paramètre est relatif au dossier « js ». Il est aussi possible de passer une URL absolue en paramètre.
*   **Pixms::add_style();**  
    Permet d'ajouter un fichier CSS à une page. Le path passé en paramètre est relatif au dossier « css ». Il est aussi possible de passer une URL absolue en paramètre.
*   **Pixms::set_data(« variable », valeur);**  
    Permet de définir une variable qui sera accessible dans les views. Exemple: Pixms::set_data('items', $events); définit une variable `$items` dans les views.
*   **Pixms::set_title(« title »);**  
    Définit le titre de la page (title tag).
*   **Pixms::add_breadcrumb($url, $title);**  
    Ajoute un item au breadcrumb.
*   **lang();** 
    Permet de [traduire des chaînes de texte litérales](06-langues).
*   **$this->load->view(« view », array(), false);  **
    Permet de charger une view. Le premier paramètre est relatif au [contexte actuel](02-contextes), c'est-à-dire « application/views/frontend » dans la plupart des cas. Le second paramètre (facultatif) est un array de variables à définir pour le chargement de cette view. Par exemple, `array('display_image' => true);` définit une variable `$display_image` dans la view chargée. Le troisième paramètre (facultatif) permet de retourner la view en string si on y passe `true` au lieu de faire un `echo`.
*   **base_url($path);**  
    Génère une URL en combinant l'URL de base au `$path` fourni en paramètre. L'URL de base étant composée du nom de domaine et des sous-dossiers (s'il y a lieu).
*   **url($controller, $method, $parametres, $context, $lang);**  
    C'est la fonction utilisée pour générer des liens vers des méthodes de controllers. [Voir la documentation sur la gestion des langues.](06-langues)
*   **site_url(\$path);**  
    Fonctionne comme base_url();, mais en ajoutant la langue en préfixe au `$path` fournit.
*   **LANG**  
    Constante de la langue actuelle du site au format ISO. fr pour Français et en pour English.
*   **$this->load->view('parts/menu', array('menu' =>  $top_menu));**  
    Génère un menu à partir d'un configuration.  
*   **switch_anchor();**  
    Génère le/les lien(s) pour le [changement de langue](06-langues).

Variables existantes par défaut dans les views
----------------------------------------------

### display.php

*   **title:**  
    Variable qui contient le titre de la page. Par défaut vide, cette variable est définie par les controllers généralement grâce à `Pixms::set_title();`.
*   **show_title:**  
    Par défaut à `true`, si cette variable est mise à `false` par défaut ou par le biais d'un controller et `Pixms::set_data('show_title', false);` alors le layout n'affiche plus le titre de la page (h1). Le content view manuellement peut alors l'inclure au besoin.
*   **menu**
*   **misc_head:**  
    Code HTML qui sera inséré juste avant la fermeture de la balise `head`.
*   **misc_body_end:**  
    Code HTML qui sera inséré juste avant la fermeture de la balise `body`.
*   **breadcrumb:**  
    Initialisation du breadcrumb. Utiliser la fonction `Pixms::add_breadcrumb();` pour ajouter des éléments au breadcrumb.
*   **meta_description:**  
    Tag meta description utile pour le SEO. Par défaut, il est vide.
*   **ga_code:**  
    Le code au format UA-XXXXXX-XX fournit par Google Analytics. Le reste du code est dans views/frontend/template.php.
*   **layout_404:**  
    Le layout à utiliser pour l'affichage de la page 404. Par défaut, « general ».
*   **body_id:**  
    ID à ajouter sur le tag `body`. Par défaut, il n'y en a pas.
*   **body_class:**  
    Classe(s) à ajouter sur le tag `body`. Par défaut, certaines classes sont inclues: layout-[layout] controller controller-method. À ces classes, la valeur de `$body_class` est ajoutée.
*   **viewport:**  
    Tag meta viewport utile pour le responsive et les versions mobiles.
*   **favicon:**  
    URL pour le favicon au format .ICO.
*   **canonical_link:**  
    Indique l'URL à indexer pour la page actuelle. (`link` tag canonical).
*   **fb_title:**  
    Le titre pour le share sur les réseaux sociaux. Par défaut, le nom du site (`lang('site_name');`).
*   **fb_desc:**  
    La description pour le share sur les réseaux sociaux. Par défaut, vide, mais s'il y a une meta description, elle sera utilisée.
*   **fb_img:**  
        L'image par défaut pour le share sur les réseaux sociaux. Par défaut, il n'y en a pas.
*   **typekit_id:**  
    Le code pour TypeKit. C'est la partie qui varie: `//use.typekit.net/**1ee362fe**.js`
*   **addthis_id:**  
    Le code de tracking pour Addthis pour les sites qui l'utilisent. Habituellement, ra-XXXXXXXXXXXXXXXX.
*   **css_files:**  
    Contient les fichiers CSS chargés par défaut sur toutes les pages. Utiliser `Pixms::add_style();` pour ajouter un CSS sur une page en particulier via le controller.
*   **js_files:**  
    Contient les fichiers JS chargés par défaut sur toutes les pages. Utiliser `Pixms::add_script();` pour ajouter un js sur une page en particulier via le controller.
*   **meta_robots:**  
    Par défaut, les environnements de développement et de preprod indiquent de ne pas indexer (noindex,nofollow). Pour les environnements de production, l'indexation est activée (index,follow).
*   **compress_css:**  
    Il est possible d'activer la compression des fichiers CSS. Peu de sites l'utilisent. Par défaut, `false`.
*   **compress_js:**  
    Il est possible d'activer la compression des fichiers JS. Peu de sites l'utilisent. Par défaut, `false`.
*   **css_version:**  
    Numéro de version ajouté à la fin des fichiers CSS inclus dans la page. Permet d'éviter les problèmes de cache suite à une mise à jour.
*   **js_version:**  
    Numéro de version ajouté à la fin des fichiers JS inclus dans la page. Permet d'éviter les problèmes de cache suite à une mise à jour.

Toutes ces valeurs sont des valeurs par défaut pour les variables et peuvent être modifiées par un controller lors de l'affichage de la page.

### menu.php/menuitems.php

Certaines variables sont générées à partir de la configuration des menus.

Pour menu.php (application/config/frontend/menu.php), pour chaque item du array `$config` définit dans le fichier, une variable portant le même nom que la clé est créée:

    $config['main_menu'] = array();

Génère une variable nommée `$main_menu` accessible depuis les views.

Pour menuitems.php, le même principe est repris, mais ce sont les items du array `$config['locations']` qui sont utilisés:

    $config['locations'] = array(
    'bottom_menu' => array(
        'lang' => 'menuitems_bottom_menu',
        'hierarchy_max' => 3
    ),
    'mobile_menu' => array(
        'lang' => 'menuitems_mobile_menu',
        'hierarchy_max' => 0
    ),
    );

Génère 2 variables nommées `$bottom_menu` et `$mobile_menu` accessibles depuis les views.

Pour afficher un menu, utiliser:

    $this->load->view('parts/menu', array('menu' => $main_menu));
