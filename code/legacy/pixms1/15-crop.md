# Cropper des images

Script pour recadrer automatiquement les images
-----------------------------------------------

Un script PHP (assets/resize/image.php) est présent dans les projets Pixms. Ce script est utilisé en combinaison avec de l’url rewriting dans le htaccess. Les images générées par le script sont mises en cache dans le dossier « assets/resize/imagecache » pour éviter qu’elles soient regénérées à chaque requête.

Pour reconnaître si une image fait appel au script de recadrage, il suffit de regarder son URL. Il devrait commencer par « i/ » si le script est utilisé. C’est la nomenclature standard. Le script utilise le URL rewriting des htaccess pour transformer une URL en un format d’image.

Voici un exemple simple qui redimensionne une image « images/frontend/monimage.jpg » pour qu’elle est une largeur maximale de 300px:

    RewriteRule ^i/monimage.jpg$ assets/resize/image.php?width=300&noupscale&image=images/frontend/monimage.jpg \[QSA,L\]

Pour bien comprendre la ligne ci-dessus, il faut connaître mod\_rewrite de Apache et les bases de l’écriture d’expressions régulières.

### Paramètres

*   **image:**  
    Chemin vers l’image à partir de la racine du site.
*   **width:**  
    Largeur maximale de l’image.
*   **height:**  
    Hauteur maximale de l’image.
*   **noupscale:**  
    Si le paramètre est présent, l’image ne sera pas agrandie. Elle sera retournée telle quelle. Si le paramètre est absent, l’image sera redimensionnée pour respecter les paramètres width et height.
*   **cropratio:**  
    Le ratio width:height à respecter lors du recadrage de l’image. L’image est recadrée au centre.
*   **grayscale:  
    **Paramètre existant sur certains projets. L’image est convertie en image en noir et blanc.

Paramètres existants, mais non utilisés:

*   **color:**  
    La couleur en hexadécimales a utilisé en background de l’image recadrée.
*   **x:**  
    Position horizontale pour le crop.
*   **y:**  
    Position verticale pour le crop.
*   **cropwidth:**  
    Largeur pour le crop.
*   **cropheight:**  
    Hauteur pour le crop.
*   **quality:**  
    Qualité de sauvegarde pour les images. Par défaut, 90.

### Redimensionner une image

Pour limiter la dimension d’une image pour optimise son affichage sur un site, il suffit d’utiliser le paramètre \`width\` et de lui donner la largeur maximale désirée:

    RewriteRule ^i/(\[A-Za-z0-9\_-\]+)/large/(\[A-Za-z0-9\_-\]+)\\.(\[A-Za-z0-9\_-\]+)?$ assets/resize/image.php?width=770&noupscale&image=/uploads/$1/$2.$3 \[QSA,L\]

### Recadrer une image

Certains cas demandent une image aux dimensions précises. Il vaut mieux alors avoir recours à \`cropratio\` en plus de \`width\`, \`height\` étant facultatif. Ces paramètres combinés générèront des images ayant toutes les mêmes dimensions:

    RewriteRule ^i/gallery/(\[A-Za-z0-9\_-\]+)\\.(\[A-Za-z0-9\_-\]+)?$ assets/resize/image.php?width=770&height=440&cropratio=770:440&noupscale&image=/uploads/galleriesimages/$1.$2 \[QSA,L\]

Activer l’outil de recadrage pour un champ image
------------------------------------------------

Dans la configuration du formulaire, ajouter pour le champ image en question:

    'image' => array(
        'width' => 300,
        'height' => 300,
        'crop' => true,
    ),

Le recadrage de l’image sera effectué lors de l’upload de l’image (voir \`Pixms::upload\`). C’est la méthode \`Pixms::default\_crop\` qui s’occupe de recadrer l’image. L’image originale est conservée en étant renommée avec le suffixe « \_orig » pour permettre de changer le cadrage de l’image après coup.