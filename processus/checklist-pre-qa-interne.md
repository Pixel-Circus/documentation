# Checklist avant d'envoyer en QA interne #

- [ ] Les Headings (H1,H2,H3...), tailles des paragraphes et listes de base doivent être basés sur ce qui est dans la page des styles dans le design, et si il n'y en a pas de fourni, se baser sur le design du template de base (titre et texte simple)
- [ ] Le design doit être le plus proche possible de *Pixel Perfect* que possible (mais respecter le règlement des espaces en multiples de 8). [PerfectPixel](https://chrome.google.com/webstore/detail/perfectpixel-by-welldonec/dkaagdgjmgdmbnecmcefdhjekcoceebi?hl=en) peut être utile.
- [ ] Les espacements entre sections doivent tous être en multiples de 8. Si possible, utiliser des variables.
- [ ] Les éléments, surtouts les éléments réutilisés de multiples fois, doivent être confinés à leur propre module. (PHP chargé via un get_template_part, SCSS et JS importés via le fichier root de ce type. Les 3 fichiers (PHP,SCSS et JS) doivent tous être dans le meme sous-dossier sous components)
- [ ] La grande majorité des textes/images doit être modifiable via l'administration. (Via Typerocket)
- [ ] Si un test a été fait, ou quelques champs sont maintenant inutilisés dus à un changement d'approche, ces champs doivent être retirés.
- [ ] Les fontes doivent avoir un fallback commun, comme Times New Roman pour les fontes Serif, et Arial/Helvetica pour les Sans-Serif.
- [ ] Tout élément qui peut être cliqué doit avoir `cursor: pointer` appliqué en CSS
- [ ] Les contenus du client doivent être placés (si disponibles)
- [ ] Lorsque utilisées, les couleurs principales du site (primaire, secondaire, tons de gris) doivent être référées via variables SASS.
- [ ] Lorsque on modifie un module de Bootstrap, voir pour modifier le module premièrement via des variables prédéfinies de Bootstrap.
- [ ] Bien que on nous fournit les maquettes Mobile et Desktop, le site doit être navigable et ne pas avoir de point où il est clairement brisé a toutes les tailles.
- [ ] Le favicon doit avoir été changé pour quelque chose de représentatif au client.
- [ ] Les popups doivent pouvoir être fermés via un clic sur le background
- [ ] Les comptes internes doivent être créés (Intégrateur/Programmeur (si nécessaire)/Chargé de Projet et Éric) Mettre des passwords défini au hazard pour les comptes qui ne sont pas le sien.
- [ ] Les images doivent toutes avoir un ALT

## Animation ##
- [ ] Voir pour les détails de l'intégration tel que vu par le designer.