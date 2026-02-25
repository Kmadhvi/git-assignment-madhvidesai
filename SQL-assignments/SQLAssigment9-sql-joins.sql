use SQLAssignments

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    manager_name VARCHAR(50) NOT NULL
)

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    dept_id INT NULL,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
)

INSERT INTO Departments VALUES
(1, 'Development', 'Suresh'),
(2, 'QA', 'Ramesh'),
(3, 'HR', 'Suresh'),
(4, 'Finance', 'Anita')

INSERT INTO Employees VALUES
(101, 'Amit', 60000, 1),
(102, 'Neha', 55000, 2),
(103, 'Rahul', 70000, 1),
(104, 'Priya', 50000, 3),
(105, 'Karan', 45000, NULL), 
(106, 'Sneha', 80000, 4)


/*1. List all employees and their department names.*/

SELECT e.emp_name, d.dept_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id


/*2. List all employees and their department names, including employees
     who are not assigned to any department.*/

SELECT e.emp_name, d.dept_name
FROM Employees e
LEFT JOIN Departments d ON e.dept_id = d.dept_id


/*3. List all departments and the number of employees in each department.*/

SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name


/*4. Find the employee with the highest salary.*/

SELECT *
FROM Employees
WHERE salary = (SELECT MAX(salary) FROM Employees)


/*5. List all employees who work in the QA department.*/

SELECT e.emp_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
WHERE d.dept_name = 'QA'


/*6. List all departments managed by 'Suresh'.*/

SELECT *
FROM Departments
WHERE manager_name = 'Suresh'


/*7. List all employees who work in departments managed by 'Suresh'.*/

SELECT e.emp_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
WHERE d.manager_name = 'Suresh'
