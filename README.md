# cf2m-allezcine_exoblog
blog en procedural avec db
Recommandations générales

    Utiliser un contrôleur frontal (index.php)
    Utiliser un fichier de routage pour gérer les url
    Créer un fichier de config
    Utiliser mysqli procédural pour les requêtes
    Gestion des erreurs au choix

Page d'accueil

    Titre : bienvenue sur allezciné
    Inclusion d'un menu avec Accueil - tous les genres venant de la table 'genre' - Administration (voir détail menu.php)
    Affichage du résumé des films par 'lannee' DESC puis 'letitre' ASC
    Par film:

    Titre
    - image du film (si présente, ! plusieurs images possibles, ne prendre que la première), redimmension : 150 px / 150 px
    - réalisateur (nom - prenom)
    - date de sortie
    - Acteurs principaux
    - genres (clicables, les films s'affichent même si ils n'ont pas de genre)
    - description de 150 caractères (suivi d'un lire la suite) 
                      

Page des genres

    Titre : bienvenue sur allezciné - rubrique 'lintitule'
    Inclusion d'un menu avec Accueil - tous les genres venant de la table 'genre' - Administration (voir détail menu.php)
    Affichage du résumé des films par 'lannee' DESC puis 'letitre' ASC
    Par film:

    Titre
    - image du film (si présente, ! plusieurs images possibles, ne prendre que la première), redimmension : 150 px / 150 px
    - réalisateur (nom - prenom)
    - date de sortie
    - Acteurs principaux
    - description de 150 caractères (suivi d'un lire la suite) 
                      

Page détail

    Titre : bienvenue sur allezciné - Film 'letitre'
    Inclusion d'un menu avec Accueil - tous les genres venant de la table 'genre' - Administration (voir détail menu.php)
    Par film:

    Titre
    - images du film (si présente, ! plusieurs images possibles, toutes les afficher), redimmension : 150 px / 150 px
    - réalisateur (nom - prenom - photo 100px/100px)
    - date de sortie
    - Acteurs principaux
    - genres (clicables, les films s'affichent même si ils n'ont pas de genre)
    - description complète avec des retours à la ligne automatiques
                      

Page administration

    Titre : bienvenue sur allezciné - Nouveau Film
    Inclusion d'un menu avec Accueil - tous les genres venant de la table 'genre' - Administration (voir détail menu.php)
    Insertion d'un film:

    Titre
    - url de(s) l'images du film (3 champs 'lurl' au total + 'lalt' correspondant) Non obligatoire
    - Liste des réalisateurs (nom - prenom), on ne peut en choisir qu'un - Obligatoire
    - date de sortie (format yyyy)
    - Liste des acteurs principaux (liste ou checkbox multichoix) Non obligatoire
    - genres (liste ou checkbox multichoix) Non obligatoire
    - description complète
                      

menu.php

    Accueil (./)
    tous les genres venant de la table 'genre' clicables
    Administration (?admin)

