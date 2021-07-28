# Utilisation de Git et GitHub

## Bonnes pratiques pour les commentaires de commit

Tous les commits doivent contenir un message descriptif de ce qui a été fait.

Voici un article qui décrit comment formater un [message de commit pertinent](https://blog.stack-labs.com/code/git_perfect_commit_message/).

La première ligne est réservée au sujet qui doit décrire brièvement le contenu du commit. Il est possible d'ajouter une description plus longue après un retour à la ligne.

Le sujet doit décrire un type d'action: Modification, Refactorisation, Bugfix, Ajout, QA, Correction, Retrait... Il faut aussi énumérer les sections du projet qui ont été modifiées. 

Un commit ne doit pas comporter plusieurs types de changement. Par exemple, on ne met pas dans le même commit la modification de la page d'accueil et le bugfix du formulaire de contact.

Avec de bons messages de commits, il est possible de lire le log de commits et de connaître rapidement l'historique des modifications. On peut ainsi retrouver le commit du popup de Noël de l'an dernier pour le remettre en place au prochain Noël. Il n'y a plus besoin de commenter du code de manière temporaire. On peut retrouver le commit où il a été enlevé en cherchant "popup" ou "Noël" dans les messages de commit.

## Mise en ligne via Github
Certains sites ont un principe ou le code en ligne est le code d'un repo Git. On ne peut pas updater manuellement le code en ligne, il sera corrigé par le système dans l'heure.

Faire les modifications, les pousser sur Git, et ensuite faire la ligne `git publish preprod`pour faire que sa branche en cours soit assignée comme le code de la préproduction.

Une fois tout vérifié, on peut faire `git publish prod` pour assigner ce commit comme étant le code utilisé en production.

## Versionnement des projets/releases

TBD (**Majeur.Mineur.BugFix** ou Date YYYY.MM.DD?) (ici ou garder dans [versionnement](versionnement#releases-tags)?)

[Semver](https://semver.org/)
