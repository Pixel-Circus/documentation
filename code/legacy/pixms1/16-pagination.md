# Faire une pagination

Cet article a pour but d'expliquer les modifications à apporter à la pagination de CodeIgniter pour qu'elle fonctionne avec une fonctionnalité de pages Pixms. La documentation de CodeIgniter est donc un bon endroit pour commencer à faire une pagination et comprendre la configuration: [https://www.codeigniter.com/userguide3/libraries/pagination.html](https://www.codeigniter.com/userguide3/libraries/pagination.html)

Créer les liens pour la pagination
----------------------------------

Copier ce code dans la méthode du controller et prendre soin d'adapter le model et le base_url pour qu'il corresponde au controller utilisé:

    $this->load->library('pagination');
    $config = array();
    $config['base_url'] = url(**'events'**, 'index');
    $config['total_rows'] = Pixms::model(**'events'**)->nb_results(' status = 1 AND date_publish < NOW()');
    $config['uri_segment'] = $this->uri->total_segments();
    $this->pagination->initialize($config);
    Pixms::set_data('pagination', $this->pagination->create_links());

Dans la view, il ne reste qu'à ajouter cette ligne pour afficher le HTML de la pagination:

    <?php echo $pagination; ?>

Récupérer les résultats pour l'affichage de la page actuelle
------------------------------------------------------------

    $offset = ($this->pagination->cur_page - 1) * $this->pagination->per_page;
    $limit = ' LIMIT ' . $offset . ',' . ($this->pagination->per_page);
    Pixms::set_data('items', Pixms::model('events')->find(' status = 1 AND date_publish < NOW()'.$limit));