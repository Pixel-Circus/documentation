# Tests Lighthouse
On teste nos sites via lighthouse pour la performance.

Installer avec `npm install lighthouse -g`

Ensuite, on peut tester des sites via `lighthouse [urldusite] --view` Le view est nécessaire pour que sa affiche un HTML a la fin, et non pas juste sauvegarder un .json

## Batch testing
On peut tester les trucs en batch via le plugin lighthouse-batch. `npm install lighthouse-batch -g`

Avec sa on peut créer un fichier .txt et mettre tous les urls (une par ligne) Ensuite on peut simplement rouler la ligne de commande `lighthouse-batch -f sites.txt -p --preset=desktop` pour le rapport desktop et `lighthouse-batch -f sites.txt` pour le rapport mobile.

Ensuite convertir le fichier summary.json en CSV et on peut le copier coller dans le Google Sheets. À noter, toutes les notes sont de 0 a 1 et non pas de 0 a 100 comme dans le rapport en ligne.