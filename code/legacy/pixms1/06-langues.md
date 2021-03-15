# Gestion des langues

<section class="post_content">
                <p>Pixms 1 peut être multilingue. La plupart des sites sont en français et en anglais.</p>
<h2>Configuration des langues</h2>
<p>Les langues sont définies dans config/languages.php:</p>
<pre>$config['english'] = array(
&nbsp;&nbsp;&nbsp; 'iso'&nbsp; =&gt; 'en',
&nbsp;&nbsp;&nbsp; 'name' =&gt; 'English',
);</pre>
<p>La valeur de `iso` est utilisée dans les URLs (en tant que dossier: http://domaine.com/fr ou http://domaine.com/en) tandis que `name` est utilisée comme texte dans les liens de changement de langue. La clé utilisée (dans l’exemple ci-dessous `english`) est le nom du dossier contenant les chaînes de traductions du projet qui se retrouve dans «&nbsp;application/language/<em>english</em>«&nbsp;.</p>
<h3>Récupérer la langue active</h3>
<p>La valeur de la langue active est sauvegardée dans la constante `LANG` qui équivaut à l’`iso` et donc, à la valeur présente dans l’URL.</p>
<h3>Ajouter une langue</h3>
<p>En exemple ici, l’ajout de l’espagnol:</p>
<ol>
<li><a href="https://github.com/bcit-ci/CodeIgniter/wiki/Language-Translation">Télécharger </a>et mettre les fichiers de langue en espagnol dans «&nbsp;system/languages/<em>spanish</em>«&nbsp;</li>
<li>Copier le contenu des fichiers de langue d’une des langues déjà dans le projet. Par exemple, copier le dossier «&nbsp;application/languages/french&nbsp;» vers «&nbsp;application/languages/spanish&nbsp;» et tout traduire</li>
<li>Ajouter la langue dans config/languages.php pour l’activer:</li>
</ol>
<pre>$config['spanish'] = array(
&nbsp;&nbsp;&nbsp; 'iso'&nbsp; =&gt; 'es',
&nbsp;&nbsp;&nbsp; 'name' =&gt; 'Español',
);</pre>
<p>http://domaine.com/es devrait maintenant affiché le site en espagnol.</p>
<h2>Traduction de chaînes de caractères</h2>
<p>Par défaut, tous les projets Pixms 1 chargent le fichier de langue «&nbsp;site&nbsp;» (application/language/french/site_lang.php). Pour connaître tous les fichiers de langue préchargés, voir le fichier config/autoload.php, à la ligne débutant par `<strong>$autoload[‘language’]`</strong>. Voici un exemple du contenu de site_lang.php:</p>
<pre>$lang['site_home'] = "Accueil";
$lang['site_tagline'] = "Un site Pixms";</pre>
<p><em>NB: un préfixe reprenant le nom du fichier est utilisé dans les clés afin d’éviter des conflits entre les différents fichiers de langue.</em></p>
<p>Pour utiliser les chaînes définies dans les fichiers de langue, la fonction `lang` est utilisée, un raccourci de `$this-&gt;lang-&gt;line()`:</p>
<pre>echo lang('site_home'); //Outputs Accueil</pre>
<h3>Ajouter une chaîne de caractères traduite</h3>
<p>Si la chaîne est globale à toutes les pages du site, on peut simplement ajouter un nouvel index au array dans le fichier site_lang.php.</p>
<p>Par contre, afin d’éviter que le fichier `site_lang.php` devienne trop chargé, si la chaîne est reliée à une section du site seulement, il vaut mieux l’ajouter à un autre fichier.</p>
<p>Généralement, en plus de `site_lang.php`, il y a un fichier de langue créé pour chaque controller. Ce fichier de langue est chargé automatiquement lorsque le controller est utilisé. Par exemple, le controller `Home` (application/controllers/frontend/home.php) chargera le fichier de langue `home_lang.php` dans le dossier «&nbsp;application/language/french&nbsp;».</p>
<h3>Créer un nouveau fichier de langue</h3>
<p>Si par exemple, on veut créer un fichier `events`:</p>
<ol>
<li>Créer le fichier `events_lang.php` dans chaque dossier de langue présent dans «&nbsp;application/languages&nbsp;».</li>
<li>Ajouter les chaînes de traduction. Exemple: `$lang[‘events_title’] = ‘Événements’`</li>
<li>Charger le fichier `events`
<ol>
<li>Pour l’utiliser avec un controller nommé `Events`, rien à faire. Tout est chargé automatiquement.</li>
<li>Pour l’utiliser dans un autre controller, ajouter la ligne `$this-&gt;lang-&gt;load(‘events’);`, soit au constructeur, soit dans la méthode qui l’utilise.</li>
<li>Pour l’utiliser sur tout le site (toujours le charger): ajouter ‘events’ dans le fichier «&nbsp;application/config/autoload.php&nbsp;» à la ligne `$autoload[‘language’]`.</li>
</ol>
</li>
<li>`lang(‘events_title’)` devrait maintenant afficher ‘Événements’.</li>
</ol>
<h2>Traduction d’URLs</h2>
<p>Par défaut, CodeIgniter ne permet pas d’avoir des URLs différentes selon les langues. Pour palier à ceci, il y a dans Pixms un fichier de langue particulier: `uri_lang.php`.</p>
<h3>Fonctionnement de uri_lang</h3>
<p>Ce fichier fonctionne un peu comme les autres fichiers de langue à l’exception que la clé utilisée pour la traduction reflète les segments d’URI représentant un controller:</p>
<pre>//application/languages/french/frontend/uri_lang.php
$lang['home/index'] = '';
$lang['events/details'] = 'evenements/fiche';
$lang['events/index']&nbsp; = 'evenements';</pre>
<p>Les lignes définies ci-dessus se réflèteront comme suit:</p>
<ol>
<li>http://domain.com/fr chargera le controller `Home` et invoquera sa méthode `index`.</li>
<li>http://domain.com/fr/evenements chargera le controller `Events` et invoquera sa méthode `index`</li>
<li>http://domain.com/fr/evenements/fiche/mon-evenement chargera le controller `Events et invoquera sa méthode `details` avec «&nbsp;mon-evenement&nbsp;» comme premier argument.</li>
</ol>
<p><em>NB: Il est important de mettre les traductions les plus précises en premier dans le fichier. Mettre la ligne `events/index` avant `events/details` ferait en sorte que `events/index` est toujours chargé à la place de `events/details`. Ceci est dû au fait que les URLs sont testées seulement sur le fait de commencer par la valeur traduite (valeur de droite).<br>
</em></p>
<h3>Affichage d’URLs traduites</h3>
<p>La fonction `url` a été ajoutée dans Pixms pour permettre la traduction automatique des URLs. Cette fonction accepte jusqu’à 5 paramètres:</p>
<ol>
<li>`$controller`: Le nom du controller en minuscules tel qu’utilisé dans le nom du fichier. Seul paramètre obligatoire.</li>
<li>`$function`: Le nom de la méthode du controller. Par défaut, la valeur est vide.</li>
<li>`$params`: Un array de paramètres à ajouter en segments à l’URL. Par exemple, `array(‘mon-evenement’, 8)` devient ‘mon-evenement/8’.</li>
<li>`$context`: Par défaut, équivant au contexte actuel.</li>
<li>`$lang`: Par défaut, équivaut à la langue actuelle.</li>
</ol>
<p>Exemple de lien dans une view:</p>
<pre>&lt;a href="&lt;?php echo url('events', 'index'); ?&gt;"&gt;&lt;?php echo lang('site_events'); ?&gt;&lt;/a&gt;</pre>
<p><strong>La traduction de l’URL se fait du plus précis au moins précis.</strong> Par exemple, `url(‘events’, ‘details’, array(‘mon-evenement’, 8))` tentera d’abord de trouver une traduction pour ‘events/details/mon-evenement/8’, puis si cette clé n’existe pas dans uri_lang.php, ce sera au tour de ‘events/details/mon-evenement’, puis ‘events/details’. La valeur retournée ajoute automatiquement les segments non traduits à la fin de l’URL traduite ce qui résulterait en ‘fr/evenements/fiche/mon-evenement/8’. Si aucune traduction n’est trouvée, l’URL originale est retournée: ‘fr/events/details/mon-evenement/8’.</p>
<h3>URLs du module Pages</h3>
<p>Il est possible que certaines URLs ne se trouvent pas dans uri_lang.php.</p>
<p>Le module Pages,&nbsp;qui vient avec la plupart des projets Pixms 1 à l’exception des tout premiers, est directement lié à la traduction des URLs. La valeur du champ `uri_fr` ou `uri_en` est automatiquement ajoutée au routing du site et peut influencer le controller utilisé pour afficher la page ainsi que la traduction faite via `url`. Se référer à la documentation du module pour plus d’infos.</p>
<h2>Liens de changement de langue</h2>
<p>L’affichage du lien de changement de langue sur un site est facile à mettre en place. La fonction `switch_anchor` s’occupe de tout. Pour modifier le comportement de cette fonction, il y a une configuration par défaut présente dans ‘application/config/languages.php’:</p>
<pre>$config['language_config'] = array(
&nbsp;&nbsp;&nbsp; 'hide_if_active' =&gt; true, //Ne pas afficher la langue active
&nbsp;&nbsp;&nbsp; 'class'&nbsp;&nbsp; =&gt; 'switch-lang', //Classe à ajouter au lien de changement de langue
&nbsp;&nbsp;&nbsp; 'active_class'&nbsp;&nbsp; =&gt; 'active', //Classe pour la langue active, si 'hide_if_active' =&gt; false
);</pre>
<p>Pour modifier la valeur texte affichée dans le lien, il faut modifier les valeurs de `name` pour les langues présentes dans le fichier «&nbsp;application/config/languages.php&nbsp;».</p>
<p>Exemple d’utilisation dans la view (parts/header.php dans la plupart des projets):</p>
<pre>&lt;div class="HEADER"&gt;
    &lt;!-- Logo, menu... --&gt;
    &lt;?php echo switch_anchor(); ?&gt;
&lt;/div&gt;</pre>
<h3>Ajustement manuel des URLs pour le changement de langue</h3>
<p>Ceci est utile dans les quelques cas où la fonction `url` n’est pas en mesure de bien traduire l’URL automatiquement. Utiliser ce code dans la méthode du controller pour laquelle la traduction de l’URL n’est pas au point:</p>
<pre>$languages = $this-&gt;config-&gt;item('languages');
foreach ($languages as $key =&gt; $config) {
&nbsp;&nbsp;&nbsp; if (isset($config['iso'])) {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $languages[$key]['url'] = url('events', 'index', 'special', $config['iso']);
&nbsp;&nbsp;&nbsp; }
}
$this-&gt;config-&gt;set_item('languages', $languages);</pre>
<p>&nbsp;</p>
              </section>