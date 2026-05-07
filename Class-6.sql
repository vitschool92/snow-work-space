CREATE OR REPLACE TABLE HR.TCS.tab1 (id INT);
CREATE OR REPLACE TABLE HR.TCS.tab2 (id INT);

INSERT INTO HR.TCS.tab1 (id) VALUES (1),(2),(3),(5),(6),(7);
INSERT INTO HR.TCS.tab2 (id) VALUES (1),(2),(4),(8),(9);


select * from tab1 ;

SELECT A.* , B.* 
  FROM  TAB1 A  INNER JOIN  
        TAB2  B 
       ON A.ID = B.ID  ;
   

SELECT A.* , B.* 
  FROM  TAB1 A  LEFT JOIN  
        TAB2  B 
       ON A.ID = B.ID  ;


SELECT A.* , B.* 
  FROM  TAB1 A  RIGHT JOIN  
        TAB2  B 
       ON A.ID = B.ID  ;

SELECT A.* , B.* 
  FROM  TAB1 A  FULL JOIN  
        TAB2  B 
       ON A.ID = B.ID  ;

SELECT A.* , B.* 
  FROM  TAB1 A  CROSS JOIN  
        TAB2  B ;


        
    CREATE TABLE departments (
	department_id INT IDENTITY(1,1) PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL,
	location_id INT DEFAULT NULL
);


INSERT INTO departments(department_id,department_name,location_id) VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id) VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (101,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (111,'Accounting',1700);



SELECT * FROM EMPLOYEES  ;


SELECT EMPLOYEE_ID,FIRST_NAME,SALARY,DEPARTMENT_ID FROM EMPLOYEES  ;


SELECT * FROM DEPARTMENTS ;


SELECT DEPARTMENT_ID,DEPARTMENT_NAME FROM DEPARTMENTS ;


SELECT X.EMPLOYEE_ID,
       X.FIRST_NAME,
       X.SALARY,
       X.DEPARTMENT_ID ,
       Y.DEPARTMENT_NAME 
       FROM EMPLOYEES  X   INNER JOIN DEPARTMENTS Y
       ON X.DEPARTMENT_ID = Y.DEPARTMENT_ID ;



SELECT X.EMPLOYEE_ID,
       X.FIRST_NAME,
       X.SALARY,
       X.DEPARTMENT_ID ,
       Y.DEPARTMENT_NAME 
       FROM EMPLOYEES  X   LEFT JOIN DEPARTMENTS Y
       ON X.DEPARTMENT_ID = Y.DEPARTMENT_ID ;


SELECT X.EMPLOYEE_ID,
       X.FIRST_NAME,
       X.SALARY,
       X.DEPARTMENT_ID ,
       Y.DEPARTMENT_NAME 
       FROM EMPLOYEES  X   RIGHT JOIN DEPARTMENTS Y
       ON X.DEPARTMENT_ID = Y.DEPARTMENT_ID ;


SELECT X.EMPLOYEE_ID,
       X.FIRST_NAME,
       X.SALARY,
       X.DEPARTMENT_ID ,
       Y.DEPARTMENT_NAME 
       FROM EMPLOYEES  X   FULL JOIN DEPARTMENTS Y
       ON X.DEPARTMENT_ID = Y.DEPARTMENT_ID ;


    SELECT X.EMPLOYEE_ID,
       X.FIRST_NAME,
       X.MANAGER_ID
       FROM EMPLOYEES X ;


SELECT X.EMPLOYEE_ID,
       X.FIRST_NAME,
       X.MANAGER_ID,
       Y.FIRST_NAME AS MANAGER_NAME
       FROM EMPLOYEES X LEFT JOIN EMPLOYEES Y
       ON X.MANAGER_ID = Y.EMPLOYEE_ID;


CREATE OR REPLACE TABLE HR.TCS.TEAMS (
    TEAM_NAME VARCHAR(50) NOT NULL
);

INSERT INTO HR.TCS.TEAMS (TEAM_NAME) VALUES
('RCB'),
('SRH'),
('GT'),
('CSK'),
('MI');

SELECT * FROM TEAMS ;

--OUTPUT
--RCB VS  SRH 
--RCB VS GT 
--RCB  VS CSK 
--RCB VS MI 
--SRH VS GT 

SELECT A.TEAM_NAME || ' VS ' || B.TEAM_NAME AS MATCH
       FROM TEAMS A JOIN TEAMS B
       ON A.TEAM_NAME < B.TEAM_NAME;

SELECT A.TEAM_NAME || ' VS ' || B.TEAM_NAME AS MATCH
       FROM TEAMS A CROSS JOIN TEAMS B
       WHERE A.TEAM_NAME < B.TEAM_NAME;



SELECT X.EMPLOYEE_ID,
       X.FIRST_NAME,
       X.SALARY,
       X.DEPARTMENT_ID ,
       Y.DEPARTMENT_NAME ,
       Z.FIRST_NAME AS DEPENDENT_NAME ,
       Z.RELATIONSHIP
       FROM EMPLOYEES  X   INNER JOIN DEPARTMENTS Y
       ON X.DEPARTMENT_ID = Y.DEPARTMENT_ID 
       INNER JOIN DEPENDENTS Z 
       ON X.EMPLOYEE_ID = Z.EMPLOYEE_ID ;




       