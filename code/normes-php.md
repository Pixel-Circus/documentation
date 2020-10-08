# Normes pour le développement PHP

Ces normes sont très inspirées de [PHP The Right Way](https://phptherightway.com/).

## Version PHP

Tous les nouveaux projets doivent être développés sur la dernière [version PHP](https://www.php.net/supported-versions.php) publiée.

## Standard de codage

[PSR-1](https://www.php-fig.org/psr/psr-1/) et [PSR-12](https://www.php-fig.org/psr/psr-12/) doivent être respectés.

## Composer

Composer est utilisé pour gérer les librairies externes.

## Sécurité

### Encodage des mots de passe

Les mots de passe doivent être "hashés" et non encodés. On ne doit pas être en mesure de récupérer le mot de passe original. Il faut utiliser les fonctions [`password_hash`](https://www.php.net/manual/en/function.password-hash.php) et [`password_verify`](https://www.php.net/manual/en/function.password-verify.php)