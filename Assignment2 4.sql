create database Assignment2

create table Department(
dept_ID varchar(10) primary key,
dept_name varchar(20),
location varchar(30)
)

insert into Department values('d1','Research ','Dallas ')
insert into Department values('d2','Accounting  ','Seattle  ')
insert into Department values('d3','Marketing  ','Dallas  ')
select * from Department

create table Employeee(
emp_no int primary key,
emp_name varchar(30),
emp_lname varchar(30),
dept_ID varchar(10) foreign key (dept_id) references department(dept_ID))

insert into Employeee values(25348 ,' Matthew ','Smith ','d3 ')
 insert into Employeee values(10102  ,' Ann   ','Jones  ','d3 ')
 insert into Employeee values(18316  ,' John  ','Barrimore  ','d1 ')
 insert into Employeee values(29346  ,' James  ','James  ','d2 ')


create table projectt(
project_no varchar(10) primary key,
project_name varchar(30),
budget decimal(18,2))

INSERT INTO projectt VALUES
('p1', 'Apollo', 120000),
('p2', 'Gemini', 95000),
('p3', 'Mercury', 185600);
select *from projectt

create table works_on(
emp_no int references Employeee(emp_no),
project_no varchar(10) references projectt(project_no),
job varchar(30),
enter_date date)

--1 Question1

insert into works_on values(10102,'p1','Analyst','1997.10.1')
insert into works_on values(10102,'p3','manager','1997.1.1')
insert into works_on values(25348,'p2','clerk','1998.2.15')
insert into works_on values(18316,'p2','NULL','1998.6.1')
insert into works_on values(29346,'p2','NULL','1997.12.15')
insert into works_on values(2581,'p3','NULL','1998.10.15')
insert into works_on values(9031,'p1','manager','1998.4.15')
insert into works_on values(28559,'p1','NULL','1998.8.1')
insert into works_on values(28559,'p2','clerk','1992.2.1')
insert into works_on values(9031,'p3','clerk','1997.11.15')
insert into works_on values(29346,'p1','clerk','1998.1.4')

select * from works_on


--2 Question

select emp_no from works_on where job='clerk'

--3 Question

select emp_no from works_on where project_no ='p2' and emp_no<10000

--4 Question

SELECT emp_no FROM works_on WHERE YEAR(Enter_date) <> 1998;

--5Question


select emp_no from works_on where project_no ='p1' and job in ('Analyst','manager')

--6 Question

SELECT Enter_date FROM Works_on WHERE project_no = 'p2' AND job IS NULL;

--7 Question

SELECT Emp_no, Emp_lname FROM Employeee WHERE Emp_name LIKE '%t%t%';
select * from Employeee

--8 Question

SELECT Emp_no, Emp_name FROM Employeee WHERE Emp_lname LIKE '_o%es';

--9 Question

SELECT Emp_no FROM Employeee WHERE dept_ID IN (SELECT dept_ID FROM Department WHERE Location = 'Seattle');


--10 Question

SELECT Emp_name, Emp_lname FROM Employeee
WHERE Emp_no IN (SELECT Emp_no FROM Works_on WHERE Enter_date = '1998-04-01');


--11 Question

select location from Department  order by location

--12 Question

SELECT MAX(Emp_no) FROM Employeee;


--13 Question

SELECT Job, COUNT(Job) AS EmployeeCount FROM Works_on GROUP BY Job HAVING COUNT(Job) > 2;

--14 Question

SELECT Emp_no FROM Works_on WHERE Job = 'Clerk' OR Emp_no IN (SELECT Emp_no FROM Employeee WHERE dept_ID = 'd3');

--II section
-- 1 Question
select * from projectt
select * from works_on
select * from projectt p join works_on w on p.project_no=w.project_no
select * from projectt p left outer join works_on w on p.project_no=w.project_no
select p.project_name ,w.job from projectt p , works_on w

--2 Question
select * from projectt
select * from works_on
select * from Employeee
select e.emp_no,w.job from Employeee e join works_on w on w.emp_no=e.emp_no join projectt p on  p.project_name='Gemini'

--3 Question

SELECT Employeee.emp_name, Employeee.emp_lname
FROM Employeee
JOIN Department ON Employeee.dept_id = Department.dept_ID
WHERE Department.Dept_name IN ('Research', 'Accounting')

--4 Question


SELECT Works_on.enter_date
FROM Works_on
JOIN Employeee ON Works_on.emp_no = Employeee.emp_no
WHERE Employeee.dept_ID= 'd1' AND Works_on.Job = 'Clerk'

--5 Question
select * from projectt
select * from works_on

SELECT p.project_name
FROM projectt p
JOIN Works_on w ON p.project_no = w.project_no
WHERE w.Job = 'Clerk'
GROUP BY p.project_no
HAVING COUNT(w.emp_no) >= 2;

--6 Question

SELECT e.emp_name, e.emp_lname
FROM Employeee e
JOIN Works_on w ON e.emp_no = w.emp_no
WHERE w.project_no = 'p3' AND w.Job = 'Manager'

--7 Question
select * from Employeee
select * from works_on

SELECT DISTINCT E1.emp_name, E1.emp_lname
FROM Works_on W1
JOIN Employeee E1 ON W1.emp_no = E1.emp_no
JOIN Works_on W2 ON W1.enter_date = W2.enter_date AND W1.emp_no <> W2.emp_no

--8 Question

select * from Department

select * from Employeee
SELECT e1.emp_no
FROM Employeee e1
JOIN Department d ON e1.dept_ID = d.dept_id AND d.location = d.location



--9 Question


SELECT emp_no
FROM Employeee
WHERE dept_ID = 'd3';

--10 Question

--join
SELECT e.Emp_no
FROM Employeee e
JOIN Department d ON e.Dept_id = d.Dept_id
WHERE d.Dept_name = 'Marketing'

--correlated
select * from Department
select * from Employeee


SELECT Emp_no
FROM Employeee
WHERE Dept_id IN (
  SELECT Dept_id
  FROM Department d
  WHERE d.dept_name = 'Marketing'
)



--11 Question


INSERT INTO Employeee (emp_no, emp_name, emp_lname)
VALUES (1111, 'Julia', 'Long');

--12 Question
select * from department



--13 Question

UPDATE Works_on
SET Job = 'Clerk'
WHERE project_no = 'p1' AND Job = 'Manager';


--14 Question

UPDATE projectt
SET Budget = NULL;

--15 Question 

UPDATE Projectt
SET Budget = Budget * 1.1
WHERE project_no IN (SELECT project_no FROM Works_on WHERE emp_no = 10102 AND Job = 'Manager');

--16 Question

UPDATE Works_on
SET enter_date = '1998-12-12'
WHERE project_no = 'p1' AND emp_no IN (SELECT emp_no FROM Employeee WHERE dept_ID = 'Sales');

--17 Question


