# Manipuler la base de données

Dans Pixms 1 grâce à l'utilisation du mode fluide de RedbeanPHP, il n'y a pas de manipulations de base de données lors des changements de structure.

Il suffit de créer un nouveau modèle, de lui donner un nom de tables et les champs seront automatiquement créés suivant ce qui est fourni à l'objet PHP (Bean).

Créer un nouveau modèle
-----------------------

Les modèles se retrouvent tous dans le dossier « application/models ». Les modèles communs au backend et au frontend sont à la racine. S'ils sont spécifiques à un contexte, ils seront dans le dossier correspondant.

Il faut donc créer un nouveau fichier PHP. La nomenclature standard est [table]_model.php. En raison de l'utilisation de RedbeanPHP, le nom de la table ne doit pas comporter de underscores. Le fichier doit au minimum contenir ce code:

    <?php

    class Table_model extends MY_Model {

        public function __construct() {
            parent::__construct();
            $this->_table = 'table';
        }
    }

On peut remarquer que le nom de la classe reprend le nom du fichier, mais avec la première lettre en majuscule. Cette nouvelle classe hérite de toutes les méthodes de application/core/MY_model.php.

Insérer en DB
-------------

Pour récupérer un modèle à partir d'un controller, utiliser la fonction `Pixms::model('table');`. L'exemple ci-dessous crée une nouvelle entrée en DB:

    $obj = Pixms::model('table')->init(); //Retourne un objet vide
    $obj->import(array('name' => 'Test', 'status' => 1)); //Importe des valeurs depuis un tableau
    $obj->name .= ' 2'; //il est possible de manipuler l'objet avec les propriétés
    //Sauvegarde l'entrée dans "table" et retourne l'objet avec son nouvel ID
    Pixms::model('table')->create($obj);

Récupérer des résultats
-----------------------

La méthode `find` est la méthode la plus utilisée pour récupérer des données de la base de données. Elle retourne un array de résultats dont les clés sont les ID des items en DB. Cette méthode s'occupe de construire la requête, il suffit de lui passer la condition (après WHERE) et les paramètres s'il y a lieu.

    $results = Pixms::model('table')->find('status = :status', array(':status' => 1));
    //SELECT * FROM table WHERE status = 1;

Mettre à jour une entrée
------------------------

    $obj = Pixms::model("table")->retrieve(5); //Récupère un item à partir du ID
    $obj->name = 'New name';
    Pixms::model("table")->update($obj);

Supprimer une entrée
--------------------

    $obj = Pixms::model("table")->retrieve(5); //Récupère un item à partir du ID
    Pixms::model("table")->delete($obj);

Autres méthodes utiles
----------------------

Toutes les méthodes ci-dessous s'utilisent avec `Pixms::model('table');`

*   **nb_results($condition = '1',, $params = array());**  
    Retourne le nombre de résultats pour la requête. Utile pour la pagination.
*   **find_one($condition = '1', $params = array());**  
    Retourne le premier résultat de la requête sous forme d'objet.
*   **get_all($condition = '1', $params = array());**  
    Fonctionne comme `find`, mais retourne des arrays au lieu d'objets.
*   **sql($requete, $params = array());**  
    Exécute une requête SQL arbitraire et retourne le résultat sous forme de arrays dans le cas d'un SELECT.
*   **batch($ids);**  
    Retourne le array d'objets selon la liste de ID fournie en array.