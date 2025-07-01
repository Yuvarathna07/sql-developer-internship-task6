# SQL Developer Internship - MySQL Subqueries

## Quick Setup
1. Run scripts 01-08 in MySQL Workbench
2. Each script demonstrates key subquery concepts
3. Total execution time: ~5 minutes

## Key Concepts

### 1. Scalar Subqueries
- Return single value
- Used in SELECT/WHERE clauses
```sql
SELECT name FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);
```

### 2. Correlated Subqueries
- Inner query uses outer query data
```sql
SELECT name FROM employees e1 
WHERE salary > (SELECT AVG(salary) FROM employees e2 WHERE e2.dept_id = e1.dept_id);
```

### 3. IN/EXISTS Operators
```sql
-- IN for multiple values
SELECT name FROM employees WHERE dept_id IN (SELECT dept_id FROM departments WHERE location = 'New York');

-- EXISTS for existence check
SELECT dept_name FROM departments d WHERE EXISTS (SELECT 1 FROM employees e WHERE e.dept_id = d.dept_id);
```

### 4. Derived Tables
```sql
SELECT * FROM (SELECT name, salary FROM employees WHERE salary > 60000) AS high_earners;
```



## Performance Tips
- Use JOINs for combining data
- Use subqueries for filtering with aggregates
- Avoid correlated subqueries with large datasets
- Consider window functions as alternatives
``
