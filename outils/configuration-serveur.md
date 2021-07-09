# Voir sa configuration en cours

## Versions

**Apache/PHP/MySQL** : Cliquer sur 'Server Information' dans le cPanel.

## Plugins

Voir l'option **Select PHP Version** dans le cPanel. Cette page contient aussi une page des plugins qui sont chargés sur le serveur.

## RAM

Une bonne partie des informations de la RAM sont dans Resource Usage.

## Configuration cronjob pour WP-Cli

Il est possible qu'une ligne de commande qui fonctionne normalement dans le terminal cause des erreurs lorsqu'exécutée en cronjob.

L'erreur commune est : "Use of undefined constant STDOUT - assumed 'STDOUT'"

Pour bien configurer une cronjob, il est recommandé de bien configurer le fichier .bash_profile à la racine du compte serveur. S'il n'existe pas, il faut le créer:

```bash
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=/usr/local/bin:$PATH:$HOME/.local/bin:$HOME/bin

export PATH
```

Le point important du fichier est l'inclusion de `/usr/local/bin` au début du `PATH`. C'est ce dossier qui contient le version CLI de PHP qui permet l'exécution sans erreur de WP-Cli.

Ensuite dans la ligne de commande de la cronjob, il faut ajouter `source .bash_profile;`
