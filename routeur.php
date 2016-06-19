<?php
// si GET est vide, on va à l'accueil
if(empty($_GET)){ // pas de variables get => ACCUEIL

    require_once 'accueil.php';

}elseif(isset($_GET['deco'])) {
    require_once "deco.php";
}elseif(isset($_GET['idarticle'])&&  ctype_digit($_GET['idarticle'])){
    
    // converstion en variable locale en int
    $idarticle = (int) $_GET['idarticle'];
    // on importe la partie DETAIL
    require_once 'detail.php';

}elseif(isset($_GET['idgenre'])&&  is_numeric($_GET['idgenre'])){
    
    // converstion en variable locale en int
    $idgenre = (int) $_GET['idgenre'];
    
    // on importe la partie RUBRIQUE
    require_once 'genre.php';
    
}elseif(isset($_GET['admin'])){
    // on vérifie avec un switch la valeur de 'admin'
    switch ($_GET['admin']){
        case "administration":
            require_once 'administration.php';
            break;
        
        default:
            require_once 'accueil.php';
    }
    
    // rien n'est juste, on retourne à l'accueil
}else{
    require_once 'accueil.php';
}