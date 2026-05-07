


CREATE DATABASE vitech_dev;


USE DATABASE vitech_dev;

CREATE SCHEMA  vitech_dev.ORDERS;

CREATE SCHEMA  vitech_dev.LOANS;


--s3://bucketsnowflakes3 
---s3://bucketsnowflakes3/Loan_payments_data.csv

CREATE TABLE   vitech_dev.LOANS.LOAN_PAYMENT  (
   Loan_ID  STRING,
   loan_status  STRING,
   Principal  STRING,
   terms  STRING,
   effective_date  STRING,
   due_date  STRING,
   paid_off_time  STRING,
   past_due_days  STRING,
   age  STRING,
   education  STRING,
   Gender  STRING);


   SELECT * FROM vitech_dev.LOANS.LOAN_PAYMENT ;


   COPY INTO  vitech_dev.LOANS.LOAN_PAYMENT 
   FROM 's3://bucketsnowflakes3/Loan_payments_data.csv'
   FILE_FORMAT = (TYPE=CSV SKIP_HEADER=1)


 SELECT LOAN_ID ,
      PRINCIPAL,
      TERMS ,
      (PRINCIPAL * TERMS)  AS TOTAL_AMOUNT
      FROM vitech_dev.LOANS.LOAN_PAYMENT ;



 SELECT LOAN_ID ,
      PRINCIPAL,
      TERMS ,
      (PRINCIPAL * TERMS)  AS TOTAL_AMOUNT,
      COALESCE(PAST_DUE_DAYS,0)
      FROM vitech_dev.LOANS.LOAN_PAYMENT ; 


------------------------------------------------
--etl s3://bucketsnowflakes3 
--1
CREATE OR REPLACE STAGE vitech_dev.LOANS.LOAN_STAGE
  URL = 's3://bucketsnowflakes3/Loan_payments_data.csv';
--2 
 LIST @vitech_dev.LOANS.LOAN_STAGE;
---3
  CREATE OR REPLACE TABLE   vitech_dev.LOANS.LOAN_PAYMENT_V1  (
   Loan_ID  STRING,
   loan_status  STRING,
   Principal  STRING,
   terms  STRING) ;

--4 TRANSFORM

COPY INTO vitech_dev.LOANS.LOAN_PAYMENT_V1 (Loan_ID,loan_status,Principal,terms)
FROM 
 (SELECT $1 , 
       $2 ,
       $3,
       $4 FROM @vitech_dev.LOANS.LOAN_STAGE )
file_format= (type = csv field_delimiter=',' skip_header=1) ;




SELECT * FROM vitech_dev.LOANS.LOAN_PAYMENT_V1;


--------------
  CREATE OR REPLACE TABLE   vitech_dev.LOANS.LOAN_PAYMENT_V2  (
   Loan_ID  STRING,
   loan_status  STRING,
   Principal  STRING,
   terms  STRING ,
   GENDER STRING
   ) ;


  
COPY INTO vitech_dev.LOANS.LOAN_PAYMENT_V2 (Loan_ID,loan_status,Principal,terms,GENDER)
FROM 
 (SELECT $1 , 
       $2 ,
       $3,
       $4,
       $11 
       FROM @vitech_dev.LOANS.LOAN_STAGE )
file_format= (type = csv field_delimiter=',' skip_header=1) ;


SELECT * FROM vitech_dev.LOANS.LOAN_PAYMENT_V2 ;




CREATE OR REPLACE STAGE vitech_dev.LOANS.LOAN_STAGE1
  URL = 's3://bucketsnowflakes3';


  list @vitech_dev.LOANS.LOAN_STAGE1 ;



  --s3 url --- s3://bucketsnowflakes3/OrderDetails.csv
  ---ddl
  CREATE OR REPLACE TABLE OUR_FIRST_DB.PUBLIC.ORDERS (
    ORDER_ID VARCHAR(30),
    AMOUNT INT,
    PROFIT INT,
    QUANTITY INT,
    CATEGORY VARCHAR(30),
    SUBCATEGORY VARCHAR(30));