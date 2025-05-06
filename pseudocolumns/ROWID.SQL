Pseudo Columns

Row Id 


SQL> select RowId from emp;

ROWID
------------------
AAAE5eAAEAAAAFcAAA
AAAE5eAAEAAAAFcAAB
AAAE5eAAEAAAAFcAAC
AAAE5eAAEAAAAFcAAD
AAAE5eAAEAAAAFcAAE
AAAE5eAAEAAAAFcAAF
AAAE5eAAEAAAAFcAAG
AAAE5eAAEAAAAFcAAH
AAAE5eAAEAAAAFcAAI
AAAE5eAAEAAAAFcAAJ
AAAE5eAAEAAAAFcAAK
AAAE5eAAEAAAAFcAAL
AAAE5eAAEAAAAFcAAM
AAAE5eAAEAAAAFcAAN

14 rows selected.


waqtd second record in a table..
  1  select * from emp e2
  2  where (select count(rowid)
  3   from emp e1
  4  where e1.rowid<= e2.rowid)
  5* in (2)
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30

SQL>


WAQTD SECOND RECORD FRON THE LAST
Wrote file afiedt.buf

  1  select * from emp e2
  2  where (select count(rowid)
  3   from emp e1
  4  where e1.rowid>= e2.rowid)
  5* in (2)
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20



WAQTD  FIRST 3 RECORDS FROM THE TABLE

  1  select * from emp e2
  2  where (select count(rowid)
  3   from emp e1
  4  where e1.rowid<= e2.rowid)
  5* in (1,2,3)
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30

WAQTD FIRST 2 EWCORDS AND LAST TWO RECORDS

  1  select * from emp e2
  2  where (select count(rowid)
  3   from emp e1
  4  where e1.rowid<= e2.rowid)
  5  in (1,2)
  6  UNION
  7  select * from emp e2
  8  where (select count(rowid)
  9   from emp e1
 10  where e1.rowid>= e2.rowid)
 11* in (1,2)
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

                                           OR

  1  SELECT * FROM EMP E2
  2  WHERE (SELECT COUNT (ROWID)
  3  FROM EMP E1
  4  WHERE E1.ROWID <=E2.ROWID  )IN (1,2) OR (SELECT COUNT(ROWID)
  5                                            FROM EMP E3
  6*                                              WHERE E3.ROWID >= E2.ROWID) IN (1,2)
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

WAQTD FIRST HALF OF THE RECORDS FROM THE TABLE
  1  SELECT * FROM EMP E2
  2  WHERE  (SELECT COUNT (ROWID)
  3  FROM EMP E1
  4  WHERE E1.ROWID <=E2.ROWID  ) <= (SELECT COUNT(ROWID)*0.5
  5* FROM EMP)
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10

7 rows selected.