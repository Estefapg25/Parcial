--------------------------------------------------------
-- Archivo creado  - miércoles-abril-25-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."CUSTOMERS" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255), 
	"COUNTRY" VARCHAR2(255), 
	"GRADE" NUMBER(*,0), 
	"SALESMAN_ID" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."ORDERS" 
   (	"ID" NUMBER(*,0), 
	"AMOUNT" NUMBER(8,2), 
	"ORDER_DATE" DATE, 
	"CUSTOMER_ID" NUMBER(*,0), 
	"SALESMAN_ID" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table SALESMAN
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."SALESMAN" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255), 
	"COUNTRY" VARCHAR2(255), 
	"COMMISSION" NUMBER(5,2)
   )
--------------------------------------------------------
--  DDL for View VIEW_1
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIOS"."VIEW_1" ("SALESMAN_ID", "SALESMAN_NAME", "CUSTOMER_ID", "CUSTOMER_NAME") AS 
  SELECT SALESMAN.ID AS SALESMAN_ID, SALESMAN.NAME AS SALESMAN_NAME, CUSTOMERS.ID AS CUSTOMER_ID, CUSTOMERS.NAME AS CUSTOMER_NAME 
    FROM SALESMAN INNER JOIN CUSTOMERS ON CUSTOMERS.SALESMAN_ID=SALESMAN.ID
--------------------------------------------------------
--  DDL for View VIEW_3
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIOS"."VIEW_3" ("CUSTOMER_ID", "CUSTOMER_NAME", "SALESMAN_ID", "SALESMAN_NAME") AS 
  SELECT CUSTOMERS.ID AS CUSTOMER_ID, CUSTOMERS.NAME AS CUSTOMER_NAME, SALESMAN.ID AS SALESMAN_ID, SALESMAN.NAME AS SALESMAN_NAME
FROM SALESMAN INNER JOIN CUSTOMERS ON SALESMAN.ID=CUSTOMERS.SALESMAN_ID
WHERE (CUSTOMERS.GRADE<300) AND (SALESMAN.ID=CUSTOMERS.SALESMAN_ID OR CUSTOMERS.SALESMAN_ID='NULL')
--------------------------------------------------------
--  DDL for Index SYS_C0011764
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."SYS_C0011764" ON "EJERCICIOS"."SALESMAN" ("ID")
--------------------------------------------------------
--  DDL for Index SYS_C0011765
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."SYS_C0011765" ON "EJERCICIOS"."CUSTOMERS" ("ID")
--------------------------------------------------------
--  DDL for Index SYS_C0011767
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."SYS_C0011767" ON "EJERCICIOS"."ORDERS" ("ID")
--------------------------------------------------------
--  Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."CUSTOMERS" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."ORDERS" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Constraints for Table SALESMAN
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."SALESMAN" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."CUSTOMERS" ADD CONSTRAINT "SALESMAN_FK" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "EJERCICIOS"."SALESMAN" ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."ORDERS" ADD CONSTRAINT "CUSTOMER_ORDER_FK" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "EJERCICIOS"."CUSTOMERS" ("ID") ENABLE
 
  ALTER TABLE "EJERCICIOS"."ORDERS" ADD CONSTRAINT "SALESMAN_ORDER_FK" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "EJERCICIOS"."SALESMAN" ("ID") ENABLE
