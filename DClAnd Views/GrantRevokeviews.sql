Grant Revoke
show user
USER is "SCOTT"


if account is locked

SQL> conn
Enter user-name: hr/tiger
ERROR:
ORA-28000: the account is locked


Warning: You are no longer connected to ORACLE.
SQL> conn
Enter user-name: system
Enter password:tiger
Connected.
SQL> connect sys as sysdba
Enter password:Oracle123
Connected.
SQL> alter user system account unlock;

User altered.

SQL> alter user hr account unlock;

User altered.

SQL> alter user system identified by tiger;

User altered.

SQL> alter user hr identified by tiger;

User altered.

SQL> connect
Enter user-name: hr
Enter password:tiger
Connected.
SQL>



///////////////////////////////////////grant and revoke  to update sal in hr\\\\\\\\\\\\\\\\\\\\\\\\\\\
SQL> connect
Enter user-name: hr
Enter password:
Connected.
SQL> show user;
USER is "HR"
SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
COUNTRIES                      TABLE
DEPARTMENTS                    TABLE
EMPLOYEES                      TABLE
EMP_DETAILS_VIEW               VIEW
JOBS                           TABLE
JOB_HISTORY                    TABLE
LOCATIONS                      TABLE
REGIONS                        TABLE

8 rows selected.

SQL> select * from scott.emp;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

14 rows selected.

SQL> update scott.emp
  2  set sal =990
  3  where ename ='SMITH';

1 row updated.

SQL> show user;
USER is "HR"
SQL> conn
Enter user-name: scott
Enter password:
Connected.
SQL> select * from emp;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        990                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

14 rows selected.

SQL>

  creating VIeww

14 rows selected.

SQL> create view chombu
  2  as
  3  select ename,job,hiredate
  4  from emp;

View created.

SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
BONUS                          TABLE
B_CUST                         TABLE
B_EMP                          TABLE
CHOCK                          TABLE
CHOMBU                         VIEW
DEPT                           TABLE
EMP                            TABLE
SALGRADE                       TABLE

8 rows selected.

SQL>


SQL> SELECT * FROM CHOMBU;

ENAME      JOB       HIREDATE
---------- --------- ---------
SMITH      CLERK     17-DEC-80
ALLEN      SALESMAN  20-FEB-81
WARD       SALESMAN  22-FEB-81
JONES      MANAGER   02-APR-81
MARTIN     SALESMAN  28-SEP-81
BLAKE      MANAGER   01-MAY-81
CLARK      MANAGER   09-JUN-81
SCOTT      ANALYST   19-APR-87
KING       PRESIDENT 17-NOV-81
TURNER     SALESMAN  08-SEP-81
ADAMS      CLERK     23-MAY-87
JAMES      CLERK     03-DEC-81
FORD       ANALYST   03-DEC-81
MILLER     CLERK     23-JAN-82

14 rows selected.

SQL>
SQL> GRANT SELECT ,UPDATE
  2  ON CHOMBU
  3  TO HR;

Grant succeeded.


SQL> CONN
Enter user-name: hr/tiger
Connected.
SQL> SELECT * FROM TAB;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
COUNTRIES                      TABLE
DEPARTMENTS                    TABLE
EMPLOYEES                      TABLE
EMP_DETAILS_VIEW               VIEW
JOBS                           TABLE
JOB_HISTORY                    TABLE
LOCATIONS                      TABLE
REGIONS                        TABLE

8 rows selected.

SQL> SELECT * FROM SCOTT.CHOMBU;

ENAME      JOB       HIREDATE
---------- --------- ---------
SMITH      CLERK     17-DEC-80
ALLEN      SALESMAN  20-FEB-81
WARD       SALESMAN  22-FEB-81
JONES      MANAGER   02-APR-81
MARTIN     SALESMAN  28-SEP-81
BLAKE      MANAGER   01-MAY-81
CLARK      MANAGER   09-JUN-81
SCOTT      ANALYST   19-APR-87
KING       PRESIDENT 17-NOV-81
TURNER     SALESMAN  08-SEP-81
ADAMS      CLERK     23-MAY-87
JAMES      CLERK     03-DEC-81
FORD       ANALYST   03-DEC-81
MILLER     CLERK     23-JAN-82

14 rows selected.

SQL> UPDATE SCOTT.CHOMBU
  2  SET JOB = 'SECURITY'
  3  WHERE ENAME IN('SMITH', 'ALLEN');

2 rows updated.

SQL>     

SQL> CONN
Enter user-name: scott/tiger
Connected.
SQL> show user
USER is "SCOTT"
SQL>
SQL> select * from emp;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      SECURITY        7902 17-DEC-80        990                    20
      7499 ALLEN      SECURITY        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

14 rows selected.

SQL>           


dropp   view

SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
BONUS                          TABLE
B_CUST                         TABLE
B_EMP                          TABLE
CHOCK                          TABLE
CHOMBU                         VIEW
DEPT                           TABLE
EMP                            TABLE
SALGRADE                       TABLE

8 rows selected.

SQL> drop view chombu;

View dropped.

SQL> flashback view chombu
  2  to before drop;
flashback view chombu
          *
ERROR at line 1:
ORA-00905: missing keyword


if we dropped view it will delete permanentlyy
flash back wont work for view
                        