-- PERFORMANCE COMPARISON

-- SLOWER: Correlated subquery (runs for each row)
SELECT name, salary
FROM employees e1
WHERE salary > (SELECT AVG(salary) 
                FROM employees e2 
                WHERE e2.dept_id = e1.dept_id);

-- FASTER: Using window function
SELECT name, salary
FROM (SELECT name, salary, dept_id,
             AVG(salary) OVER (PARTITION BY dept_id) as dept_avg
      FROM employees) AS emp_with_avg
WHERE salary > dept_avg;

-- WHEN TO USE SUBQUERIES:
-- 1. Filtering with aggregates
SELECT name FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);

-- 2. Existence checks
SELECT dept_name FROM departments d WHERE EXISTS (SELECT 1 FROM employees e WHERE e.dept_id = d.dept_id);

-- WHEN TO USE JOINS:
-- 1. Combining data from multiple tables
SELECT e.name, d.dept_name FROM employees e JOIN departments d ON e.dept_id = d.dept_id;
