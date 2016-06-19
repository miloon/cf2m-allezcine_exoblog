/*

Requête sélectionnant des éléments dans toutes les tables de la base 'exe_films'

Cette méthode va poser des problèmes de concaténation car les tables jointes peuvent 
avoir un nombre d'entrées fluctuentes

*/

/*
Phase 1, récupération de 3 champs nécessaires de 'film'
*/

SELECT f.id AS idfilm, f.letitre, f.ladesc
	FROM film f;

/*
Phase 2, récupération d'une des images (2 présentes pour le premier film, 0 pour le deuxième)
*/

SELECT  f.id AS idfilm, f.letitre, f.ladesc,
		i.lurl, i.lalt
	FROM film f
    LEFT JOIN images i
		ON f.id = i.film_id
	GROUP BY f.id
    ;
    
/*
Phase 3, récupération du réalisateur
*/

SELECT  f.id AS idfilm, f.letitre, f.ladesc,
		i.lurl, i.lalt,
        r.lenom, r.leprenom
	FROM film f
    LEFT JOIN images i
		ON f.id = i.film_id
	INNER JOIN realisateur r
		ON f.realisateur_id = r.id
	GROUP BY f.id
    ;
    
/*
Phase 4, récupération des genres !!! problème dès qu'il y a plusieures group_concat sur des tables différentes
même non indiqué 'images' a 2 entrées et nécéssiterait un group_concat, ce qui pose un problème avec celui
de 'genre'
*/

SELECT  f.id AS idfilm, f.letitre, f.ladesc, /* sélection des champs de film*/
		i.lurl, i.lalt, /* sélection du champs image, pas de group_concat()
        car on souhaite en importer 1 maximum */
        r.lenom, r.leprenom, /* champs sélectionnés */
        GROUP_CONCAT(g.id) AS idgenre, 
        GROUP_CONCAT(g.lintitule SEPARATOR '|||') AS lintitule
        
	FROM film f /* table de base */
    
    LEFT JOIN genre_has_film ghf
		ON f.id = ghf.film_id
	LEFT JOIN genre g
		ON g.id = ghf.genre_id /* requête many to many pour récupérer les genres, on utilise
        LEFT JOIN pour prendre les films qui n'auraient pas de genre */
        
    LEFT JOIN images i
		ON f.id = i.film_id /* on joint une image si elle existe (grâce au left un film
        sans image s'affichera malgré tout  */
        
	INNER JOIN realisateur r
		ON f.realisateur_id = r.id
        
	GROUP BY f.id
    ;
    
    
    
/*
Phase 5, comme nous constatons des bugs lorsqu'il y a plusieures entrées à charger depuis des tables
différentes, nous allons isoler les requêtes grâce à des select imbriqués.

On garde comme jointure principale celle des genres (suppression du lien avec images)
*/

SELECT  f.id AS idfilm, f.letitre, f.ladesc, /* sélection des champs de film*/
        r.lenom, r.leprenom, /* sélection des champs 'réalisateur' */
        GROUP_CONCAT(g.id) AS idgenre, 
        GROUP_CONCAT(g.lintitule SEPARATOR '|||') AS lintitule
        
	FROM film f /* table de base */
    
    LEFT JOIN genre_has_film ghf
		ON f.id = ghf.film_id
	LEFT JOIN genre g
		ON g.id = ghf.genre_id /* requête many to many pour récupérer les genres, on utilise
        LEFT JOIN pour prendre les films qui n'auraient pas de genre */
        
	INNER JOIN realisateur r
		ON f.realisateur_id = r.id /* jointure réalisateur*/
        
	GROUP BY f.id
    ;
 
 
    /*
Phase 6, nous allons créer un select imbriqué sans GROUP_CONCAT mais un concat
pour image car on souhaite en récupérer 
1 maximum (ou aucune)
*/

SELECT  f.id AS idfilm, f.letitre, f.ladesc, /* sélection des champs de film*/
        r.lenom, r.leprenom, /* sélection des champs 'réalisateur' */
        GROUP_CONCAT(g.id) AS idgenre, 
        GROUP_CONCAT(g.lintitule SEPARATOR '|||') AS lintitule, /* Séléction des genres concaténés */
        /* requête imbriquée pour récupérer l'image liée au film si il y en a, sinon on en garde 1 seul*/
        (SELECT concat(i.lurl,'|||', i.lalt) FROM images i 
        WHERE i.film_id = f.id LIMIT 1
        ) as monimage
        
	FROM film f /* table de base */
    
    LEFT JOIN genre_has_film ghf
		ON f.id = ghf.film_id
	LEFT JOIN genre g
		ON g.id = ghf.genre_id /* requête many to many pour récupérer les genres, on utilise
        LEFT JOIN pour prendre les films qui n'auraient pas de genre */
        
	INNER JOIN realisateur r
		ON f.realisateur_id = r.id /* jointure réalisateur*/
        
	GROUP BY f.id
    ;
    
 /*
Phase 7, nous allons créer un select imbriqué avec GROUP_CONCAT pour récupérer les acteurs
*/

SELECT  f.id AS idfilm, f.letitre, f.ladesc, /* sélection des champs de film*/
        r.lenom, r.leprenom, /* sélection des champs 'réalisateur' */
        GROUP_CONCAT(g.id) AS idgenre, 
        GROUP_CONCAT(g.lintitule SEPARATOR '|||') AS lintitule, /* Séléction des genres concaténés */
        
        /* requête imbriquée pour récupérer l'image liée au film si il y en a, sinon on en garde 1 seul*/
        (SELECT concat(i.lurl,'|||', i.lalt) 
			FROM images i 
			WHERE i.film_id = f.id LIMIT 1
        ) as monimage,
        
        /* requête imbriquée pour récupérer les acteurs */
        (SELECT GROUP_CONCAT(a.id,'~~',a.lenom,' ',a.leprenom SEPARATOR '|||' )
			FROM acteur a
            INNER JOIN film_has_acteur fha
				ON a.id = fha.acteur_id
			WHERE f.id = fha.film_id
        ) as acteur
        
	FROM film f /* table de base */
    
    LEFT JOIN genre_has_film ghf
		ON f.id = ghf.film_id
	LEFT JOIN genre g
		ON g.id = ghf.genre_id /* requête many to many pour récupérer les genres, on utilise
        LEFT JOIN pour prendre les films qui n'auraient pas de genre */
        
	INNER JOIN realisateur r
		ON f.realisateur_id = r.id /* jointure réalisateur*/
        
	GROUP BY f.id
    ;
