SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
BONUS                          TABLE
B_CUST                         TABLE
B_EMP                          TABLE
CHOCK                          TABLE
CUST                           TABLE
DEPT                           TABLE
EMP                            TABLE
PRODUCT                        TABLE
SALGRADE                       TABLE

RENAME

RENAME CUST TO CUSTOMER;
SQL> SELECT * FROM TAB
  2  ;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
BONUS                          TABLE
B_CUST                         TABLE
B_EMP                          TABLE
CHOCK                          TABLE
CUSTOMER                       TABLE
DEPT                           TABLE
EMP                            TABLE
PRODUCT                        TABLE
SALGRADE                       TABLE

9 rows selected.

ALTER THE TABLE

TO ADD COLUMN
SQL> ALTER TABLE CUST
  2  ADD CUST_LOC VARCHAR(20) NOT NULL;

Table altered.

SQL> DESC CUST;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 CID                                                   NOT NULL NUMBER(3)
 CNAME                                                 NOT NULL VARCHAR2(5)
 PH_NO                                                 NOT NULL NUMBER(10)
 ADDRESS                                               NOT NULL VARCHAR2(10)
 PID                                                   NOT NULL NUMBER(2)
 CUST_LOC                                              NOT NULL VARCHAR2(20)


//DROP COLUMN 

SQL>SQL> ALTER TABLE CUST
  2  DROP COLUMN CUST_LOC ;

Table altered.

SQL> DESC CUST
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 CID                                                   NOT NULL NUMBER(3)
 CNAME                                                 NOT NULL VARCHAR2(5)
 PH_NO                                                 NOT NULL NUMBER(10)
 ADDRESS                                               NOT NULL VARCHAR2(10)
 PID                                                   NOT NULL NUMBER(2)

SQL>

MODIFY DATA TYPE


  1  ALTER TABLE CUST
  2* MODIFY CID VARCHAR(20)
SQL> /

Table altered.

SQL> DESC CUST;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 CID                                                   NOT NULL VARCHAR2(20)
 CNAME                                                 NOT NULL VARCHAR2(5)
 PH_NO                                                 NOT NULL NUMBER(10)
 ADDRESS                                               NOT NULL VARCHAR2(10)
 PID                                                   NOT NULL NUMBER(2)

SQL>/

TO ADD MULTIPLE COLUMNNS AT A TIME
SQL> alter table Cust
  2  add(
  3  c_sal number(4) not null,
  4  c_comm number(4) );

Table altered.

TO DROP MULTIPLE TABLE ONCE
SQL> alter table Cust
  2  drop(
  3  c_sal,c_comm);

TO MODIFY DATATYPE FOR MULTIPLE COLUMNS AT A TIME
SQL> alter table cust
  2  modify
  3  (
  4  C_sal number(5),C_comm Number(5));

TO ADD PRIMARY KEY FOR THE OBJECT

SQL> ALTER TABLE CUST
  2  ADD CONSTRAINT EPK PRIMARY KEY(CID);

Table altered.

TO DROP PRIMARY KEY

SQL> ALTER TABLE CUST
  2  DROP CONSTRAINT EPK;

Table altered.


ADD FOREIGN KEY TO THE TABLE USING ALTER

SQL> ALTER TABLE PRODUCT
  2  ADD CONSTRAINT PFK FOREIGN KEY(CID) REFERENCES CUST(CID);

Table altered.

SQL> DESC PRODUCT;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 PID                                                   NOT NULL NUMBER(3)
 PNAME                                                 NOT NULL VARCHAR2(50)
 P_PRICE                                               NOT NULL NUMBER(6,2)
 BRAND                                                 NOT NULL VARCHAR2(20)
 CID                                                            NUMBER(3)


TO DROP THE TABLE

SQL> DROP TABLE PRODUCT;

TO RECOVER THE TABLE

SQL> FLASHBACK TABLE PRODUCT
  2  TO BEFORE DROP;

Flashback complete.

TO DROP THE TABLE PERMANENTLY

SQL> PURGE TABLE PRODUCT;

Table purged.






