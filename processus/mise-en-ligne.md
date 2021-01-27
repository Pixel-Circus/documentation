# Mises en ligne

## Requis

- [ ] Search Console
- [ ] Google Tag Manager
- [ ] Google Analytics


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

