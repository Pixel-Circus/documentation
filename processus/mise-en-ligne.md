# Mises en ligne

## Requis

- [ ] Search Console
- [ ] Google Tag Manager
- [ ] Google Analytics
## Serveurs et hébergement

La majorité de nos sites sont hébergés sur un serveur géré par Marc-André. C'est un serveur avec CloudLinux, WHM et cPanel.

## Connection au serveur 

[Se connecter au serveur en SSH](connection-ssh-serveur.html)

## Configuration preprod

Un [compte cPanel est créé](creation-compte-cpanel.html) pour chaque environnement dans le WHM en utilisation un sous-domaine du domaine pixelcircusclient.com. Une fois le compte créé, il faut configurer l'intégration continue pour que les mises en ligne soient automatique.

Il faut ensuite ajouter l'entrée DNS dans Cloudflare pour le nouveau sous-domaine pixelcircusclient.com qui a été créé. L'adresse IP est affichée sur la page d'accueil du cPanel.

Voir [Configuration de l'intégration continue](configuration-integration-continue.html).

### Changement de version PHP pour les environnements de développement

Dans le htaccess, il est possible de changer la version PHP utilisée par l'environnement de développement avec cette ligne : 

`AddType application/x-lsphp72 .php`

Les 2 chiffres représentants la version PHP voulue. _Cette version de PHP n'utilise pas les configurations dans le cPanel._

**Ne jamais utiliser pour l'environnement de production** Il faut plutôt changer la valeur dans le sélecteur PHP du cPanel.

## Automatisation

Voir [Configuration de l'intégration continue](configuration-integration-continue.html).

## Wordpress

Lors de la mise en ligne d'un site WP, quelques petites choses sont à ajouter.

1. Installer Litespeed cache. Lier l'installation à un compte quic.cloud via le dashboard de Litespeed Cache.
    - Dans Image optimisation/optimisation settings, mettre Auto Request Cron à ON.
2. Installer Wordfence, lier au compte PixelCircus.
    - Sync les options Wordfence au template Pix (dans Wordfence)

### Exporter les assets pour la mise en ligne ou en stage ###

1. Arrêter son `npm run start`, et exécuter `npm run build`
2. Uploader les fichiers du site sur le serveur de stage ou production. Tous les fichiers du thèmes devraient être en ligne, à part node_modules.
3. Si on veut pas uploader tout (pour une mise en ligne plus rapide), on peut simplement mettre en ligne tous les PHP modifiés, et si les modifications concernent quelque chose dans `assets_src`, comme les SCSS, JS ou images, il faut uploader tout le dossier `assets_src` et le dossier `assets_dist`.

_WIP_
Mise à jour Wordpress

Récupérer la base de données live

Faire la mise à jour avec WP Cli

Tester si le local marche

Publier les lignes de commande

wp export
wp install

