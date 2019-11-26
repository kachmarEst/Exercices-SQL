                /*Création de la base de données et contraintes d’intégrité*/
-- Q1
    CREATE TABLE DEPT(
        deptno number(3),
        dname varchar2(40),
        loc varchar2(40),
        constraint dept_no_pk PRIMARY KEY (deptno),
        constraint dept_dname_ck check(dname in ('ACCOUNTING', 'RESEARCH', 'SALES','OPERATIONS'))
    );
--Q2
    INSERT INTO DEPT VALUES(10,'ACCOUNTING','NEW-YORK');
    INSERT INTO DEPT VALUES(20,'RESEARCH','DALLAS');
    INSERT INTO DEPT VALUES(30,'SALES','CHICAGO');
    INSERT INTO DEPT VALUES(40,'OPERATIONS','BOSTON');
--Q3
    CREATE TABLE EMP AS SELECT * FROM SCOTT.EMP;
--Q4
    INSERT INTO EMP VALUES(7369,'Bidon',NULL,NULL,NULL,NULL,NULL,NULL);
    --cette insertion fonctionne , c'est normal car il manque d'ajouter les contraintes d'integrité nécessaires (CLE PRIMAIRE)
--Q5
    ROLLBACK; /* OU */ DELETE FROM EMP WHERE EMPNO = 7369 AND ENAME = 'Bidon';
--Q6
    ALTER TABLE EMP 
    ADD (CONSTRAINT emp_empno_pk PRIMARY KEY (empno),
        CONSTRAINT emp_deptno_fk FOREIGN KEY (deptno) REFERENCES DEPT(deptno) 
        );
--Q7
    INSERT INTO EMP VALUES(7369, 'WILSON', 'MANAGER', 7839, '17/11/91', 3500.00, 600.00, 10) ;  
    INSERT INTO EMP VALUES(7657, 'WILSON','MANAGER', 7839, '17/11/91', 3500.00, 600.00, 50) ;  
    INSERT INTO EMP VALUES(7657, 'WILSON', 'MANAGER', 7000,'17/11/91', 3500.00, 600.00, 10) ;  
    INSERT INTO EMP VALUES (7657, 'WILSON', 'MANAGER', 7839, '17/11/91', 3500.00,600.00, 10) ; 
    -- la premiére insertion ne fonctionne pas parceque la valeur 7369 du empno existe déja dans la table EMP.  (clé primaire)
    -- la deuxiéme insertion ne fonctionne pas parceque la valeur 50 n'existe pas dans la table DEPT. (clé étrangères) 
    -- la troisiéme insertion  fonctionne  normalement.  
    -- la quatriéme inseretion ne fonctionne pas parceque la valeur 7657 est déja insérée dans la table. (clé primaire) 
--Q8 
COMMIT;


              /* Mise à jour de la base de données */   

--Q1
    UPDATE DEPT 
    SET loc = 'PITTSBURGH'
    WHERE deptno = 30;
--Q2
    UPDATE EMP
    SET SAL = SAL + (SAL * 0.1)
    WHERE nvl(COMM,0) >=  (SAL*0.5);
--Q3
    UPDATE EMP
    SET COMM= AVG(nvl(COMM,0)
    WHERE HIREDATE< to_date('01/01/82','dd/mm/rr') AND COMM IS NULL;
--Q4
    ROLLBACK;
--Q5
    DELETE FROM DEPT
    WHERE deptno = 20;
    -- cette instruction ne fonctionne pas a cause du contrainte du FOREIGN KEY (clé parent).


        /* Interrogation de la base de données */

--Q1
    SELECT ename,sal,comm,sal+comm
    FROM emp
    WHERE JOB = 'SALESMAN';
--Q2
    SELECT ename,AVG(comm/sal) "ratio"
    FROM emp
    GROUP BY ename
    ORDER BY ratio desc;
--Q3
    SELECT ename,
    FROM emp
    WHERE comm < sal*0.25;
--Q4
    SELECT count(*)
    FROM emp
    WHERE deptno = 10;
--Q5
    SELECT count(*)
    FROM emp
    WHERE comm IS NOT NULL;
--Q6
    SELECT count(distinct JOB)
    FROM emp;
--Q7
    SELECT AVG(SAL)
    FROM EMP
    GROUP BY JOB;
--Q8
    SELECT SUM(e.SAL)
    FROM emp e ,dept d
    WHERE d.deptno = e.deptno AND dname= 'SALES';
--Q9
    SELECT e.ename,d.dname
    FROM emp e, dept d
    WHERE e.deptno = d.deptno;
--Q10
    SELECT ename,job,sal
    FROM emp
    WHERE sal = (SELECT Max(sal)
                 FROM emp);
--Q11
    SELECT ename
    FROM emp
    WHERE sal > (SELECT sal
                 FROM EMP
                 WHERE ename='JONES');
--Q12
    SELECT ename
    FROM emp
    WHERE job = (select job
                 FROM emp
                 where ename='JONES');
    
--Q13
    SELECT ENAME
    FROM emp
    WHERE mgr= (SELECT mgr
               FROM emp
               WHERE ename='CLARK');
--Q14
    SELECT ename,job
    from emp
    where mgr = (SELECT mgr
                 from emp
                 where ename='TURNER') AND JOB = (select JOB
                                                  from emp
                                                  where ename='TURNER');
--Q15
    SELECT ename
    from emp
    where HIREDATE < ALL(SELECT HIREDATE 
                         from emp
                         where deptno = 10);
--Q16
    SELECT  'EMP : ' || worker.ename || ' MGR:' || mger.mgr
    from emp worker , emp mger
    where worker.mgr = mger.empno;
--Q17
    SELECT ename
    from emp mger, emp worker
    where worker.mgr = mger.empno and worker.depno <> mger.depno;
