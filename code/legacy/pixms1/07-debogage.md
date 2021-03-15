# Déboguer un projet

Plusieurs outils sont disponibles dans Pixms 1 pour permettre de déboguer.

debug();
--------

La fonction `debug` permet d'afficher des informations de débogages dans la page. Un peu comme un `var_dump`, mais mieux formaté. Elle prend 2 paramètres: la variable à afficher et true, comme 2e paramètre pour arrêter le script (die).

    debug($var, true);

Pixlog
------

Les projets Pixms ont aussi une librairie permettant d'inspecter différents aspects de la page affichée. Cet outil qui s'affiche dans le coin en haut à droite des pages sur les environnements de développement comporte 3 onglets: Erreurs PHP, Informations sur la page et Benchmark.

### Erreurs PHP

Lorsqu'il y a une erreur PHP générée par la page, le détail de l'erreur se retrouve dans cet onglet qui devient alors rouge. Lorsqu'il n'y eu aucune erreur, il est vert.

### Informations sur la page

C'est ici que se retrouve les variables utilisées avec  `debug`. Sous les informations de débogage, il y a aussi toutes les variables définies pour les views à l'aide de `Pixms::set_data();`.

### Benchmark

Cet onglet reprend toutes les informations disponibles lors de l'activation du [profilage](https://www.codeigniter.com/userguide3/general/profiling.html) ou du [benchmark](https://www.codeigniter.com/userguide3/libraries/benchmark.html) de CodeIgniter. Ces informations sont les benchmarks, $_GET, le memory usage, $_POST, uri_string, le controller et la méthode actifs, les headers, les données de session et la configuration.

### Désactiver Pixlog dans les requêtes AJAX

    Pixlog::$enable = false;