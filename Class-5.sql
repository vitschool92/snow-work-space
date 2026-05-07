

use hr.tcs ;


SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME,SALARY FROM EMPLOYEES ;


SELECT FIRST_NAME,
       SALARY,
       ROW_NUMBER() OVER(ORDER BY SALARY DESC ) AS RNUM,
       RANK() OVER(ORDER BY SALARY DESC)  AS RNK ,
       DENSE_RANK() OVER(ORDER BY SALARY DESC ) AS DRANK ,
       LEAD(SALARY) OVER(ORDER BY SALARY DESC) AS NEXT_VAL ,
       LAG(SALARY) OVER(ORDER BY SALARY DESC) AS PREV_VAL
FROM EMPLOYEES ;


SELECT FIRST_NAME,
       SALARY,
       DENSE_RANK() OVER(ORDER BY SALARY  DESC)  AS RNK
       FROM EMPLOYEES ;

--CTE     C0MMON TABLE EXPRESSION  - IT WILL WORK AS LIKE TEMP TABLE /SESSION TABLE

WITH CTE_EMP   AS 
(SELECT FIRST_NAME,
       SALARY,
       DENSE_RANK() OVER(ORDER BY SALARY  DESC)  AS RNK
       FROM EMPLOYEES)
SELECT * FROM CTE_EMP
       WHERE RNK = 5 ;




WITH CTE_EMP   AS 
(SELECT FIRST_NAME,
       SALARY,
       DENSE_RANK() OVER(ORDER BY SALARY )  AS RNK
       FROM EMPLOYEES)
SELECT * FROM CTE_EMP
       WHERE RNK = 3 ;


WITH CTE_EMP   AS 
(SELECT *,
       DENSE_RANK() OVER(ORDER BY SALARY )  AS RNK
       FROM EMPLOYEES)
SELECT * FROM CTE_EMP
       WHERE RNK <= 5;


WITH CTE_EMPLOYEES AS 
(
   SELECT * ,
         ROW_NUMBER() OVER(ORDER BY FIRST_NAME) AS RNUMBER
         FROM EMPLOYEES     
) 
SELECT * FROM CTE_EMPLOYEES 
      WHERE RNUMBER = 3 ;




SELECT FIRST_NAME,
       SALARY,
       DENSE_RANK() OVER(ORDER BY SALARY )  AS RNK
       FROM EMPLOYEES
       QUALIFY RNK = 3 ;




WITH CTE_EMP   AS 
(SELECT FIRST_NAME,
        DEPARTMENT_ID,
       SALARY,
       DENSE_RANK() OVER(ORDER BY SALARY  DESC)  AS RNK
       FROM EMPLOYEES)
SELECT * FROM CTE_EMP
       WHERE RNK = 2 ;


----DEPAT WISE 2ND HIGHT SALARY


WITH CTE_EMP   AS 
(SELECT FIRST_NAME,
        DEPARTMENT_ID,
       SALARY,
       DENSE_RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY  DESC)  AS RNK
       FROM EMPLOYEES)
SELECT * FROM CTE_EMP
       WHERE RNK = 4 ;




select   'vamsi'
       union 
select  'vamsi'
      union 
select 'xyz' ;


select   'vamsi'
       union all
select  'vamsi'
      union all 
select 'xyz' ;


select first_name from employees 
     union 
select first_name from dependents ;

40+31 = 71 


select first_name from employees 
     union all 
select first_name from dependents ;


select first_name from employees 
     intersect 
select first_name from dependents ;


select first_name from employees 
     minus 
select first_name from dependents ;



select first_name from employees 
     union 
select first_name from dependents ;


select * from employees

select * from dependents ;




select first_name,salary from employees 
     union all 
select first_name,employee_id from dependents ;


select first_name,salary from employees 
     union all 
select first_name from dependents ;


CREATE OR REPLACE TABLE sales (
    month       VARCHAR(10),
    sales_amount NUMBER
);

INSERT INTO sales (month, sales_amount) VALUES
    ('jan', 50000),
    ('feb', 90000),
    ('march', 30000),
    ('april', 80000),
    ('may', 60000),
    ('june', 45000),
    ('july', 75000),
    ('aug', 55000),
    ('sep', 65000),
    ('oct', 40000),
    ('nov', 85000),
    ('dec', 70000);

