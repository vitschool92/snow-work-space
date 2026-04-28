

SELECT * FROM EMPLOYEES ;

SELECT MAX(SALARY) FROM EMPLOYEES ;



SELECT * FROM EMPLOYEES 
WHERE SALARY = 24000.00 ;

SELECT * FROM EMPLOYEES 
   WHERE SALARY IN (SELECT MAX(SALARY) FROM EMPLOYEES )  ;



SELECT * FROM EMPLOYEES 
   WHERE SALARY IN ( SELECT MAX(SALARY) FROM EMPLOYEES 
                      WHERE SALARY NOT IN  (SELECT MAX(SALARY) FROM EMPLOYEES ) ) ;



SELECT DEPARTMENT_ID , MAX(SALARY) FROM  EMPLOYEES 
     GROUP BY DEPARTMENT_ID ;

SELECT * FROM EMPLOYEES WHERE SALARY IN (
   SELECT  MAX(SALARY) FROM  EMPLOYEES 
     GROUP BY DEPARTMENT_ID 
)




CREATE TABLE dependents (
	dependent_id INT IDENTITY(1,1) PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT NOT NULL
);


INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (29,'Alec','Partners','Child',146);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (30,'Sandra','Taylor','Child',176);

INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (3000,'Sandra','Taylor','Child',1760);



SELECT * FROM EMPLOYEES ;

SELECT * FROM DEPENDENTS;


SELECT * FROM EMPLOYEES 
     WHERE employee_id IN  (SELECT employee_id FROM DEPENDENTS) ;


SELECT * FROM EMPLOYEES 
     WHERE employee_id IN  (100,200,300,4000) ;

SELECT * FROM EMPLOYEES 
     WHERE employee_id NOT IN  (SELECT employee_id FROM DEPENDENTS) ;


--CORELATED SUBQUERY 

SELECT * FROM EMPLOYEES ;


SELECT * FROM EMPLOYEES WHERE MANAGER_ID  IS NULL ;


SELECT * FROM EMPLOYEES WHERE PHONE_NUMBER  IS NULL ;

SELECT * FROM EMPLOYEES WHERE PHONE_NUMBER  IS NOT NULL ;

SELECT EMPLOYEE_ID,
    FIRST_NAME,
    COALESCE(PHONE_NUMBER,'NA') FROM EMPLOYEES ;


SELECT EMPLOYEE_ID,
    FIRST_NAME,
    COALESCE(PHONE_NUMBER,'8987666-77666') FROM EMPLOYEES ;
    
SELECT EMPLOYEE_ID,
    FIRST_NAME,
    COALESCE(MANAGER_ID,0) FROM EMPLOYEES ;


SELECT EMPLOYEE_ID ,
       FIRST_NAME ,
       SALARY ,
       CASE 
           WHEN SALARY > 15000  THEN 'SR ENGINEER'  ELSE ' JR ENGINEER'
       END AS DESIGNATION 
       FROM EMPLOYEES ;


SELECT EMPLOYEE_ID,
       FIRST_NAME,
       SALARY,
       IFF(SALARY > 15000, 'SR ENGINEER', 'JR ENGINEER') AS DESIGNATION
FROM EMPLOYEES;


SELECT * FROM EMPLOYEES ;



CREATE TABLE TEST (NUM  INT) ;



INSERT INTO TEST VALUES (-1),
                        (-2),(1),(3),(5),(6),(7),(9),(0),(-20),(-12) ;


SELECT * FROM TEST ;

SELECT NUM , IFF(NUM > 0 ,'Postive' ,'Negative') FROM TEST ;


SELECT NUM , 
       case 
         when NUM > 0 then 'Postive' else 'Negative'
       end
    FROM TEST ;


SELECT    
      CASE 
          WHEN NUM > 0 THEN NUM 
      END ,
    CASE 
          WHEN NUM < 0 THEN NUM 
      END 

FROM TEST ;



SELECT    
      CASE 
          WHEN NUM > 0 THEN NUM 
      END AS POSTIVE,
    CASE 
          WHEN NUM < 0 THEN NUM 
      END AS NEGATIVE

FROM TEST ;


SELECT    
    SUM(
       CASE 
          WHEN NUM > 0 THEN NUM 
       END
    )   AS POSTIVE,
    SUM(CASE 
          WHEN NUM < 0 THEN NUM 
      END )AS NEGATIVE

FROM TEST 