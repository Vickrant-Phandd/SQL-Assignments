USE SQL_Assignment;

CREATE DATABASE SQL_Assignment;

CREATE TABLE location(
	location_id INTEGER PRIMARY KEY,
	city VARCHAR(20));
SELECT * FROM location;

CREATE TABLE Department(
	Department_id INTEGER PRIMARY KEY,
	Name VARCHAR(20),
	location_id INTEGER,
	FOREIGN KEY(location_id) REFERENCES location(location_id) ON DELETE SET NULL);
SELECT * FROM Department

CREATE TABLE Job(
	Job_id INTEGER PRIMARY KEY NOT NULL,
	Designation VARCHAR(20));

CREATE TABLE Employee(
	Employee_Id INTEGER,
	last_Name VARCHAR(20),
	First_Name VARCHAR(20),
	Middle_Name VARCHAR(20),
	Job_id INTEGER,
	Manager_id INTEGER,
	Hire_Date Date,
	Salary INTEGER,
	Comm INTEGER,
	Department_id INTEGER,
	FOREIGN KEY(Job_id) REFERENCES Job(Job_id) ON DELETE SET NULL,
	FOREIGN KEY(Department_id) REFERENCES Department(Department_id) ON DELETE SET NULL);
SELECT * FROM Employee;

INSERT INTO Employee VALUES(7369, 'Smith', 'John', 'Q', 667, 7902,'1984-10-17', 800, Null, 20 );
INSERT INTO Employee VALUES(7499, 'Allen', 'Kevin', 'J', 670, 7698,'1985-02-20', 1600, 300, 30 );
INSERT INTO Employee VALUES(7505, 'Doyle', 'Jean', 'K', 671, 7839,'1985-04-04', 2850, Null, 30 );
INSERT INTO Employee VALUES(7506, 'Dennis', 'Lynn', 'S', 671, 7839,'1985-05-15', 2750, Null, 30 );
INSERT INTO Employee VALUES(7507, 'Baker', 'Leslie', 'D', 671, 7839,'1985-06-10', 2200, Null, 40 );
INSERT INTO Employee VALUES(7521, 'Wark', 'Cynthia', 'D', 670, 7698,'1985-02-22', 1250, 500, 30 );

INSERT INTO  location VALUES(122, 'New York');
INSERT INTO location VALUES(123, 'Dallas');
INSERT INTO location VALUES(124, 'Chicago');
INSERT INTO location VALUES(125, 'Boston');

UPDATE location
SET location_id = 167
WHERE city= 'Boston';


INSERT INTO  Department VALUES(10, 'Accounting', 122);
INSERT INTO  Department VALUES(20, 'Sales', 124);
INSERT INTO  Department VALUES(30, 'Research', 123);
INSERT INTO  Department VALUES(40, 'Opeartions', 167);


INSERT INTO  job VALUES(667, 'Clerk');
INSERT INTO  job VALUES(668, 'Staff');
INSERT INTO  job VALUES(669, 'Analyst');
INSERT INTO  job VALUES(670, 'Sales Person');
INSERT INTO  job VALUES(671, 'Manager');
INSERT INTO  job VALUES(672, 'President');

--SIMPLE QUERIES:--
--1.	LIST ALL THE EMPLOYEE DETAILS.--
SELECT * FROM Employee;

--2.	LIST ALL THE DEPARTMENT DETAILS--
SELECT * FROM Department;

--3.	LIST ALL JOB DETAILS.--
SELECT * FROM Job;

--4.	LIST ALL THE LOCATIONS.--
SELECT * FROM location;

--5.	LIST OUT THE FIRSTNAME, LASTNAME, SALARY, COMMISSION FOR ALL EMPLOYEES.--
SELECT First_Name, last_Name,Salary,Comm  FROM Employee;


--6.	LIST OUT EMPLOYEEID,LAST NAME, DEPARTMENT ID FOR ALL EMPLOYEES AND ALIAS EMPLOYEEID AS "ID OF THE EMPLOYEE", LAST NAME AS "NAME OF THE EMPLOYEE", DEPARTMENTID AS "DEP_ID".--
SELECT Employee_id As 'ID OF THE EMPLOYEE', last_Name As 'NAME OF THE EMPLOYEE', Department_id As 'DEP_ID' FROM Employee;

--7.	LIST OUT THE EMPLOYEES ANNUAL SALARY WITH THEIR NAMES ONLY.--

SELECT First_Name, (Salary*12) As 'Annual_Salary', Salary AS 'Monthly_Salary' FROM Employee;

--WHERE CONDITION:--
--1.	LIST THE DETAILS ABOUT "SMITH"
SELECT * FROM Employee
WHERE last_name = 'Smith';

--2.	LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 20.
SELECT * FROM Employee
WHERE Department_id = 20;

--3.	LIST OUT THE EMPLOYEES WHO ARE EARNING SALARY BETWEEN 2000 AND 3000.
SELECT * FROM Employee WHERE Salary BETWEEN 2000 AND 3000;

--4.	LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 10 OR 20.
SELECT * FROM Employee WHERE Department_id = '10' or Department_id = '20';

--5.	FIND OUT THE EMPLOYEES WHO ARE NOT WORKING IN DEPARTMENT 10 OR 30.
Select last_name, salary, comm, department_id from employee where department_id not in (10,30);

--6.	LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S'.
SELECT * FROM Employee WHERE last_Name LIKE 'S%';

--7.	LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S' AND ENDS WITH 'H'.
SELECT * FROM Employee WHERE last_Name LIKE 's%h';

--8.	LIST OUT THE EMPLOYEES WHOSE NAME LENGTH IS 4 AND START WITH 'j'.
SELECT * FROM Employee WHERE First_Name LIKE 'J%___';

--9.	LIST OUT EMPLOYEES WHO ARE WORKING IN DEPARRTMENT 10 AND DRAW THE  SALARIES MORE THAN 3500.
SELECT * FROM Employee WHERE Department_id = 10 AND Salary>3500;

--10.	LIST OUT THE EMPLOYEES WHO ARE NOT RECEVING COMMISSION.
SELECT * FROM Employee WHERE Comm IS NULL;

--ORDER BY CLAUSE:
--1.	LIST OUT THE EMPLOYEE ID, LAST NAME IN ASCENDING ORDER BASED ON THE EMPLOYEE ID.
SELECT Employee_id, last_Name FROM Employee ORDER BY last_Name;

--2.	LIST OUT THE EMPLOYEE ID, NAME IN DESCENDING ORDER BASED ON SALARY.
SELECT Employee_id, First_Name FROM Employee ORDER BY Salary DESC;
SELECT * FROM Employee;

--3.	LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER 
SELECT * FROM Employee ORDER BY last_Name ASC;

--4.	LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER AND THEN ON DEPARTMENT_ID IN DESCENDING ORDER.
SELECT * FROM Employee ORDER BY last_Name ASC, Department_id DESC;

-- GROUP BY & HAVING CLAUSE
--1.	HOW MANY EMPLOYEES WHO ARE IN DIFFERENT DEPARTMENTS WISE IN THE ORGANIZATION.
SELECT * FROM Employee;
SELECT Department_id, COUNT(*) As No_of_Employees FROM Employee GROUP by Department_id;

--2.	LIST OUT THE DEPARTMENT WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARY OF THE EMPLOYEES.
SELECT Department_id, MAX(Salary) AS MAXIMUM_SALARY, MIN(Salary) AS MINIMUM_SALARY, AVG(Salary) AS AVERAGE_SALARY 
FROM Employee 
GROUP by Department_id;

--3.	LIST OUT JOB WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARIES OF THE EMPLOYEES.
SELECT Job_id, MAX(Salary) AS MAXIMUM_SALARY, MIN(Salary) AS MINIMUM_SALARY, AVG(Salary) AS AVERAGE_SALARY 
FROM Employee 
GROUP by Job_id;

--4.	LIST OUT THE NUMBER OF EMPLOYEES JOINED IN EVERY MONTH IN ASCENDING ORDER.
SELECT * FROM Employee;

SELECT COUNT(Employee_Id) As No_of_Employees, MONTH(hire_date) As Month_Wise
FROM Employee 
GROUP by MONTH(hire_date) 
ORDER BY MONTH(hire_date);

--5.	LIST OUT THE NUMBER OF EMPLOYEES FOR EACH MONTH AND YEAR, IN THE ASCENDING ORDER BASED ON THE YEAR, MONTH.
SELECT COUNT(*) As No_of_Employees, YEAR(hire_date) as OrderYear, MONTH(hire_date) as OrderMonth
FROM Employee
GROUP BY YEAR(hire_date), MONTH(hire_date)
ORDER BY YEAR(hire_date), MONTH(hire_date);

--6.	LIST OUT THE DEPARTMENT ID HAVING ATLEAST FOUR EMPLOYEES.
Select department_id, count(*) AS No_of_employees from employee group by department_id having count(*)>=4;

--7.	HOW MANY EMPLOYEES JOINED IN JANUARY MONTH.
SELECT COUNT(*) As No_of_Employees, DATENAME (MONTH, DATEADD(MONTH, MONTH(hire_date) - 1, '1900-01-01')) Month
FROM Employee
GROUP BY MONTH(hire_date)
HAVING MONTH(hire_date)= 'February';

--8.	HOW MANY EMPLOYEES JOINED IN JANUARY OR SEPTEMBER MONTH.
SELECT MONTH(hire_date) as Hire_Month, COUNT(*) As No_of_Employees
FROM Employee
GROUP BY MONTH(hire_date)
HAVING MONTH(hire_date)= '2' OR MONTH(hire_date)= '9';

SELECT DATENAME (MONTH, DATEADD(MONTH, MONTH(hire_date) - 1, '1900-01-01')) Month, COUNT(*) As No_of_Employees
FROM Employee
GROUP BY MONTH(hire_date)
HAVING MONTH(hire_date)= '2' OR MONTH(hire_date)= '9';


--9.	HOW MANY EMPLOYEES WERE JOINED IN 1985?
SELECT  YEAR(hire_date) as Joining_Year, COUNT(*) As No_of_Employees
FROM Employee
GROUP BY YEAR(hire_date)
HAVING YEAR(hire_date)= 1985;

--10.	HOW MANY EMPLOYEES WERE JOINED EACH MONTH IN 1985.
SELECT COUNT(*) As No_of_Employees, YEAR(hire_date) as Joining_Year, MONTH(hire_date) as Joining_Month
FROM Employee
GROUP BY YEAR(hire_date), MONTH(hire_date)
HAVING YEAR(hire_date)= 1985;

--11.	HOW MANY EMPLOYEES WERE JOINED IN MARCH 1985?
SELECT COUNT(*) As No_of_Employees, YEAR(hire_date) as Joining_Year, MONTH(hire_date) as Joining_Month
FROM Employee
GROUP BY YEAR(hire_date), MONTH(hire_date)
HAVING MONTH(hire_date)= 2;

--12.	WHICH IS THE DEPARTMENT ID, HAVING GREATER THAN OR EQUAL TO 3 EMPLOYEES JOINED IN APRIL 1985?
SELECT Department_id, COUNT(*) As No_of_Employees
FROM Employee
GROUP BY Department_id
HAVING count(*)>=3;

--JOINS
--1.	LIST OUT EMPLOYEES WITH THEIR DEPARTMENT NAMES.
Select employee_id, last_name, name from employee e, department d 
where e.department_id=d.department_id

--2.	DISPLAY EMPLOYEES WITH THEIR DESIGNATIONS.
SELECT * FROM Employee;
SELECT * FROM Job;

SELECT e.employee_id, e.last_name, e.first_name, j.Designation
FROM Employee e INNER JOIN Job j
ON e.job_id = j.Job_id;

--3.	DISPLAY THE EMPLOYEES WITH THEIR DEPARTMENT NAMES AND REGIONAL GROUPS.
SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM location;

select e.First_Name, e.last_Name, e.Department_id,d.location_id _id, d.Name AS Department_Name , l.city AS Regional_Groups
from department d,employee e ,location l 
where e.Department_id=d.Department_id and d.location_id=l.location_id;


--4.	HOW MANY EMPLOYEES WHO ARE WORKING IN DIFFERENT DEPARTMENTS AND DISPLAY WITH DEPARTMENT NAMES.
select e.First_Name, e.last_Name, e.Department_id,d.location_id _id, d.Name AS Department_Name 
from department d,employee e
where e.Department_id=d.Department_id;

--5.	HOW MANY EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
SELECT count(*) from employee e,department d 
where e.Department_id=d.Department_id 
group by name
Having  name='sales';

--6.	WHICH IS THE DEPARTMENT HAVING GREATER THAN OR EQUAL TO 5 EMPLOYEES AND DISPLAY THE DEPARTMENT NAMES IN ASCENDING ORDER.
select count(*) Department_id,name 
from employee e,department d
where e.Department_id=d.Department_id  
group by name 
having count(*)>=5 
order by name;

--7.	HOW MANY JOBS IN THE ORGANIZATION WITH DESIGNATIONS.
SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM location;
SELECT * FROM job;

select count(*) job_id, Designation
from employee e,job j
Where e.job_id=j.job_id 
group by Designation;

--8.	HOW MANY EMPLOYEES ARE WORKING IN "NEW YORK".
SELECT E.*, City FROM(SELECT Department_id, count(1) As EMPCNT FROM Employee GROUP BY Department_id) As E
INNER JOIN Department As D ON E.Department_id=D.Department_id
INNER JOIN Location As L ON L.location_id=D.location_id
WHERE L.city='new york';

--9.	DISPLAY THE EMPLOYEE DETAILS WITH SALARY GRADES
SELECT * , Salgrade=
CASE 
WHEN E.salary < 2000 THEN 'c'
WHEN E.salary BETWEEN 2000 and 5000 THEN 'B'
ELSE 'A'
END
FROM employee As E;

--10.	LIST OUT THE NO. OF EMPLOYEES ON GRADE WISE.
SELECT E.Salgrade , count(1) FROM
(SELECT Employee_id, salgrade=
CASE 
WHEN salary < 2000 THEN 'c'
WHEN salary BETWEEN 2000 and 5000 THEN 'B'
ELSE 'A'
END
FROM employee) As E
GROUP BY E.Salgrade

select * from employee
--11.	DISPLAY THE EMPLOYEE SALARY GRADES AND NO. OF EMPLOYEES BETWEEN 2000 TO 5000 RANGE OF SALARY.
SELECT E.Salgrade , count(1) FROM
(SELECT Employee_id, salgrade=
CASE 
WHEN salary < 2000 THEN 'c'
WHEN salary BETWEEN 2000 and 5000 THEN 'B'
ELSE 'A'
END
FROM employee
WHERE salary BETWEEN 2000 and 5000 ) As E
GROUP BY E.Salgrade

--12.	DISPLAY THE EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.
SELECT E.*, J.job_id , J.Designation FROM employee As E 
INNER JOIN job AS j ON E.Job_id=j.Job_id
where Designation='manager';

SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM location;
SELECT * FROM job;

--13.	DISPLAY THE EMPLOYEE DETAILS WHO EARN MORE THAN THEIR MANAGERS SALARIES.

--14.	SHOW THE NO. OF EMPLOYEES WORKING UNDER EVERY MANAGER.

--15.	DISPLAY EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.

--16.	DISPLAY ALL EMPLOYEES IN SALES OR OPERATION DEPARTMENTS.
 select * from employee e, department d 
 where e.department_id=d.department_id and 
 d.Department_id=(select d.department_id where Name in ('sales' ,'opeartions'));


 --SET OPERATORS
--1. LIST OUT THE DISTINCT JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
 Select Designation from job where job_id in (Select job_id from employee where department_id=(select department_id from department where name='SALES'))
 union Select Designation from job where job_id in (Select job_id from employee where department_id=(select department_id from department where name='ACCOUNTING'));

--2. LIST OUT ALL THE JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
Select Designation from job where job_id in (Select job_id from employee where department_id=(select department_id from department where name='SALES'))
 union All Select Designation from job where job_id in (Select job_id from employee where department_id=(select department_id from department where name='ACCOUNTING'));

--3. LIST OUT THE COMMON JOBS IN RESEARCH AND ACCOUNTING DEPARTMENTS IN ASCENDING ORDER
Select Designation from job where job_id in (Select job_id from employee where department_id=(select department_id from department where name='Research'))
intersect Select Designation from job where job_id in (Select job_id from employee where department_id=(select department_id from department where name='ACCOUNTING'))
order by Designation;

--Sub-Queries

--1) Display the employee who got the maximum salary
select * from employee 
where salary=(select max(salary) from employee);

--2) Display the employees who are working in Sales department
select* from employee 
where Department_id in(select Department_id from department where Name='sales');

--3. DISPLAY THE EMPLOYEES WHO ARE WORKING AS 'CLERCK'.
select * from employee where job_id in (Select job_id from job where Designation = 'Clerk');

--4. DISPLAY THE LIST OF EMPLOYEES WHO ARE LIVING IN "NEW YORK".
Select * from employee where department_id=(select department_id from department where location_id=(select location_id from location where city='New York'));

--5. FIND OUT NO. OF EMPLOYEES WORKING IN "SALES" DEPARTMENT.
select * from employee where department_id = (select department_id from Department where name = 'sales');

--6. UPDATE THE EMPLOYEES SALARIES, WHO ARE WORKING AS CLERK ON THE BASIS OF 10%.
update employee set salary = (salary + Salary*10/100) where job_id = (select job_id from job where Designation = 'clerk');

--7. DELETE THE EMPLOYEES WHO ARE WORKING IN ACCOUNTING DEPARTMENT.
delete from employee where department_id=(select department_id from department where name='ACCOUNTING');

--8. DISPLAY THE SECOND HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
 Select * from employee where salary=(select max(salary) from employee where salary <(select max(salary) from employee));

--9. DISPLAY THE N'TH HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
Select * from employee E1
where 0 = (select count(distinct salary) from employee E2 where E2.Salary > E1.salary);

SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM location;
SELECT * FROM job;

--10 LIST OUT THE EMPLOYEES WHO EARN MORE THAN EVERY EMPLOYEE IN DEPARTMENT 30.
 Select * from employee where salary > all (Select salary from employee where department_id=30);

--11. LIST OUT THE EMPLOYEES WHO EARN MORE THAN THE LOWEST SALARY IN DEPARTMENT 30.
SELECT * FROM Employee;
Select * from employee where salary > any (Select salary from employee where department_id=30);

--12. FIND OUT WHOSE DEPARTMENT HAS NOT EMPLOYEES.
select Department_id from department d 
 where not exists (select department_id from employee e where d.department_id = e.department_id);

--13. FIND OUT WHICH DEPARTMENT DOES NOT HAVE ANY EMPLOYEES.
SELECT * FROM Employee;
SELECT * FROM Department;
Select name from department d where not exists (select last_name from employee e where d.department_id=e.department_id);

--14. FIND OUT THE EMPLOYEES WHO EARN GREATER THAN THE AVERAGE SALARY FOR THEIR DEPARTMENT
SELECT * FROM Employee;
SELECT * FROM Department;
Select * from employee e where salary > (select avg(salary) from employee where department_id=e.department_id);
Select employee_id, last_name, salary, department_id from employee e where salary > (select avg(salary) from employee where department_id=e.department_id);


1-