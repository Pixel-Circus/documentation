# Typerocket #

Voir le fichier dans `includes/typerocket-fields.php`

Les premières lignes ne devraient pas être modifiées.

`define('TYPEROCKET_PAGE_BUILDER', false);
define('TYPEROCKET_UI', false);`

Les 2 premières lignes retirent des petites choses qui viennent par défaut avec Typerocket. (Le pagebuilder est un pagebuilder par Typerocket, que on utilise pas. Le UI est un UI pour créer des fields sans code, comme ACF. On ne l'utilise pas puisque c'est justement pourquoi on a quitté ACF. Les fields doivent être dans le code.)

`use WPToolies\Plugins\TypeRocket\PageTemplateMetaBox;`

Cette librairie permet de charger les fields sur un template en particulier.

`add_filter('typerocket_loaded', function () {` et sa fermeture a la fin du fichier

Ce bout de code fait que Wordpress exécute le code au bon moment.

Bon, maintenant que les explications sont faites, passons aux vraies affaires.

## Le conteneur ##

```php
$box = PageTemplateMetaBox::make('Home','templates/accueil.php');
$box->addPostType('page');
$box->setContext('normal');
$box->setCallback(function() {
```

- Au début, on crée le bloc. La fonction prend 2 éléments: Un nom (qui doit être unique) et ensuite le nom du template (path complet à partir du thème)
- addPostType est défini à `page`, puisque les fields s'appliqueront dans une page.
- setContext est défini à `normal`. Peut être mis a `side` si on veut qu'il s'applique a la sidebar.
- setCallback est une fonction qui gère les fields. On va l'expliquer en détail dans la prochaine section.

## Le Callback ##

Le callback débute par `$form = tr_form()`. Ceci crée un object que on va référer quand on va créer tous les champs.

Ensuite chaque field peut être créé avec la fonction suivante:

echo $form->**type**('**slug**')->setLabel('**nom**')

- **Slug** : Le nom du field d'un point de vue programmation. Le meta sera sauvegardé et accessible sous ce nom dans le PHP.
- **Nom** : Le nom qui sera affiché dans l'administration.
- **Type** : Le type de champ qui sera affiché. Voir les types acceptés dans la section suivante.

### Les types ###
Il y a beaucoup de types simples:
 - text : Champ texte classique.
 - textarea: Boite de texte acceptant les retours de ligne. Ne pas oublier de faire un nl2br() quand on affiche le champ, sinon les retours seront ignorés à l'affichage.
 - wpEditor: affiche un wysiwyg de Wordpress. Permet d'avoir des titres, du bold, italique, etc.
 - image: Une image. Sera sauvegardé comme le ID de l'image.
 - file: Un fichier. Sauvegardé comme id de attachment.
 - checkbox: Une checkbox simple, qui retournera un vrai/faux.

Mais aussi des types un peu plus complexes:

#### row et column ####

On peut faire un field type row, qui est en fait un conteneur de fields qui seront sur la même rangée. On peut même imbriquer un column pour faire des colonnes dans les rangées.

La fonction fonctionne comme ceci:

```php
echo $form->row(
    $form->text('field1'),
    $form->text('field2')
)
```

Remarquer que les echo ne sont plus nécessaires à l'intérieur du row et les lignes ne se terminent pas par un point virgule, mais une virgule.

#### Repeater ####
Permet d'avoir un élément qui se répête. Par exemple, pour un tableau de données. Les valeurs sont données via un array serialisé, alors ne pas oublier de `unserialize()` sur le meta avant de pouvoir l'utiliser.

Voici la structure:
```php
echo $form->repeater('footer_membres')->setLabel('Membres')->setFields([
    $form->text('field1'),
    $form->text('field2')
]);
```

Donc il faut mettre tous les champs du repeater sous un setFields. Et ensuite, sa fonctionne pas mal comme les row. Pas de echo, et les lignes sont séparées par des virgules.
