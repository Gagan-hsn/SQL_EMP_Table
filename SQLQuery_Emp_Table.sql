DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Employee;


create TABLE Department( DeptID int primary KEY,DeptName varchar(50));

-- creating Department table
create TABLE Employee(EmpID INT primary Key,EmpName varchar(100),Salary decimal(10,2),DeptID INT,ManagerID INT,DateOfJoining date);

INSERT INTO Department VALUES(1,'HR'),(2,'Finance'),(3,'IT');

INSERT INTO Employee VALUES
(1001,'Gagan',95000,3,null,'2025-07-31'),
(1002,'Ravi',90000,2,1001,'2022-07-31'),
(1003,'Vaishu',30000,3,1001,'2024-07-31'),
(1004,'Akash',70000,3,1002,'2021-07-31'),
(1005,'Nachin',40000,1,null,'2020-07-31');

Select * from Department;
Select * from Employee;

--Implement scalar function
 
SELECT EmpName,Len(EmpName) As NameLength from Employee;

SELECT EmpName, round(Salary,-3) AS RoundedSalary from Employee;

select GETDATE() AS CurrentDate;

--Aggregate Functions

Select COUNT(*) AS TotalEmployees from Employee;
Select round(avg(Salary),-2) AS AverageSalary from Employee;
Select max(Salary) AS MaxSalary from Employee;

-- Joins 
--Inner Joins : Returns only matching rows from both table 

Select E.EmpName, D.DeptName
FROM Employee E
INNER JOIN Department D ON E.DeptID = D.DeptID;
-- Left Joins : returns all rows from the left table and matched rows from the right table 

Select E.EmpName, D.DeptName
FROM Employee E 
LEFT JOIN  Department D ON E.DeptID = D.DeptID; 
-- Right Joins: returns alll rows from the right table  and matched rows from the left

Select E.EmpName , D.DeptName
FROM Employee E

right JOIN Department D ON E.DeptID = D.DeptID;

-- Full Joins : Returns all rows where there is a match in one of the table 

Select E.EmpName , D.DeptName
FROM Employee E
FUll OUTER JOIN Department D ON E.DeptID = D.DeptID;

-- Self join : a table is joined with itself, ofthe using aliases.
-- Here we are returning Emp- > Manager mapping 
Select E1.EmpName AS Employee, E2.EmpName AS Manager
FROM Employee E1
LEFT JOIN  Employee E2  ON E1.ManagerID = E2.EmpID;
-- cross join : returns the cartsian product of two table(All possible combination)
SELECT EmpName, DeptName FROM Employee cross join Department;









