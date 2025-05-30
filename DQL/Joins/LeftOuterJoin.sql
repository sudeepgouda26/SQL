
📄 Oracle SQL Interview Questions – LEFT OUTER JOIN Focus
1.
List all departments and the names of employees working in them.
Include departments that have no employees.
  1  select d.dname,e.ename,d.deptno
  2  from dept d , emp e
  3* where d.deptno  = e.deptno(+)

2.
Write a query to display the department name and the total number of employees in each department.
Show departments with zero employees as well.
  1  select d.dname , count(empno)
note: 
 // why empno why not * beccuse count(*) also counts the null values that if any deprtment consists of null it give the count as 1 or 2 so carefully use the count
  2  from emp e , dept d
  3  where d.deptno = e.deptno(+)
  4* group by d.dname
SQL> /

DNAME          COUNT(EMPNO)
-------------- ------------
ACCOUNTING                3
OPERATIONS                0
RESEARCH                  5
SALES                     6

SQL>

3.
Fetch the names of employees and their corresponding department names.
If an employee is not assigned to any department, display them with a NULL department.
SQL> select e.ename , d.dname
  2  from emp e, dept d
  3  where e.deptno = d.deptno(+);

ENAME      DNAME
---------- --------------
MILLER     ACCOUNTING
KING       ACCOUNTING
CLARK      ACCOUNTING
FORD       RESEARCH
ADAMS      RESEARCH
SCOTT      RESEARCH
JONES      RESEARCH
SMITH      RESEARCH
JAMES      SALES
TURNER     SALES
BLAKE      SALES
MARTIN     SALES
WARD       SALES
ALLEN      SALES


4.
Find departments where no employees are currently working.
Use a left outer join and filter appropriately.

  1  select d.dname
  2  from emp e , dept d
  3  where e.deptno(+) = d.deptno
  4  group by dname
  5* having count(e.empno)<1
SQL> /

DNAME
--------------
OPERATIONS

5.
Display all department names and the highest salary drawn by an employee in each department.
Include departments with no employees.
SQL> select d.dname,max(sal)
  2  from emp e, dept d
  3  where e.deptno(+) = d.deptno
  4  group by d.dname
  5  ;

DNAME            MAX(SAL)
-------------- ----------
ACCOUNTING           5000
OPERATIONS
RESEARCH             3000
SALES                2850


6.
Write a query to list department names and employee names for all departments,
even those without employees, using Oracle’s (+) outer join syntax.
SQL> select d.dname ,e.ename
  2  from emp e , dept d
  3  where e.deptno(+) = d.deptno;

DNAME          ENAME
-------------- ----------
ACCOUNTING     CLARK
ACCOUNTING     KING
ACCOUNTING     MILLER
RESEARCH       JONES
RESEARCH       FORD
RESEARCH       ADAMS
RESEARCH       SMITH
RESEARCH       SCOTT
SALES          WARD
SALES          TURNER
SALES          ALLEN
SALES          JAMES
SALES          BLAKE
SALES          MARTIN
OPERATIONS

15 rows selected.

7.
Explain the difference between an inner join and a left outer join using the EMP and DEPT tables.
Give example queries to support your answer./


1. Basic Left Outer Join:
Question: Write a query to retrieve all employee names and their corresponding department names, including employees who are not assigned to any department.
SQL> set lines 100 pages 100;
SQL> select e.ename ,d.dname
  2  from emp e, dept d
  3  where e.deptno(+) = d.deptno;


2. Right Outer Join:
Question: Write a query to list the department names and employee names for all departments, including departments that have no employees.
SQL> select e.ename ,d.dname
  2  from emp e, dept d
  3  where e.deptno(+) = d.deptno;

3. Left Outer Join for Employees without Departments:
Question: Write a query to find employees who are not assigned to any department, using a LEFT OUTER JOIN.SQL> select e.ename , d.dname
  2  from dept d, emp e
  3  where d.deptno(+) = e.deptno;

ENAME      DNAME
---------- --------------
MILLER     ACCOUNTING
KING       ACCOUNTING
CLARK      ACCOUNTING
FORD       RESEARCH
ADAMS      RESEARCH
SCOTT      RESEARCH
JONES      RESEARCH
SMITH      RESEARCH
JAMES      SALES
TURNER     SALES
BLAKE      SALES
MARTIN     SALES
WARD       SALES
ALLEN      SALES

14 rows selected.

4. Difference Between Left and Right Outer Joins:
Question: What is the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN?

5. Left Outer Join with Salary Filtering:
Question: Write a query to find the department names and employee names for all departments, but only show employees whose salary is greater than 3000. Departments with no employees should still be shown.

SQL> select e.ename, d.dname
  2  from emp e ,dept d
  3  where e.deptno(+) = d.deptno and e.sal >3000;

ENAME      DNAME
---------- --------------
KING       ACCOUNTING


6. Finding Departments with No Employees:
Question: Write a query to find departments that do not have any employees assigned to them, using a LEFT OUTER JOIN.
SQL> select d.dname
  2  from emp e , dept d
  3  where e.deptno(+) = d.deptno
  4  group by dname
  5  having count(empno) =0;

DNAME
--------------
OPERATIONS

7. Combining Left and Right Outer Joins:
Question: What happens when you combine a LEFT OUTER JOIN and a RIGHT OUTER JOIN in the same query?
SQL> select e.ename , d.dname
  2  from emp e , dept d
  3  where e.deptno(+) = d.deptno(+);
where e.deptno(+) = d.deptno(+)
                  *
ERROR at line 3:
ORA-01468: a predicate may reference only one outer-joined table

8. Outer Join for Hierarchical Data:
Question: In an organization, each employee has a manager (who is also an employee). Write a query to find the employee names and their manager names, including employees with no managers (such as the CEO).
  1   select e.ename , nvl(m.ename,'CEO')
  2   from emp e , emp m
  3* WHERE e.mgr = m.empno(+)
SQL> /

ENAME      NVL(M.ENAM
---------- ----------
FORD       JONES
SCOTT      JONES
JAMES      BLAKE
TURNER     BLAKE
MARTIN     BLAKE
WARD       BLAKE
ALLEN      BLAKE
MILLER     CLARK
ADAMS      SCOTT
CLARK      KING
BLAKE      KING
JONES      KING
SMITH      FORD
KING       CEO

14 rows selected.

9. Multiple Left Joins on the Same Table:
Question: Write a query that lists employees, their departments, and their managers' departments using LEFT OUTER JOIN multiple times on the same table.
  1  select e.ename, d.dname, m.ename as manager
  2  from emp e, emp m, dept d
  3* where e.mgr = m.empno(+) and d.deptno = e.deptno(+)
SQL> /

ENAME      DNAME          MANAGER
---------- -------------- ----------
SCOTT      RESEARCH       JONES
FORD       RESEARCH       JONES
MARTIN     SALES          BLAKE
JAMES      SALES          BLAKE
ALLEN      SALES          BLAKE
TURNER     SALES          BLAKE
WARD       SALES          BLAKE
MILLER     ACCOUNTING     CLARK
ADAMS      RESEARCH       SCOTT
BLAKE      SALES          KING
JONES      RESEARCH       KING
CLARK      ACCOUNTING     KING
SMITH      RESEARCH       FORD
           OPERATIONS
KING       ACCOUNTING

15 rows selected.

10. Left Outer Join with Aggregate Functions:
Question: Write a query to show the department names and the total salary of employees in each department. Show departments with no employees as well.
SQL> select d.dname ,sum(sal)
  2  from emp e, dept d
  3  where e.deptno(+) = d.deptno
  4  group by d.dname;

DNAME            SUM(SAL)
-------------- ----------
ACCOUNTING           8750
OPERATIONS
RESEARCH            10875
SALES                9400

11. Finding Employees in the Same Department as a Specific Employee:
Question: Write a query to find all employees who work in the same department as 'KING', including employees with no department assigned.
 1  select e.ename, d.dname
  2  from emp e, dept d
  3  where e.deptno= d.deptno(+) and e.deptno in(select deptno
  4* from emp where ename ='KING')


12. Right Outer Join for Missing Data:
Question: Using a RIGHT OUTER JOIN, write a query to list all departments and the names of employees working in them. Include departments with no employees.
  2  from emp e, dept d
  3  where e.deptno(+) = d.deptno;

DNAME          ENAME
-------------- ----------
ACCOUNTING     CLARK
ACCOUNTING     KING
ACCOUNTING     MILLER
RESEARCH       JONES
RESEARCH       FORD
RESEARCH       ADAMS
RESEARCH       SMITH
RESEARCH       SCOTT
SALES          WARD
SALES          TURNER
SALES          ALLEN
SALES          JAMES
SALES          BLAKE
SALES          MARTIN
OPERATIONS

13. Employee Details and Manager Information:
Question: Using a LEFT OUTER JOIN, write a query to fetch employee names, their department names, and their managers' names.
ENAME      DNAME          MGR
---------- -------------- ----------
SCOTT      RESEARCH       JONES
FORD       RESEARCH       JONES
ALLEN      SALES          BLAKE
WARD       SALES          BLAKE
MARTIN     SALES          BLAKE
TURNER     SALES          BLAKE
JAMES      SALES          BLAKE
MILLER     ACCOUNTING     CLARK
ADAMS      RESEARCH       SCOTT
BLAKE      SALES          KING
JONES      RESEARCH       KING
CLARK      ACCOUNTING     KING
SMITH      RESEARCH       FORD
KING       ACCOUNTING


14. Left Join for Including Null Values:
Question: Write a query to display employees who work in departments that have no employees, using a LEFT OUTER JOIN.
 1  select d.dname
  2  from emp e, dept d
  3  where e.deptno(+) = d.deptno
  4  group by d.dname
  5* having count(empno) = 0

15. Using Left Outer Join to Detect Missing Information:
Question: Write a query to find departments where no employees are currently working, using LEFT OUTER JOIN and filtering appropriately.
  select d.dname
  2  from emp e, dept d
  3  where e.deptno(+) = d.deptno
  4  group by d.dname
  5* having count(empno) = 0

These questions focus on testing knowledge and practical understanding of outer joins in SQL, including the LEFT OUTER JOIN and RIGHT OUTER JOIN.

