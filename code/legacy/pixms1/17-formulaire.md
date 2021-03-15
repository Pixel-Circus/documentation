# Programmer un formulaire

CodeIgniter fournit une librairie pour la [validation de formulaires](https://www.codeigniter.com/userguide3/libraries/form_validation.html). Pour Pixms, cette librairie a été bonifiée d'une fonction permettant de générer un formulaire au complet.

La méthode `build_form` retourne tout le HTML pour un formulaire, l'affichage des erreurs de validation y compris si applicable. `build_form` reprend la [structure de configuration utilisée](https://www.codeigniter.com/userguide3/libraries/form_validation.html#setting-rules-using-an-array) pour la validation des formulaires dans CodeIgniter, tout en y ajoutant de multiples options pour gérer l'affichage des champs.

Générer un formulaire
---------------------

Cette ligne permet de générer tout le HTML pour un formulaire. Elle prend 2 paramètres: un objet PHP, avec des propriétés publiques ou `(object) $_POST` et la clé pour le array de configuration (dans application/config/form_validation.php) ou directement un array de confirguration.

    $this->form_validation->build_form($object_data, 'config/array');

### Exemple d'utilisation complète dans un controller

    public function index()
    {
        //Cette ligne peut être inutile si la librairie est déjà chargée
        $this->load->library('form_validation');

        if ($this->form_validation->run('config/array') {
            //Insérer code en cas de succès
            return;
        }
        Pixms::set_data('form', $this->form_validation->build($object, 'config/array'));
        Pixms::set_data('action', current_url());

        Pixms::display('general', 'form');
    }

Dans le fichier de configuration (application/config/frontend/form_validation.php):

    <?php

    $config['config/array'] = array(
        array(
            'type' => 'text',
            'field' => 'name',
            'label' => 'lang:site_name',
            'rules' => 'required'
        ),
        array(
            'type' => 'text',
            'field' => 'email',
            'label' => 'lang:site_email',
            'rules' => 'required|valid_email'
        ),
        array(
            'type' => 'textarea',
            'field' => 'message',
            'label' => 'lang:site_message',
            'rules' => 'required'
        ),
        array(
            'type' => 'submit',
            'label' => 'lang:site_send',
            'back' => false
        ),
    );

Références
----------

### Règles de validation additionnelles

En plus des règles existantes de CodeIgniter, plusieurs règles de validation ont été créées:

*   **is_image:** si le fichier uploadée est une image (jpg, png, gif).
*   **numeric_positive:** si la valeur est numérique et plus grande que 0.
*   **valid_url:** si la valeur est une URL conforme (http://www.google.com)
*   **valid_youtube:** si la valeur est une URL ou un ID YouTube.
*   **valid_postalcode:** si la valeur est un code postal canadien
*   **valid_phone:** si la valeur est un numéro de téléphone nord-américain
*   **valid_date:** Si la valeur est une date au format yyyy-mm-dd
*   **valid_future_date:** Si la valeur est une date au format yyyy-mm-dd et dans le futur
*   **valid_name:** Si la valeur est un nom (Contient des lettres, des tirets et des espaces uniquement)

Ces règles sont à utiliser dans `rules` dans la configuration de chaque champ et s'il y a plusieurs règles pour une même champ, il faut les séparer par un pipe (|).

### Types de champs

Il existe de nombreux types de champs pour la génération de formulaires. Ce sont toutes les valeurs possibles de `type` dans la configuration:

*   **block_start, block_end:** Crée un bloc (div) permettant de regrouper plusieurs champs ensemble. (Dans une colonne, par exemple).
*   **tab_start, tab_end:** Regroupe des champs sous un même tab. Utilise le label. Utilisé dans l'admin uniquement pour les formulaires complexes.
*   **block_tab_start, block_tab_end:** Crée un bloc dans un tab. Utilisé dans l'admin uniquement.
*   **collapse_start, collapse_end:** Crée un bloc qui est fermé par défaut. Utilisé dans l'admin uniquement.
*   **submit:** Affiche un bouton submit et un bouton annuler.
*   **line:** Affiche une ligne horizontale (hr).
*   **href:** Affiche un lien.
*   **title:** Affiche un titre.
*   **note:** Affiche une description.
*   **text:** Affiche un champ texte standard.
*   **date:** Affiche un champ texte et charge un datepicker.
*   **password:** Affiche un champ password.
*   **email:** Affiche un champ email.
*   **tel:** Affiche un champ tel.
*   **search:** Affiche un champ search.
*   **textarea:** Affiche un textarea.
*   **radio:** Affiche des choix sous forme de boutons radio.
*   **checkbox:** Affiche une checkbox après le label.
*   **checkbox-before:** Affiche une checkbox avant le label.
*   **multi-checkbox:** Affiche des choix sous forme de checkboxes.
*   **select:** Affiche des choix sous forme de select (dropdown).
*   **select_multiple:** Affiche des choix sous forme de select et permet d'en sélectionner plusieurs.
*   **upload:** Affiche un champ d'upload
*   **multi-upload:** Affiche des contrôles pour l'ajout de plusieurs uploads.
*   **data:** Affiche une donnée sous forme de texte.
*   **hidden:** Affiche un champ hidden. _Le label n'est pas affiché._
*   **tags:** Affiche un champ texte et charge un script pour simuler l'ajout de tag. Valeurs séparées par une virgule.
*   **youtube:** Affiche un champ URL et un preview si possible.
*   **simple-editor:** Affiche un éditeur HTML simple.
*   **large-editor:** Affiche un grand éditeur HTML.
*   **custom:** Affiche un HTML arbitraire fournit par _function_.
*   **view:** Génère une view HTML.
*   **grid:** Génère un tableau de résultats par _call_fn_.
*   **images-grid:** Génère une grille d'images par _call_fn_.
*   **gmap:** Affiche un div et charge l'API JavaScript de Google Maps.
*   **link:** Affiche un lien.

### Clés de configuration

De CodeIgniter:

*   **field:** L'attribut name
*   **label:** Le libellé à afficher pour le champ
*   **rules:** Règles de validation séparées par un pipe (|)

De Pixms, les plus communes:

*   **type:** Le type de champ pour l'affichage. Voir la liste ci-dessous.
*   **default:** La valeur par défaut pour le champ
*   **class:** Classe(s) CSS pour le champ
*   **choices,choices_fn:** Les choix pour les types: radio, multi-checkbox, select et select_multiple. Un array de key/values (la clé est la valeur et la value est le label). `choices_fn` est le nom de la méthode du controller qui utilise le formulaire qui retourne le array.
*   **misc:** Utile pour passer d'autres attributs aux champs sous forme de string.
*   **tooltip:** Affiche une instruction dans un tooltip. S'utilise comme le label avec `lang:`.
*   **lang:** Affiche la langue du champ dans une pastille. Utilisé dans l'admin.

De Pixms, les cas particuliers:  
_À noter: toutes les clés se terminant par _fn sont des callbacks. La valeur en string peut être le nom d'une méthode du controller actif ou d'une function PHP._

*   **id:** Le id pour le champ. Par défaut, équivaut à _field_.
*   **display_zero:** Par défaut, 0 n'est pas considéré comme une valeur et n'est pas affiché. Mettre _display_zero_ à _true_ rend 0 affichable.
*   **rights:** un array de droits pour l'affichage du champ selon le rôle. `array('read' => array('EDITOR'))`
*   **href_link, href_fn:** (s'applique au type _href_) Url à utiliser pour le lien.
*   **tag:** (s'applique au type _title_) Tag à utiliser pour l'affichage du titre. Par défaut, _h2_.
*   **data, data_fn, data_field:** (s'applique au type _data_) Data à afficher à la place du champ de formulaire. _data_field_ correspond à une propriété de l'objet passé à `build_form`.
*   **custom_button:** (s'applique au type _submit_) HTML à utiliser pour le bouton à la place de se qui serait généré par `build_form`.
*   **back, back_url, back_url_fn, back_label:** (s'applique au type _submit_) Contrôlent l'affichage d'un bouton Retour ou Annuler au côté du bouton Submit.
*   **continue, continue_label:** (s'applique au type _submit_) Utilisé dans certains projets seulement.
*   **line:** (s'applique au type _submit_) Affichage d'une ligne avant ou après les boutons. Choix de _none, before_ ou _after_. Par défaut, _before_.
*   **fields:** (s'applique au type _text, select_) Un array contenant plusieurs champs à afficher un à la suite de l'autre sous le même label.
*   **option:** (s'applique au type _select_) Équivalent de _misc_.
*   **dataplaceholder:** (s'applique au type _select_multiple_) Texte à afficher quand aucune sélection n'est encore faite.
*   **image[width,height,crop]:** (s'applique au type _upload_) Configuration du crop si une image est uploadée.
*   **preview:** (s'applique au type _upload_) Boolean pour l'affichage d'une image de preview pour le fichier une fois uploadé. Par défaut, _true_.
*   **advanced:** (s'applique au type _large-editor_) Boolean à savoir si la configuration avancée est activée sur l'éditeur
*   **function:** (s'applique au type _custom_) Nom d'une méthode du controller actif ou d'une function PHP qui renvoit le HTML à afficher.
*   **view:** (s'applique au type _view_) Nom de la view à charger.
*   **variables:** (s'applique au type _view_) Variables à passer à la view sous forme de array.
*   **call_fn, id_table, type_object, style:** (s'applique au type _grid_) Utilisé dans l'admin seulement.
*   **call_fn, style:** (s'applique au type _images-grid_) Utilisé dans l'admin seulement.
*   **href:** (s'applique au type _link_) Url à utiliser pour le lien.

### Configuration de l'affichage des lignes

Pour modifier le HTML généré pour l'affichage de chaque champ, il faut modifier la config `display` dans le fichier de configuration form_validation (application/config/frontend):

    $config['display'] = array(
            'lang' => ' <span class="lang">[lang]</span>',
            'error' => '<span class="error">[error]</span>',
            'line' => '<div class="[class]" [misc]>[label][field][tooltip][error]</div>',
            'required' => ' *',
            'line_class' => 'line',
            'error_class' => 'error',
            'block_class' => 'block',
            'default_submit' => '[before-line]<div class="clearfix"></div><input type="submit" value="[label]" class="[class]" [misc] [id] />[back]<div class="clearfix"></div>[after-line]',
            'submit_line' => 'before',
    );