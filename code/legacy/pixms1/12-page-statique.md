# Créer une page statique

Ce tutoriel montre comment créer une nouvelle page statique sur Pixms. L'exemple utilisé est une page contact avec une carte Google Maps.

Créer un controller
-------------------

Pour créer un controller, il suffit de créer un nouveau fichier dans le dossier « controllers/frontend ». Dans le contexte de ce tutoriel, le nom du controller est Contact, il faut donc créer un fichier nommé **contact.php** (le nom du controller en minuscule) avec le contenu suivant:

    <?php

    class Contact extends MY_Frontend_Controller
    {

    }

### Créer la méthode

Un controller seul ne sert pas à grand chose. Il faut lui ajouter des méthodes qui sont responsables de l'affichage de la page. Dans ce cas-ci, on peut utiliser « index » comme nom de méthode puisque la page qui sera affichée est la page principale de ce controller (Se référer à l'[article sur l'intégration](09-integration.html) pour comprendre les 3 lignes de la méthode):

    public function index()
    {
        Pixms::set_title('Contact');
        Pixms::set_data('content', '<p>Page de contact</p>');
        Pixms::display('general', 'content');
    }

### Voir la page

Il est maintenant possible de voir la page en navigant à http://domain.com/contact/index ou simplement, http://domain.com/contact puisque la méthode par défaut dans CodeIgniter est « index ».

Le titre dans la barre du navigateur devrait être « Contact | nom du site » et la page devrait affichée en titre « Contact » et en contenu « Page de contact ».

Créer une view
--------------

C'est bien beau de pouvoir définir le HTML dans une variable `$content`, mais dès que le HTML se complique il vaut mieux créer une view, ou plus précisément une content view (puiqu'elle se retrouve dans le dossier « contents ». La nomenclature standard pour les content views est « controller-method.php », sauf lorsqu'il s'agit de la méthode « index », on peut alors simplement nommer la view « controller.php ».

Il faut donc créer le fichier « contact.php » dans le dossier « application/views/frontend/contents » avec le contenu suivant:

    <p class="contact-panel">
    Pour nous contacter:<br/>
    Téléphone : 555 555-5555<br/>
    Courriel : <a href="mailto:info@example.com">info@example.com</a>
    </p>

Et changer la méthode index:

    public function index()
    {
        Pixms::set_title('Contact');
        Pixms::display('general', 'contact');
    }

### Ajouter du CSS

Le fichier CSS relié à une content view est automatiquement ajouté à la page. Il suffit donc de créer le fichier « contact.scss » dans « scss/frontend/contents » et d'y insérer du SCSS pour ajouter du style à la page.

### Ajouter du JavaScript

Si la page nécessitait du JavaScript, il faudrait créer le fichier JS en suivant la même nomenclature, mais il faudrait l'inclure manuellement à la méthode grâce à cette ligne à insérer avant `Pixms::display();`:

    Pixms::add_script('frontend/contact.js');

### Insérer une image

Pour insérer une image, il suffit d'ajouter le tag img dans la view, la chose à noter est l'utilisation de `base_url();` pour s'assurer que l'image s'affiche correctement peu importe où le site est installé:

    <img src="<?php echo base_url('images/frontend/logo.png'); ?>" alt="Logo" />

### Charger une part

Il est possible de charger des views partielles dans une content view. Les parts sont dans le dossier « application/views/parts ». Dans ce cas-ci, c'est ce qui est utilisé pour charger une carte Google Maps sur la page.

D'abord, il faut créer la « part » (view partielle) en créant le fichier « google-maps.php » dans « application/views/parts ».:

    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2795.0975349025757!2d-73.60019048444045!3d45.52824277910167!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4cc9197b5d847dd9%3A0x66a2c5e10923323!2s5605+Avenue+de+Gasp%C3%A9%2C+Montr%C3%A9al%2C+QC+H2T+2A4!5e0!3m2!1sfr!2sca!4v1490648620080" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>

Ensuite, il faut charger la view dans la content view contact.php à l'aide de cette ligne:

    $this->load->view('parts/google-maps');

### Créer un lien vers la page contact

Pour créer un lien vers la page contact, dans la sidebar par exemple, il faut utiliser:

    url('contact', 'index');

Rendre la page multilingue
--------------------------

Pour une description en détails des fonctionnalités multilingues de Pixms, [voir cet article](06-langues.html).

### Créer les fichiers de langue pour chaque langue

En suivant les règles de nomenclature, le fichier de langue sera chargé automatiquement sans avoir à utiliser `$this->lang->load();`. Cette règle est simple: controller_lang.php, donc pour le cas présent il faut créer le fichier contact_lang.php pour chacune des langues dans le dossier « application/languages/[langue]/frontend ».

Ce fichier contient un array de chaînes de traduction, ici pour le français, faire la même chose en anglais en traduisant les valeurs:

    <?php 

    $lang['contact_title'] = 'Contact';
    $lang['contact_us'] = 'Pour nous contacter:';
    $lang['contact_phone'] = 'Téléphone :';
    $lang['contact_email'] = 'Courriel :';

À noter l'utilisation du préfix « contact_ » qui reprend le nom du fichier pour éviter les conflits potentiels avec les autres fichiers de langue.

En utilisant la fonction `lang();`, il est maintenant possible d'activer la traduction dans le controller et les views:

**Controller:**

    Pixms::set_title(lang('contact_title'));

**Content view:**

    <p class="contact-panel">
    <?php echo lang('contact_us'); ?><br/>
    <?php echo lang('contact_phone'); ?> 555 555-5555<br/>
    <?php echo lang('contact_email'); ?> <a href="mailto:info@example.com">info@example.com</a>
    </p>

Pour voir le résultat de la traduction, il faut ajouter la langue à l'URL: http://domain.com/contact devient http://domain.com/en/contact

### Traduire l'URL

Pour les fins du SEO, il est tenu de traduire les URL pour qu'elles utilisent des mots-clés de la langue d'affichage. Ceci est possible dans Pixms grâce à un fichier de langue spécial: uri_lang.php qui se retrouve dans chacune des langues.

Son fonctionnement est simple, il prend une combinaison « controller/méthode » et les traduit en autre chose. Voici les lignes à ajouter pour traduire l'URL de la page contact:

En français (application/languages/french/frontend/uri_lang.php, ajouter:

    $lang['contact/index'] = 'contactez-nous';

En anglais (application/languages/english/frontend/uri_lang.php, ajouter:

    $lang['contact/index'] = 'contact-us';

Les URLs suivantes devraient maintenant aussi afficher la page: http://domain.com/fr/contactez-nous et http://domain.com/en/contact-us

Les URLs non traduites vont continuer de fonctionner, mais Pixms utilise le canonical link pour informer les navigateurs sur quel URL il faut indexer.