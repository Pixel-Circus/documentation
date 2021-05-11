
## Génération de fichiers Excel

La librairie utilisée fréquemment est [PHPSpreadsheet](https://phpspreadsheet.readthedocs.io/en/latest/).

## Génération de PDF

Pour le remplissage d'un gabarit PDF existant, c'est [FPDI](https://www.setasign.com/products/fpdi/about/) qui est utilisé. Avec FPDI, on importe un fichier gabarit PDF et on utilise des fonctions pour insérer du contenu personnalisé par dessus le gabarit. 

Pour la création de fichiers PDF simples en PHP avec l'aide de CSS et HTML, il est possible d'utiliser [mPDF](https://mpdf.github.io/).

L'autre option est l'outil [Web2PDF](../outils/web2pdf) que nous avons développé qui permet de générer un PDF à partir d'une adresse URL. Cette méthode est l'équivalent de faire une impression PDF avec Chrome et permet donc toutes les mises en page possible d'un navigateur moderne.