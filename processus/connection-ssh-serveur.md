# Se connecter sur le serveur en SSH #

Avant de commencer, nous aurons à avoir une paire de clés SSH.

Le poste peut en avoir déja une.

### Trouver les clés existantes ###
**En Mac**
1. Ouvrir un Finder, et faire CMD+Shift+G
2. Dans la fenêtre qui ouvre, mettre `~/.ssh/`dans le field et cliquer Go.
3. On peut y trouver les paires de clés SSH déjà générées sur le mac. (un fichier sans extention qui sera référée comme *clé privée* dans le reste du document, et un avec l'extention .pub, qui sera référée comme la *clé publique*)
4. Si elle existe, utiliser id_rsa comme paire. C'est la clé de base du Mac.

**En Windows**
- TODO: Trouver comment trouver les clés déja générées en Windows

### Générer une clé ###
**Si il n'y a pas de clés déjà générées**

1. [Générer via SSH](https://www.ssh.com/ssh/keygen/)
2. Garder les 2 fichiers clés quelque part de simple à accéder.

***À partir de cette étape, on assume vous avez une clé SSH***

## Se connecter via Filezilla au serveur ##

### Sur le serveur (Cpanel) ###
1. Se connecter au cpanel général du serveur (cloud-cluster), et choisir le compte auquel on va vouloir se connecter.
2. Aller dans le menu **SSH Access -> Manage SSH Keys -> Import Key**
3. Donner un nom a l'accès (utiliser quelque chose qui vous identifie facilement, tel votre nom.)
4. Ouvrir sa clé publique dans un lecteur texte, et copier/coller la clé dans **'Paste the public key in the following text box'**. Les 2 autres champs devraient être laissés vides.
5. Nous serons rapportés à **Manage SSH Keys**.
6. Trouver sa clé dans la liste **Public keys** et cliquer sur **Manage**
7. Cliquer sur **Authorize**

### Dans Filezilla ###
1. Créer un nouveau host.
2. Trouver le username du compte.
   - Si on retourne a la base du CPanel du compte, voir ce qui est dans 'Current User' dans la sidebar. Retirer ce qui est entre parenthèses, qui est l'URL du compte.
   - Si on est dans la liste des comptes dans WHM, c'est ce qui est dans la colonne Username.
3. Entrer cette configuration
   - Protocol: SFTP - SSH File Transfer Protocol
   - Host: c05.cloud-cluster.org
   - Logon Type: Key File
   - User: Le username trouvé à l'étape précédente
   - Key File: Mettre le fichier de la clé privée reliée à la clé publique mise sur le serveur.