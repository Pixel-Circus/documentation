# Versionning

La grande majorité des repos sont sur [GitHub](https://github.com/Pixel-Circus).

Si on se retrouve a modifier un repo qui n'est pas présentement dans GitHub (serait donc dans [Bitbucket](https://bitbucket.org/)) le transférer dans Github durant les modifications.

Si le projet n'a pas encore de repo, le créer dans Github via les instructions des noms des repos.

## Nom des repos

Les repos doivent suivre un nom comme ceci:

Code a trois lettres du client, tiret et ensuite un modificateur. Le tout en CamelCase.

Exemple: PIX-SiteWeb

## Outil pour gérer les commits

Aucun requis. Ligne de commande ou un logiciel d'aide comme on veut.

## Branches

Une branch devrait être utilisée pour chaque élément majeur. (Header/Footer/Template, etc.)
Après le développement actif, une branch par point réglé.

https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow

## Releases/Tags

Majeur.Mineur.BugFix

Majeur: Ces modifications vont briser des choses précédemment correctes.
Mineur: Ces modifications ne vont pas briser des éléments, mais n'est pas non plus un bug fix.
Bugfix: Est un bug fix, virgule qui manque, etc.

Lorsque on change une version, tous les # de version en dessous retombent à 0. Exemple: 2.3.4 devient 2.4.0 et non pas 2.4.4

[Semver](https://semver.org/)

## Gestion des gitignores

### .gitignore

Ne contient que les ignores propres au projet pour tous les développeurs/environnements.

### .git/info/exclude

Ne contient que les ignores propres au projet pour cet environnement en particulier.

### Global

Contient tous les ignores qui doivent être partagés sur tous les projets. Ici, on met les règles propres au système d'exploitation et aux logiciels utilisés.

Il faut configurer le fichier global: [https://stackoverflow.com/a/7335487](https://stackoverflow.com/a/7335487) et le créer à la racine du dossier utilisateur: `touch ~/.gitignore` 

**IMPORTANT: Copier le contenu de fichiers/global.gitignore dans ce fichier.**

