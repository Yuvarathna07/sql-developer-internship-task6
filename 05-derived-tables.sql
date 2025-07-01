-- DERIVED TABLES (subqueries in FROM clause)

-- 1. Department statistics
SELECT dept_name, emp_count, avg_salary
FROM (SELECT d.dept_name,
             COUNT(e.emp_id) as emp_count,
             AVG(e.salary) as avg_salary
      FROM departments d
      LEFT JOIN employees e ON d.dept_id = e.dept_id
      GROUP BY d.dept_id, d.dept_name) AS dept_stats;

-- 2. Top salary employees
SELECT name, salary, salary_rank
FROM (SELECT name, salary,
             RANK() OVER (ORDER BY salary DESC) as salary_rank
      FROM employees) AS ranked_emp
WHERE salary_rank <= 2;

-- 3. Project budget analysis
SELECT project_name, budget, budget_category
FROM (SELECT project_name, budget,
             CASE 
                WHEN budget > 100000 THEN 'High'
                WHEN budget > 75000 THEN 'Medium'
                ELSE 'Low'
             END as budget_category
      FROM projects) AS categorized_projects;
