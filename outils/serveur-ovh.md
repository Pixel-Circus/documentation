Un serveur dev a été configuré chez OVH. C'est un serveur Ubuntu. Il est notamment utilisé pour l'outil de génération PDF [Web2PDF](web2pdf.html).

Sur le serveur, [Webmin](https://doxfer.webmin.com/Webmin/Main_Page) a été installée pour son administration. C'est une alternative gratuite à cPanel. Les accès pour le Webmin sont dans le document d'accès de Pixel Circus.

Un certificat SSL a été configuré. Il utilise Let's encrypt et devrait être renouvelé automatiquement tous les 2 mois.

## Modifier des fichiers

Dans le menu Tools, choisir File Manager. Les fichiers pour les sites sur le serveur sont dans `/var/www`.

## Ajouter un site

Rechercher Apache dans le menu. Il faut ensuite ajouter un vhost avec Create virtual host. S'assurer de mettre le root dans `/var/www` comme pour les autres sites.