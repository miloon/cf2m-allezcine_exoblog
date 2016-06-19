<?php
$recup_tous = mysqli_query($mysqli, "
SELECT  f.id AS idfilm, f.letitre, f.ladesc, f.lannee,
        r.lenom, r.leprenom,
        GROUP_CONCAT(g.id) AS idgenre, 
        GROUP_CONCAT(g.lintitule SEPARATOR '|||') AS lintitule, 
        
        (SELECT concat(i.lurl) 
			FROM allo_images i
			WHERE i.film_id = f.id LIMIT 1
        ) as monimage,
        
          (SELECT GROUP_CONCAT(a.leprenom,' ',a.lenom,'|', a.lurlimg separator '|||' )

			FROM allo_acteur a
            INNER JOIN allo_film_has_acteur fha
				ON a.id = fha.acteur_id
			WHERE f.id = fha.film_id
        ) as acteur

	FROM allo_film f
    
        LEFT JOIN allo_genre_has_film ghf
		ON f.id = ghf.film_id
	LEFT JOIN allo_genre g
		ON g.id = ghf.genre_id 
        
	INNER JOIN allo_realisateur r
		ON f.realisateur_id = r.id 
WHERE f.id = $idarticle
GROUP BY f.id
    ;  
        ");

// on compte le nombre de lignes pour affichage, ou pour indiquer qu'on a pas encore d'articles
$nb = mysqli_num_rows($recup_tous);

// si on a pas récupéré d'article
if(empty($nb)){
    // on crée le titre et le contenu de l'erreur
    $titre_erreur = "Erreur 404";
    $contenu_erreur = "<h3>Erreur 404</h3>";
    $contenu_erreur .= "<h4>L'article demandé n'existe pas</h4>";
    
    // on charge la page d'erreur
    require 'erreur.php';
    // on arrête le script ici (pour ne pas afficher le code html qui suit)
    exit();
}
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <link href='https://fonts.googleapis.com/css?family=Josefin+Sans:400,600,700' rel='stylesheet' type='text/css'>
        <title>Bienvenue sur AllezCiné</title>
    </head>
    <body>
        <div>
            <?php
            include 'menu.php';
            ?>
        </div>
        <section><?php
        // si $nb est vide (=>0)
        if (empty($nb)) {
            echo "<article><h2>Le cinéma manque d'oeuvres !</h2></article>";
        // sinon (on a au moins 1 article)    
        } else {
            while ($ligne = mysqli_fetch_assoc($recup_tous)) {
                ?><article><?php
                echo "<img width='105px' height='150px' src='".$ligne['monimage']."'/>" ;
                // Pour l'affichage des ACTEURS
                ?><div id="flexx"><?php
                $actid = explode('|||',$ligne['acteur']);
                foreach($actid AS $clef => $valeur){
                    $actid = explode('|',$valeur);
                    ?>
                    <figure>
                    <img width='100' height='133' src='<?=$actid[1]?>' alt='<?=$actid[0]?>' /><figcaption><?=$actid[0]?></figcaption>
                    </figure>
                    <?php
                }?></div><?php




                echo "<h2>" . $ligne['letitre'] . "</h2>";
                // Pour l'affichage des sections
                $les_genres = ""; // création de la chaine vide
                // on va transformer les chaines de caractère des sections en tableaux indexés
                $ids = explode(',',$ligne['idgenre']);
                $genre = explode('|||',$ligne['lintitule']);
                
                // affichage de la liste des sections en utilisant 1 seul foreach
                foreach($ids AS $clef => $valeur){
                    $les_genres.= "<a title='$genre[$clef]' href='?idgenre=$valeur'>$genre[$clef]</a> ";
                }
                echo "<h3>" . $les_genres . "</h3>";
                
                echo "<p><strong>Date de sortie</strong> : " . $ligne['lannee'] . " | <strong>Réalisé par</strong> " . $ligne['leprenom'] . " " . $ligne['lenom'] . "<br/>";
                
                echo "<p>" . nl2br($ligne['ladesc']);

            }
        }
        ?></article></section>
    </body>
</html>