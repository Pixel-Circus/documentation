# Installation d'un site en local #

1. Cloner le repo sur son poste. (Ou, si le repo n'existe pas, le créer dans GitHub et le cloner sur son poste.)
2. Créer son host via Mamp, ou manuellement dans son hostfile.  
   - L'URL locale devrait être [codeclient].pixelcircus.d3v
   - Tandis que on a les fichiers et le host, lorsque cette étape est terminée, on devrait voir à l'URL sélectionnée la page d'erreur de connexion a la DB de Wordpress.
3. Installer la base de données.
    - Il est préférable d'utiliser la base de données 'la plus avancée'. Ce que on veut dire par la est la production si le site est en ligne, et le stage si le site est seulement en préproduction.
    - Une fois que on a téléchargé la base de données, faire un chercher/remplacer dans le SQL pour remplacer l'ancienne URL par l'url de son site local.
    - Importer la base de données sur son phpmyadmin local. Pour utiliser la fonctionalité de groupage des bases de données de phpmyadmin, donner un nom tel que [technologie]_[nomprojet]. Exemple: wp_bca
4. Ouvrir son projet dans VSCode (ou autre logiciel de code utilisé)
5. Se rendre dans le dossier du thème via command line et exécuter la ligne `npm run themesetup`. Cette ligne fera tous les installs nécessaires pour le bon fonctionnement du site. (Cette ligne nécessite que [Github CLI](https://cli.github.com/) soit installé sur son poste pour pouvoir run.)
6. Lorsque themesetup est terminé, exécuter, au meme endroit, `npm run bootstrap`. Celle ligne configurera webpack. Avoir l'URL de son local dans le presse-papier, puisque cette ligne nous demandera cette information.
7. Lorsque bootstrap aura terminé, `npm run start` pour faire du développement.

# Préparer a mettre en stage ou en ligne #

1. Arrêter son `npm run start`, et exécuter `npm run build`
2. Uploader les fichiers du site sur le serveur de stage ou production. Tous les fichier du thèmes devraient être en ligne, à part node_modules.
3. Si on veut pas uploader tout (pour une mise en ligne plus rapide), on peut simplement mettre en ligne tous les PHP modifiés, et si les modifications concernent quelque chose dans `assets_src`, comme les SCSS, JS ou images, il faut uploader tout le dossier `assets_src` et le dossier `assets_dist`.