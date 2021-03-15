# Créer un module avec backend

Les modules Pixms consistent en 1 table en DB, 1 onglet dans la console de gestion et la plupart du temps 1 controller frontend. La table est automatiquement gérée par l’ORM RedbeanPHP, donc la première étape consiste à développer l’onglet dans la console de gestion (backend).

Générer les fichiers pour le backend
------------------------------------

Il existe une page dans la console de gestion permettant de générer les fichiers nécessaires pour commencer le développement du module. Cette page est accessible pour les superadmins.

*   Depuis le menu du haut à droite, cliquer sur Ajouter un module
*   Dans le champ Label, il faut inscrire le nom de la table en DB au pluriel
*   En cliquant sur confirmer, plusieurs fichiers seront ajoutés et d’autres seront modifiés:
    *   Ajouté: application/config/admin/form\_validation/\[label\]\_validation.php
    *   Ajouté: application/controllers/admin/\[label\].php
    *   Ajouté: application/models/admin/\[label\]\_model.php
    *   Modifié: application/config/admin/menu.php
    *   Modifié: application/languages/french/admin/controller\_lang.php
    *   Modifié: application/languages/english/admin/controller\_lang.php

Par défaut, le nouveau module est ajouté à la fin du menu principal dans la console de gestion. Il est possible de changer l’emplacement en modifiant la configuration de menu.php. Aussi, il faut réviser les ajouts aux fichiers de langues pour ajuster les traductions et les conjugaisons.

Adapter le formulaire, la validation et la sauvegarde
-----------------------------------------------------

Le comportement par défaut d’un module backend consiste en un formulaire affiché qui lors de sa soumission valide les données. S’il y a des erreurs, elles sont affichées à même le formulaire, s’il n’y en a pas, l’entrée est sauvegardée en DB.

### Modifier le formulaire

Le module créé vient avec un formulaire générique pour des modules de contenu. Il est possible de modifier le formulaire en éditant le fichier de validation créé à l’étape précédente. Se référer à [la configuration des formulaires](http://docs.pixelcircusclient.com/blog/programmer-un-formulaire/) pour connaître les différents types de champs possibles. Dans le controller, c’est la méthode \`details\` qui s’occupe de l’affichage, de la validation et de la sauvegarde d’un formulaire.

### Modifier l’objet avant de le sauvegarder

La méthode \`\_manage\_object\_to\_store\` permet de faire des dernières manipulations avant que l’objet soit sauvegardé en DB. Pour récupérer l’objet actif qui sera sauvegardé, il suffit de faire appel à \`Pixms::object();\` qui contient l’object Redbean actif.

    protected function \_manage\_object\_to\_store()
    {
        //Insérer les modifications
        Pixms::object()->property = false;
        //Supprimer une propriété utile au formulaire seulement qui ne doit pas être sauvegardée en DB
        unset(Pixms::object()->obsolete);
    }

### Modifier l’objet avant de l’afficher

La méthode \`\_manage\_object\_before\_display\` permet de faire des changements à l’objet comme \`\_manage\_object\_to\_store\` à l’exception que les changements effectués ne seront pas mis en base de données, mais seront plutôt réflétés dans l’affichage des données dans le formulaire.

    protected function \_manage\_object\_before\_display()
    {
        //Insérer les modifications
        Pixms::object()->property = false;
    }

### Modifier la configuration du formulaire pour l’affichage depuis le controller

La méthode \`\_manage\_form\_validation\_before\_display\`, si ajoutée au controller, permet de modifier la configuration du formulaire juste avant l’affichage. Cela peut être utile dans certains cas demandant un ajustement des champs du formulaire en fonction de la valeur d’un autre champ par exemple. Cette méthode possède un paramètre: le array de configuration tel que dans le fichier de validation et le array modifié doit être retourné.

L’utilisation de clés textuelles dans le array de configuration du formulaire est utile pour rapidement modifier un champ en particulier.

    protected function \_manage\_form\_validation\_before\_display($form\_validation)
    {
        //Manipulations sur le array
        unset($form\_validation\['test'\]);
        if (count($form\_validation\['autre'\]\['choices'\]) > 5) {
            $form\_validation\['autre'\]\['type'\] = 'select';
        }
        return $form\_validation;
    }

### Modifier la configuration du formulaire pour la validation depuis le controller

La méthode \`\_manage\_form\_validation\_before\_run\`, si ajoutée au controller, permet de modifier la configuration du formulaire juste avant la validation. Cela peut être utile dans certains cas demandant un ajustement des règles de validation en fonction de la valeur d’un autre champ par exemple. Cette méthode possède un paramètre: le array de configuration tel que dans le fichier de validation et le array modifié doit être retourné.

    protected function \_manage\_form\_validation\_before\_run($form\_validation)
    {
        //Manipulations sur le array
        unset($form\_validation\['test'\]);
        $form\_validation\['autre'\]\['rules'\] = '';

        return $form\_validation;
    }

### Ajouter un sous-tableau de résultats

Il est possible d’ajouter un tableau de résultats à même le formulaire pour faciliter l’accès à des relations multiples. Il faudra ensuite créer le sous-module en utilisant à nouveau la fonction Ajouter un module. Dans les exemples de code suivant, il suffit de remplacer \`\[sousmodule\]\` par le nom choisi pour le sous-module tel qu’il sera inscrit dans le champ Label lors de l’ajout du module.

Code à ajouter au fichier de validation du module dans config:

    array(
        'type' => 'block\_start',
        'class' => 'secondary-grid',
        'id' => '\[sousmodule\]',
    ),
    array(
        'type' => 'href',
        'label' => 'lang:\[sousmodule\]\_add',
        'id' => 'add\_sections',
        'class' => 'add button',
        'href\_fn' => 'link\_add\_\[sousmodule\]',
    ),
    array('type' => 'title',
        'label' => "lang:\[sousmodule\]\_title",
    ),
    array('type' => 'line'),
    array(
        'type' => 'grid',
        'call\_fn' => 'grid\_\[sousmodule\]',
        'id\_table' => 'grid\_\[sousmodule\]',
    ),
    array('type' => 'block\_end'),

#### Code à ajouter au controller du module:

    /\*\*
    \* Get URL to add a section
    \* @return string URL
    \*/
    public function link\_add\_\[sousmodule\]() {
        return admin\_url('\[sousmodule\]/details/0/' . Pixms::$object . '/' . Pixms::object()->id);
    }


    /\*\*
    \* Manage grid related
    \*
    \* @param object $obj Object collection
    \* @param string $id\_table
    \* @param string
    \*/
    public function grid\_\[sousmodule\]($obj = null, $id\_table = null) {
        if (is\_object($obj)) {
            $sections = $obj->own\[sousmodule\];

            $this->\_pixel\_grid\_\[sousmodule\]\_setup();

            return $this->\_render\_pixel\_grid($sections, $id\_table);
        }
    }

    /\*\*
    \* Define setup for the sections grid
    \*/
    private function \_pixel\_grid\_\[sousmodule\]\_setup() {
        // Reorder
        $this->config->set\_item('pixel\_grid\_reordering', false);
        $this->config->set\_item('pixel\_grid\_edit\_cells', false);
        // Export CSV + PDF
        $this->config->set\_item('pixel\_grid\_tabletools', false);

        // Change columns
        $this->config->set\_item('pixel\_grid\_change\_columns', true);

        $this->pixel\_grid->unset\_actions();

    
        // Pixel Grid
        $this->pixel\_grid->add\_action(lang('action\_edit'), '', '', 'edit', array($this, '\[sousmodule\]\_edit\_link'))
            ->add\_action(lang('action\_delete'), '', '', 'delete', array($this, '\[sousmodule\]\_delete\_link'));

        $this->pixel\_grid->columns(array(
            //Configuration des colonnes
        ));
    }
    
    /\*\*
    \* Sections grid link anchor
    \*
    \* @param mixed $value Current value to be displayed
    \* @param object $row Current object to be displayed
    \* @return string Anchor that links to edit page
    \*/
    public function \[sousmodule\]\_link\_anchor($value, $row) {
        $value = strip\_tags($row->get\_label());
    
        return '<a href="' . admin\_url('\[sousmodule\]/details') . '/' . $row->id .
        '/' . Pixms::$object . '/' . Pixms::object()->id . '">' . $value . '</a>';
    }

    /\*\*
    \* Status sections link on grid
    \*
    \* @param string $value
    \* @param object $row
    \* @return string
    \*/
    public function \[sousmodule\]\_status\_link($value, $row) {

        $href = admin\_url('\[sousmodule\]') . '/activate/' . $row->id . '/' . Pixms::$object . '/' . Pixms::object()->id;

        // 2 for pending
        if ($value == 2) {
            return '<span class="pending"><a href="' . $href . '/0" class="inactive" title="Desactivate">Desactivate</a><a href="' . $href . '/1" class="active" title="Activate">Activate</a></span>';
        }
        // 1 for active, 0 for inactive
        if ($value == 1) {
            $text = 'Active';
        } else {
            $text = 'Inactive';
        }

        return '<a href="' . $href . '" class="' . strtolower($text) . '" title="' . $text . '">' . $text . '</a>';
    }

    /\*\*
    \* Edit sections link on grid
    \*
    \* @return string
    \*/
    public function \[sousmodule\]\_edit\_link($value, $row) {
    
        return admin\_url('\[sousmodule\]') . '/details/' . $row->id .
        '/' . Pixms::$object . '/' . Pixms::object()->id; // Url parent type and ID for title on detail view
    }

    /\*\*
    \* Delete sections link on grid
    \*
    \* @return string
    \*/
    public function \[sousmodule\]\_delete\_link($value, $row) {
    
        return admin\_url('\[sousmodule\]') . '/delete/' . $row->id .
        '/' . Pixms::$object . '/' . Pixms::object()->id;
    }

Relations entre les modules
---------------------------

Outre le sous-tableau, il existe quelques types de champs de formulaire pouvant être utilisé pour définir des relations entre les modules.

### Relation one-to-many

En utilisant un select qui reprend le nom de la colonne de liaison entre les modules, il est possible d’automatiquement créer une relation one-to-many entre 2 modules.

L’exemple le plus commun est le champ Page parente dans le module Pages:

    array(
        'type' => 'select',
        'field' => 'pages\_id',
        'label' => 'lang:pages\_related',
        'choices\_fn' => 'get\_pages',
        'rules' => '',
    ),

En ajoutant une nouvelle page, il est possible de lui assigner une page parente grâce au select et la relation est automatiquement créée grâce à \`’field’ => ‘pages\_id’\` qui correspond à la nomenclature attendue par RedBeanPHP pour établir la relation entre les 2 objets en DB. C’est une relation one-to-many parce que la page créée n’a qu’un seul parent, mais le parent peut avoir plus d’un enfant.

L’affichage inverse de cette relation serait un sous-tableau contenant tous les enfants qui serait affiché dans la page parente.

### Relation many-to-many

Pour recréer une relation many-to-many par la configuration du formulaire, c’est le type \`select\_multiple\` qui est utilisé:

    array(
        'type' => 'select\_multiple',
        'field' => 'schools',
        'label' => 'lang:members\_schools\_id',
        'dataplaceholder' => lang('members\_careers\_dataplaceholder'),
        'choices\_fn' => 'get\_schools',
        'class' => 'nojq chosen',
        'attributDisplay' => 'name\_' . LANG,
    ),

Dans le cas d’une relation many-to-many, le \`field\` est plutôt le nom de la table avec laquelle il y a une liaison à faire. Ce genre de relations est beaucoup moins fréquent que le one-to-many.

Génération du tableau de résultats
----------------------------------

Il y a 2 méthodes à connaître dans le controller généré automatiquement pour la génération du tableaux de résultats: \`index\` et \`\_pixel\_grid\_setup\`. La première est utilisé pour la configuration générale de la page affichant les résultats. Elle définit les options d’affichage et les boutons secondaires. Elle appelle ensuite la méthode \`\_pixel\_grid\_setup\` qui est responsable de la configuration du tableau des résultats, puis \`\_render\_pixel\_grid\` qui est responsable de la génération du tableau des résultats. Il est possible de passer un array de résultats à \`\_render\_pixel\_grid\` si on ne veut pas afficher tous les résultats en DB.

### \`index();\`

#### Options

Toutes les options ainsi que leur valeur par défaut sont définies dans le fichier \`application/config/admin/pixel\_grid.php\`. Voici la liste des options les plus utilisées:

*   **pixel\_grid\_search:**  
    Affiche un champ de recherche simple en haut à droite du tableau. Par défaut, true.
*   **pixel\_grid\_advanced\_search:**  
    Affiche un formulaire permettant de faire une recherche plus précise sur plusieurs champs pour filtrer les résultats. Par défaut, false.
*   **pixel\_grid\_sorting:**  
    Permet de réordonner les résultats par les valeurs d’une autre colonne. Par défaut, true.
*   **pixel\_grid\_fix\_header:**  
    Permet de garder visible les noms de colonnes lorsque l’utilisateur défile les résultats. Par défaut, true.
*   **pixel\_grid\_change\_columns:**  
    Permet de changer l’ordre des colonnes en drag-and-drop. Par défaut, false.
*   **pixel\_grid\_reordering:**  
    Permet de réordonner les résultats en DB. Doit être activé dans le constructeur. Par défaut, false.
*   **pixel\_grid\_reordering\_url:**  
    L’url à appeler en AJAX lorsqu’un résultat est réordonné (\`admin\_url(Pixms::$object . ‘/reorder’)\`).
*   **pixel\_grid\_edit\_cells:**  
    Permet de changer la valeur d’une colonne en double cliquant. Par défaut, true.
*   **pixel\_grid\_tabletools:**  
    Permet d’exporter en PDF ou Excel les données affichées dans le tableau. Par défaut, false.
*   **pixel\_grid\_large\_data:**  
    Permet d’utiliser des requêtes AJAX pour charger les résultats pour le tableau. Est automatiquement activé lorsque la table contient beaucoup de résulats.
*   **pixel\_grid\_large\_data\_url:**  
    L’url à appeler en AJAX pour charger les résultats. Est définit automatiquement à l’activation de \`pixel\_grid\_large\_data\`.
*   **pixel\_grid\_exceptions\_not\_edit:**  
    Un array de noms de colonnes qui ne peuvent pas être éditées en double-cliquant. C’est le cas pour toutes les données dont l’affichage dans le tableau diffère de celui en DB.

#### Recherche avancée

La recherche avancée est générée automatiquement à partir des informations fournies par la base de données et la configuration du formulaire du module. Chaque type de champ dans le formulaire est assigné à un type de critère pour la recherche. Voici les fichiers et méthodes à consulter pour comprendre le fonctionnement de la recherche avancée:

*   **application/core/MY\_Admin\_Controller.php**, \_manage\_advanced\_search, \_manage\_advanced\_search\_rules, \_manage\_advanced\_search\_joins, advanced\_search
*   **application/hooks/admin/pixms.php**, génération des données qui sont utilisées par les fichiers JS
*   **js/admin/advanced\_search.js**
*   **js/admin/criteria.js**

#### Boutons

Il est possible d’ajouter des boutons pour effectuer d’autres actions globales en relation avec le module en utilisant \`$this->\_add\_link($url, $label);\`. Par défaut, 2 boutons sont générés: Le bouton pour créer un nouvel objet et un bouton pour l’export.

##### Export

Une méthode a été spécifiquement créée pour les boutons d’export afin de normaliser leur affichage (icône). Au lieu de \`\_add\_link\`, c’est \`\_add\_export\` qu’il faut utiliser.

### \`\_render\_pixel\_grid();\`

    protected function \_pixel\_grid\_setup() {

            // Pixel Grid
            $this->pixel\_grid->add\_action(lang('action\_edit'), '', '', 'edit', array($this, 'edit\_link'))
                    ->add\_action(lang('action\_copy'), '', '', 'copy', array($this, 'copy\_link'))
                    ->add\_action(lang('action\_delete'), '', '', 'delete', array($this, 'delete\_link'));

            $this->pixel\_grid->columns(array(
                        'label\_property' => lang(Pixms::$object.'\_single'),
                        'status' => lang('fields\_status')
                    ))
                    ->callback\_column('label\_property', array($this, 'edit\_link\_anchor'))
                ->callback\_column('status', array($this, 'status\_link'));
    }

#### Actions

Les actions sont des liens qui affectent un seul résultat de la base de données.Pour ajouter une action au tableau, utiliser la méthode \`$this->pixel\_grid->add\_action($label,  »,  », $css\_class, $url\_callback)\`. Si le callback retourne la valeur \`false\` à la place d’une URL, l’action ne sera pas affichée pour l’objet en question.

Ces actions sont présentes par défaut:

*   **modifier:** Paramètres: \`lang(‘action\_edit’),  »,  », ‘edit’, array($this, ‘edit\_link’)\`
*   **supprimer:** Paramètres: \`lang(‘action\_delete’),  »,  », ‘delete’, array($this, ‘delete\_link’)\`
*   **dupliquer:** Paramètres: \`lang(‘action\_copy’),  »,  », ‘copy’, array($this, ‘copy\_link’)\`

#### Colonnes

    $this->pixel\_grid->columns(array(
                        'label\_property' => lang(Pixms::$object.'\_single'),
                        'status' => lang('fields\_status')
                    ))

Les colonnes sont définies à l’aide d’un array dont la clé est la propriété dans la table en DB et la valeur est le label à afficher à l’utilisateur. Il arrive que les colonnes affichent des données qui ne sont pas des propriétés en DB, c’est le cas de \`label\_property\` dans l’exemple ci-dessus. Il faut alors définir un callback qui retournera la valeur affichée en utilisant:  \`$this->pixel\_grid->callback\_column(‘label\_property’, array($this, ‘edit\_link\_anchor’))\`.