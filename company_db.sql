USE company_db;


-- Write a SQL query to display EmployeeID, FirstName, LastName,
-- and DepartmentName for employees who belong to a department.

SELECT  employees.EmployeeID, employees.FirstName,
employees.LastName,departments.DepartmentName
FROM employees INNER JOIN departments ON 
employees.DepartmentID = departments.DepartmentID;

-- Q2. Write a SQL query to display EmployeeID, FirstName, and Salary
-- for employees who have a salary record.

SELECT e.EmployeeID,e.FirstName,s.salary
FROM employees e INNER JOIN salaries s 
ON e.EmployeeID = s.EmployeeID;

-- Q3. Write a SQL query to display EmployeeID, FirstName,
-- and DepartmentName for all employees,
-- even if they do not belong to any department.

SELECT e.EmployeeID,e.FirstName , d.DepartmentName
FROM  employees e LEFT JOIN departments d
ON e.DepartmentID = d. DepartmentID;


-- Q4. Write a SQL query to display all departments along with employees
-- working in them. Departments without employees should also appear.
CREATE VIEW v1 AS (
SELECT e.DepartmentID , e.FirstName ,d.DepartmentName
FROM employees e RIGHT JOIN departments d 
ON e.DepartmentID = d.DepartmentID);

SELECT * FROM v1; 
DROP VIEW v1;


-- Q5. Write a SQL query to display EmployeeID, FirstName,
-- DepartmentName, and Salary for employees who have both
--  department and salary information.

SELECT e.EmployeeID,e.FirstName,d.DepartmentName,s.salary
FROM employees e INNER JOIN departments d
ON e.DepartmentID = d.DepartmentID
INNER JOIN salaries s
ON e.EmployeeID = s.EmployeeID;

-- Q13. Write a SQL query to generate all possible combinations
-- of employees and departments.
SELECT e.*,d.*
FROM employees e 
CROSS JOIN departments d ;

-- Q14. Write a SQL query using SELF JOIN to display pairs of employees
-- who work in the same department.	

SELECT e1.EmployeeID , e1.FirstName,e2.DepartmentID 
FROM employees e1 JOIN employees e2
ON e1.DepartmentID = e2.DepartmentID
AND e1.EmployeeID > e2.EmployeeID;

