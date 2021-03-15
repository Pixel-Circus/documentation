# Le routing des pages

Comprendre le routing de Pixms est essentiel pour identifier comment le controller utilisé pour une requête est choisi. En plus du système de routing venant de CodeIgniter, Pixms ajoute 3 niveaux de routing qui peuvent influencer le controller choisi pour l'affichage d'une page. L'ordre des niveaux dans l'article correspond à l'ordre de priorité pour trouver un controller.

Le routing du module Pages
--------------------------

Le premier endroit où Pixms recherche une correspondance entre l'URL et un controller est dans le module Pages présent dans la plupart des projets. Ce sont les champs `uri_fr` et `uri_en` qui sont utilisés pour trouver une correspondance exacte avec l'URL demandée. Si une correspondance est trouvée, le controller utilisé sera alors `Pages` et la méthode invoquée sera `details`.

### La fonctionnalité d'une page

Certaines pages ont une fonctionnalité qui leur ait associée. Les fonctionnalités utilisent l'URI de la page pour le routing, mais changent le controller utilisé par Pixms pour l'affichage de la page.

Le fichier de configuration pages_routes.php (application/config/pages_routes.php) est responsable de définir les fonctionnalités. Le format de configuration d'une fonctionnalité est le suivant:

    'events/index' => array(
        'lang' => 'pages_routes_events',
        'active' => array(),
    ),

La clé correspond à « controller/method », il pourrait y avoir un 3e segment (exemple: « events/index/upcoming »). « upcoming » serait passé en tant que paramètre à la méthode « index ». « lang » ci-dessus correspond à la [chaîne de traduction](06-langues.html) utilisée dans l'admin pour l'affichage de la fonctionnalité. « active » correspond au « active » utilisé dans les menus.

### Les routes additionnelles d'une fonctionnalité

Les fonctionnalités peuvent aussi avoir des routes additionnelles. Par exemple, une fonctionnalité pour des événements mène par défaut à « events/index » qui liste tous les événements, mais il faut aussi être en mesure de voir le détail d'un événement en utilisant la même structure d'URL, mais en ajoutant un ou plusieurs segments supplémentaires. Voici un exemple de configuration:

    'events/index' => array(
        'lang' => 'pages_routes_events',
        'additional_routes' => array(
            '(:uri)/(:num)' => 'events/index/$3', //Pagination numérotée
            '(:uri)/details/(:any)' => 'events/details/$3', //Détails d'un événement
        ),
        'active' => array(),
    ),

La clé dans les « additional_routes » reprend le fonctionnement des routes de CodeIgniter avec l'ajout de `(:uri)` qui correspond à l'URI de la page à laquelle la fonctionnalité est associée. Il est à remarquer que pour reprendre un des segments entre parenthèses il y a un décalage de 1 valeur. Pour reprendre le 2e segment de la config, il faut utiliser `$3`. Ceci est dû à l'ajout de la langue au début de l'URL lors du routing.

Traduction des URLs
-------------------

Le système de traduction des URLs présent dans Pixms permet de traduire les routes du format controller/method vers des termes dans la langue actuelle. Pour connaître le fonctionnement, se référer à la documentation sur [le multilingue dans Pixms](06-langues.html).

Routing de CodeIgniter
----------------------

[Se référer à la documentation officielle](https://www.codeigniter.com/userguide3/general/routing.html).