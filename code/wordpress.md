# Normes de développement pour WordPress

## Thème de base

- Theme [Pix-Bootstrap](https://github.com/Pixel-Circus/PIX-ThemeBootstrap)

### Legacy

- Theme [https://github.com/Pixel-Circus/WordpressBase](https://github.com/Pixel-Circus/WordpressBase)
  - Uikit-Base (UIKit)
  - shiroi-theme (pas de templating préfait.)

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
  - [scss](#scss)
  - [video](#video)
- [includes](#includes)
- [languages](#languages)
- [partials](#partials)
- [templates](#templates)
- [wp-admin](#wp-admin)
- [fichiers de WP]

### Explication

#### <div id="assets_src">assets_src</div>

