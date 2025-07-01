-- SUBQUERIES WITH IN and EXISTS

-- 1. Using IN - employees in specific departments
SELECT name, salary
FROM employees
WHERE dept_id IN (SELECT dept_id 
                  FROM departments 
                  WHERE location IN ('New York', 'Boston'));

-- 2. Using EXISTS - departments with projects
SELECT dept_name
FROM departments d
WHERE EXISTS (SELECT 1 
              FROM projects p 
              WHERE p.dept_id = d.dept_id);

-- 3. Using NOT EXISTS - departments without projects
SELECT dept_name
FROM departments d
WHERE NOT EXISTS (SELECT 1 
                  FROM projects p 
                  WHERE p.dept_id = d.dept_id);

-- 4. Managers (employees who manage others)
SELECT name
FROM employees e1
WHERE EXISTS (SELECT 1 
              FROM employees e2 
              WHERE e2.manager_id = e1.emp_id);
