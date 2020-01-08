
--Cours Samples
DECLARE
v_empno employees.employee_id%type;
v_ename employees.last_name%type;
CURSOR emp_cursor IS
Select employee_id,last_name
from employees;
BEGIN
OPEN emp_cursor;
LOOP
 Fetch emp_cursor INTO v_empno, v_ename;
 EXIT WHEN emp_cursor%ROWCOUNT > 10 OR emp_cursor%NOTFOUND.
 DBMS_OUTPUT.PUT_LINE(to_char(v_empno) || '  ' || v_ename);
 END LOOP;
 CLOSE emp_cursor;
END;
/



-- QUESTION 1
DECLARE
a number(2) := 1; 
b number(2) := 2;
c number(2);

BEGIN
DBMS_OUTPUT.PUT_LINE('a : ' || a || ', b : '||b );
c:=a;
a:=b;
b:=c;
DBMS_OUTPUT.PUT_LINE('a : ' || a || ', b : '||b );
END;
/

-- QUESTION 2

DECLARE
a number(20) := 10; 
BEGIN
DBMS_OUTPUT.PUT_LINE('a : ' || a  );

for i in 1..a LOOP
a:=a*i;
exit when i >= 9;
END LOOP;
DBMS_OUTPUT.PUT_LINE('factorielle de a : ' || a);

END;
/

-- QUESTION 3

DECLARE
v_depid departments.department_id%type;
BEGIN
SELECT MAX(department_id) INTO v_depid
FROM departments;

INSERT INTO departments(department_id, department_name)
VALUES((v_depid + 10),'AMINE');
END;
/

-- QUESTION 4 
DECLARE
v_depid departments.department_id%type;
BEGIN
SELECT MAX(department_id) INTO v_depid
FROM departments;

DBMS_OUTPUT.PUT_LINE(v_depid);
END;
/

-- QUESTION 5
DECLARE
v_depid departments.department_id%type;
v_depname departments.department_name%type;

BEGIN
select department_id,department_name  INTO v_depid,v_depname
from departments
where department_id = ( select max(department_id)
                        from departments);

DBMS_OUTPUT.PUT_LINE(to_char(v_depid) || v_depname);
END;
/
-- QUESTION 6
DECLARE
v_depid departments.department_id%type;
v_depname departments.department_name%type;

BEGIN
select department_id  INTO v_depid
from departments
where department_id = ( select max(department_id)
                        from departments);
DBMS_OUTPUT.PUT_LINE(to_char(v_depid));
update departments 
set location_id = 2500 
where department_id = v_depid;
END;
/
-- QUESTION 7
DECLARE
v_m employees.manager_id%type;
BEGIN
select manager_id INTO v_m
from employees
where last_name = '&lastname';
DBMS_OUTPUT.PUT_LINE(v_m);
END;
/
-- QUESTION 8
DECLARE
v_empno employees.employee_id%type;
v_ename employees.last_name%type;
CURSOR emp_cursor IS
Select employee_id,last_name
from employees
order by hire_date desc;
BEGIN
OPEN emp_cursor;
LOOP
 Fetch emp_cursor INTO v_empno, v_ename;
 EXIT WHEN emp_cursor%ROWCOUNT > 10 OR emp_cursor%NOTFOUND;
 DBMS_OUTPUT.PUT_LINE(to_char(v_empno) || '  ' || v_ename);
 END LOOP;
 CLOSE emp_cursor;
END;
/
--QUESTION 9
DECLARE
v_c number(10);

BEGIN
select count(*) into v_c
from employees
where department_id = 30;
DBMS_OUTPUT.PUT_LINE(v_c);
END;
/
--QUESTION 10
DECLARE
v_salary employees.salary%type;
v_name employees.last_name%type;
BEGIN
select last_name,salary into v_name,v_salary
from employees
where employee_id=100;
IF v_salary < 3000 THEN
UPDATE employees
SET salary = salary +  500
where employee_id=100;
DBMS_OUTPUT.PUT_LINE(v_name || ' ''s salary updated ');
ELSE 
DBMS_OUTPUT.PUT_LINE(v_name || ' earns  ' || to_char(v_salary));

END IF;
END;
/
--QUESTION 11
-- a)
select noms,horaire
from salle
where lower(titre) ='les misérables';
-- b)
select acteur 
from film
where acteur = All (select acteur
                    from film);
-- c)


















+
=