# Forfaits Québec

## Popups
Le client a fait ajouter plusieurs popups. Le code de ces popups est sous `/partials/` et sont `contestpopup.php`, `couponpopup.php` et `custompopup.php`.

Le code pour décider de quel popup qui est affiché est dans le `footer.php`. Tous les popups génèrent un cookie pour que ça s'affiche une seule fois par jour.

## Page Forfaits
Il y a 2 types de forfaits, qui sont gérés dans `single-forfaits.php`.

Les forfaits vedette (peu utilisés) et les forfaits normaux. La décision est prise via le champ Type (bouton radio) dans l'administration.


## Passeport Québec

Le Passeport Québec est une carte-cadeau physique ou virtuelle prépayée et utilisable chez plusieurs partenaires de Forfait Québec.
### Formulaire d'achat

Dans le template `template-achat-carte-cadeau.php`, il y a un formulaire à remplir par les utilisateurs pour acheter une carte-cadeau. Il est possible de recevoir une carte physique par la poste ou une carte virtuelle par courriel.

Les transactions en ligne sont effectuées avec la [plateforme de paiement de Moneris](https://developer.moneris.com/). Pour configurer le compte Moneris, il faut se connecter à l'admin de WordPress et aller dans Cartes-cadeaux => Configuration.

La transaction est ensuite traitée par le controller TypeRocket `App\Controllers\MonerisController`. Il est possible de visualiser les commandes dans l'onglet Cartes-cadeaux/Commandes de l'admin Wordpress.

### Cartes-cadeaux

#### Cartes virtuelles

Lorsqu'une transaction est validée par Moneris, une commande est créée dans la base de données de Forfaits Québec. Une cronjob (`wp fq sendvirtualCards`) est exécutée toutes les quelques minutes et s'occupe de créer les cartes commandées et d'envoyer les cartes en version PDF à l'adresse courriel associée à la commande.
#### Cartes physiques

Les cartes physiques ont des montants prédéterminés et des numéros préétablis. Il faut générer des numéros de carte physique avant de pouvoir les faire imprimer. Pour générer des cartes, il faut utiliser cette ligne de commande : `wp fq generate_cards`. Cette commande nécessite 3 paramètres: \<quantity> \<amount> \<type>. \<amount> est un nombre décimal et \<type> est soit P (physique), X (test) ou V (virtuelle). On peut aussi ajouter `--dry-run` pour faire des tests sans affecter la base de données. L'autre option est `--csv` dont la valeur est le courriel à qui envoyer les données CSV générées.

Les cartes physiques sont assignées à une commande grâce à une cronjob (`wp fq assignPhysicalCards`) effectuée toutes les quelques minutes sur le serveur. Le client doit ensuite manuellement trouvée les cartes associées à la commande en cherchant par ID de commande dans l'admin Cartes-cadeaux/Cartes-cadeaux et les envoyer par la poste.

__Exemple concret__

`wp fq generate_cards 100 10.00 P --dry-run --csv=smarquette@pixelcircus.ca`

Cet exemple générera 100 numéros de carte avec une valeur de 10$ pour des cartes physiques. Un CSV sera envoyé à smarquette@pixelcircus.ca avec toutes les informations des nouvelles cartes nécessaires à l'impression. _NB: Enlever le `--dry-run` dans le cas où ce n'est plus un test._

### API de transactions

L'API utilise les [JWT tokens](https://wordpress.org/plugins/jwt-auth/) pour authentifier les partenaires qui se connectent à l'aide d'un nom d'utilisateur et d'un mot de passe ou d'un numéro de carte. 

#### Gestion des droits

Des rôles ont été créer pour gérer l'accès à l'API :
`card_partner` (Partenaire cartes-cadeaux) et `card_balance`

Liste des droits et des rôles qui ont ce droit :

    RIGHT_DEBIT_CARDS: card_partner
    RIGHT_LIST_OWN_TRANSACTIONS: card_partner
    RIGHT_EXPORT_OWN_TRANSACTIONS: card_partner
    RIGHT_SEE_CARDS: card_balance
    RIGHT_LOGIN_WITH_CARD_NUMBER: card_partner, card_balance
#### Endpoints

POST `/wp-json/jwt-auth/v1/token`

Permet de se connecter à l'API par token JWT.

Paramètres possibles: username, password et custom_auth.

custom_auth est utilisé pour la connection avec numéro de carte-cadeau.

GET `/wp-json/carte-cadeau/v1/card-info`

Retourne les informations de la carte actuelle. Nécessite RIGHT_DEBIT_CARDS.

POST `/wp-json/carte-cadeau/v1/card-debit`

Permet de débiter une carte-cadeau. Nécessite RIGHT_DEBIT_CARDS

Paramètres possibles: amount.

GET `/wp-json/carte-cadeau/v1/partner-transactions`

Retourne toutes les transactions partenaires pour une période donnée. Nécessite RIGHT_LIST_OWN_TRANSACTIONS.

Paramètres possibles: month, year.

GET `/wp-json/carte-cadeau/v1/partner-transactions-export`

Retourne un export CSV de toutes les transactions partenaires pour une période donnée. Nécessite RIGHT_EXPORT_OWN_TRANSACTIONS.

Paramètres possibles: month, year.

GET `/wp-json/carte-cadeau/v1/card-balance`

Retourne la balance et les transactions de la carte actuelle. Nécessite RIGHT_SEE_CARDS.



### Terminal des partenaires

Un sous-site terminal.forfaits-quebec.com existe. C'est un site React qui appelle une API créée dans le site principal.

Le site est dans un autre compte sur le serveur, et dans une autre archive Git.

#### Effectuer une transaction

Le partenaire se connecte à l'aide du nom d'utilisateur et du numéro de carte-cadeau. Ensuite, il peut entrer une valeur monétaire pour débiter la carte.

#### Lister les transactions

Le partenaire a aussi accès à une autre page pour visualiser et exporter toutes les transactions qu'il a effectué à chaque mois.

#### Ajouter un partenaire

L'ajout de partenaires se fait depuis l'admin de Wordpress. Il faut ajouter un nouvel utilisateur et lui assigner le rôle de "Partenaire cartes-cadeaux". Il pourra alors se connecter au terminal et effectuer des transactions.
