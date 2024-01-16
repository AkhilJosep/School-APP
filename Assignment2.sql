use Assignment
------------Department-----------------
create table Department(Dept_no varchar(40) primary key ,Dept_name varchar(40) not null,[location] varchar(40))
select * from Department
drop table Department

insert into Department values('d1','Reasearch','Dallas')
insert into Department values('d2','Accounting','Scattle')
insert into Department values('d3','Marketing','Dallas')
select * from Department

-----------------Employee-----------------------
create table Employee(emp_no varchar(5) primary key ,emp_fname varchar(40) not null,emp_lname varchar(40) not null,dept_no varchar(40)  foreign key references Department(Dept_no))
select * from Employee
drop table Employee

insert into Employee values (25348,'Mathews','Smith','d3') 
insert into Employee values (10102,'Ann','Jones','d3') 
insert into Employee values (18316,'John','Barrimore','d1') 
insert into Employee values (29346,'James','James','d2') 
select * from Employee

-----------project-----------------
create table project(project_no varchar(10) primary key,project_name varchar(50) not null,Budget varchar(50) not null)
select * from project

insert into project values('p1','Apollo',120000)
insert into project values('p2','Gemini',95000)
insert into project values('p3','Mercury',185600)
select * from project


----------Work_on-----------
create table work(emp_no varchar(10),project_no varchar(10),Job varchar(50),enter_date varchar(20))
select * from work

insert into work values(10102,'p1','Analyst','1997.10.1'),
(10102,'p3','manager','1999.1.1'),(25348,'p2','clerk','1998.2.15'),(25348,'p2',null,'1998.6.1'),
(2581,'p3','Analyst','1998.10.15'),(9031,'p1','Manager','1998.4.15'),(28559,'p1',null,'1998.8.1'),
(28559,'p2','Clerk','1992.2.1'),(9031,'p3','Clerk','1997.11.15'),(29346,'p1','Clerk','1998.1.4')
select * from work
-----------Q1----------------
select * from work
-----------Q2--------------
select emp_no from work where Job='clerk'
-----------Q3------------------
select emp_no from work where project_no ='p2' and emp_no<10000
-----------Q4---------------------
SELECT emp_no FROM work WHERE YEAR(Enter_date) != 1998;
-----------Q5----------------------
select emp_no from work where project_no ='p1' and job in ('Analyst','manager')
------------Q6--------------------
select enter_date FROM work WHERE project_no = 'p2' AND job IS NULL;
-------------Q7-------------------
select emp_no, emp_lname FROM Employee WHERE emp_fname LIKE '%t%t%';
--------------Q8----------------------
select emp_no, emp_fname FROM Employee WHERE emp_lname LIKE '_o%es';
-------------Q9---------------------
select emp_no FROM Employee WHERE dept_no IN (select dept_no FROM Department WHERE Location = 'Seattle');
-------------Q10--------------------
SELECT emp_fname, emp_lname FROM Employee WHERE emp_no IN (SELECT emp_no FROM work WHERE enter_date = '1998-04-01');
----------------Q11-------------------------
select location from Department  order by location
-----------------Q12------------------------
SELECT MAX(emp_no) FROM Employee;
------------------Q13--------------------------
SELECT Job, COUNT(Job) AS EmpCount FROM work GROUP BY Job HAVING COUNT(Job) > 2;
---------------Q14----------------------
SELECT emp_no FROM work WHERE Job = 'Clerk' OR emp_no IN (SELECT emp_no FROM Employee WHERE dept_no = 'd3');



-------------------------------------------------------Assignment Based On Join Operation---------------------------------------------------------------------------

------------------------Q1------------------------
select * from project
select * from work
select * from project p join work w on p.project_no=w.project_no
select * from project p left outer join work w on p.project_no=w.project_no
select p.project_name ,w.job from project p , work w

------------------Q2-------------------------

select e.emp_no,w.job from Employee e join work w on w.emp_no=e.emp_no join project p on  p.project_name='Gemini'

------------------------Q3-------------------
SELECT Employee.emp_fname, Employee.emp_lname
FROM Employee
JOIN Department ON Employee.dept_no = Department.dept_no
WHERE Department.Dept_name IN ('Research', 'Accounting')

----------------------Q4----------------------
SELECT work.enter_date
FROM work
JOIN Employee ON work.emp_no = Employee.emp_no
WHERE Employee.dept_no= 'd1' AND work.Job = 'Clerk'

--------------------Q5---------------------

SELECT p.project_name
FROM project p
JOIN work w ON p.project_no = w.project_no
WHERE w.Job = 'Clerk'
GROUP BY p.project_no
HAVING COUNT(w.emp_no) >= 2;

---------------Q6--------------------
SELECT e.emp_fname, e.emp_lname
FROM employee e
JOIN work w ON e.emp_no = w.emp_no
WHERE w.project_no = 'p3' AND w.Job = 'Manager'

------------------Q7--------------------
SELECT DISTINCT E1.emp_fname, E1.emp_lname
FROM work W1
JOIN Employee E1 ON W1.emp_no = E1.emp_no
JOIN work W2 ON W1.enter_date = W2.enter_date AND W1.emp_no != W2.emp_no

--------------Q8---------------------
SELECT e1.emp_no
FROM Employee e1
JOIN Department d ON e1.dept_no = d.dept_no AND d.location = d.location

-----------Q9------------------
--join
SELECT e.emp_no
FROM Employee e
JOIN Department d ON e.dept_no = d.dept_no
WHERE d.dept_name = 'Marketing'
 
--correlated
 
 
SELECT Emp_no
FROM Employee
WHERE Dept_no IN (
  SELECT Dept_no
  FROM Department d
  WHERE d.dept_name = 'Marketing')

---------------Q10-----------------------
INSERT INTO Employee (emp_no, emp_fname, emp_lname)
VALUES (1111, 'Julia', 'Long')
select * from employee

-----------------Q11-------------------


----------------Q12------------------
UPDATE work
SET Job = 'Clerk'
WHERE project_no = 'p1' AND Job = 'Manager';
select * from work

-----------Q13-----------------------
UPDATE project
SET Budget = NULL
