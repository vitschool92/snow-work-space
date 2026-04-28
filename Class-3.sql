


select * from hr.tcs.employees ;

select top 5 * from hr.tcs.employees ;

select   first_name , salary from hr.tcs.employees ;


select   first_name , salary from hr.tcs.employees 
  order by salary  asc ;

  select   first_name , salary from hr.tcs.employees 
  order by salary  desc ;


    select   first_name , salary from hr.tcs.employees 
  order by first_name  asc ;

 --0-9    9-0
  --a-z    z-a 
  
    select   first_name , salary from hr.tcs.employees 
  order by first_name  desc ;

     select   first_name , salary from hr.tcs.employees 
     where first_name = 'Michael';

     select   first_name , salary from hr.tcs.employees 
     where first_name like 'S%';


      select   first_name , salary from hr.tcs.employees 
     where first_name like '%a';


     
      select   *  from hr.tcs.employees 
      where job_id = 5 or 
            job_id = 4 or 
            job_id = 10  ;


      
      select   *  from hr.tcs.employees 
      where job_id in (5,4,10,2) ;


        select   *  from hr.tcs.employees 
      where job_id in (5,4,10,2) and 
             salary >= 15000 ;


  
        select   *  from hr.tcs.employees 
      where salary != 17000 
            and salary != 24000 ;


       select   *  from hr.tcs.employees 
      where salary not in (17000 ,24000) ;


    select   distinct (department_id)  from hr.tcs.employees ;


    select department_id  from hr.tcs.employees
       group by department_id ;


    select department_id,count(*) as cnt from hr.tcs.employees
       group by department_id 
       order by department_id ;


    select department_id,max(salary)  from hr.tcs.employees
       group by department_id 
       order by department_id ;


      select department_id,min(salary)  from hr.tcs.employees
       group by department_id 
       order by department_id ;


           select department_id,avg(salary)  from hr.tcs.employees
       group by department_id  ;



       select first_name, count(*) as cnt from employees
       group by first_name 
       order by 2 desc ;

       
       select first_name, count(*) as cnt from employees
       group by first_name 
       having count(*)  >=2 
   
          select first_name, count(*) as cnt from employees
          where department_id in (2,3,45,6)
          group by first_name 
          having count(*)  >=2 


               select first_name, count(*) as cnt from employees
          where department_id in (2,3,45,6)
        --  group by first_name 
          having count(*)  >=2 
      
     select first_name, count(*) as cnt from employees
          where department_id in (2,3,45,6)
          group by first_name 
       ---   having count(*)  >=2 


       
select department_id , count(department_id) from employees 
  where department_id in (10,3,7)
       group by department_id 
       having count(department_id)  > 1 
       

    
    

      select count(*)  from employees ;

        select count(1)  from employees ;


    select count(manager_id)  from employees ;


    select upper(first_name) from employees;

       select lower(first_name) from employees;


       select  concat(first_name, ' ',last_name) as fullname from employees;


-----TASK --practice 10 string /number and date functions 

-- STRING FUNCTIONS
-- 1. LENGTH
SELECT first_name, LENGTH(first_name) AS name_length FROM employees;

-- 2. SUBSTRING
SELECT first_name, SUBSTRING(first_name, 1, 3) AS short_name FROM employees;

-- 3. REPLACE
SELECT first_name, REPLACE(first_name, 'a', '@') AS replaced_name FROM employees;

-- 4. TRIM
SELECT TRIM('   Hello World   ') AS trimmed_text;

-- 5. REVERSE
SELECT first_name, REVERSE(first_name) AS reversed_name FROM employees;

-- NUMBER FUNCTIONS
-- 6. ROUND
SELECT salary, ROUND(salary / 3, 2) AS rounded_val FROM employees;

-- 7. CEIL
SELECT salary, CEIL(salary / 7) AS ceil_val FROM employees;

-- 8. FLOOR
SELECT salary, FLOOR(salary / 7) AS floor_val FROM employees;

-- 9. ABS
SELECT ABS(-500) AS absolute_val;

-- DATE FUNCTIONS
-- 10. CURRENT_DATE / DATEDIFF / DATEADD
SELECT hire_date,
       CURRENT_DATE() AS today,
       DATEDIFF('year', hire_date, CURRENT_DATE()) AS years_worked,
       DATEADD('month', 6, hire_date) AS six_months_after_hire
FROM employees;


-----10 DATE FUNCTIONS

-- 1. CURRENT_DATE
SELECT CURRENT_DATE() AS today;

-- 2. CURRENT_TIMESTAMP
SELECT CURRENT_TIMESTAMP() AS now;

-- 3. DATEADD
SELECT hire_date, DATEADD('month', 6, hire_date) AS plus_6_months FROM employees;

-- 4. DATEDIFF
SELECT hire_date, DATEDIFF('day', hire_date, CURRENT_DATE()) AS days_worked FROM employees;

-- 5. DATE_PART / EXTRACT
SELECT hire_date, DATE_PART('year', hire_date) AS hire_year FROM employees;

-- 6. YEAR
SELECT hire_date, YEAR(hire_date) AS hire_year FROM employees;

-- 7. MONTH
SELECT hire_date, MONTH(hire_date) AS hire_month FROM employees;

-- 8. DAY
SELECT hire_date, DAY(hire_date) AS hire_day FROM employees;

-- 9. LAST_DAY
SELECT hire_date, LAST_DAY(hire_date) AS end_of_month FROM employees;

-- 10. TO_DATE
SELECT TO_DATE('2025-04-28', 'YYYY-MM-DD') AS converted_date;
