use dhruti;


CREATE  TABLE Country ( 
COUNTRY_ID varchar(2),
COUNTRY_NAME varchar(40)
REGION_ID decimal(10,0)

CHECK(COUNTRY_NAME IN('Italy','India','China')) ,
);