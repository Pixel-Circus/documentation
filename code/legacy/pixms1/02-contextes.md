# Les contextes

Afin de permettre des sites multidisciplinaires, des contextes ont été créés dans Pixms 1. Par défaut, 5 contextes peuvent coexister sur un site Pixms:

*   **frontend**: pour le site principal accessible par tous
*   **admin**: pour l'administration du site
*   **mobile**: utilisé s'il y a une version mobile distincte du site principal
*   **facebook**: utilisé pour les pages application de Facebook
*   **api**: utilisé pour les APIs qui émettent du json généralement

La plupart des sites utilisent les contextes **frontend** et **admin**.

Détermination du contexte actif
-------------------------------

Les contextes sont définis avec des constantes dans le fichier application/config.php/constants.php:

    define('FRONTEND_FOLDER', 'frontend');
    define('ADMIN_FOLDER', 'admin');
    define('MOBILE_FOLDER', 'mobile');
    define('FACEBOOK_FOLDER', 'facebook');
    define('API_FOLDER', 'api');

Le contexte est déterminé par le premier segment de l'url. Par exemple, http://domaine.com/_admin_ aura comme contexte « admin ». Lorsqu'aucun contexte ne concorde avec le premier segment de l'URL, Pixms utilise la valeur de `FRONTEND_FOLDER`, c'est-à-dire par défaut « frontend ».

En suivant ce principe, il est donc possible d'utiliser le contexte « admin » pour le site principal en changeant 'frontend' pour 'admin' dans `FRONTEND_FOLDER`. C'est le cas pour certains projets d'intranet.

Chargement des fichiers selon le contexte actif
-----------------------------------------------

Le chargement des fichiers dans le dossier application à l'aide des méthodes de `$this->load->[…]` est influencé par le contexte actif. Voici la liste des dossiers qui utilisent le système de contextes:

*   application/
    *   config
    *   controller
    *   hooks
    *   language/french
    *   models
    *   views
*   css
*   js
*   scss

Pour les dossiers dans application, le principe est simple. Pixms cherche d'abord le fichier dans application/config/[context], si le fichier ne s'y retrouve pas, il remonte d'un niveau (application/config) pour charger un fichier partagé par tous les contextes.

Exemple: `$this->load->config('events');` tente de trouver le fichier events.php dans application/config/[context], sinon dans application/config

Les dossiers css, js, et scss reprennent la structure des contextes, mais il n'y pas le principe de surchargement si le fichier n'existe pas dans le contexte.

Depuis la version 1.5, les fichiers peuvent aussi être chargés directement depuis le package Pixms de composer s'il n'est pas présent dans la hiérarchie du projet.