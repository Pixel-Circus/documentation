# Mises en ligne

## Requis

- [ ] Search Console
- [ ] Google Tag Manager
- [ ] Google Analytics
## Serveurs et hébergement

## Mise en ligne via GitHub
Les sites utilisant cette technique sont présentement rares, mais ça deviendra la norme tranquillement mais sûrement.
 
Les projets l'utilisant auront mention de ceci dans leur aide mémoire, mais si le projet en cours à une branche `develop` les chances sont qu'elles utilisent cette technique.
 
Donc quand on développe avec cette technique de mise en ligne, on branche pour notre modification à partir de `develop`, qui est la version 'en développement'.
 
Ensuite on développe sa nouvelle fonctionnalité, et quand c'est prêt aller sur le serveur Stage modifier la branche utilisée. Cela mettra à jour le code utilisé en stage pour pouvoir montrer au client.
 
TODO: Expliquer comment aller changer ce head.
 
Lorsque tout est confirmé et prêt à la mise en ligne, faire un Pull Request qui merge sa modification sur `develop`, et ensuite sur `master` ou `main`. Ce Pull Request amènera le nouveau code en ligne.
 
### Hotfix
 
Lorsque une modification doit être faite expressément (on parle ici d'une urgence, qui ne passerait pas par approbation), on peut faire un Hotfix.
 
Dans un hotfix, on branche le `master`/`main` fait la modif, et Pull Request dans `master`/`main`.
 
Ensuite, quand tout est bon, Pull sa branche dans `develop` pour mettre le bug fix dans la version développement aussi.
 
Cette option est vraiment uniquement pour les bugs qui doivent être corrigés expressément. A utiliser seulement en cas d'urgence.

## Connection au serveur 

[Se connecter au serveur en SSH](connection-ssh-serveur.html)

## Configuration preprod

Un [compte cPanel est créé](creation-compte-cpanel.html) pour chaque environnement dans le WHM en utilisant un sous-domaine du domaine pixelcircusclient.com. Une fois le compte créé, il faut configurer l'intégration continue pour que les mises en ligne soient automatique.

Il faut ensuite ajouter l'entrée DNS dans Cloudflare pour le nouveau sous-domaine pixelcircusclient.com qui a été créé. L'adresse IP est affichée sur la page d'accueil du cPanel.

Voir [Configuration de l'intégration continue](configuration-integration-continue.html).

### Changement de version PHP pour les environnements de développement

Dans le htaccess, il est possible de changer la version PHP utilisée par l'environnement de développement avec cette ligne : 

`AddType application/x-lsphp72 .php`

Les 2 chiffres représentent la version PHP voulue. _Cette version de PHP n'utilise pas les configurations dans le cPanel._

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

