# Ajouter une nouvelle fonctionnalité (route) 

Ajout au backend
----------------

L'ajout d'une nouvelle fonctionnalité est relativement simple. Il faut avoir en tête le nom qui sera donné au controller et à la méthode principale. Pour cet article, ce sera un controller `News` et la méthode `index`.

Ajouter une nouvelle configuration au fichier application/config/pages_routes.php:

    'news/index' => array(
        'lang' => 'pages_routes_news',
        'active' => array(),
    ),

Pour un affichage traduisable du nom de la fonctionnalité, il faut ajouter `pages_routes_news` au fichier de langue pour les modules backend: application/french/admin/controller_lang.php

    $lang['pages_routes_news'] = 'Nouvelles';

Il est maintenant possible de créer une page Actualités par la console de gestion et de lui assigner la fonctionnalité `Nouvelles`.

Création du controller frontend
-------------------------------

Sans la création du controller, la page n'est pas en mesure d'être affichée. Une erreur se produit, il faut donc le créer: application/controllers/frontend/news.php

    <?php

    class News extends MY_Frontend_Controller {
        
    }

À noter: Le nom de la classe utilise une majuscule pour la première lettre du controller étant donné que c'est la nomenclature standard pour les classes. Le reste du temps, comme durant la création de la fonctionnalité, le nom du controller est utilisé tout en minuscules.

Création de la méthode
----------------------

Créer la classe ne suffit pas, il faut aussi ajouter la méthode qui s'occupe de l'affichage de la fonctionnalité. `index` dans le cas présent:

    public function index()
    {
        //PAGE_URI est définie seulement dans le cas d'une fonctionnalité associée à une page
        if (!is_null(PAGE_URI)) {
            $page = Pixms::manage_page(PAGE_URI);
            //Déclaration de variables en relation avec la page
        } else {
            //Déclaration de valeurs par défaut 
            Pixms::set_title(lang('site_news'));
            Pixms::add_breadcrumb(current_url(), lang('site_news'));
            //Ou dans certains cas, affichage d'une page 404 si aucune page associés
            Pixms::display_404();
            return;
        }

        //Déclaration d'autres variables et programmation d'un formulaire si nécessaire
        //La méthode se termine par un appel à Pixms::display
        Pixms::display('general', 'listing');
    }

Ajout de routes additionnelles
------------------------------

Certaines fonctionnalités nécessitent des routes additionnelles. C'est le cas de la fonctionnalité en exemple dans cet article. Une fonctionnalité de nouvelles à besoin d'une liste de nouvelles (méthode `index`), mais aussi du détail d'une nouvelle. L'affichage de la nouvelle, selon les standards de nomenclature, se fera dans la méthode `details`.

Pour ajouter une route additionnelle, il faut modifier la configuration ajoutée au fichier application/config/pages_routes.php

    'news/index' => array(
        'lang' => 'pages_routes_news',
        'additional_routes' => array(
            '(:uri)/details/(:any)' => 'news/details/$3',
        ),
        'active' => array(),
    ),

Le paramètre `$3` correspond à la valeur qu'aura `(:any)`.

Ensuite, il faut créer la méthode dans le controller News:

    //$uri a la valeur de $3
    public function details($uri) 
    {

    }