RECORDS 
--------------
1.WAQTD FIRST 2 RECORDS OF THE EMPLOYEES
/ 1  SELECT *
  2  FROM (SELECT EMP.*, ROWNUM AS SINO
  3  FROM EMP)
  4* WHERE SINO IN (1,2)
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO           SINO
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7369 SMITH      SECURITY        7902 17-DEC-80        990               20           1
      7499 ALLEN      SECURITY        7698 20-FEB-81       1600        300    30           2

2.WAQTD 5th RECORD OF THE EMPLOYEE
SQL> SELECT R.*,SINO
  2  FROM (SELECT EMP.*, ROWNUM AS SINO
  3         FROM EMP) R
  4  WHERE SINO= 5;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO       
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30          
         
3.WAQTD 1st , 3rd ,5th  RECORDS OF THE EMPLOYEES
  1  SELECT * FROM
  2  (SELECT EMP.*, ROWNUM AS SINO
  3     FROM EMP)
  4* WHERE SINO IN(1,5,3)
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO       SINO
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7369 SMITH      SECURITY        7902 17-DEC-80        990                    20          1
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30          3
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30          5
4.WAQTD last 5 RECORD OF THE EMPLOYEES 
 1  SELECT *
  2  FROM EMP
  3  WHERE (SELECT COUNT(ROWID)
  4         FROM EMP E
  5*         WHERE E.ROWID >= EMP.ROWID) <=5
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10
5.WAQTD LAST RECORD OF THE EMPLOYEES

6.WAQTD LAST 2 RECORDS OF THE EMPLOYEES 

  1  SELECT * FROM EMP
  2  WHERE (SELECT COUNT(ROWID)
  3  FROM EMP E
  4* WHERE E.ROWID>=EMP.ROWID) <=2
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10


7.WAQTD FIRST HALF OF THE EMPLOYEES RECORDS
  1  select * from
  2  (select emp.*, rownum as sino
  3    from emp)
  4  where sino  <= (select count(sino)*0.5
  5*          from emp)
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO       SINO
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7369 SMITH      SECURITY        7902 17-DEC-80        990                    20          1
      7499 ALLEN      SECURITY        7698 20-FEB-81       1600        300         30          2
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30          3
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20          4
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30          5
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30          6
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10          7

7 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  select * from
  2  (select emp.*, rownum as sino
  3    from emp)
  4* where sino  <= (select count(sino)         from emp) * 50/100
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO       SINO
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7369 SMITH      SECURITY        7902 17-DEC-80        990                    20          1
      7499 ALLEN      SECURITY        7698 20-FEB-81       1600        300         30          2
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30          3
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20          4
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30          5
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30          6
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10          7

7 rows selected.


8.WAQTD LAST 25% OF THE EMPLOYEES RECORDS 
 1  select *
  2  FROM (SELECT EMP.*, ROWNUM AS SINO
  3           FROM EMP)
  4  WHERE SINO> (SELECT COUNT(SINO)
  5*       FROM EMP) * 75/100
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO       SINO
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20         11
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         12
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20         13
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         14



 1  SELECT * FROM
  2  EMP
  3  WHERE  (SELECT COUNT(ROWID)
  4            FROM EMP E2
  5           WHERE E2.ROWID>= EMP.ROWID) >= (SELECT COUNT(ROWID)*75/100
  6*                                                     FROM EMP)
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      SECURITY        7902 17-DEC-80        990                    20
      7499 ALLEN      SECURITY        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20

9.WAQTD FIRST  25% OF THE EMPLOYEES RECORDS AND LAST 2 RECORS 
  1  SELECT *
  2  FROM EMP
  3  WHERE (SELECT COUNT(ROWID)
  4            FROM EMP E3
  5         WHERE E3.ROWID <= EMP.ROWID) <= (SELECT COUNT(ROWID)*25/100  FROM EMP) OR(SELECT COUNT(ROWID)
  6                                                                                      FROM EMP  E4
  7*      WHERE E4.ROWID >= EMP.ROWID) <=2
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      SECURITY        7902 17-DEC-80        990                    20
      7499 ALLEN      SECURITY        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

SQL>

10.WAQTD DETAILS OF THE EMPLOYEES RECORDS WHO IS GETTING 5 TH MAXIMUM SAL EMPLOYEES.



  1  SELECT *
  2    FROM(
  3  SELECT A.*,ROWNUM AS SINO
  4  FROM(SELECT EMP.*
  5     FROM EMP
  6  ORDER BY SAL DESC)A)
  7* WHERE SINO =5
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO       SINO
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30          5



WAQTD DETAILS WITH 3 RD MINIIMUM SAL USING ROWNUM?
  1  SELECT *
  2  FROM
  3  (SELECT A.* , ROWNUM AS SINO
  4       FROM (SELECT EMP.* FROM EMP
  5                  ORDER BY SAL  ) A
  6  )
  7* WHERE SINO =3
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO       SINO
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20          3


Nth max and Nth Min
-------------------------

1.WAQTD 3rd MAXIMUM SALARAY OF THE EMPLOYEES
2. WAQTD 1ST MIN AND 5th MINIMUM SALARAY OF THE EMPLOYEES
3. WAQTD 1st MAXIMUM SALARAY AND LAST MAX OF SALARY OF THE EMPLOYEES
4. WAQTD FIRST 50% MINIMUM SALARAY OF THE EMPLOYEES
5.WAQTD FIRST 25 % MAXIMUM SALARY OF THE EMPLOYEES 
6.WAQTD FIRST 75% OF MAXIMUM SALARY OF THE EMPLOYEES 
7.WAQTD LAST 3 MINIMUM SALARY OF THE EMPLOYEES 
8.WAQTD LAST 50 % OF MAXIMUM SALARY OF ALL THE EMPLOYEES 
9.WAQTD LAST 25% OF THE MINIMUM SALARY OF THE EMPLOEES 
10.WAQTD FIRST MAX SALARY AND THE LAST 3rd MAX OF THE SALARY 
11.WAQTD FIRST 3 MIN SALARY AND THE LAST 25% OF THE MIN SALARY 
12.WAQTD 1ST ,3RD ,5TH  MAX OF SALARY AND THE LAST SECOND MAX SALARY OF ALL THE EMPLOYEES .
13.WAQTD LAST 5TH  MINIMUM SALARY OF THE EMPLOYEES .