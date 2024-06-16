CREATE database employeemanagementsystem;

USE employeemanagementsystem;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);
INSERT INTO departments (department_id, department_name)
VALUES
(1, 'Engineering'),
(2, 'Human Resources'),
(3, 'Marketing'),
(4, 'Finance');

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    department_id INT,
    hire_date DATE NOT NULL
);
INSERT INTO employee (employee_id, first_name, last_name, department_id, hire_date)
VALUES
(101, 'Alice', 'Smith', 1, '2023-01-15'),
(102, 'Bob', 'Johnson', 2, '2022-06-20'),
(103, 'Carol', 'Williams', 3, '2021-11-30'),
(104, 'David', 'Brown', 1, '2022-12-05'),
(105, 'Eve', 'Jones', 4, '2023-03-10');


CREATE TABLE salaries (
    employee_id INT,
    salary DECIMAL(10, 2) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE
);
INSERT INTO salaries (employee_id, salary, from_date, to_date)
VALUES
(101, 75000, '2023-01-15', NULL),
(102, 65000, '2022-06-20', NULL),
(103, 80000, '2021-11-30', NULL),
(104, 70000, '2022-12-05', NULL),
(105, 90000, '2023-03-10', NULL);

SELECT * FROM employee
WHERE YEAR(hire_date) = YEAR(CURDATE()) - 1;

SELECT d.department_name, SUM(s.salary) AS total_salary_expenditure
FROM employee e
JOIN departments d ON e.department_id = d.department_id
JOIN salaries s ON e.employee_id = s.employee_id
GROUP BY d.department_name;

SELECT e.employee_id, e.first_name, e.last_name, d.department_name, s.salary
FROM employee e
JOIN departments d ON e.department_id = d.department_id
JOIN salaries s ON e.employee_id = s.employee_id
ORDER BY s.salary DESC
LIMIT 5;
