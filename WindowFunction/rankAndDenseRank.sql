 Conceptual Questions
What is the difference between RANK() and DENSE_RANK() in Oracle?
in rank if the record are duplicated it will assign the same rank and it will skip the next rank but incase of dense rank it will assign same rank for the duplicate records but not skips the rank

When do RANK() and DENSE_RANK() produce the same result?
when there is no duplicaterecords

What happens to the ranking if there are duplicate values in the ordered column?
it will assign same rank

Can RANK() or DENSE_RANK() be used in the WHERE clause? Why or why not?
no

How does RANK() handle ties in the ranking column?


What are the use cases where DENSE_RANK() is preferred over RANK()?
if we want continuous ranking without skiping the rank then we should go for dense rank

Can you explain how the PARTITION BY clause works with RANK() and DENSE_RANK()?

take example of deprtment table if there is deptmrntno 10 20 30 it will make group for dept 10  which are working on dept 10 same for 20 30 and it will assign rank 1234 for dept 20 rank will start from 1234

What is the default ordering of RANK() if no ORDER BY is specified?
we cant assign rank without ordreby or partition by

How is ROW_NUMBER() different from RANK() and DENSE_RANK()?

What are the performance considerations of using ranking functions in large datasets?



🔹 Query-Based Scenario Questions
Write a query to fetch the top 3 highest salaries using RANK().
 1  select * from (select emp.*,  rank() over(order by sal desc ) as rank from emp)
  2* where rank <=3
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO           RANK
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7839 KING       PRESIDENT            17-NOV-81       5000               10           1
      7788 SCOTT      ANALYST         7566 19-APR-87       3000               20           2
      7902 FORD       ANALYST         7566 03-DEC-81       3000               20           2

Write a query to fetch the top 3 highest salaries using DENSE_RANK().

  1  select * from(select emp.*, dense_rank() over(order by sal) as rank from emp)
  2* where rank in (1,2,3)
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO           RANK
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7900 JAMES      CLERK           7698 03-DEC-81        950               30           1
      7369 SMITH      SECURITY        7902 17-DEC-80        990               20           2
      7876 ADAMS      CLERK           7788 23-MAY-87       1100               20           3


Show how RANK() and DENSE_RANK() produce different results on duplicate salaries.

Write a query to get the 5th highest salary using DENSE_RANK().

  1  select * from(select emp.*, dense_rank() over(order by sal desc) as rank from emp)
  2* where rank =5
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO           RANK
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7782 CLARK      MANAGER         7839 09-JUN-81       2450               10           5


How would you rank employees by salary within each department?

  1  select *
  2* from (select emp.*, dense_rank() over(partition by deptno order by sal desc) as rank from emp)
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO           RANK
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7839 KING       PRESIDENT            17-NOV-81       5000               10           1
      7782 CLARK      MANAGER         7839 09-JUN-81       2450               10           2
      7934 MILLER     CLERK           7782 23-JAN-82       1300               10           3
      7788 SCOTT      ANALYST         7566 19-APR-87       3000               20           1
      7902 FORD       ANALYST         7566 03-DEC-81       3000               20           1
      7566 JONES      MANAGER         7839 02-APR-81       2975               20           2
      7876 ADAMS      CLERK           7788 23-MAY-87       1100               20           3
      7369 SMITH      SECURITY        7902 17-DEC-80        990               20           4
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850               30           1
      7499 ALLEN      SECURITY        7698 20-FEB-81       1600        300    30           2
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0    30           3
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400    30           4
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500    30           4
      7900 JAMES      CLERK           7698 03-DEC-81        950               30           5

How can you find employees who share the same rank within their department?

Write a query to find duplicate salaries using DENSE_RANK().

Demonstrate the difference between ROW_NUMBER(), RANK(), and DENSE_RANK() with a salary example.

Write a query to fetch employees with the second highest salary using RANK().

/