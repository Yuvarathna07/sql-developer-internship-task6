-- MySQL Database Setup for Subqueries Task
CREATE DATABASE IF NOT EXISTS subquery_demo;
USE subquery_demo;

-- Create tables
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(8,2),
    manager_id INT
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    budget DECIMAL(10,2),
    dept_id INT
);

-- Insert sample data
INSERT INTO departments VALUES 
(1, 'IT', 'New York'),
(2, 'HR', 'Boston'),
(3, 'Sales', 'Chicago');

INSERT INTO employees VALUES 
(101, 'John', 1, 75000, NULL),
(102, 'Sarah', 1, 65000, 101),
(103, 'Mike', 2, 55000, NULL),
(104, 'Lisa', 2, 50000, 103),
(105, 'Tom', 3, 60000, NULL);

INSERT INTO projects VALUES 
(1, 'Website', 100000, 1),
(2, 'Training', 50000, 2),
(3, 'CRM System', 150000, 3);
