# Création d'un nouveau install WP

1. Créer le Repo dans Github. Le faire avec la convention pour le nom des git [Code Client]-[Nom représentatif du projet]
2. Cloner ce Repo dans ses fichiers.
3. Créer son host (ne pas utiliser l'auto créateur d'installation WordPress de Mamp.)
4. Aller Télécharger une installation Wordpress sur le [site officiel](https://wordpress.org/download/).
5. Dézipper Wordpress et en plasser les fichiers dans notre host (qui devrait aussi être la base du repo que on a créé a l'étape 1) mais ne pas passer le 5 minute install.
6. Se créer une base de données dans son PHPMyAdmin, sous le nom wp_[code projet]
7. Prendre le `wp-config-sample.php` et le sauvegarder sous `wp-config.php`
8. Entrer les informations de sa base de données dans le wp-config.
9. Plus bas dans le wp-config, mettre des [salts générés](https://api.wordpress.org/secret-key/1.1/salt/).
10. Encore plus bas, modifier le `$table_prefix` Pour y mettre un préfixe autre que `wp_`. Ceci rendra le site un peu plus sécur.
11. Accéder a son host pour passer l'installation Wordpress
    1.  Titre du site: mettre le nom, au long, du client. Pourrait être utilisé pour faire la ligne copyright dans le pied de page.
    2.  Pour son Username, mettre la première lettre de son nom et ensuite son nom de famille, comme le début de son courriel (exemple: fpilon). Password est son mot de passe personnel.
    3.  Le courriel admin est le courriel de l'installateur (TODO: changer cette instruction quand on aura statué d'un email admin pour tous.)
    4.  Search engine visibility on peut laisser décoché.
12. Installer des plugins.
    1.  Classic Editor, pour enlever Gutenberg. Peut être ajouté via le repo de Wordpress.
    2.  Typerocket V5, qui doit être téléchargé, et placé manuellement dans `wp-content/plugins`. Suivre [Plugin Installation sur le site de Typerocket](https://typerocket.com/docs/v5/install-via-plugin/#section-plugin-installation).
13. Télécharger le [Thème Bootstrap](https://github.com/Pixel-Circus/PIX-ThemeBootstrap) comme un ZIP, pour ne pas avoir tout le baggage de Git, et le placer dans `wp-content/themes`
14. Renommer le dossier un nom représentatif du client, tout en minuscules, et sans espaces ni tirets.
15. Faire un search and replace dans le dossier du thème pour remplacer `pixbootstrap` par le même nom que le dossier du thème.
16. Exécuter la ligne de commande `npm run themesetup` dans le dossier du thème.
17. Exécuter `npm run bootstrap` au même endroit. Cette ligne demandera l'URL du host, avec le http/https.
18. Exécuter `npm run build` pour faire le premier build.
19. Pousser tout le site sur Github.
20. Exécuter `npm run start` pour commencer son développement actif.