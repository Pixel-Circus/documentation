# Univins
 
## Metas des bouteilles/producteurs
Le site a été modifié pour que les métas des produits et des producteurs soient dans une table séparée. Voir les tables `uni_post_producers` et `uni_post_products`.
 
Si un meta est ajouté ou modifié, il devra être ajouté/modifié dans la table aussi, sinon ils ne sauvegardent pas.
 
Les métas doivent aussi être ajoutés dans `mu-plugins/univins/app/Models/ProductData.php`, qui gère cet ajout à la base de données.
 
Ceci a été fait pour l'optimisation de la recherche.
 
## Versions PDF des fiches
Les fiches ont aussi une version PDF. Cette fiche est générée via un second template dans le code. `single-uni_product.php`  est la page de la fiche, et `fiche-technique-uni-product.php` est le PDF.
 
On peut voir la page utilisée pour générer le PDF simplement en retirant le .pdf de l'URL lorsqu'on demande la fiche. (Exemple: https://univins.ca/produits/mazzaro-trebbiano-pinot-grigio.pdf/fiche-technique/ -> https://univins.ca/produits/mazzaro-trebbiano-pinot-grigio/fiche-technique/)
 
Les PDF ne sont générés qu'une fois. Après leur génération, la version générée la première fois sera simplement redonnée au nouvel utilisateur. Les PDF générés sont sauvegardés sur le serveur, sous `wp-content/uploads/pdf`. Si on veut forcer une update des PDF (par exemple, après modification), supprimer le ou les PDF à refaire du dossier. Supprimer tous les PDFs du dossier est une option valable.
 
## Recherche Ajax
La recherche Ajax n'est pas comme la majorité de nos sites. Elle fait une requête PHP au site, alors que beaucoup d'autres sites consultent un json généré.
 

