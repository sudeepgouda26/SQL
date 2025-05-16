SPECIAL OPERATORS:
----------------------------------
1.IN:
-------
    column_name/expression  IN ( v1,v2,...Vn) ; 

2.NOT IN:
---------------
    column_name/expression NOT  IN ( v1,v2,...Vn) ; 

3.BETWEEN :
-----------
  column_name/expression BETWEEN lower_range AND higher_range; 

4.NOT BETWEEN :
---------------
  column_name/expression NOT BETWEEN lower_range AND higher_range; 

5.IS :
-------
 column_name/expression IS NULL ;

 6.IS NOT :
--------------
 column_name/expression IS NOT NULL ;

7.LIKE:
-----------
column_name/expression  LIKE   'pattern_to_match' ;

8.NOT LIKE:
-----------
column_name/expression  NOT  LIKE   'pattern_to_match' ;

ESCAPE CHARACTER
-----------
column_name/expression  LIKE/NOT LIKE   'pattern_to_match' ESCAPE 'char'  ;


ASSIGNMENT ON SEPCIAL OPERATORS : 
----------------------------------

1) LIST ALL THE EMPLOYEES WHOSE COMMISSION IS NULL
2) LIST ALL THE EMPLOYEES WHO DON’T HAVE A REPORTING MANAGER
3) LIST ALL THE SALESMEN IN DEPT 30
4) LIST ALL THE SALESMEN IN DEPT NUMBER 30 AND HAVING SALARY GREATER THAN 1500
5) LIST ALL THE EMPLOYEES WHOSE NAME STARTS WITH ‘S’ OR ‘A’
6) LIST ALL THE EMPLOYEES EXCEPT THOSE WHO ARE WORKING IN DEPT 10 & 20.
7) LIST THE EMPLOYEES WHOSE NAME DOES NOT START WITH ‘S’
8) LIST ALL THE EMPLOYEES WHO ARE HAVING REPORTING MANAGERS IN DEPT 10
9) LIST ALL THE EMPLOYEES WHOSE COMMISSION IS NULL AND WORKING AS CLERK
10) LIST ALL THE EMPLOYEES WHO DON’T HAVE A REPORTING MANAGER IN DEPTNO 10 OR 30
11) LIST ALL THE SALESMEN IN DEPT 30 WITH SAL MORE THAN 2450
12) LIST ALL THE ANALYST IN DEPT NUMBER 20 AND HAVING SALARY GREATER THAN 2500
13) LIST ALL THE EMPLOYEES WHOSE NAME STARTS WITH ‘M’ OR ‘J’
14) LIST ALL THE EMPLOYEES WITH ANNUAL SALARY EXCEPT THOSE WHO ARE WORKING IN DEPT 30
15) LIST THE EMPLOYEES WHOSE NAME DOES NOT END WITH ‘ES’ OR ‘R’
16) LIST ALL THE EMPLOYEES WHO ARE HAVING REPORTING MANAGERS IN DEPT 10 
17) DISPLAY ALL THE EMPLOYEE WHO ARE ‘SALESMAN’S HAVING ‘E’ AS THE LAST BUT ONE CHARACTER IN ENAME BUT SALARY HAVING EXACTLY 4 CHARACTER
18) DISPLAY ALL THE EMPLOYEE WHO ARE JOINED AFTER YEAR 81
19) DISPLAY ALL THE EMPLOYEE WHO ARE JOINED IN FEB
20) LIST THE EMPLOYEES WHO ARE NOT WORKING AS MANAGERS AND CLERKS IN DEPT 10 AND 20 WITH A SALARY IN THE RANGE OF 1000 TO 3000.

SQL> SELECT *
  2  FROM EMP WHERE COMM IS NULL;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      SECURITY        7902 17-DEC-80        990               20
      7566 JONES      MANAGER         7839 02-APR-81       2975               20
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850               30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450               10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000               20
      7839 KING       PRESIDENT            17-NOV-81       5000               10
      7876 ADAMS      CLERK           7788 23-MAY-87       1100               20
      7900 JAMES      CLERK           7698 03-DEC-81        950               30
      7902 FORD       ANALYST         7566 03-DEC-81       3000               20
      7934 MILLER     CLERK           7782 23-JAN-82       1300               10

10 rows selected.

SQL> SELECT *
  2  FROM EMP
  3  WHERE MGR IS NULL;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7839 KING       PRESIDENT            17-NOV-81       5000               10

SQL> SELECT *
  2  FROM EMP
  3  WHERE DEPTNO =30 AND JOB ='SALESMAN';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500    30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400    30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0    30

SQL> SELECT *
  2  FROM EMP
  3  WHERE JOB = 'SALESMAN' AND DEPTNO=30 AND SAL >1500;

no rows selected

SQL> SELECT *
  2  FROM EMP
  3  WHERE ENAME LIKE 'S%' OR ENAME LIKE 'A%';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      SECURITY        7902 17-DEC-80        990               20
      7499 ALLEN      SECURITY        7698 20-FEB-81       1600        300    30
      7788 SCOTT      ANALYST         7566 19-APR-87       3000               20
      7876 ADAMS      CLERK           7788 23-MAY-87       1100               20

SQL> SELECT *
  2  FROM EMP
  3  WHERE DEPTNO NOT IN (10,30);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      SECURITY        7902 17-DEC-80        990               20
      7566 JONES      MANAGER         7839 02-APR-81       2975               20
      7788 SCOTT      ANALYST         7566 19-APR-87       3000               20
      7876 ADAMS      CLERK           7788 23-MAY-87       1100               20
      7902 FORD       ANALYST         7566 03-DEC-81       3000               20

SQL> SELECT *
  2  FROM EMP
  3  WHARE JOB = 'SALESMAN'  AND DEPTNO =30 AND SAL >1500;
WHARE JOB = 'SALESMAN'  AND DEPTNO =30 AND SAL >1500
      *
ERROR at line 3:
ORA-00933: SQL command not properly ended


SQL> ED
Wrote file afiedt.buf

  1  SELECT *
  2  FROM EMP
  3* WHERE JOB = 'SALESMAN'  AND DEPTNO =30 AND SAL >1500
SQL> /

no rows selected

SQL> SELCT * FROM EMP
SP2-0734: unknown command beginning "SELCT * FR..." - rest of line ignored.
SQL> SELECT * FROM EMP
  2  WHERE ENAME NOT LIKE 'S%';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SECURITY        7698 20-FEB-81       1600        300    30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500    30
      7566 JONES      MANAGER         7839 02-APR-81       2975               20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400    30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850               30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450               10
      7839 KING       PRESIDENT            17-NOV-81       5000               10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0    30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100               20
      7900 JAMES      CLERK           7698 03-DEC-81        950               30
      7902 FORD       ANALYST         7566 03-DEC-81       3000               20
      7934 MILLER     CLERK           7782 23-JAN-82       1300               10

12 rows selected.

SQL> SELECT * FROM EMP
  2  WHERE MGR IS NOT NULL;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      SECURITY        7902 17-DEC-80        990               20
      7499 ALLEN      SECURITY        7698 20-FEB-81       1600        300    30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500    30
      7566 JONES      MANAGER         7839 02-APR-81       2975               20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400    30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850               30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450               10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000               20
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0    30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100               20
      7900 JAMES      CLERK           7698 03-DEC-81        950               30
      7902 FORD       ANALYST         7566 03-DEC-81       3000               20
      7934 MILLER     CLERK           7782 23-JAN-82       1300               10

13 rows selected.

SQL> SELECT *
  2  FROM EMP
  3  WHERE MGR IS NOT NULL  AND DEPTNO IN (10);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7782 CLARK      MANAGER         7839 09-JUN-81       2450               10
      7934 MILLER     CLERK           7782 23-JAN-82       1300               10

SQL> SELECT 8
  2  /
SELECT 8
       *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> SELECT *
  2  FROM EMP
  3  WHERE COMM IS NULL AND JOB = 'CLERK';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7876 ADAMS      CLERK           7788 23-MAY-87       1100               20
      7900 JAMES      CLERK           7698 03-DEC-81        950               30
      7934 MILLER     CLERK           7782 23-JAN-82       1300               10

SQL> SELECT *
  2  FROM EMP
  3  WHERE MGR IS NOT NULL AND DEPTNO IN (10,30);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SECURITY        7698 20-FEB-81       1600        300    30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500    30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400    30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850               30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450               10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0    30
      7900 JAMES      CLERK           7698 03-DEC-81        950               30
      7934 MILLER     CLERK           7782 23-JAN-82       1300               10

8 rows selected.

SQL> SELECT *
  2  FROM EMP
  3  WHERE JOB ='SALESMAN' AND SAL >2450 ;

no rows selected

SQL> ED
Wrote file afiedt.buf

  1  SELECT *
  2  FROM EMP
  3* WHERE JOB ='ANALYST' AND SAL >2500 AND DEPTNO IN (30)
SQL> /

no rows selected

SQL> SELECT *
  2  FROM EMP
  3  WHERE DEPTNO != 30;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      SECURITY        7902 17-DEC-80        990               20
      7566 JONES      MANAGER         7839 02-APR-81       2975               20
      7782 CLARK      MANAGER         7839 09-JUN-81       2450               10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000               20
      7839 KING       PRESIDENT            17-NOV-81       5000               10
      7876 ADAMS      CLERK           7788 23-MAY-87       1100               20
      7902 FORD       ANALYST         7566 03-DEC-81       3000               20
      7934 MILLER     CLERK           7782 23-JAN-82       1300               10

8 rows selected.

SQL> SELECT *
  2  FROM EMP
  3  WHERE ENAME NOT LIKE '%ES' OR ENAME NOT LIKE'%R';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      SECURITY        7902 17-DEC-80        990               20
      7499 ALLEN      SECURITY        7698 20-FEB-81       1600        300    30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500    30
      7566 JONES      MANAGER         7839 02-APR-81       2975               20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400    30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850               30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450               10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000               20
      7839 KING       PRESIDENT            17-NOV-81       5000               10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0    30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100               20
      7900 JAMES      CLERK           7698 03-DEC-81        950               30
      7902 FORD       ANALYST         7566 03-DEC-81       3000               20
      7934 MILLER     CLERK           7782 23-JAN-82       1300               10

14 rows selected.

SQL> SELECT *
  2  FROM EMP
  3  WHERE ENAME LIKE '%E_%' AND SAL LIKE '____';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SECURITY        7698 20-FEB-81       1600        300    30
      7566 JONES      MANAGER         7839 02-APR-81       2975               20
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0    30
      7934 MILLER     CLERK           7782 23-JAN-82       1300               10

SQL> SELECT *
  2  FROM EMP
  3  WHERE JOB NOT IN ('MANAGER', 'CLERK') AND DEPTNO NOT IN(10,20) AND SAL BETWEEN 1000 AND 3000;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SECURITY        7698 20-FEB-81       1600        300    30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500    30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400    30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0    30

SQL>