# Les prérequis

Pixms 1 a été bâti avec le framework CodeIgniter 2 et l'ORM RedbeanPHP 3.4. **Ces 2 librairies ont récemment été mises à jour : la ver sion 3 de CodeIgniter est maintenant utilisée et la version 5.5 pour RedbeanPHP.**

Il faut se référer aux documentations respectives pour trouver l'information concernant ces dépendences. La documentation de Pixms prend en compte une connaissance préalable de [CodeIgniter](https://www.codeigniter.com/userguide3/) et [RedbeanPHP](https://www.redbeanphp.com/index.php?p=/welcome).

En ce qui concerne l'intégration, [SASS](https://sass-lang.com/documentation/file.SASS_REFERENCE.html) est utilisé comme préprocesseur CSS.

CodeIgniter
-----------

Il est fortement recommandé de lire au minimum la documentation dans **CodeIgniter Overview** et **General Topics** pour avoir une idée générale du framework.

### Function helpers utilisés fréquemment

*   [https://www.codeigniter.com/userguide3/helpers/language_helper.html](https://www.codeigniter.com/userguide3/helpers/language_helper.html)
*   [https://www.codeigniter.com/userguide3/helpers/text_helper.html](https://www.codeigniter.com/userguide3/helpers/text_helper.html)
*   [https://www.codeigniter.com/userguide3/helpers/url_helper.html](https://www.codeigniter.com/userguide3/helpers/url_helper.html)

### Librairies utilisées fréquemment

En ordre d'utilité à connaître, en gras ce sont les indispensables

*   **[https://www.codeigniter.com/userguide3/libraries/loader.html](https://www.codeigniter.com/userguide3/libraries/loader.html)**
*   **[https://www.codeigniter.com/userguide3/libraries/language.html](https://www.codeigniter.com/userguide3/libraries/language.html)**
*   **[https://www.codeigniter.com/userguide3/libraries/uri.html](https://www.codeigniter.com/userguide3/libraries/uri.html)**
*   **[https://www.codeigniter.com/userguide3/libraries/config.html](https://www.codeigniter.com/userguide3/libraries/config.html)**
*   **[https://www.codeigniter.com/userguide3/libraries/form_validation.html](https://www.codeigniter.com/userguide3/libraries/form_validation.html)**
*   [https://www.codeigniter.com/userguide3/libraries/pagination.html](https://www.codeigniter.com/userguide3/libraries/pagination.html)
*   [https://www.codeigniter.com/userguide3/libraries/sessions.html](https://www.codeigniter.com/userguide3/libraries/sessions.html)
*   [https://www.codeigniter.com/userguide3/libraries/email.html](https://www.codeigniter.com/userguide3/libraries/email.html)
*   [https://www.codeigniter.com/userguide3/libraries/input.html](https://www.codeigniter.com/userguide3/libraries/input.html)
*   [https://www.codeigniter.com/userguide3/libraries/file_uploading.html](https://www.codeigniter.com/userguide3/libraries/file_uploading.html)
*   [https://www.codeigniter.com/userguide3/libraries/output.html](https://www.codeigniter.com/userguide3/libraries/output.html)

RedbeanPHP
----------

La librairie peut être utilisée telle que décrite dans la [documentation officielle](https://www.redbeanphp.com/index.php?p=/welcome), mais dans Pixms, elle est utilisée un peu différemment en intégrant des models. Voir l'article relatif à la base de données dans la documentation de Pixms.


Composer
--------

La version 1.5 de Pixms utilise maintenant un [package Composer](https://github.com/Pixel-Circus/Pixms1) pour isoler le core de Pixms. Ce package est installé par composer dans le dossier "pixms" du projet à l'aide d'un [installateur personnalisé](https://github.com/Pixel-Circus/pixms1-installer). L'installateur s'occupe aussi de transférer tous les assets dans le dossier "pixms" du `PUBLIC_DIR`.

Toute modification effectuée aux fichiers dans le dossier "pixms" doivent être rapportées dans le Git du package composer sans quoi les modifications seront perdues lors d'une mise à jour via Composer.

Si un projet nécessite une modification au core qui ne doit pas se retrouver sur les autres projets, il faut extend la classe dans le projet actuel pour y intégrer la modification.