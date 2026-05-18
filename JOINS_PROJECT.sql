USE company_db;
-- =========================================
-- SQL JOIN & SET OPERATIONS PROJECT.
-- =========================================

-- Q1. Write a SQL query to display EmployeeID, FirstName, LastName,
-- and DepartmentName for employees who belong to a department.

SELECT employees.EmployeeID , employees.FirstName,employees.LastName
,departments.DepartmentName
FROM employees INNER JOIN departments
ON employees.DepartmentID = departments.DepartmentID;



-- Q2. Write a SQL query to display EmployeeID, FirstName, and Salary
-- for employees who have a salary record.

SELECT employees.EmployeeID , employees.FirstName, salaries.salary
FROM employees INNER JOIN salaries
ON employees.EmployeeID = salaries.EmployeeID;





-- Q3. Write a SQL query to display EmployeeID, FirstName,
-- and DepartmentName for all employees, even if they do not belong to any department.


SELECT employees.EmployeeID , employees.FirstName, departments.DepartmentName 
FROM employees  LEFT JOIN departments
ON employees.DepartmentID = departments.DepartmentID;



-- Q4. Write a SQL query to display all departments along with employees
-- working in them. Departments without employees should also appear.

SELECT e.EmployeeID,e.FirstName,e.LastName , d.DepartmentName 
FROM employees e RIGHT JOIN departments d
ON e.DepartmentID  = d.DepartmentID;



-- Q5. Write a SQL query to display EmployeeID, FirstName,
-- DepartmentName, and Salary for employees who have both
-- department and salary information.

SELECT e.EmployeeID , e.FirstName,d.DepartmentName,s.salary 
FROM employees e INNER JOIN departments d
ON e.DepartmentID = d.DepartmentID 
INNER JOIN salaries s
ON s.EmployeeID = e.EmployeeID;





-- Q6. Write a SQL query to display all employees and their salary.
-- Employees without salary should also appear.

SELECT e.EmployeeID , e.FirstName,e.LastName,s.salary
FROM employees e LEFT JOIN salaries s 
ON e.EmployeeID = s.EmployeeID;





-- Q7. Write a SQL query to display employees who do not have a salary record. (not cleared)

SELECT e.EmployeeID,e.FirstName, e.LastName
FROM employees e LEFT JOIN salaries s 
ON e.EmployeeID = s.EmployeeID
WHERE s.EmployeeID IS NULL;




-- Q8. Write a SQL query to display all departments and employees working in them.
-- Departments with no employees should also be displayed.

SELECT e.EmployeeID , e.FirstName , d.DepartmentName
FROM employees e RIGHT JOIN departments d 
ON e.DepartmentID = d.DepartmentID;



-- Q9. Write a SQL query using UNION to combine
-- the FirstName of employees and the DepartmentName from departments.

SELECT FirstName AS Name
FROM employees

UNION

SELECT DepartmentName
FROM departments;

-- Q10. Write a SQL query using UNION ALL to combine
-- the FirstName of employees and DepartmentName.

SELECT FirstName AS Name 
FROM employees

UNION ALL 

SELECT DepartmentName AS dept_name
FROM departments; 




-- Q11. Write a SQL query to display EmployeeID from employees
-- and EmployeeID from salaries using UNION.

SELECT EmployeeID 
FROM employees 

UNION 
SELECT EmployeeID
FROM salaries;

 -- Q12. Write a SQL query to find employees who appear
 -- in both employees and salaries tables (common EmployeeID).
 
 SELECT e.FirstName, e.EmployeeID ,s.salary
 FROM employees e INNER JOIN salaries s
 ON e.EmployeeID = s.EmployeeID;

-- Q13. Write a SQL query to generate all possible combinations
-- of employees and departments.

SELECT e.*,d.* 
FROM employees e 
CROSS JOIN departments d;



-- Q14. Write a SQL query using SELF JOIN to display pairs of employees
-- who work in the same department.

SELECT e1.FirstName , e2.FirstName ,e1.EmployeeID FROM
employees e1 JOIN employees e2
ON e1.DepartmentID = e2.DepartmentID
AND e1.EmployeeID > e2.EmployeeID;