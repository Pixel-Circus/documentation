# Installation d'un site en local #

1. Cloner le repo sur son poste. (Ou, si le repo n'existe pas, le créer dans GitHub et le cloner sur son poste.)
2. Créer son host via Mamp, ou manuellement dans son hostfile.  
   - L'URL locale devrait être [codeclient].pixelcircus.d3v
   - Tandis qu'on a les fichiers et le host, lorsque cette étape est terminée, on devrait voir à l'URL sélectionnée la page d'erreur de connexion à la DB de Wordpress.
3. Installer la base de données.
    - Il est préférable d'utiliser la base de données 'la plus avancée'. Ce qu'on veut dire par là est la production si le site est en ligne, et le stage si le site est seulement en préproduction.
    - Une fois qu'on a téléchargé la base de données, faire un chercher/remplacer dans le SQL pour remplacer l'ancienne URL par l'url de son site local.
    - Importer la base de données sur son phpmyadmin local. Pour utiliser la fonctionnalité de groupage des bases de données de phpmyadmin, donner un nom tel que [technologie]_[nomprojet]. Exemple: wp_bca
4. Ouvrir son projet dans VSCode (ou autre logiciel de code utilisé)
5. Se rendre dans le dossier du thème via command line et exécuter la ligne `npm run themesetup`. Cette ligne fera toutes les installations nécessaires pour le bon fonctionnement du site. (Cette ligne nécessite que [Github CLI](https://cli.github.com/) soit installé sur son poste pour pouvoir run.)
6. Lorsque themesetup est terminé, exécuter, au même endroit, `npm run bootstrap`. Celle ligne configurera webpack. Avoir l'URL de son local dans le presse-papier, puisque cette ligne nous demandera cette information.
7. Lorsque bootstrap aura terminé, `npm run start` pour faire du développement.