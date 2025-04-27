SQL> desc chock;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 CID                                                   NOT NULL NUMBER(5)
 CNAME                                                          VARCHAR2(20)
 COST                                                           NUMBER(5,2)
 BRAND                                                          VARCHAR2(50)



-----INSERT MULTIPLE COLUMN DYNAMICALYY ---------   

SQL> insert into chock values(&cid,'&cname',&cost,'&Brand');
Enter value for cid: 1
Enter value for cname: kitkat
Enter value for cost: 50
Enter value for brand: chocklate
old   1: insert into chock values(&cid,'&cname',&cost,'&Brand')
new   1: insert into chock values(1,'kitkat',50,'chocklate')


DML IS TEMPERORY SO YOU SHOULD COMMIT 
SQL> commit;

Commit complete.



DELETE RECORDS

SQL> delete from chock
  2  where cid = 3;

1 row deleted.


UPDATE

SQL> update chock
  2  set cname ='melody'
  3  where cid =2;

1 row updated.


AVOID THISS
SQL> update chock
  2  set cname ='limbu',cname='mango'
  3  where cid in(1,3);
set cname ='limbu',cname='mango'
                   *
ERROR at line 2:
ORA-00957: duplicate column name

SQL> update chock
  2  set cname ='limbu',brand='mango'
  3  where cid in(1,3);

2 rows updated.

SQL> select * from chock;

       CID CNAME                      COST BRAND
---------- -------------------- ---------- --------------------------------------------------
         1 limbu                        50 mango
         2 melody                       99 chocklate
         3 limbu                       999 mango




