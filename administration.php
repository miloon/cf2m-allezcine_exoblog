<?php
// lancement de la session
session_start();

// on prend le fichier de config
require_once "config.php";
// on se connecte à la db
require_once "db.php";

// on a cliqué sur "vous connecter"
if (!empty($_POST['connect'])) {
    // récupération des entrées du formulaire
    $lelogin = htmlspecialchars(strip_tags(trim($_POST['lelogin'])), ENT_QUOTES);
    $lepass = htmlspecialchars(strip_tags(trim($_POST['lepass'])), ENT_QUOTES);

    // vérification de login et password
    if($lelogin==LOGIN && $lepass == PASS){
        // création des variables de session
        $_SESSION['clef']=session_id();
        $_SESSION['lelogin'] = LOGIN;
    }
}
// si on est connecté
if (isset($_SESSION['clef']) && $_SESSION['clef'] == session_id()) {
$form = false;
$affiche_form = true;
$success = false ;


// GESTION DU FORMULAIRE D'ADMINISTRATION
if(empty($_POST['modif'])){
// création d'une variable pour afficher le formulaire
$affiche_form = true;

$recup_real = mysqli_query($mysqli, "SELECT * FROM allo_realisateur ORDER BY lenom ASC;");
$recup_acteur = mysqli_query($mysqli, "SELECT * FROM allo_acteur ORDER BY lenom ASC;");
$recup_genres = mysqli_query($mysqli, "SELECT * FROM allo_genre ORDER BY lintitule ASC;");

}else{

    // création d'une variable pour cacher le formulaire
    $affiche_form = false;
    $success = true;

    $letitre = htmlspecialchars(strip_tags(trim($_POST['letitre'])),ENT_QUOTES);
    $letexte = htmlspecialchars(strip_tags(trim($_POST['letexte'])),ENT_QUOTES);
    // vérif pour le réalisateur
    if(ctype_digit($_POST['realisateur'])){
        $idrealisateur = $_POST['realisateur'];
    }else{
            $idrealisateur = 1;
        }
    // vérif pour les acteurs
    if(ctype_digit($_POST['acteur'])){
        $idacteur = $_POST['acteur'];
    }else{
            $idacteur = 1;
        }
    // vérif pour les genres
    if(ctype_digit($_POST['genre'])){
        $idgenre = $_POST['genre'];
    }else{
            $idgenre = 1;
        }
    // mise en variable de la date
    $ladate = ($_POST['annee']);
    // REQUETES D'INSERTION
    mysqli_query($mysqli, "INSERT INTO `allo_film`(`letitre`, `ladesc`, `lannee`, `realisateur_id`) VALUES ('$letitre','$letexte',$ladate,$idrealisateur);");
    $id_dernier_article = mysqli_insert_id($mysqli);
    // REQUETES D'INSERSTION POUR LES IMAGES
    // variable requete_img, est false si on ne trouve pas d'images
    $requete_img = false;
    // préparation de la requête
    $sql4 = "INSERT INTO allo_images (lurl, lalt, film_id) VALUES ";
    // récupération et traitement des variables POST pour les images
    foreach($_POST['imgurl'] as $clef => $valeur){
        // si cette ligne d'url n'est pas vide
        if(!empty($valeur)){
            // la requête sera effectuée
            $requete_img = true;
            $url = $valeur;
            $lalt = $_POST['imgalt'] ;
            if(empty($lalt[$clef])){ $lalt[$clef] = "non défini"; }
            $sql4 .= " ('$url','$lalt[$clef]',$id_dernier_article) ,";
        }
    }
    // si on a qq chose à insérer
    if($requete_img){
        // on coupe la dernière virgule de la requête
        $sql4 = substr($sql4,0,-1);
        // on effectue la requête
        mysqli_query($mysqli,$sql4) or die('images'.mysqli_error($mysqli));
    }
    // REQUETES D'INSERTION POUR genre_has_film
    if (isset($_POST['genre'])) {
        
        $sql = "INSERT INTO `allo_genre_has_film`(`genre_id`, `film_id`) VALUES ";
        foreach($_POST['genre'] AS $valeur){
        $sql.= "($valeur,$id_dernier_article),";
    }
    $sql = substr($sql, 0,-1);
    mysqli_query($mysqli,$sql)or die('genre'.mysqli_error($mysqli));
    }
    // REQUETES D'INSERTION POUR film_has_acteur
    if (isset($_POST['acteur'])) {

        $sql1 = "INSERT INTO `allo_film_has_acteur`(`film_id`, `acteur_id`) VALUES ";
        foreach($_POST['acteur'] AS $valeur){
        $sql1.= "($id_dernier_article,$valeur),";
    }
    $sql1 = substr($sql1, 0,-1);
    mysqli_query($mysqli,$sql1)or die('acteur'.mysqli_error($mysqli));
    }
}

// FIN INSERTION DU FORMULAIRE DE MODIFICATION

} else {
    $success = false ;
    $form = true;
    $affiche_form = false;
}




?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="style.css" />
    <link href='https://fonts.googleapis.com/css?family=Josefin+Sans:400,600,700' rel='stylesheet' type='text/css'>
    <title>Créer un nouvel article</title>
</head>
<body>
            <?php
            include 'menu.php';
            ?>
<section>
            <h1>Insérer un nouveau film dans AllezCiné</h1>

    <?php
    // pas connecté on affiche le formulaire
    if ($form) {
        ?>
        <form action="" name="" method="POST">
            <input type="text" name="lelogin" placeholder="Votre login" required/><br/>
            <input type="password" name="lepass" placeholder="Votre PWD" required/><br/>
            <input type="submit" name="connect" value="Vous connecter"/><br/>

        </form>
        <?php
    }


    if($affiche_form) {
    ?>
        <h2><a href="?deco">... déconnexion</a></h2>
            <form name="formulaire" method="POST" action="">
                <div class="container">
            <div><h3>Le titre du film</h3>
            <input type="text" name="letitre" size="33" placeholder="Titre du film"/></div>
            <div><h3>Réalisateur</h3>
            <select name="realisateur">
            <option value="">-----</option>
            <?php
            while($ligne = mysqli_fetch_assoc($recup_real)){
                echo '<option value="'.$ligne['id'].'">'.$ligne['leprenom'].' '.$ligne['lenom'].'</option>';
            }?></select></div>
            <div><h3>Date du film</h3>
            <input required type="number" name="annee" max="<?=date("Y")?>" min="1900" placeholder="YYYY"/></div>
                    </div>
                    <div class="container">
            <div><h3>Acteurs</h3>
            <div class="choice"><?php
            while($ligne = mysqli_fetch_assoc($recup_acteur)){
                echo '<input type="checkbox" name="acteur[]" value="'.$ligne['id'].'"><label>'.$ligne['leprenom'].' '.$ligne['lenom'].'</label> <br/> ';
            }?></div></div>
            <div><h3>Genres du film</h3>
                <div class="choice"><?php
            while($ligne = mysqli_fetch_assoc($recup_genres)){
                echo'<input type="checkbox" name="genre[]" value="'.$ligne['id'].'"/>'.$ligne['lintitule'].'<br/>';
            }?></div></div>
            <div><h3>L'image du film</h3>
            <input type="text" name="imgurl[]" size="33" placeholder="Insérez l'URL du film"/><br/>
            <input type="text" name="imgalt[]" size="33" placeholder="Qu'est-ce que l'image représente ?"/><br/>
            <input type="text" name="imgurl[]" size="33" placeholder="Insérez l'URL du film"/><br/>
            <input type="text" name="imgalt[]" size="33" placeholder="Qu'est-ce que l'image représente ?"/><br/>
            <input type="text" name="imgurl[]" size="33" placeholder="Insérez l'URL du film"/><br/>
            <input type="text" name="imgalt[]" size="33" placeholder="Qu'est-ce que l'image représente ?"/><br/></div>
            <div><h3>La description du film</h3>
            <textarea cols="50" rows="10" name="letexte" required placeholder="Description du film"></textarea><br>
            <br/><input name="modif" type="submit" value="Insérez le film"/></div>
                </div>
        </form>
        <?php
    }

    if($success){
        ?>
        <p>Film inséré. Good job <?=$_SESSION['lelogin']?>!</p>
        <?php
    }
    ?>
        </section>
</body>
</html>
