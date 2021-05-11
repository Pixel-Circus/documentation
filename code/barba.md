# [Barba](https://barba.js.org/)
On utilise Barba pour changer de page dynamiquement (sans un full reload)

La configuration a certaines options

## Transition
Permet de faire les transitions entre les pages. Une fonction pour leave, une fonction pour enter. Dans chacune des fonctions on retourne une animation qui cachera/affichera la page.

Il est préférable de faire ces fonctions d'animations via [GSAP](code/gsap)

## Views
Permet de run des fonctions en particulier a un certain point du processus d'entrée/sortie de page.

Par exemple on dispatch l'event px-ready sur afterEnter.

## Prevent
Est une fonction qui permet d'analyser le lien cliqué et si barba devrait être utilisé pour changer de page.

Par exemple, pour éviter que barba ait un problème avec les liens du /wp-admin/ et des pdfs.

## RequestError
Permet de gérer le bug si il y a un crash dans la transition barba.