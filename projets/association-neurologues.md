# Association des Neurologues du Québec
Pages importantes:  
Produits (Pour acheter les formations) [https://stage.anq.qc.ca/boutique/](https://stage.anq.qc.ca/boutique/)  
1 formation: [https://stage.anq.qc.ca/cours/epilepsie/](https://stage.anq.qc.ca/cours/epilepsie/) ou [https://stage.anq.qc.ca/cours/epilepsie/](https://stage.anq.qc.ca/cours/epilepsie/)  
Archive des formations: ?  
Mes formations: [https://stage.anq.qc.ca/my-courses/](https://stage.anq.qc.ca/my-courses/)

## Créer une formation
1. Créer dans l'admin la formation
2. Si la formation a un certificat, il faut l'assigner via la sidebar dans le backend.
3. Une formation est formée de plusieures leçons, qui quand on les crée dans la formation, sa crée un post au même nom, en draft, dans le custop post type leçon.
4. Dans chaque formation, on peut y mettre la doc de ce chapitre, et ensuite un Quiz. Sensei se base sur la complétion de ce quiz pour figurer que une portio de la formation a été faite.

Donc en gros ce que je fais c'est pas mal de mettre chaque élément (vidéo ou powerpoint) dans sa propre leçon, et ensuite on figurera comment mettre un Quiz dans le tout

## Faire que une formation est payante/achetée
Important à savoir: Les produits n'ont pas a avoir une seule formation, et les formations peuvent être associées a plusieurs produits
1. Aller dans Woocommerce et ajouter un produit. Lui assigner un prix et il est préférable, dans l'onglet inventaire, de limiter a l'achat de 1 unité de ce produit par compte.
2. Une fois le produit créé, on peut aller dans les formations, et dans le haut de la page de modifications, il y a un onglet sensei (est un petit cercle, à coté de l'engrenage settings.)
3. Dans l'onglet sensei, on peut associer les produits woocommerce à une formation. Si je comprend bien, on a juste a avoir acheté un des produits qui contient la formation pour y avoir accès.