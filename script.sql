-- EXERCICE 1 
    -- Q1
        SELECT *
        FROM airplane
        WHERE capacity > 350
    -- Q2
        SELECT numap,nameap
        FROM airplane
        WHERE localistion ='Nice'
    -- Q3
        SELECT nump,dep_t
        FROM flight
    -- Q4
        SELECT *
        FROM pilot
    -- Q5
        SELECT namep
        FROM pilot
        WHERE salary > 15000 AND address = 'Paris'
    -- Q6
        SELECT numap,nameap
        FROM airplane
        WHERE localistion='Nice' OR capacity < 350
    -- Q7
        SELECT * 
        FROM flight
        WHERE dep_t='Nice' and arr_t='Paris' and arr_h - dep_h  = 18
    -- Q8
        SELECT *
        FROM pilot 
        WHERE nump <>  ALL (SELECT nump 
                            FROM flight)
    -- Q9
        SELECT  numf,dep_t
        FROM flight
        WHERE  nump in (100,204)       
-- EXERCICE 2
    -- 1
        SELECT personne
        FROM emprunt
        WHERE livre="Recueil Examens BD"
    -- 2
        SELECT personne
        FROM emprunt
        WHERE personne not in all (select personne
                                    from retard)
    -- 3
        SELECT e.personne
        FROM emprunt e , emprunt r
        WHERE e.livre  
    -- 4
