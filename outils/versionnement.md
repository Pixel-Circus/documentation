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

TBD (Une branch pour chaque élément durant le développement actif, ou garder les branch pour chaque élément lors d'ajout d'éléments apres le dev actif.)

https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow

## Releases/Tags

TBD (**Majeur.Mineur.BugFix** ou Date YYYY.MM.DD?)

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

