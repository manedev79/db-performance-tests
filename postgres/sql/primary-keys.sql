/* Only uses the index. No table access (Index Only Scan) */
EXPLAIN
SELECT employee_id
FROM employees
WHERE employee_id = 5;

/* Uses the index then table access by rowid (Index Scan) */
EXPLAIN
SELECT first_name, last_name
FROM employees
WHERE employee_id = 5;

/* Full table scan (Seq Scan) */
EXPLAIN
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hans';
