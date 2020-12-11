# Checklist avant d'envoyer en QA interne #

- [ ] Les espacements entre sections devraient tous être en multiples de 8. Si possible, utiliser des variables.
- [ ] Les fontes devraient avoir un fallback commun, comme Times New Roman pour les fontes Serif, et Arial/Helvetica pour les Sans-Serif.
- [ ] Tout élément qui peut être cliqué devrait avoir `cursor: pointer` appliqué en CSS
- [ ] Les contenus du client devraient être placés (si disponibles)
- [ ] Lorsque utilisées, les couleurs principales du site (primaire, secondaire, tons de gris) devraient être référées via variables SASS.
- [ ] Lorsque on modifie un module de Bootstrap, voir pour modifier le module premièrement via des variables prédéfinies de Bootstrap.
- [ ] Bien que on nous fournit les maquettes Mobile et Desktop, le site devrait être navigable et ne pas avoir de point où il est clairement brisé a toutes les tailles.
- [ ] Le favicon devrait avoir été changé pour quelque chose de représentatif au client.
- [ ] Les popups devraient pouvoir être fermés via un clic sur le background
