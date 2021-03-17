# Les gestion des menus

Il existe 2 façons de créer les menus dans les projets Pixms: une méthode par le code et une méthode par la console de gestion.

Les fichiers de configuration
-----------------------------

Les premiers projets Pixms et certains autres utilisent un fichier de configuration pour programmer les liens dans les menus. Ce fichier se trouve dans application/config/frontend/menu.php.

Il peut y avoir plusieurs menus dans ce fichier. Chaque menu utilise une clé différente dans le array de la variable $config. Chaque clé se retrouve à être définie en tant que variable dans les views. Ainsi, pour créer le menu principal, il y aura généralement une configuration comme celle-ci:

    $config['main_menu'] = array(
        array(
            'href' => url('home', 'index'),
            'lang' => 'site_home',
            'active' => array('home/index'),
        )
    );

Pour afficher ce menu, il faut insérer dans la view appropriée cette ligne de code:

    <?php $this->load->view('parts/menu', array('menu' => $main_menu)); ?>

### Configuration d'un item de menu

L'exemple ci-dessous crée un lien vers l'accueil. Voici un aperçu des clés de configuration possible pour créer les items de menu:

*   **href:** Le lien vers la page. Voir l'article sur [la génération de liens](08-liens.html).
*   **lang:** La chaîne de traduction à utiliser. Sera passé dans la fonction `lang`.
*   **name:** Le label pour le lien (non traduisible).
*   **active:** Un array contenant des groupes controller/method pour lequel le menu est considéré actif. La classe « active » sera ajoutée à l'item.
*   **class:** La/les classe(s) à appliquer à l'item.
*   **children:** Un array contenant les sous-items du menu. Les sous-items suivent la même configuration et peut être utilisé pour imbriquer un nombre infini de sous-menus.
*   **target:** Attribut target. true pour _blank, ou  _parent, etc…

Voici un exemple plus complet:

    $config['main_menu'] = array(
        array(
            'href' => url('home', 'index'),
            'lang' => 'site_home',
            'active' => array('home/index'),
        ),
        array(
            'href' => url('about', 'index'),
            'lang' => 'site_about',
            'active' => array('about'),//Aura la classe "active" pour tous les items utilisant le controller "about"
            'children' => array(
                array(
                    'href' => url('about', 'president'),
                    'lang' => 'site_about_president',
                    'active' => array('about/president'),
                ),
                array(
                    'href' => url('about', 'company'),
                    'lang' => 'site_about_company',
                    'active' => array('about/company'),
                ),
            ),
        )
    );

Le module de menus
------------------

Pour donner la possibilité au client de gérer ses menus lui-même, le module Menus a été ajouté à la console de gestion de beaucoup de sites Pixms. Ce module est généralement accessible depuis le menu Utilisateur en haut à droite.

### Configuration des menus

Un fichier de configuration est responsable de donner les bonnes options dans le module de la console de gestion. Ce fichier (application/config/menuitems.php) comporte 2 éléments de configuration distincts:

#### Les emplacements

La configuration la plus importante est les emplacements (locations). Chaque menu du site qui doit être gérable par la console de gestion doit avoir sa clé dans cet array de configuration:

    $config['locations'] = array(
        'main_menu' => array(
            'name' => lang('menuitems_main_menu'),
            'hierarchy_max' => 2, //niveau principal, plus un niveau de sous-menus.
        ),
        'top_menu' => array(
            'name' => lang('menuitems_top_menu'),
            'hierarchy_max' => 1, //niveau principal, sans sous-menu
        ),
        'footer_menu' => array(
            'name' => lang('menuitems_footer_menu'),
            'hierarchy_max' => 2,
        ),
    );

Chaque clé de cet array de configuration sera automatiquement déclaré en tant que variable dans les views. Ainsi, il suffit de cette ligne dans une view pour afficher un menu provenant de la console de gestion:

    <?php $this->load->view('parts/menu', array('menu' => $main_menu)); ?>

_À noter: les variables de menus sont déclarées à partir du hook `hook_build_menus`. Voir le fichier application/hooks/frontend/pixms.php._

#### Les routes, ou controllers

Cette fonctionnalité du module Menus est peu utilisée dans les projets Pixms, mais elle permet de rendre possible l'ajout de controller de pages statiques non reliées au module Pages aux emplacements de menus.

Voici la configuration par défaut qui active la sélection des pages pour l'ajout aux menus:

    $config['menuitems_types'] = array(
        'pages' => array(
            'function' => 'details',
        ),
    );

Les clés dans le array ci-dessus doivent correspondre aux noms de modules (donc aux noms des tables en DB). Ensuite, pour ce qui est de la configuration, il suffit d'y écrire le nom de la méthode du controller frontend qui s'occupe de l'affichage du détail.