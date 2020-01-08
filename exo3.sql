   /* Création des tables */ 

   CREATE TABLE PIECE(
    NOP NUMBER(10),
    DESIGNATION VARCHAR2(40),
    COULEUR VARCHAR2(40),
    POIDS NUMBER(10)
   );
    CREATE TABLE SERVICE(
    NOS NUMBER(10),
    INTITULE VARCHAR2(40),
    LOCALISATION VARCHAR2(40)
    );
    CREATE TABLE ORDRE(
    NOP NUMBER(10),
    NOS NUMBER(10),
    QUANTITE NUMBER(10)
   );
    CREATE TABLE NOMENCLATURE(
    NOPA NUMBER(10),
    NOPC VARCHAR2(40),
    QUANTITE NUMBER(10)
   );

      /* Contraintes d’intégrité */ 
    -- Q1
        INSERT INTO PIECE VALUES (1,'lorem','rouge',200);
        INSERT INTO PIECE VALUES (1,'lorem','jaune',200);
        INSERT INTO PIECE VALUES (1,'lorem','noire',200);
        INSERT INTO PIECE VALUES (1,'lorem','blanche',200);
    -- Q2
        INSERT INTO SERVICE VALUES (1,'it','casa');
        INSERT INTO SERVICE VALUES (1,'rh','kech');
        INSERT INTO SERVICE VALUES (1,'it','casa');
        INSERT INTO SERVICE VALUES (1,'it','chichaoua');
    -- Q3
            INSERT INTO ORDRE VALUES (2,2,'rouge',200);



