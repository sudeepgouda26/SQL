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



    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON


1.NAME OF THE EMPLOYEE AND HIS LOCATION OF ALL THE EMPLOYEES .

 select e.ename , d.loc
  2  from emp e, dept d
  3  where d.deptno = e.deptno;


2.WAQTD DNAME AND SALARY FOR ALL THE EMPLOYEE WORKING IN ACCOUNTING.
 1  select d.Dname, e.sal
  2  from dept d, emp e
  3* where e.deptno =d.deptno and d.dname ='ACCOUNTING'


DNAME                 SAL
-------------- ----------
ACCOUNTING           2450
ACCOUNTING           5000
ACCOUNTING           1300

3.WAQTD DNAME AND ANNUAL SALARY FOR ALL EMPLOYEES WHOS SALARY IS MORE THAN 2340
select e.sal, d.dname , e.sal*12 as anual_sal
  2  from emp e, dept d
  3  where e.deptno = d.deptno and e.sal >2340;

4.WAQTD ENAME AND DNAME FOR EMPLOYEES HAVING CAHARACTER 'A' IN THEIR DNAME 
 select ename, dname
  2  from emp e , dept d
  3  where d.deptno = e.deptno and dname like '%A%';


5.WAQTD ENAME AND DNAME FOR ALL THE EMPLOYEES WORKING AS SALESMAN
 select ename, dname
  2  from emp e, dept d
  3  where d.deptno = e.deptno and e.job ='SALESMAN';

6.WADTD DNAME AND JOB FOR ALL THE EMPLOYEES WHOS JOB AND DNAME STARTS WITH CHARACTER 'S'
select dname , job
  2  from dept d, emp e
  3  where d.deptno = e.deptno and e.job like 'S%' and d.dname like 'S%';

7.WAQTD DNAME AND MGR NO FOR EMPLOYEES REPORTING TO 7839
SQL>  select dname, mgr,ename
  2    from dept d , emp e
  3     where d.deptno = e.deptno and mgr = 7839;

DNAME                 MGR ENAME
-------------- ---------- ----------
RESEARCH             7839 JONES
SALES                7839 BLAKE
ACCOUNTING           7839 CLARK

8.WAQTD DNAME AND HIREDATE FOR EMPLOYEES HIRED AFTER 83 INTO ACCOUNTING OR RESEARCH DEPT
  select dname, hiredate
  2  from dept d, emp e
  3* where d.deptno = e.deptno and hiredate <'1-JAN-83' and dname in('ACCOUNTING' ,'RESEARCH')


DNAME          HIREDATE
-------------- ---------
ACCOUNTING     17-NOV-81
ACCOUNTING     09-JUN-81
ACCOUNTING     23-JAN-82
RESEARCH       03-DEC-81
RESEARCH       17-DEC-80
RESEARCH       02-APR-81
 
9.WAQTD ENAME AND DNAME OF THE EMPLOYEES WHO ARE GETTING COMMIN DEPT 10 OR 30 
  1  select ename , dname
  2  from emp e , dept d
  3* where d.deptno = e.deptno and comm is not null and d.deptno in (10,30)


10.WAQTD DNAME AND EMPNO FOR ALL THE EMPLOYEES WHO'S EMPNO ARE (7839,7902) AND ARE WORKING IN LOC NEW YORK.


  1  select dname,empno
  2  from emp e, dept d
  3* where d.deptno = e.deptno and loc='NEW YORK'
SQL> /

DNAME               EMPNO
-------------- ----------
ACCOUNTING           7782
ACCOUNTING           7839
ACCOUNTING           7934

Find all employees whose department is not located in 'CHICAGO'. Show their name and department.

//
  1  select e.*,e.ename, d.dname
  2  from emp e, dept d
  3* where e.deptno=d.deptno and d.loc!='CHICAGO'

Write a query to get department names that have more than 2 employees./
 1   select d.dname, count(*)
  2   from emp e, dept d
  3   where e.deptno = d.deptno
  4*  group by dname

Find the total salary paid to each department. Show department name and total salary.
 1  select d.dname, sum(e.sal)
  2  from emp e , dept d
  3  where e.deptno =d.deptno
  4* group by d.dname
  5
SQL> /

DNAME          SUM(E.SAL)
-------------- ----------
ACCOUNTING           8750
RESEARCH            10875
SALES                9400


Get the names of all managers (MGRs) and the departments their subordinates belong to.

  1  select m.ename,e.ename, d.dname
  2  from emp m , emp e, dept d
  3* where e.mgr = m.empno and d.deptno = e.deptno
SQL> /

ENAME      ENAME      DNAME
---------- ---------- --------------
JONES      FORD       RESEARCH
JONES      SCOTT      RESEARCH
BLAKE      WARD       SALES
BLAKE      TURNER     SALES
BLAKE      MARTIN     SALES
BLAKE      ALLEN      SALES
BLAKE      JAMES      SALES
CLARK      MILLER     ACCOUNTING
SCOTT      ADAMS      RESEARCH
KING       BLAKE      SALES
KING       JONES      RESEARCH
KING       CLARK      ACCOUNTING
FORD       SMITH      RESEARCH

13 rows selected.

Display employees who work in the same location as 'KING'.
select *
from emp e , dept d
where e.deptno = d.deptno  and d.loc in (select loc
                                         from dept, emp
                                         where dept.deptno =emp.deptno and emp.ename ='KING')

List departments that have at least one employee with a salary greater than 3000.
 select d.dname
  2  from emp e , dept d
  3  where e.deptno = d.deptno and e.sal >3000
  4  group by dname
  5  having count(*)>=1;

Write a query to find departments that have no employees (use inner join to trick them, then explain why it's not possible).

Find employees whose department is located in the same city as that of their manager.
(Requires a self join on EMP for manager info, plus join with DEPT.)

  1  select d.dname
  2  from emp e , dept d
  3  where e.deptno = d.deptno
  4  group by dname
  5* having count(*)<1/

Display employee names along with their manager's name and department name.
 1  select e.ename as emp_name , m.ename as mgr_name,d.dname
  2  from emp e, emp m, dept d
  3* where d.deptno = e.deptno and e.mgr = m.empno
SQL> /

EMP_NAME   MGR_NAME   DNAME
---------- ---------- --------------
FORD       JONES      RESEARCH
SCOTT      JONES      RESEARCH
WARD       BLAKE      SALES
TURNER     BLAKE      SALES
MARTIN     BLAKE      SALES
ALLEN      BLAKE      SALES
JAMES      BLAKE      SALES
MILLER     CLARK      ACCOUNTING
ADAMS      SCOTT      RESEARCH
BLAKE      KING       SALES
JONES      KING       RESEARCH
CLARK      KING       ACCOUNTING
SMITH      FORD       RESEARCH

