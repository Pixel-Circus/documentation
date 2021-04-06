# Le module Pages

La plupart des projets Pixms 1 ont un module de Pages standard. Ce module permet la création de pages de contenu simple dynamiquement.

Champs standards
----------------

Voici la liste des champs qui existent dans le module Pages standard. Selon les projets, il peut y avoir d'autres champs qui s'y sont ajoutés pour combler des besoins spécifiques:

*   **status:**  
    Seules les pages ayant un **status** à 1 sont considérées comme active et public, c'est-à-dire qu'elles peuvent être affichées sur le frontend.
*   **is_home:**  
    Une seule page peut avoir **is_home** à 1, c'est la page d'accueil. La page accessible lorsqu'il n'y a pas d'URI pour le routing.
*   **pages_id:**  
    Le ID de la page parente. Permet une hiérarchisation des pages.
*   **name_fr, name_en:**  
    Utilisé pour le titre de la page sur le frontend.
*   **description_fr, description_en:**  
    Utilisé pour le contenu de la page sur le frontend.
*   **uri_fr, uri_en:**  
    Utilisé pour l'URI rendant la page accessible sur le frontend. Autogénéré à partir de name si aucune information n'est fournie.
*   **route:**  
    Communément appelé fonctionnalité. Permet de diriger la page vers un autre controller que celui par défaut et d'ainsi pouvoir ajouter des éléments de programmation comme un formulaire ou une liste de nouvelles. Documentation ci-dessous.
*   **image:**  
    Nom du fichier à utiliser pour l'image. Le fichier est automatiquement sauvegardé dans « uploads/pages ».
*   **picture_size:**  
    Format d'affichage de l'image sur le frontend. Il y en a généralement 3: thumb, small et large.
*   **image_alt_fr, image_alt_en:**  
    L'attribut `alt` pour l'image.
*   **legend_fr, legend_en:**  
    Texte à inscrire sous l'image.
*   **meta_title_fr, meta_title_en:**  
    Disponible pour les fins du SEO seulement.
*   **meta_description_fr, meta_description_en:**  
    Disponible pour les fins du SEO seulement.
*   **order_item:**  
    Sert à ordonner les pages dans un ordre précis.
*   **template:**  
    Ce champ présent dans certains projets permet de changer le content view responsable de l'affichage de la page par le controller Pages. Ne fait qu'affecter la view qui s'occupe de l'affichage de la page.

### Sections

Pour permettre la création de pages plus complexes tout en restreignant la possibilité que le client brise la grille établie. Les sections ont été créées avec un nombre limité d'options:

*   **status:**  
    Seules les sections ayant un status à 1 sont considérées comme active et public, c'est-à-dire qu'elles peuvent être affichées sur le frontend.
*   **pages_id:**  
    ID de la page à laquelle la section est rattachée.
*   **name_fr, name_en:**  
    Utilisé pour le titre de la section sur le frontend.
*   **description_fr, description_en:**  
    Utilisé pour le contenu de la section sur le frontend.
*   **image:**  
    Nom du fichier à utiliser pour l'image. Le fichier est automatiquement sauvegardé dans « uploads/pages ».
*   **picture_size:**  
    Format d'affichage de l'image sur le frontend. Il y en a généralement 3: thumb, small et large.
*   **image_alt_fr, image_alt_en:**  
    L'attribut `alt` pour l'image.
*   **legend_fr, legend_en:**  
    Texte à inscrire sous l'image.
*   **order_item:**  
    Sert à ordonner les sections dans un ordre précis.

Fonctionnement de l'affichage frontend
--------------------------------------

C'est grâce à la valeur de l'URI de la page dans la langue active que Pixms est en mesure de déterminer quelle page utilisée pour l'affichage. L'URI de la page active est sauvegardé dans la constante `PAGE_URI` qui est généralement utilisée pour récupérer la page en base de données.

### Controller Pages

Si l'URL actuelle concorde avec une page créée dans l'admin, c'est par défaut le controller `Pages` et sa méthode `details` qui s'occuperont de l'affichage de la page.

#### Pixms::manage_page();

La ligne suivante, la première ligne de Pages::details, s'occupe de récupérer la page active en base de données de par son URI:

    $page = Pixms::manage_page($uri);

`$page`, dans l'exemple ci-dessus, est un objet contenant tous les champs standards énumérés plus haut en tant que propriétés.

En plus de retourner l'objet Pages, `manage_pages();` définit plusieurs variables qui seront utilisées dans les views notamment pour le titre, le breadcrumb et le SEO:

*   $title
*   $breadcrumb
*   $canonical_link
*   $title_tag
*   $meta_description

Ces variables sont expliqués dans [l'article sur l'intégration](09-integration).

#### View page-templates/default

La content view responsable de l'affichage de la page est par défaut: application/views/frontend/contents/page-templates/default.php. Cette view demande la définition de plusieurs variables:

*   **$item:**  
    Un objet provenant de la DB ayant la plupart des champs énumérés ci-dessous. L'objet doit ressembler à une page dans sa structure.
*   **$item_type:**  
    Généralement le nom de la table dans la DB d'où vient l'objet.
*   **$sections:**  
    Un array d'objets reprenant la structure de champs des sections.
*   **\$sections_type:**  
    Généralement le nom de la table dans laquelle les sections ont été récupérées. Par défaut, c'est `[$item_type]sections`

Ce sont ces variables qui rendent la réutilisation du template pour plusieurs types d'objets. En plus des pages, certains sites l'utilisent pour l'affichage de nouvelles et d'événements.

### `route`, ou fonctionnalité

Grâce au champ `route`, il est possible de définir un autre controller pour l'affichage d'une page et ainsi d'y ajouter du code particulier, généralement un formulaire ou une liste. Voir [le routing](05-routing) pour une description du fonctionnement.

Pour que le nouveau controller puisse bénéficier de la définition automatique de certaines variables pour l'affichage, il est recommandé d'insérer cette ligne dans la méthode du controller de la fonctionnalité:

    $page = Pixms::manage_page(PAGE_URI);

Comme déjà mentionné ci-dessus, cette fonction permet de générer notamment le titre, le breadcrumb et les variables SEO.

### La page d'accueil

La page ayant le champ `is_home = 1` devient la page d'accueil du site, c'est-à-dire la page affichée lorsque l'URI de la page est vide: http://domain.com ou http://domain.com/en