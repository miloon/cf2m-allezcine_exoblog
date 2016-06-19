<?php

$mysqli = @mysqli_connect(DB_HOST, DB_LOGIN, DB_PWD, DB_NAME);

// on force l'encodage des tranferts en utf8 (@ en cas d'erreur de connexion)
@mysqli_set_charset($mysqli, DB_CHARSET);

// si une erreur est présente (true)
if(mysqli_connect_error($mysqli)){
    
    // création du titre de l'erreur
    $titre_erreur = "Problème de connexion à la DB";
            
    // création du contenu de l'erreur
    $contenu_erreur = "<h3>Code erreur : ".mysqli_connect_errno($mysqli);
    $contenu_erreur .= "</h3><h4>Description erreur : ".mysqli_connect_error($mysqli)."</h4>";
    
    // on importe notre page d'erreur
    include 'erreur.php';
}