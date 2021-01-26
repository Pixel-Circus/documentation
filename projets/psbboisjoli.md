# PSB Boisjoli
 
## Page Carrières Universitaire
Cette page est séparée du restant du site. Les CSS/JS sont une combinaison de ceux du site principal et un custom.css et un custom.js
 
Un formulaire est présent sur la page pour les inscriptions à un événement.
 
Les inscriptions s'inscrivent dans la base de données (table wp_pix_internship_app). La fonction qui fait la vérification du courriel et l'inscription dans la DB est dans le `functions.php` dans une fonction `ajax_inscription_stage()`.
 
À chaque fois que la cliente nous demande un nouvel événement, les limites d'inscriptions changent. Habituellement avec 2 types de limites. La limite d'inscription normale et la limite de la liste d'attente si c'est plein. Ces limites sont définies dans une fonction `get_fills_config()`, aussi présente dans le `functions.php`. Il y a aussi une configuration `per_uni`, qui définit si les limites définies sont par université (exemple: limiter les inscriptions à 10 au HEC, 10 à Concordia, etc.) ou générales (exemple: 10 tout court, peu importe l'université)
 
## CCH/Alertes Fiscales
On peut voir, sur la page d'accueil, un module s'appelant Alertes Fiscales. Ce module provient d'un API externe, dont tous les fichiers se retrouvent sous le dossier `_cch`.
 
Les fichiers sous `_cch` sont des fichiers donnés par CCH eux-mêmes. Les éléments proviennent du site web https://taxna.wolterskluwer.com/news et tout cela fonctionne par whitelist que les administrateurs font manuellement. Alors il est normal que le module ne fonctionne ni en local ni en stage.
 
## Intranet
Ce client a un intranet, aussi développé par Pixel. Nous n'avons pas accès à leur production. Lorsque des demandes sont demandées, nous les intégrons en local de notre côté, sans leur data, et ensuite donnons les fichiers modifiés à Larry de PSB Boisjoli, qui en fait l'intégration dans la production.
 
## DNS
Les DNS de PSB Boisjoli sont gérés par leurs propres TI (Larry). Si une modif est à faire, nous devons les contacter, nous ne pouvons faire ça nous même.
 

