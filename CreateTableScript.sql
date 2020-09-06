---DROP TABLES
DROP TABLE IF EXISTS Dept_Emp;
DROP TABLE IF EXISTS Dept_Manager;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Salary;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Title;

--CREATE TABLES 

--Title Table
CREATE TABLE Title
(
	title_id  VARCHAR(10) PRIMARY KEY,
	title VARCHAR(20)
);

--Departments Table
Create Table Departments
( 
	dept_no VARCHAR(10) PRIMARY KEY,
 	dept_name VARCHAR(30)
);

--Employee Table
CREATE TABLE Employee
(
	emp_no INT PRIMARY KEY, 
	emp_title_id  VARCHAR(10) references Title(title_id),
	birth_date VARCHAR(20),
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex CHAR(1),
	hire_date VARCHAR(20)
);

--Dept Emp Table
CREATE TABLE Dept_Emp
(
	emp_no INT references Employee(emp_no), 
	dept_no  VARCHAR(10) references Departments(dept_no)
);

--Dept Manager Table
CREATE TABLE Dept_Manager
(
	dept_no  VARCHAR(10) references Departments(dept_no),
	emp_no INT references Employee(emp_no)
	
);

--Salary Table
CREATE TABLE Salary
(
	emp_no INT references Employee(emp_no), 
	salary INT
);






