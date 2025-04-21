SQL> set lines 100 pages 100;
SQL> select * from emp;


1.WAQTD NUMBER OF EMPLOYEES GETTING SALARY LESS THAN 2000 IN DEPTNO 10
SQL> select count(*)
  2  from emp
  3  where sal <2000 and deptno in(10);

HERE WE CANT DISPLAY ANYTHING WITH MRF IF WE WANT TO DO WE SOULD MENTION THAT COL NAME IN GROUPBY CLAUSE

  1  select emp.*,count(*)
  2  from emp
  3* where sal <2000 and deptno in(10)
THIS IS WRONG THING 

 1  select count(*),sal
  2  from emp
  3  where sal <2000 and deptno in(10)
  4* group by sal
THIS ONE IS CORRECT




2.WAQTD TOTAL SALARY NEEDED TO PAY EMPLOYEES WORKING AS CLERK

SQL> select sum(sal)
  2   from emp
  3  where job ='CLERK';


3.WAQTD AVERAGE SALARY NEEDED TO PAY ALL EMPLOYEES

SQL> select avg(sal)
  2  from emp;


4.WAQTD NUMBER OF EMPLOYEES HAVING 'A' AS THEIR FIRST CHARACTER
SQL> select count(ename)
  2  from emp
  3  where ename like 'A%';


5.WAQTD NUMBER OF EMPLOYEES WORKING AS CLERK OR MANAGER
 1  select count(*)
  2  from emp
  3 where job in('CLERK','MANAGER')
------------------------------------------------------------------------USING GROUP BY
  1  select count(*),ename
  2  from emp
  3  where job in('CLERK','MANAGER')
  4* group by ename
SQL> /

  COUNT(*) ENAME
---------- ----------
         1 JONES
         1 CLARK
         1 MILLER
         1 SMITH
         1 ADAMS
         1 BLAKE


6.WAQTD TOTAL SALARY NEEDED TO PAY EMPLOYEES HIRED IN FEB
   1  select sum(sal)
  2  from emp
  3* where hiredate like'%FEB%'



8.WAQTD NUMBER OF EMPLOYEES GETTING COMISSION IN DEPTNO 30
SQL> select count(*)
  2  from emp
  3  where comm is not null;


9.WAQTD AVG SAL , TOTAL SAL , NUMBER OF EMPS AND MAXIMUM SALARY GIVEN TO EMPLOYEES WORKING AS PERSIDENT
SQL> select avg(sal),sum(sal),count(*),max(sal)
  2  from emp
  3  where job = 'PRESIDENT';

  AVG(SAL)   SUM(SAL)   COUNT(*)   MAX(SAL)
---------- ---------- ---------- ----------
      5000       5000          1       5000

10.WAQTD NUMBER OF EMPLOYEES HAVING 'A' IN THEIR NAMES 
SQL> select count(*)
  2  from emp
  3  where ename like '%LL%';

11.WAQTD NUMBER OF EMPS AND TOTAL SALary needed to pay THE EMPLOYEES WHO HAVE 2 CONSICUTIVE L's IN THEIR NAMES
SQL> select count(*)
  2  from emp
  3  where ename like '%LL%';

12.WAQTD NUMBER OF DEPARTMENTS PRESENT IN EMPLOYEE TABLE 
 1  select count(distinct deptno)
  2* from emp

13.WAQTD NUMBER OF EMPLOYEES HAVING CHARACTER '_' IN THEIR NAMES 

 1  select count(*)
  2  from emp
  3* where ename like '%!_%' escape'!'


14.WAQTD NUMBER OF EMPLOYEES HAVING ATLEAST 2 PERCENTILES IN THEIR NAMES 
SQL> select count(*) from emp
  2  where ename like '%!%%!%%' escape'!';

15.WAQTD TOTAL SALARY GIVEN TO EMPLOYEES WORKING AS CLERK IN DEPT 30 


16.WAQTD MAXIMUM SALARY GIVEN TO THE EMPLOYEES WORKING AS ANALYST 

select max(sal) from
  2  emp
  3  where job='ANALYST';


17.WAQTD NUMBER OF DISTINCT SALARIES PRESENT IN EMPLOYEE TABLE 

SQL> SELECT COUNT(DISTINCT SAL)
  2  FROM EMP;

COUNT(DISTINCTSAL)
------------------
                12

18.WAQTD NUMBER OF JOBS PRESENT IN EMPLOYEE TABLE 
SQL> SELECT COUNT(DISTINCT JOB)
  2  FROM EMP;

COUNT(DISTINCTJOB)
------------------
                 5

19.WATQD AVG SALARY GIVEN TO THE CLERK 
20.WAQTD MINIMUM SALARY GIVEN TO THE EMPLOYEES WHO WORK IN DEPT 10 AS MANAGER  OR A CLERK
  1  SELECT COUNT(*),MIN(SAL)
  2  FROM EMP
  3* WHERE DEPTNO IN (10) AND JOB IN('MANAGER','CLERK')

