Un serveur dev a été configuré chez OVH. C'est un serveur Ubuntu. Il est notamment utilisé pour l'outil de génération PDF [Web2PDF](web2pdf.html).

Sur le serveur, [Webmin](https://doxfer.webmin.com/Webmin/Main_Page) a été installée pour son administration. C'est une alternative gratuite à cPanel. Les accès pour le Webmin sont dans le document d'accès de Pixel Circus.

## Certificat SSL

Un certificat SSL a été configuré. Il utilise Let's encrypt et devrait être renouvelé automatiquement tous les 2 mois.

1. La page de configuration se trouve dans **Webmin** => **Webmin Configuration** => **SSL Encryption**. 
2. Une fois sur la page, aller dans l'onglet **Let's Encrypt**. Les fichiers générés sont stockés dans `etc/letsencrypt/live`. Il faut aussi configurer le vhost dans** Apache Webserver**. 
3. Sur la page du vhost à modifier, s'assurer d'utiliser le port 443.
4. Aller dans **SSL Options**. Sur cette page, il faut mettre le fichier `fullchain.pem` de Let's Encrypt dans la configuration **Certificate/private key file** et le fichier `privkey.pem` dans **Private key file**.

## Modifier des fichiers

Dans le menu Tools, choisir File Manager. Les fichiers pour les sites sur le serveur sont dans `/var/www`.

## Ajouter un site

1. Rechercher Apache dans le menu. 
2. Il faut ensuite ajouter un vhost avec Create virtual host. 
3. S'assurer de mettre le root dans `/var/www` comme pour les autres sites.
5. Se connecter sur le compte sur le site d'OVH
6. Ajouter le nouveau nom de domaine à leur zone DNS
7. Faire pointer le nom de domaine chez le registraire/gestionnaire de DNS vers l'adresse IP du serveur
