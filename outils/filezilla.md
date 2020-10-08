# Filezilla

Filezilla est notre logiciel de choix pour le travail FTP.

## Se connecter sur un serveur que nous hébergeons.

Pour se conencter a un site que nous hébergeons, on a besoin d'une clé SSH.

- Premièrement, générer une clé SSH sur son ordinateur.
- Aller sur le serveur (c05.cloud-cluster.org) et ajouter la clé (publique) sous SSH Access sur le compte du site. (Ne pas oublier de activer la clé SSH)
- Ajouter la config dans Filezilla
  - Protocol: SFTP
  - Host: c05.cloud-cluster.org
  - User: Nom du user sur le serveur
  - Logon Type: Keyfile
  - Key file: Clé privé de la clé uploadée sur le serveur.

## Se connecter sur un serveur que nous n'hébergeons pas

Aucune différence avec la façon normale de faire.