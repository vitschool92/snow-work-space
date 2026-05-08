
CREATE OR REPLACE STAGE OUR_FIRST_DB.PUBLIC.orders_csv_stage 
    URL = 's3://snowflakebucket-copyoption/returnfailed/'
    FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1);

list @OUR_FIRST_DB.PUBLIC.orders_csv_stage ;


  CREATE OR REPLACE TABLE OUR_FIRST_DB.PUBLIC.ORDERS_csv (
    ORDER_ID VARCHAR(30),
    AMOUNT INT,
    PROFIT INT,
    QUANTITY INT,
    CATEGORY VARCHAR(30),
    SUBCATEGORY VARCHAR(30));  


select * from OUR_FIRST_DB.PUBLIC.ORDERS_csv ;  --4785  records 4 records missing 


COPY INTO OUR_FIRST_DB.PUBLIC.ORDERS_csv
FROM @OUR_FIRST_DB.PUBLIC.orders_csv_stage 
PATTERN = '.*Order.*[.]csv' 
ON_ERROR = 'CONTINUE'




COPY INTO OUR_FIRST_DB.PUBLIC.ORDERS_csv
FROM @OUR_FIRST_DB.PUBLIC.orders_csv_stage 
PATTERN = '.*Order.*[.]csv' 
VALIDATION_MODE = RETURN_ERRORS ;


CREATE OR REPLACE TABLE OUR_FIRST_DB.PUBLIC.COPY_ERRORS AS
SELECT * FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()));

SELECT * 

FROM INFORMATION_SCHEMA.LOAD_HISTORY
WHERE TABLE_NAME = 'ORDERS_V5' ;
---------------------------------

--WRITE 2 SQLS TO CONVERT OUR_FIRST_DB.PUBLIC.ORDERS_csv TABLE TO 
 --- JSON AND XML 


select * from OUR_FIRST_DB.PUBLIC.ORDERS_csv ;



SELECT OBJECT_CONSTRUCT(*)
 AS JSON_DATA
FROM OUR_FIRST_DB.PUBLIC.ORDERS_csv;


SELECT OBJECT_CONSTRUCT(
    'ORDER_ID', ORDER_ID,
    'AMOUNT', AMOUNT,
    'PROFIT', PROFIT,
    'QUANTITY', QUANTITY
) AS JSON_DATA
FROM OUR_FIRST_DB.PUBLIC.ORDERS_csv;



SELECT OBJECT_CONSTRUCT(*)
 AS JSON_DATA
FROM OUR_FIRST_DB.PUBLIC.ORDERS_csv;


SELECT PARSE_XML($1) FROM OUR_FIRST_DB.PUBLIC.ORDERS_csv;


select * from OUR_FIRST_DB.PUBLIC.ORDERS_csv;


SELECT PARSE_XML(
    '<ROW><ORDER_ID>' || ORDER_ID || '</ORDER_ID><AMOUNT>' || AMOUNT || '</AMOUNT><PROFIT>' || PROFIT || '</PROFIT><QUANTITY>' || QUANTITY || '</QUANTITY><CATEGORY>' || CATEGORY || '</CATEGORY><SUBCATEGORY>' || SUBCATEGORY || '</SUBCATEGORY></ROW>'
) AS XML_DATA
FROM OUR_FIRST_DB.PUBLIC.ORDERS_csv
LIMIT 5;


----------------------

CREATE SCHEMA EXTERNAL_STAGES;

CREATE OR REPLACE stage OUR_FIRST_DB.EXTERNAL_STAGES.JSONSTAGE
     url='s3://bucketsnowflake-jsondemo'
     FILE_FORMAT = (TYPE =JSON) ;

LIST @OUR_FIRST_DB.EXTERNAL_STAGES.JSONSTAGE;    
    
CREATE OR REPLACE table OUR_FIRST_DB.PUBLIC.JSON_RAW (
    raw_file variant);


COPY INTO OUR_FIRST_DB.PUBLIC.JSON_RAW 
FROM @OUR_FIRST_DB.EXTERNAL_STAGES.JSONSTAGE ;


SELECT * FROM OUR_FIRST_DB.PUBLIC.JSON_RAW ;


SELECT $1:city,
       $1:first_name ,
       $1:id
from  OUR_FIRST_DB.PUBLIC.JSON_RAW ;



SELECT raw_file:city :: string as city ,
       raw_file:first_name :: string as name,
       raw_file:id :: int as id,
       raw_file:job.salary :: decimal(10,2) as salary,
       raw_file:job.title :: string as titile
from  OUR_FIRST_DB.PUBLIC.JSON_RAW ;


SELECT raw_file:city,
       raw_file:first_name ,
       raw_file:id,
       raw_file:job.salary ,
       raw_file:job.title
from  OUR_FIRST_DB.PUBLIC.JSON_RAW ;


create table hr_csv_data as 
(
SELECT raw_file:city :: string as city ,
       raw_file:first_name :: string as name,
       raw_file:id :: int as id,
       raw_file:job.salary :: decimal(10,2) as salary,
       raw_file:job.title :: string as titile
from  OUR_FIRST_DB.PUBLIC.JSON_RAW 
)  ;


select * from hr_csv_data;


SELECT * FROM OUR_FIRST_DB.PUBLIC.JSON_RAW ;



select raw_file:id ,
       raw_file:first_name ,
       raw_file:spoken_languages[0]

       from OUR_FIRST_DB.PUBLIC.JSON_RAW


       select raw_file:id ,
       raw_file:first_name ,
       raw_file:spoken_languages[0].language  as first_lang,
        raw_file:spoken_languages[0].level  as level
       from OUR_FIRST_DB.PUBLIC.JSON_RAW ;


select raw_file:id,
       raw_file:first_name :: string as name ,
       f.value:language AS language,
       f.value:level AS level
from OUR_FIRST_DB.PUBLIC.JSON_RAW,
     LATERAL FLATTEN(input => raw_file:spoken_languages) f;       

     