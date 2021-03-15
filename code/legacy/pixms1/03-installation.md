# Installation et mise en ligne

Voir la documentation sur les mises en ligne et [la création de preprods](http://docs.pixelcircusclient.com/blog/creer-un-preprod/) pour connaître comment procéder sur le serveur de Pixel Circus.

Configuration de la DB et de l’environnement
--------------------------------------------

Il existe 3 types d’environnement possible pour Pixms:

*   **development:**  
    Sert pour le développement en local des projets. Active les outils de débogage. Utilisation d’adresses courriel pixelcircus pour les envois courriels.
*   **preprod:**  
    L’environnement de préproduction sert aux tests et aux validations client avant la mise en ligne. Le contenu du preprod diffère généralement de l’environnement de production. Certains outils de débogage s’activent lorsqu’une erreur survient.
*   **production:**  
    C’est l’environnement pour les sites live. S’assure de ne pas afficher d’informations de débogage et d’utiliser les bonnes adresses pour l’envoi des courriels.

La configuration de la DB pour les 3 environnements est contenue dans le fichier application/config/database.php. Le nom de l’environnement est repris comme clé du array:

<pre>
$db\['**development**'\]\['hostname'\] = 'localhost';
$db\['**development**'\]\['username'\] = 'root';
$db\['**development**'\]\['password'\] = '';
$db\['**development**'\]\['database'\] = 'dbname';
$db\['**development**'\]\['dbdriver'\] = 'mysql';
</pre>

Installation et transfert du contenu
------------------------------------

1.  Exporter la dernière version du dépôt Git vers le dossier public.
2.  Récupérer le dossier uploads et tous les fichiers qui y sont contenus de l’endroit approprié: ftp live, ftp preprod ou encore depuis les downloads sur Bitbucket.
3.  Récupérer la base de données de l’endroit approprié: database live, database preprod ou encore depuis les downloads sur Bitbucket.
4.  Faire un search/replace du domaine pour s’assurer que les liens fonctionnent correctement.
5.  S’assurer d’avoir le bon environnement dans index.php ou environment.php
6.  S’assurer de bien configurer la connexion à la DB selon l’environnement.
7.  Importer la base de données.
8.  Le site est fonctionnel.  
    _\* Certains projets requièrent l’utilisation d’un nom de domaine (pas de sous-dossier) pour fonctionner correctement._