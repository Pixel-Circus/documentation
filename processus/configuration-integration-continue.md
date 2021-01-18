# Configuration des projets pour l'intégration continue

L'intégration continue mise en place pour le moment consiste seulement à une mise à jour automatique des fichiers source à partir de Git.

## Fonctionnement

Pour publier une nouvelle version du site, il faut déplacer le tag correspondant en faisant `git tag -a -f <environment> <commit>` où `<environment>` correspond soit à preprod ou production et `<commit>` à l'identifiant hexadécimal du commit qui est la nouvelle version du preprod.

Le serveur se charge de vérifier si une nouvelle version du site est publiée toutes les minutes et fera la mise à jour le cas échéant.

## Configuration du script de mise à jour

Le script qui s'occupe de faire la mise à jour est dans le dossier `bin` sur le Git du projet. Le nom du fichier est `deploy.sh`. Un exemple de base est présent dans [fichiers/deploy.sh](/fichiers/deploy.sh). Il est possible de personnaliser ce fichier pour les différents projets. 

Il faut commiter le fichier en exécutable: `git add --chmod=+x -- bin/deploy.sh`

Le fichier `index.php` du site doit se retrouver dans un dossier `public_html` sur le repo Git.

- [Conversion d'un projet Wordpress](#conversion-wordpress)
- [Conversion d'un projet Pixms](#conversion-pixms)

## Configuration d'un environnement de preprod ou de production

1. Créer un accès Git sur le serveur en accédant au terminal depuis le compte cPanel: 
    <pre>
    cd ~/.ssh && ssh-keygen 
    //github_rsa pour le nom de clé 
    cat ~/.ssh/github_rsa.pub
</pre>

2. Aller sur Github dans le repo du projet, ensuite Settings, puis Deploy keys et cliquer sur Add new. Utiliser le nom de l'environnement (preprod, production) comme nom et coller le contenu copié avec la commande `cat`.

3. Retourner dans le terminal du cPanel
   <pre>nano ~/.ssh/config</pre>
4. Coller, sauvegarder (`Ctrl+O`) et quitter (`Ctrl+X`)
    <pre>Host git
      Hostname github.com
      User git
      IdentityFile ~/.ssh/github_rsa</pre>
5. Tester la connexion : `ssh git`.
6. Initialiser git sur le serveur : `git init`
7. Configurer les excludes pour les fichiers cPanel : `nano .git/info/exclude`
   <pre>
    .*
    access-logs
    cache
    etc
    logs
    mail
    public_ftp
    ssl
    tmp
    var
    www
    cpbackup-exclude.conf
    //Autre fichiers/dossiers selon le projet
    </pre>
    Puis, sauvegarder (`Ctrl+O`) et quitter (`Ctrl-X`).
8. Ajouter le repo Github : 
`git remote add origin git:path/to/the/repository.git`
9. Exécuter `~/bin/deploy.sh <environment>` et vérifier que le site est fonctionnel
10. Mettre en place la cronjob dans cPanel/Cron Jobs, sélectionner à chaque minute : `~/bin/deploy.sh <environment>`

## Annexes

### Conversion d'un projet Wordpress

TODO

### Conversion d'un projet Pixms

TODO