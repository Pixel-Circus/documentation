## Normes pour la rédaction de documentation

Un site (https://pixel-circus.github.io/documentation/) est autogénéré grâce à cette configuration du repo GitHub: [Easy Markdown to GitHub Pages](https://nicolas-van.github.io/easy-markdown-to-github-pages/).

La documentation est écrite avec la syntaxe [Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

## Règles de rédaction

1. Éviter de créer une hiérarchie de dossiers, favoriser la création de document dans les dossiers existants.
2. Le dossier "code" contient la documentation des langages et frameworks utilisés dans les projets.
3. Le dossier "outils" contient la documentation de tous les logiciels/sites/technologies utilisés pour supporter le développement des projets.
4. Le dossier "processus" contient toutes les étapes de réalisation de plusieurs types de tâches au sein de l'agence.
5. Si une section est à compléter, la précéder d'un des deux préfixes suivants:
   1. **TBD: To be decided**
   Ce point nécessitera qu'on prenne une décision d'équipe sur cette question avant qu'on écrive la documentation.
   2. **TODO: À faire** 
   Ce sujet a été discuté et décidé, mais il reste le texte a écrire.

## Comment modifier la documentation

### Modification rapide directement sur GitHub

1. Naviguer vers le fichier à modifier et cliquer sur le crayon dans le coin à droite, ou créer un nouveau fichier en cliquant sur Add file
2. Ajouter le contenu au fichier, ou le modifier
3. Entrer les informations de commit dans le bas
4. Pour une simple correction typographique, sélectionner "Commit directly", pour l'ajout de nouveau contenu, cliquer sur "Create a new branch ans start a pull request". *Une pull request permettra à tout le monde de voir la mise à jour et d'apporter des commentaires et des correctifs le cas échéant*

### Modification avec Visual Studio Code

1. Cloner le repo sur votre ordinateur et l'ouvrir dans [Visual Studio Code](outils/visual-studio-code.md)
2. Faire les modifications dans l'éditeur de code. *L'extension "Markdown All in One" est recommandée pour faciliter l'édition et la prévisualisation du contenu.*
3. Commiter les changements sur une nouvelle branche. `TODO: déterminer la structure du nom de la branche`
4. Créer la Pull Request avec l'extension Github Pull Requests.

