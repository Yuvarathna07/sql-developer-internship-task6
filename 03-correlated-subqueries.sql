-- CORRELATED SUBQUERIES (inner query uses outer query data)

-- 1. Employees earning above their department average
SELECT e1.name, e1.salary, d.dept_name
FROM employees e1
JOIN departments d ON e1.dept_id = d.dept_id
WHERE e1.salary > (SELECT AVG(e2.salary)
                   FROM employees e2
                   WHERE e2.dept_id = e1.dept_id);

-- 2. Departments with above-average budgets
SELECT dept_name
FROM departments d
WHERE EXISTS (SELECT 1 
              FROM projects p 
              WHERE p.dept_id = d.dept_id 
              AND p.budget > (SELECT AVG(budget) FROM projects));
