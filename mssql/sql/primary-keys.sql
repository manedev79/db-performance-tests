SET STATISTICS PROFILE ON;
GO

/* Only uses the index. No table access (Index Seek) */
SELECT employee_id
FROM employees
WHERE employee_id = 5;
GO

/* Uses the index then table access by RID (Index Seek) */
SELECT first_name, last_name
FROM employees
WHERE employee_id = 5;
GO

/* Full table scan (Index Scan) */
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hans';
GO

SET STATISTICS PROFILE OFF;
GO