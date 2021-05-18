# Le Pagebuilder Typerocket
Dans certains sites, nous utilisons le pagebuilder Typerocket. Voici comment l'utiliser

## Créer le component
Dans le dossier components, créer un dossier pour le component en général. Le nom doit être en PascalCase (TBD: Mettre un préfixe comme PB avant pour les différencier?)

Dans ce dossier il y aura le fichier PHP component, ainsi que les fichiers js/scss reliés.

Créer le fichier component qui condiendra un objet PHP avec toute la configuration (expliquée ci bas)

### Fonction `__construct()`
On peut y set le titre du component avec `$this->title =`

À compléter: Autres éléments possibles?

### fonction `fields()`
Cette fonction contient les fields qui pourront être set dans le backend. La configuration est pareille à [lorsque on crée des fields](code/typerocket) pour une page.

### fonction `render($data,$info)`
Cette fonction contient le code HTML qui sera affiché dans le frontend. Les metas sont contenus dans l'attribut `$data`.

### fonction `thumbnail($url)`
À compléter. Semble glitché et ne fonctionne pas sur mon install

## Ajouter le component à la liste
Aller dans le fichier [root]/config/component.

Commencer par ajouter une ligne use au début. La ligne devrait être `use [namespace créé dans le fichier du component]\[nom de l'objet créé dans le même fichier]`

Ajouter son component dans le array `registry` comme `[nom unique] => [nom de l'objet]::class`, et aussi au array `builder`, mais seulement y écrire le nom unique mis dans registry