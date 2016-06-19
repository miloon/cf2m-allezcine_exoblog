<?php

// fichiers utiles si on ne passe pas par index.php
require_once 'config.php';
require_once 'db.php';

// on récupère les rubriques
$recup = mysqli_query($mysqli, "SELECT * FROM allo_genre ORDER BY lintitule ASC;");
?>
<nav><ul><li><a href="./">Accueil</a></li>
    <?php
    while($result = mysqli_fetch_assoc($recup)){
        echo "<li><a href='?idgenre=".$result['id']."'>".$result['lintitule']."</a></li>";
    }
    ?>
    <li><a href="?admin=administration">Insérer un film</a></li>
</ul></nav>