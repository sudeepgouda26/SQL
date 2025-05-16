LOGICAL OPERATORS:
————————————————
1.WAQTD DETAILS OF THE EMPLOYEES WORKING AS CLERK AND EARNING LESS THAN 1500

SQL> select *
  2  from emp
  3  where job ='CLERK' and sal <1500;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7876 ADAMS      CLERK           7788 23-MAY-87       1100               20
      7900 JAMES      CLERK           7698 03-DEC-81        950               30
      7934 MILLER     CLERK           7782 23-JAN-82       1300               10



2.WAQTD NAME AND HIREDATE OF THE EMPLOYEES WORKING AS  MANAGER IN DEPT 30 
  1  SELECT ENAME, HIREDATE FROM EMP
  2* WHERE JOB ='MANAGER' AND DEPTNO =30
SQL> /

ENAME      HIREDATE
---------- ---------
BLAKE      01-MAY-81



3.WAQTD DETAILS OF THE EMP ALONG WITH ANNUAL SALARY IF THEY ARE WORKING IN DEPT 30 AS SALESMAN AND THEIR  ANNUAL SALARY HAS TO BE GREATER THAN 14000

  1  SELECT EMP.*, SAL* 12 AS ANUAL_SAL
  2  FROM EMP
  3* WHERE DEPTNO =30 AND JOB = 'SALESMAN'
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO  ANUAL_SAL
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500    30       15000
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400    30       15000
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0    30       18000


4.WAQTD ALL THE DETAILS OF THE EMP WORKING IN DEPT 30 OR AS ANALYST
SQL> SELECT *
  2  FROM EMP
  3  WHERE DEPTNO =30 OR JOB = 'ANALYST';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SECURITY        7698 20-FEB-81       1600        300    30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500    30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400    30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850               30
      7788 SCOTT      ANALYST         7566 19-APR-87       3000               20
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0    30
      7900 JAMES      CLERK           7698 03-DEC-81        950               30
      7902 FORD       ANALYST         7566 03-DEC-81       3000               20

8 rows selected.




5.WAQTD NAMES OF THE EMPMLOYEES WHOS SALARY IS LESS THAN 1100 AND THEIR DESIGNATION IS CLERK
SQL> SELECT ENAME, SAL , SAL* 12 AS AUAL_SAL
  2  FROM EMP
  3  WHERE SAL <1100 AND JOB ='CLERK';

ENAME             SAL   AUAL_SAL
---------- ---------- ----------
JAMES             950      11400

6.WAQTD NAME AND SAL , ANNUAL SAL AND DEPTNO IF DEPTNO IS 20 EARNING MORE THAN 1100 AND ANNUAL SALARY EXCEEDS 12000.
  SELECT ENAME,SAL FROM EMP
  2* WHERE  DEPTNO = 20 AND SAL>100 AND SAL*12 >12000
SQL> /

ENAME             SAL
---------- ----------
JONES            2975
SCOTT            3000
ADAMS            1100
FORD             3000

7.WAQTD EMPNO AND NAMES OF THE EMPLOYEES WORKING AS MANAGER IN DEPT 20 
8.WAQTD DETAILS OF EMPLOYEES WORKING IN DEPT 20 OR 30 

  1  SELECT EMPNO , ENAME
  2  FROM EMP
  3* WHERE DEPTNO IN(20,30)
  4  /

     EMPNO ENAME
---------- ----------
      7369 SMITH
      7499 ALLEN
      7521 WARD
      7566 JONES
      7654 MARTIN
      7698 BLAKE
      7788 SCOTT
      7844 TURNER
      7876 ADAMS
      7900 JAMES
      7902 FORD

11 rows selected.

9.WAQTD DETAILS OF EMPLOYEES WORKING AS AN ANALYST IN DEPT  20 
10.WAQTD DETAILS OF EMPLOYEE WORKING AS PRESIDENT WITH SALARY OF RUPEES 4000


SQL> SELECT * FROM EMP
  2  WHERE EMPNO  IN (7902,7839);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7839 KING       PRESIDENT            17-NOV-81       5000               10
      7902 FORD       ANALYST         7566 03-DEC-81       3000               20

SQL> SELECT SAL FROM EMP
  2  WHERE SAL BETWEEN 1000 AND 4000 AND SAL*12 >15000;

       SAL
----------
      1600
      2975
      2850
      2450
      3000
      1500
      3000
      1300

8 rows selected.



SQL> set lines 100 pages 100;
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


