# Plugin WP - Litespeed Cache #

## Dashboard ##
Aucune modification d'options a faire ici.

## General ##
Lier a un quic.cloud account (fpilon@pixelcircus.ca; le mot de passe est dans le fichier d'accès.) Ce cloud account sera utilisé pour l'optimisation des images.

## Cache ##

### General ###
Tout devrait être ON except cache mobile.

Cache logged in users peut être a OFF pour tester lorsque on place du nouveau code en prod.

### TTL/Purge/ESI/Object/Browser/Advanced ###
Ne pas toucher a moins d'indication contraire.

## CDN ##
Options a explorer. Gratuit jusque a 10GB par mois.

## Image Optimisation (Settings) ##

**Auto Request Cron/Auto Pull Cron :** Devrait être à ON. Nécessaire pour que les images soient envoyées et recues de Quic.Cloud

**Optimize original images :** ON

**Remove Original Backups :** OFF. Mettre a ON seulement si nécessaire pour réduire la taille générale du site. Ceci supprime les image originales, donc est irréversible.

**Optimize losslessly :** ON

**Preserve EXIF/XMP data :** OFF

**Create WebP Versions/Image WebP Replacement/WebP For Extra srcset :** ON. Ceci ajoute des versions WebP et remplaces les images dans le code par ces WebP. Est OFF par défaut.

**WebP Attribute To Replace :** Garder recommended value.

**WordPress Image Quality Control :** Laisser tel quel

## Page optimisation ##

Dans cette section c'est beaucoup de activer une option, clear cache, test en session incognito.

Beaucoup de trucs peuvent crash.

### CSS/JS ###
En activer le plus possible avant sa crashe (souvent les font vont arrêter de loader, je n'ai pas pus vraiment voir pourquoi)

Les plus importants sont loader en http2 et async. Mais chaque site a une config un peu différente dépendemment de ce qui casse ou non.

### Optimisation ###
Tout devrait être a ON, sauf Remove Google Fonts, qui devrait être a OFF.

### Media settings ###
**Lazy load images** et **Responsive placeholder** devrait etre a ON;

**LQIP** n'est pas utilisé, mais on devrait ptete regarder pour l'utiliser.

**Lazy Load Iframes** devrait être a ON.

### Media Excludes ###
Devrait être vide ou recommended value.

### Localization/Tuning ###
Devrait être laissé tel quel.

## Database ##
Rien a vraiment changer dans cette section.

TBD: Est-ce que on fait passer le convertisseur de MyISAM a InnoDB?

## Crawler ##
TBD: A décider si on l'utilise. Faut je figure ce qu'il fait en premier lieu.