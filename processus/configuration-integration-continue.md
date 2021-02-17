# Configuration des projets pour l'intégration continue

L'intégration continue mise en place pour le moment consiste seulement à une mise à jour automatique des fichiers source à partir de Git. Git doit contenir tous les fichiers incluant les fichiers générés ou vendor nécessaires au fonctionnement du site sur le serveur preprod/live excluant les uploads et tout autre fichier lié à la base de données.

## Fonctionnement

Pour publier une nouvelle version du site, il faut déplacer le tag correspondant en faisant `git tag -a -f <environment> <commit>` où `<environment>` correspond soit à preprod ou prod et `<commit>` à l'identifiant hexadécimal du commit qui est la nouvelle version du preprod.

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
    </pre>
2.  Copier la clé publique:
        <pre>
        cat ~/.ssh/github_rsa.pub
    </pre>

3. Aller sur Github dans le repo du projet, ensuite Settings, puis Deploy keys et cliquer sur Add new. Utiliser le nom de l'environnement (preprod, prod) comme nom et coller le contenu copié avec la commande `cat`.

4. Retourner dans le terminal du cPanel
   <pre>nano ~/.ssh/config</pre>
5. Coller, sauvegarder (`Ctrl+O`), enter et quitter (`Ctrl+X`)
    <pre>Host git
      Hostname github.com
      User git
      IdentityFile ~/.ssh/github_rsa</pre>
6. Tester la connexion : `ssh git`. *À la question "Are you sure...", répondre Yes.*
7. Se mettre dans le bon dossier avec `cd` et initialiser git sur le serveur : `git init`
8. Configurer les excludes pour les fichiers cPanel : `nano .git/info/exclude`
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
    .my.conn.cnf
    //Autre fichiers/dossiers selon le projet
    </pre>
    Puis, sauvegarder (`Ctrl+O`) et quitter (`Ctrl-X`).
9. Ajouter le repo Github : 
`git remote add origin git:path/to/the/repository.git`. _L'url de Github doit être modifiée pour retirer **@github**._
1. Exécuter `git fetch --tags -f;` et `git checkout tags/<environment>;` et vérifier que le site est fonctionnel
2.  Mettre en place la cronjob dans cPanel/Cron Jobs, sélectionner à chaque minute : `~/bin/deploy.sh <environment>`

## Récupération de la base de données live

### Configurer le user MySQL sur le serveur

https://dev.mysql.com/doc/refman/8.0/en/option-files.html

Dans le dossier du git, 

`nano .my.conn.cnf`
<pre>
[client]
user=ton-username-mysql
password=UNbonPASSWORD
host=192.168.0.233
port=3306

[mysql]
database=DATABASE_NAME
</pre>
Puis, sauvegarder (`Ctrl+O`) et quitter (`Ctrl-X`).

`chmod 600 .my.conn.cnf`

Tester `mysql --defaults-extra-file=.my.conn.cnf`, puis entrer `exit` pour quitter mysql.

### Exporter la base de données

D'abord naviguer dans le dossier de l'environnement où on doit exporter la base de données.

`mysqldump --defaults-extra-file=.my.conn.cnf --add-drop-table DATABASE_NAME > db-export.sql`

### Importer la base de données

D'abord naviguer dans le dossier de l'environnement où on doit importer la base de données et ajuster le chemin vers le fichier exporté précédemment. 

`mysql --defaults-extra-file=.my.conn.cnf DATABASE < ../db-export.sql`

## Récupérer les uploads

Pour synchroniser les uploads de production vers preprod, on utilise `rsync`. Il faut enlever le n dans les flags après avoir fait un dry-run pour que le transfert soit vraiment effectué. 

`rsync -avn --delete "./uploads/" "./preprod/uploads/"`

## Annexes

### Conversion d'un projet Wordpress

TODO

https://matthewdaly.co.uk/blog/2019/09/22/storing-wordpress-configuration-in-environment-variables/

### Conversion d'un projet Pixms

TODO
