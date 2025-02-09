To solve this issue, use a deterministic function instead or rewrite the query to not rely on a non-deterministic function.  If a random sample is needed, generate the random numbers separately and use them in a subquery or CTE.

```sql
--Example using a subquery to generate random numbers
WITH RandomEmployees AS (
    SELECT employee_id
    FROM employees
    ORDER BY NEWID()
    OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY --Get 10 random employees
)
SELECT * 
FROM employees
WHERE employee_id IN (SELECT employee_id FROM RandomEmployees);
```