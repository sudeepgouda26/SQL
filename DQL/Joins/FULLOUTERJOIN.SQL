----------------------------------------------------------------FULL OUTER JOIN-------------------------------------------------

1>What is a FULL OUTER JOIN? How is it different from LEFT and RIGHT OUTER JOIN?
Feature                  	LEFT JOIN	               RIGHT JOIN	                      FULL OUTER JOIN
Returns all 
rows from…	               Left table	               Right table	                         Both tables
   
matches rows 
from…
	                 Right table (if match exists)	  Left table (if match exists)	                Both sides (if match exists)


Fills NULLs 
when…	                      No match in right table	     No match in left table              	No match in either left or right



---------------------------------------------------------------------------------------------------------------------------------------------

2>Matching and Non-Matching Rows

Write a query to display all employees and all departments — including:

Employees without departments, and

Departments with no employees.
SQL> SELECT ENAME , DNAME
  2  FROM EMP E FULL JOIN DEPT D
  3  ON E.DEPTNO  = D.DEPTNO;

ENAME      DNAME
---------- --------------
SMITH      RESEARCH
ALLEN      SALES
WARD       SALES
JONES      RESEARCH
MARTIN     SALES
BLAKE      SALES
CLARK      ACCOUNTING
SCOTT      RESEARCH
KING       ACCOUNTING
TURNER     SALES
ADAMS      RESEARCH
JAMES      SALES
FORD       RESEARCH
MILLER     ACCOUNTING
           OPERATIONS

15 rows selected.
-------------------------------------------------------------------------------------------3>Unmatched Rows Identification

Write a query to display only unmatched rows between EMP and DEPT using FULL OUTER JOIN (i.e., where e.deptno IS NULL or d.deptno IS NULL).SELECT e.empno, e.ename, d.deptno, d.dname
FROM emp e
FULL OUTER JOIN dept d
ON e.deptno = d.deptno
WHERE e.deptno IS NULL OR d.deptno IS NULL;
-----------------------------------------------------------------------------------------
4>  Find Orphaned Data

Using FULL OUTER JOIN, find all employees who don’t belong to a department and all departments that have no employees.
 1  SELECT ENAME, D.DEPTNO, DNAME, EMPNO
  2  FROM DEPT D FULL JOIN EMP E
  3  ON D.DEPTNO = E.DEPTNO
  4* WHERE D.DEPTNO IS NULL OR E.DEPTNO IS NULL
SQL> /

ENAME          DEPTNO DNAME               EMPNO
---------- ---------- -------------- ----------
                   40 OPERATIONS

-----------------------------------------------------55E5352243252----74332----

Coalesce with FULL OUTER JOIN

Show how you would use COALESCE() with FULL OUTER JOIN to handle NULL values when combining data from both tables.
  1  SELECT COALESCE(ENAME,'NULL'), COALESCE(D.DEPTNO,0), COALESCE(DNAME, 'NODNAME'), COALESCE(EMPNO,0)
  2  FROM DEPT D FULL JOIN EMP E
  3  ON D.DEPTNO = E.DEPTNO
  4* WHERE D.DEPTNO IS NULL OR E.DEPTNO IS NULL
SQL> /

COALESCE(E COALESCE(D.DEPTNO,0) COALESCE(DNAME COALESCE(EMPNO,0)
---------- -------------------- -------------- -----------------
NULL                         40 OPERATIONS                     0

SQL>
---------------------------------------------------------------------------------------

Simulating FULL OUTER JOIN

How would you simulate FULL OUTER JOIN in a system (like older versions of MySQL) that doesn’t support it natively?

-- LEFT JOIN: All EMP, matching DEPT (or NULL)
SELECT e.empno, e.ename, d.deptno, d.dname
FROM emp e
LEFT JOIN dept d ON e.deptno = d.deptno

UNION

-- RIGHT JOIN: All DEPT, matching EMP (or NULL)
SELECT e.empno, e.ename, d.deptno, d.dname
FROM emp e
RIGHT JOIN dept d ON e.deptno = d.deptno;




Multiple FULL OUTER JOINS

Can you perform a FULL OUTER JOIN on more than two tables? If so, what are the considerations?
✅ YES, It’s Possible
You just need to chain the FULL OUTER JOINs carefully.

🔧 Example Syntax:
sql
Copy
Edit
SELECT *
FROM table1
FULL OUTER JOIN table2 ON table1.id = table2.id
FULL OUTER JOIN table3 ON COALESCE(table1.id, table2.id) = table3.id;
🧠 Considerations When Using Multiple FULL OUTER JOINs:
Null-safe joins:
Use COALESCE() to combine keys from previously joined tables — this ensures unmatched rows still get a chance to join.

Result complexity:
FULL OUTER JOIN increases result size — so multiple joins can lead to lots of NULLs and a wider, messier table.

Performance:
These joins are more expensive — especially with big tables — since both unmatched and matched rows are returned.

Readability:
Always alias your tables and columns well — or the logic can get hard to maintain.

NULL conflicts:
Be cautious: fields from different tables with the same name but NULL values can cause confusion.

🔍 Example Use Case:
Suppose you're merging customer orders, payments, and support tickets, and you want to see all data, whether related or not:

sql
Copy
Edit
SELECT *
FROM customers c
FULL OUTER JOIN orders o ON c.cust_id = o.cust_id
FULL OUTER JOIN payments p ON COALESCE(c.cust_id, o.cust_id) = p.cust_id
FULL OUTER JOIN tickets t ON COALESCE(c.cust_id, o.cust_id, p.cust_id) = t.cust_id;

