# Gestion des langues
Pixms 1 peut être multilingue. La plupart des sites sont en français et en anglais.

Configuration des langues
-------------------------

Les langues sont définies dans config/languages.php:

    $config['english'] = array(
        'iso'  => 'en',
        'name' => 'English',
    );

La valeur de `iso` est utilisée dans les URLs (en tant que dossier: http://domaine.com/fr ou http://domaine.com/en) tandis que `name` est utilisée comme texte dans les liens de changement de langue. La clé utilisée (dans l'exemple ci-dessous `english`) est le nom du dossier contenant les chaînes de traductions du projet qui se retrouve dans « application/language/_english_« .

### Récupérer la langue active

La valeur de la langue active est sauvegardée dans la constante `LANG` qui équivaut à l'`iso` et donc, à la valeur présente dans l'URL.

### Ajouter une langue

En exemple ici, l'ajout de l'espagnol:

1.  [Télécharger](https://github.com/bcit-ci/CodeIgniter/wiki/Language-Translation) et mettre les fichiers de langue en espagnol dans « system/languages/_spanish_« 
2.  Copier le contenu des fichiers de langue d'une des langues déjà dans le projet. Par exemple, copier le dossier « application/languages/french » vers « application/languages/spanish » et tout traduire
3.  Ajouter la langue dans config/languages.php pour l'activer:

        $config['spanish'] = array(
            'iso'  => 'es',
            'name' => 'Español',
        );

http://domaine.com/es devrait maintenant affiché le site en espagnol.

Traduction de chaînes de caractères
-----------------------------------

Par défaut, tous les projets Pixms 1 chargent le fichier de langue « site » (application/language/french/site_lang.php). Pour connaître tous les fichiers de langue préchargés, voir le fichier config/autoload.php, à la ligne débutant par **`$autoload['language']`**. Voici un exemple du contenu de site_lang.php:

    $lang['site_home'] = "Accueil";
    $lang['site_tagline'] = "Un site Pixms";

_NB: un préfixe reprenant le nom du fichier est utilisé dans les clés afin d'éviter des conflits entre les différents fichiers de langue._

Pour utiliser les chaînes définies dans les fichiers de langue, la fonction `lang` est utilisée, un raccourci de `$this->lang->line()`:

    echo lang('site_home'); //Outputs Accueil

### Ajouter une chaîne de caractères traduite

Si la chaîne est globale à toutes les pages du site, on peut simplement ajouter un nouvel index au array dans le fichier site_lang.php.

Par contre, afin d'éviter que le fichier `site_lang.php` devienne trop chargé, si la chaîne est reliée à une section du site seulement, il vaut mieux l'ajouter à un autre fichier.

Généralement, en plus de `site_lang.php`, il y a un fichier de langue créé pour chaque controller. Ce fichier de langue est chargé automatiquement lorsque le controller est utilisé. Par exemple, le controller `Home` (application/controllers/frontend/home.php) chargera le fichier de langue `home_lang.php` dans le dossier « application/language/french ».

### Créer un nouveau fichier de langue

Si par exemple, on veut créer un fichier `events`:

1.  Créer le fichier `events_lang.php` dans chaque dossier de langue présent dans « application/languages ».
2.  Ajouter les chaînes de traduction. Exemple: `$lang['events_title'] = 'Événements'`
3.  Charger le fichier `events`
    1.  Pour l'utiliser avec un controller nommé `Events`, rien à faire. Tout est chargé automatiquement.
    2.  Pour l'utiliser dans un autre controller, ajouter la ligne `$this->lang->load('events');`, soit au constructeur, soit dans la méthode qui l'utilise.
    3.  Pour l'utiliser sur tout le site (toujours le charger): ajouter 'events' dans le fichier « application/config/autoload.php » à la ligne `$autoload['language']`.
4.  `lang('events_title')` devrait maintenant afficher 'Événements'.

Traduction d'URLs
-----------------

Par défaut, CodeIgniter ne permet pas d'avoir des URLs différentes selon les langues. Pour palier à ceci, il y a dans Pixms un fichier de langue particulier: `uri_lang.php`.

### Fonctionnement de uri_lang

Ce fichier fonctionne un peu comme les autres fichiers de langue à l'exception que la clé utilisée pour la traduction reflète les segments d'URI représentant un controller:

    //application/languages/french/frontend/uri_lang.php
    $lang['home/index'] = '';
    $lang['events/details'] = 'evenements/fiche';
    $lang['events/index']  = 'evenements';

Les lignes définies ci-dessus se réflèteront comme suit:

1.  http://domain.com/fr chargera le controller `Home` et invoquera sa méthode `index`.
2.  http://domain.com/fr/evenements chargera le controller `Events` et invoquera sa méthode `index`
3.  http://domain.com/fr/evenements/fiche/mon-evenement chargera le controller `Events et invoquera sa méthode `details` avec « mon-evenement » comme premier argument.

_NB: Il est important de mettre les traductions les plus précises en premier dans le fichier. Mettre la ligne `events/index` avant `events/details` ferait en sorte que `events/index` est toujours chargé à la place de `events/details`. Ceci est dû au fait que les URLs sont testées seulement sur le fait de commencer par la valeur traduite (valeur de droite)._

### Affichage d'URLs traduites

La fonction `url` a été ajoutée dans Pixms pour permettre la traduction automatique des URLs. Cette fonction accepte jusqu'à 5 paramètres:

1.  `$controller`: Le nom du controller en minuscules tel qu'utilisé dans le nom du fichier. Seul paramètre obligatoire.
2.  `$function`: Le nom de la méthode du controller. Par défaut, la valeur est vide.
3.  `$params`: Un array de paramètres à ajouter en segments à l'URL. Par exemple, `array('mon-evenement', 8)` devient 'mon-evenement/8'.
4.  `$context`: Par défaut, équivant au contexte actuel.
5.  `$lang`: Par défaut, équivaut à la langue actuelle.

Exemple de lien dans une view:

    <a href="<?php echo url('events', 'index'); ?>"><?php echo lang('site_events'); ?></a>

**La traduction de l'URL se fait du plus précis au moins précis.** Par exemple, `url('events', 'details', array('mon-evenement', 8))` tentera d'abord de trouver une traduction pour 'events/details/mon-evenement/8', puis si cette clé n'existe pas dans uri_lang.php, ce sera au tour de 'events/details/mon-evenement', puis 'events/details'. La valeur retournée ajoute automatiquement les segments non traduits à la fin de l'URL traduite ce qui résulterait en 'fr/evenements/fiche/mon-evenement/8'. Si aucune traduction n'est trouvée, l'URL originale est retournée: 'fr/events/details/mon-evenement/8'.

### URLs du module Pages

Il est possible que certaines URLs ne se trouvent pas dans uri_lang.php.

Le module Pages, qui vient avec la plupart des projets Pixms 1 à l'exception des tout premiers, est directement lié à la traduction des URLs. La valeur du champ `uri_fr` ou `uri_en` est automatiquement ajoutée au routing du site et peut influencer le controller utilisé pour afficher la page ainsi que la traduction faite via `url`. Se référer à la documentation du module pour plus d'infos.

Liens de changement de langue
-----------------------------

L'affichage du lien de changement de langue sur un site est facile à mettre en place. La fonction `switch_anchor` s'occupe de tout. Pour modifier le comportement de cette fonction, il y a une configuration par défaut présente dans 'application/config/languages.php':

    $config['language_config'] = array(
        'hide_if_active' => true, //Ne pas afficher la langue active
        'class'   => 'switch-lang', //Classe à ajouter au lien de changement de langue
        'active_class'   => 'active', //Classe pour la langue active, si 'hide_if_active' => false
    );

Pour modifier la valeur texte affichée dans le lien, il faut modifier les valeurs de `name` pour les langues présentes dans le fichier « application/config/languages.php ».

Exemple d'utilisation dans la view (parts/header.php dans la plupart des projets):

    <div class="HEADER">
        <!-- Logo, menu... -->
        <?php echo switch_anchor(); ?>
    </div>

### Ajustement manuel des URLs pour le changement de langue

Ceci est utile dans les quelques cas où la fonction `url` n'est pas en mesure de bien traduire l'URL automatiquement. Utiliser ce code dans la méthode du controller pour laquelle la traduction de l'URL n'est pas au point:

    $languages = $this->config->item('languages');
    foreach ($languages as $key => $config) {
        if (isset($config['iso'])) {
            $languages[$key]['url'] = url('events', 'index', 'special', $config['iso']);
        }
    }
    $this->config->set_item('languages', $languages);