-- COMPLEX NESTED QUERIES

-- 1. Employees in highest paying department
SELECT name, salary
FROM employees
WHERE dept_id = (SELECT dept_id
                 FROM (SELECT dept_id, AVG(salary) as avg_sal
                       FROM employees
                       GROUP BY dept_id
                       ORDER BY avg_sal DESC
                       LIMIT 1) AS top_dept);

-- 2. Above average performers in their department
SELECT e.name, e.salary, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE e.salary > (SELECT AVG(salary)
                  FROM employees
                  WHERE dept_id = e.dept_id)
AND e.dept_id IN (SELECT dept_id
                  FROM projects
                  WHERE budget > 75000);

-- 3. Multi-level filtering
SELECT name
FROM employees
WHERE dept_id IN (SELECT dept_id
                  FROM departments
                  WHERE dept_id IN (SELECT dept_id
                                    FROM projects
                                    WHERE budget > (SELECT AVG(budget) 
                                                    FROM projects)));
