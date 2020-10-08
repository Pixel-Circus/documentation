# Normes de développement pour WordPress

## Thème de base

- Theme [Pix-Bootstrap](https://github.com/Pixel-Circus/PIX-ThemeBootstrap)

### Legacy

- Theme [https://github.com/Pixel-Circus/WordpressBase](https://github.com/Pixel-Circus/WordpressBase)
  - Uikit-Base (UIKit)
  - shiroi-theme (pas de templating préfait.)

## WP Cli

L'installation recommandée est [avec Composer](https://make.wordpress.org/cli/handbook/guides/installing/#installing-via-composer): `composer global require wp-cli/wp-cli-bundle` 

## Plugins approuvés par l'équipe

- [LiteSpeed Cache](https://fr.wordpress.org/plugins/litespeed-cache/) (Caching, surtout pour nos sites hostés sur serveur a marc.)
  - Le site devait être lié au compte [quic.cloud](https://my.quic.cloud/) fpilon@pixelcircus.ca pour l'optimisation des images
- [WordFence](https://en-ca.wordpress.org/plugins/wordfence/) (Sécurité)
  - Le site devrait être inscrit sur [Wordfence](https://www.wordfence.com/), sur le compte pixelcircus
- [Polylang](https://en-ca.wordpress.org/plugins/polylang/) (Multilingue)
- [YoastSEO](https://en-ca.wordpress.org/plugins/wordpress-seo/) (SEO)
- ~~[WP Migrate DB](https://fr.wordpress.org/plugins/wp-migrate-db/) (Pour transfert du site d'environnement en environnement)~~
- [Classic Editor](https://fr.wordpress.org/plugins/classic-editor/) (Pour retirer Gutenberg)

## Structure des thèmes

### Structure

- [assets_src](#assets_src)
  - [components](#components)
    - ...
  - [images](#images)
  - [js](#js)
  - [scss](#js)
  - [video](#video)
- [includes](#includes)
- [languages](#languages)
- [partials](#partials)
- [templates](#templates)
- [wp-admin](#wp-admin)
- [fichiers de WP]

### Explication

#### assets_src {#assets_src}

Contient tout ce qui nest pas structure. Sera compilé/compressé dans assets_dist lorsque on fera un build.

#### components {#components}
Contient un dossier par component. Chaque component contient un .scss et si besoin un .js qui contient le code pour le bon fonctionnement du component. Peut aussi contenir un .php du code nécessaire.

#### images {#images}
Contient toutes les images loadées du thème. Seront compressées dans assets_dist lors d'un build.

#### js et scss {#js}
Les dossiers js et scss contiennent le js et scss (respectivement) root (celui qui import tous les components nécessaires au site.)

#### video {#video}
Si on demande d'avoir un vidéo, et que celui-ci est hosté sur le serveur, le mettre ici.

#### includes {#includes}
Contient toutes les fonctions de Wordpress qui sont créées pour le bon fonctionnement du thème. Pas de structure ici, juste des hooks ou des fonctions aidantes.

#### languages {#languages}
Contient les mo/po nécessaires pour la traduction du thème.

#### partials {$partials}
Parties du thèmes qui seront réutilisées de template en template. Exemple: header (top.php) et footer (bottom.php)

#### templates {#templates}
Les templates nécessaires au fonctionnement du site, qui ne sont pas des fichiers de base de WP.

#### wp-admin {#wp-admin}
Contient les scripts/styles qui ne sont utilisés que dans l'administration WP.

