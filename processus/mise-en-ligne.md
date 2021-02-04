# Mises en ligne

## Requis

- [ ] Search Console
- [ ] Google Tag Manager
- [ ] Google Analytics

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



## Serveurs et hébergement

## Connection au serveur

## Configuration preprod

TODO:

Créer un accès Git pour le preprod: 
<pre>
cd ~/.ssh && ssh-keygen //github_rsa pour le nom de clé 
cat ~/.ssh/github_rsa.pub
coller le contenu sur github
nano ~/.ssh/config
> Host git
   Hostname (l'URL du fournisseur - i.e. gitlab.com)
   User git
   IdentityFile ~/.ssh/(ta clé privée - soit celle sans extension)

//test 
ssh git
//Setup repo git
git init

nano .git/info/exclude
.*
access-logs
cache
concours.patrimoine-religieux.qc.ca
etc
logs
mail
public_ftp
ssl
tmp
var
www
cpbackup-exclude.conf

git remote add origin git:path/to/the/repository.git

git pull --track origin preprod
</pre>

## Automatisation

Marc-andré devrait nous faire un script qui permet rapidement de importer de Productiona stage et l'inverse.

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

