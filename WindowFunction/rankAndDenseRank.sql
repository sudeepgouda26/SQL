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

Write a query to fetch the top 3 highest salaries using DENSE_RANK().

Show how RANK() and DENSE_RANK() produce different results on duplicate salaries.

Write a query to get the 5th highest salary using DENSE_RANK().

How would you rank employees by salary within each department?

How can you find employees who share the same rank within their department?

Write a query to find duplicate salaries using DENSE_RANK().

Demonstrate the difference between ROW_NUMBER(), RANK(), and DENSE_RANK() with a salary example.

Write a query to fetch employees with the second highest salary using RANK().

How would you filter only the top N rows per group using DENSE_RANK()?