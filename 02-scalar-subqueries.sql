-- SCALAR SUBQUERIES (return single value)

-- 1. Employees earning above average
SELECT name, salary 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 2. Show salary vs company average
SELECT name, salary,
       (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees;

-- 3. Highest paid in each department
SELECT name, salary, dept_id
FROM employees e1
WHERE salary = (SELECT MAX(salary) 
                FROM employees e2 
                WHERE e2.dept_id = e1.dept_id);
