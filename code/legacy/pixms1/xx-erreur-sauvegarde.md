# Problème de migration des tables pour RedbeanPHP 

Il se peut qu’il y ait des erreurs produites par RedbeanPHP lors d’une mise en ligne sur certains serveurs. Les erreurs peuvent être causées par le mode MySQL utilisé sur le serveur, notamment « STRICT\_TRANS\_TABLES ».

Pour rectifier le problème, accéder au PHPMyAdmin du serveur et exécuter cette requête:

    SET GLOBAL sql_mode = '';