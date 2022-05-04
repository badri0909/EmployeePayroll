--UC1
create database payroll_service;

use payroll_service;

--UC2
create table employee_payroll(
id int,
name varchar(100),
salary int,
start_date Date);

--UC3
insert into employee_payroll values (101,'badri','52000','2022/01/01'),
(304,'Carmel','58000','2021/05/14');

--UC4
select * from employee_payroll;

--UC5
--INSERTING FEW RECORD
insert into employee_payroll values (201,'hemanth','91050','2019/01/01'),
(201,'Shahan','95050','2018/01/08'),
(201,'Samantha','81050','2020/01/01'),
(204,'Raphael','80000','2020/05/14');

--searching for employee name is bill
select salary from employee_payroll where name='Shahan';

--searching name and salary for people how join from 2018-01-01
select name,salary from employee_payroll where start_date between CAST('2018-01-01' AS date) and GETDATE();

--UC6
Alter table employee_payroll add gender char;

update employee_payroll set gender='M' where name='Donald' or name='Carmel' or name='Nishanth' or name='Shahan' or name='Raphael';
update employee_payroll set gender='F' where name='Samantha';

Select * from employee_payroll;

--UC7
--Average
select AVG(salary) from employee_payroll;
--Sum 
select SUM(salary) from employee_payroll;
--Minimum
select MIN(salary) from employee_payroll;
--Maximum
select MAX(salary) from employee_payroll;
--Count
select COUNT(salary) from employee_payroll;
-- Group by 
SELECT SUM(salary) FROM employee_payroll
WHERE gender = 'F' GROUP BY gender;
SELECT SUM(salary) FROM employee_payroll
WHERE gender = 'M' GROUP BY gender;

----UC 8
--Alter table employee_payroll add address varchar(255) default 'TBS'; 
--Alter table employee_payroll add phonenumber varchar(255);
--Alter table employee_payroll add department varchar(255) not null default 'bench';

----UC9
--Alter table employee_payroll add basicPay float, Deduction float, TaxablePay float, IncomeTax float, NeyPay float;
--Update employee_payroll 
--set Deduction=1000
--where Gender='F';
--Update employee_payroll 
--set Deduction=2000
--where Gender='M';
--update employee_payroll
--set NeyPay=(BasicPay - Deduction);
--update employee_payroll
--set TaxablePay=0,IncomeTax=0
--select * from employee_payroll;

----UC10
--insert into employee_payroll values
--(901,'Terissa',2000000, '2018-01-03' , 'F','New York',9762003699,'Marketting',  3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00)
--, (911,'Terissa',2500000, '2018-01-03' , 'F','New York',9092003699,'Sales',  3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00);
--select * from employee_payroll where name='Terisa';

--------- Implement the ER Diagram into Payroll Service DB UC-11 ------
----UC 11
--CREATE TABLE Company(
--CompanyID int identity(1,1) PRIMARY KEY,
--CompanyName varchar(100) not null);

--CREATE TABLE Department(
--DepartmentID int identity(1,1) PRIMARY KEY,
--DepartmentName varchar(100) not null);

--CREATE TABLE employee(
--ID int identity(1,1) PRIMARY KEY,
--EmployeeName varchar(100) NOT NULL,
--EmployeePhoneNumber int not null,
--EmployeeAddress varchar(255),
--EmployeeGender char(1),
--EmployeeJoining date,
--Fk_CompanyID int,
--Foreign key(Fk_CompanyID) REFERENCES Company(CompanyID)
--);

--CREATE TABLE Payment(
--PaymentID int identity(1,1) PRIMARY KEY,
--Fk_EmployeeID int not null,
--basicPay float not null, 
--Deduction float not null, 
--TaxablePay float not null, 
--IncomeTax float not null,
--NetPay float  not null
--Foreign key(Fk_EmployeeID) REFERENCES employee(id)
--);

--CREATE TABLE EmployeeDepartment(
--EmployeeID int,
--DepartmentID int,
--Foreign key(EmployeeId) REFERENCES employee(id),
--Foreign key(DepartmentID) REFERENCES Department(DepartmentID)
--);
----Insert in Company and Department
--INSERT INTO Company VALUES ('Apple'),('Amazon'),('Microsoft');
--INSERT INTO Department Values ('Marketing'),('Sales'),('R&D');

----Insert in Employee table
--INSERT INTO employee VALUES ('Donald',986926455,'Sewri Mumbai','M','2019/02/15',(SELECT CompanyID FROM Company WHERE CompanyName='Amazon'));
--INSERT INTO employee VALUES ('Raphael','828241418','Khar Mumbai','M','2017/01/28',(Select CompanyID from Company where CompanyName='Microsoft'));
--INSERT INTO employee VALUES ('Carmel','78787878','Mumbai','F','2018/05/07',(Select CompanyID from Company where CompanyName='Apple'));

----Insert in Payment table
--insert into Payment(BasicPay,Deduction,IncomeTax,Fk_EmployeeID) values 
--(4000000,1000000,20000,1),
--(4500000,200000,4000,2),
--(6000000,10000,5000,3),
--(9000000,399994,6784,4)

----Insert in EmployeeDepartment
--INSERT INTO EmployeeDepartment VALUES ((Select ID from employee where EmployeeName='Terissa'),(SELECT DepartmentID from Department where DepartmentName='Marketing')),
--((Select ID from employee where EmployeeName='Terissa'),(SELECT DepartmentID from Department where DepartmentName='Sales'));

----UC12
----Display all employees
--SELECT * FROM employee;

----Display employee name 
--SELECT * FROM employee WHERE EmployeeName='Donald';

----Display employee from joining date 2018/01/01
--select * from employee where EmployeeJoining between CAST('2018-01-01' AS date) and GETDATE();

----Perform aggregate function on payroll
--Select COUNT(basicPay) as COUNTOfPay from Payment;
--Select SUM(basicPay) as SumOfPay from PaymenT;
--Select AVG(basicPay) as AVGOfPay from Payment;
--Select MIN(basicPay) as MINOfPay from Payment;
--Select MAX(basicPay) as MAXOfPay from Payment;