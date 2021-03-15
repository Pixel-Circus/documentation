# Génération de liens

base\_url($path);
-----------------

Génère une URL en combinant l’URL de base au \`$path\` fourni en paramètre. L’URL de base étant composée du nom de domaine et des sous-dossiers (s’il y a lieu). Son utilisation la plus fréquente est l’affichage d’images.

    base\_url('images/frontend/logo.jpg');
    //http://domaine.com/images/frontend/logo.jpg

admin\_url($path);
------------------

Génère une URL pour la console de gestion en y ajoutant la langue active.

    admin\_url('pages');
    //http://domaine.com/admin/fr/pages

site\_url($path);
-----------------

Fonctionne comme base\_url();, mais en ajoutant la langue en préfixe au \`$path\` fournit.

    site\_url('contact');
    //http://domaine.com/fr/contact

url($controller, $method, $parametres, $context, $lang);
--------------------------------------------------------

C’est la fonction utilisée pour générer des liens vers des méthodes de controllers. [Voir la documentation sur la gestion des langues](http://docs.pixelcircusclient.com/blog/la-gestion-des-langues/) pour comprendre son fonctionnement quant à la traduction des URLs entre les langues et selon la fonctionnalité des pages.

Elle accepte jusqu’à 5 paramètres:

1.  \`$controller\`: Le nom du controller en minuscules tel qu’utilisé dans le nom du fichier. Seul paramètre obligatoire.
2.  \`$function\`: Le nom de la méthode du controller. Par défaut, la valeur est vide.
3.  \`$params\`: Un array de paramètres à ajouter en segments à l’URL. Par exemple, \`array(‘mon-evenement’, 8)\` devient ‘mon-evenement/8’.
4.  \`$context\`: Par défaut, équivant au contexte actuel.
5.  \`$lang\`: Par défaut, équivaut à la langue actuelle.

    url('events', 'index'); //http://domaine.com/fr/evenements 

object\_url($id, $type, $lang);
-------------------------------

Cette fonction permet de créer un lien vers un objet en DB selon son ID et sa table. Elle accepte 3 paramètres:

*   \`$id\`: Le ID en DB de l’objet vers lequel créer un lien. Seul paramètre obligatoire.
*   \`$type\`: Le type de l’objet, c’est-à-dire le nom de sa table en DB ou le nom du module Pixms. Par défaut, ‘pages’.
*   \`$lang\`: La langue à utiliser pour créer le lien. Par défaut, la langue active.

    object\_url(5);
    //http://domaine.com/fr/mon-uri

Dans l’exemple ci-dessus, « mon-uri » est la valeur dans le champ \`uri\_fr\` pour le ID 5 de la table \`pages\`. Si on tente de faire un lien vers un objet qui n’a pas de champ \`uri\_fr\`, ce sera le ID de l’objet qui sera utilisé dans l’URL à sa place.

_À noter que pour que le lien fonctionne bien, il faut qu’il y ait un controller qui reprend le type avec une méthode \`details\`._