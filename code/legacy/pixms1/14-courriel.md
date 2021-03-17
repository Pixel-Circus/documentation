# Envoyer un courriel

Pixms::send_email();
---------------------

Cette méthode fait appel à `send_email();`. Ce qu'elle fait de plus est de s'occuper de charger le helper si la fonction n'existe pas.

send_email();
--------------

Pixms a complètement réécrit la fonction native de CodeIgniter `send_email();` pour qu'elle utilise la librairie CodeIgniter `Email` au lieu de `mail();`.

### Paramètres

*   **$subject:**  
    Le sujet du courriel.
*   **\$msg:**  
    Le contenu HTML du courriel. `$this->load->view('view', array(), true);` est souvent utilisé pour générer le contenu d'un courriel.
*   **$to:**  
    Un ou plusieurs courriels à qui envoyer le email.
*   **$from:**  
    Facultatif. Par défaut, l'adresse courriel contenue dans la config « contact_email ».
*   **$from_name:**  
    Facultatif. Par défaut, la chaîne de traduction « site_title ».
*   **$attach:**  
    Chemin absolu vers le fichier à mettre en pièce jointe.
*   **$template:**  
    View dans « application/views/frontend » à utiliser pour le gabarit du courriel. Par défaut, « email_template ».
*   **$debug:**  
    S'il faut afficher le résultat de l'envoi plutôt que de retourner un boolean. Utile pour comprendre pourquoi un email n'est pas envoyé. Par défaut, `false`.

$this->email
------------

Dans de rares cas, la librairie native de CodeIgniter est utilisée pour envoyer des courriels depuis un controller. Voir [la documentation de CodeIgniter.](https://www.codeigniter.com/userguide3/libraries/email.html)

Configuration
-------------

Le fichier de configuration pour changer, entre autres, le SMTP pour les envois depuis un environnement de développement se trouve dans « application/config/email.php ». Voir [la documentation de CodeIgniter](https://www.codeigniter.com/userguide3/libraries/email.html) pour des explications sur les options de configuration.

Template HTML
-------------

Le template HTML utilisé par défaut pour construire les courriels est « application/views/frontend/email_template.php »:

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->config->item('lang'); ?>">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title><?php echo $this->lang->line('site_title') ?></title>
        </head>
        <body>
            <?php echo nl2br($msg); ?>
        </body>
    </html>

**À noter:** la fonction `nl2br` est employée pour transformer les retours de ligne en tags `br`. C'est utile pour l'envoi de courriels composés principalement de texte, mais il peut être souhaitable de l'enlever dans certains projets où les messages envoyés contiennent du HTML plus complexe.