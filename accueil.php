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
        
        (SELECT GROUP_CONCAT(a.leprenom,' ',a.lenom SEPARATOR ' | ' )
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
        
	GROUP BY f.id
	ORDER BY f.lannee DESC, f.letitre ASC
    ;
");

// on compte le nombre de lignes pour affichage, ou pour indiquer qu'on a pas encore d'articles
$nb = mysqli_num_rows($recup_tous);
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
        
        <section>
            <h1>Bienvenue sur <span style="color:#CF8A00;">AllezCiné</span></h1>
            <?php
        // si $nb est vide (=>0)
        if (empty($nb)) {
            echo "<article><h2>Le cinéma manque d'oeuvres !</h2></article>";
        // sinon (on a au moins 1 article)    
        } else {
            while ($ligne = mysqli_fetch_assoc($recup_tous)) {
                ?><article><?php
                echo "<img width='105px' height='150px' src='".$ligne['monimage']."'/>" ;
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
                echo "<p>" . $les_genres . "</p>";

                // Pour l'affichage des ACTEURS
                $lesacteurs = ""; // création de la chaine vide
                // on va transformer les chaines de caractère des sections en tableaux indexés
                $actid = explode(', ',$ligne['acteur']);
                // affichage de la liste des sections en utilisant 1 seul foreach
                foreach($actid AS $clef => $valeur){
                    $lesacteurs.= $ligne['acteur'] ;
                }
                
                echo "<p><strong>Date de sortie</strong> : " . $ligne['lannee'] . " | <strong>Réalisé par</strong> " . $ligne['leprenom'] . " " . $ligne['lenom'] . "<br/>";
                

                              
                
                echo "<strong>Avec</strong> : " . $lesacteurs . "</p>";
                echo "<p>" . substr($ligne['ladesc'], 0, 150) . "... ";
                echo "<a href='?idarticle=" . $ligne['idfilm'] . "'>Lire la suite</a></p></article><hr/>";
            }
        }
        ?></section>
    </body>
</html>