# Utilisation de Git et GitHub

## Bonnes pratiques pour les commentaires de commit

Tous les commits doivent contenir un message descriptif de ce qui a été fait.

Voici un article qui décrit comment formatter un [message de commit pertinent](https://blog.stack-labs.com/code/git_perfect_commit_message/).

La première ligne est réservée au sujet qui doit décrire brièvement le contenu du commit. Il est possible d'ajouter une description plus longue après un retour à la ligne.

Le sujet doit décrire un type d'action: Modification, Refactorisation, Bugfix, Ajout, QA, Correction, Retrait... Il faut aussi énumérer la section du projet qui ont été modifiées. 

Un commit ne doit pas comporter plusieurs types de changement. Par exemple, on ne met pas dans le même commit la modification de la page d'accueil et le bugfix du formulaire de contact.

Avec de bons messages de commits, il est possible de lire le log de commits et de connaître rapidement l'historique des modifications. On peut ainsi retrouver le commit du popup de Noël de l'an dernier pour le remettre en place au prochain Noël. Il n'y a plus besoin de commenter du code de manière temporaire. On peut retrouver le commit où il a été enlevé en cherchant "popup" ou "Noël" dans les messages de commit.

## Versionnement des projets/releases

TBD (**Majeur.Mineur.BugFix** ou Date YYYY.MM.DD?) (ici ou garder dans [versionnement](versionnement/#releases-tags)?)

[Semver](https://semver.org/)