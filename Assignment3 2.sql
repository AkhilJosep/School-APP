create database Assignment3

CREATE TABLE Workerr (
WORKER_ID INT PRIMARY KEY ,
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);






CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT,
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Workerr(WORKER_ID)
 ON DELETE CASCADE
);


CREATE TABLE Title (
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Workerr(WORKER_ID)
 ON DELETE CASCADE
)

insert into Workerr (worker_id,first_name,last_name,salary,joining_date,department)values
(001,'Monika', 	'Arora ',	100000 	,'2014-02-20 09:00:00',	'HR' )
insert into Workerr (worker_id,first_name,last_name,salary,joining_date,department)values
(002, 'Niharika', 'Verma' ,80000 	,'2014-06-11 09:00:00' 	,'Admin' )
insert into Workerr (worker_id,first_name,last_name,salary,joining_date,department)values
(003 ,'	Vishal ',	'Singhal' 	,300000 ,'2014-02-20 09:00:00' 	,'HR' )
insert into Workerr (worker_id,first_name,last_name,salary,joining_date,department)values
(004 ,'	Amitabh ','Singh ',500000, '2014-02-20 09:00:00','Admin')
insert into Workerr (worker_id,first_name,last_name,salary,joining_date,department)values
(005 ,'	Vivek 	','Bhati '	,500000 ,'2014-06-11 09:00:00' 	,'Admin ')
insert into Workerr (worker_id,first_name,last_name,salary,joining_date,department)values
(006 ,'	Vipul 	','Diwan '	,200000, '2014-06-11 09:00:00 '	,'Account ')
insert into Workerr (worker_id,first_name,last_name,salary,joining_date,department)values
(007 ,'	Satish 	','Kumar '	,75000, '2014-01-20 09:00:00 '	,'Account' )
insert into Workerr (worker_id,first_name,last_name,salary,joining_date,department)values
(008 ,'	Geetika', 	'Chauhan' ,	90000 ,'2014-04-11 09:00:00 ',	'Admin' )

select * from Workerr
select * from Bonus
select * from Title

insert into Bonus(WORKER_REF_ID,BONUS_DATE,BONUS_AMOUNT) values
(1,'2016-02-20 00:00:00',5000)

insert into Bonus(WORKER_REF_ID,BONUS_DATE,BONUS_AMOUNT) values
(2,'2016-06-11 00:00:00',3000)

insert into Bonus(WORKER_REF_ID,BONUS_DATE,BONUS_AMOUNT) values
(3,'2016-02-20 00:00:00',4000)

insert into Bonus(WORKER_REF_ID,BONUS_DATE,BONUS_AMOUNT) values
(1,'2016-02-20 00:00:00',4500)

insert into Bonus(WORKER_REF_ID,BONUS_DATE,BONUS_AMOUNT) values
(2,'2016-06-11 00:00:00',3500)


INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES
(1, 'Manager', '2016-02-20 00:00:00'),
(2, 'Executive', '2016-06-11 00:00:00'),
(8, 'Executive', '2016-06-11 00:00:00'),
(5, 'Manager', '2016-06-11 00:00:00'),
(4, 'Asst. Manager', '2016-06-11 00:00:00'),
(7, 'Executive', '2016-06-11 00:00:00'),
(6, 'Lead', '2016-06-11 00:00:00'),
(3, 'Lead', '2016-06-11 00:00:00');

--1
SELECT FIRST_NAME AS WORKER_NAME
FROM Workerr;


--2
SELECT UPPER(FIRST_NAME)
FROM Workerr;


--3
SELECT DISTINCT DEPARTMENT
FROM Workerr;


--4
SELECT LEFT(FIRST_NAME, 3) FROM Workerr;

--5 


--6

SELECT RTRIM(FIRST_NAME) as spaceright FROM Workerr;

--7 

SELECT LTRIM(FIRST_NAME) as spaceleft FROM Workerr;

--8 

SELECT DISTINCT DEPARTMENT, LEN(DEPARTMENT) AS DEPARTMENT_LENGTH FROM Workerr;


--9
SELECT REPLACE(FIRST_NAME, 'a', 'A') FROM Workerr;


--10

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS COMPLETE_NAME FROM Workerr;


--11

SELECT * FROM Workerr ORDER BY FIRST_NAME ASC;

--12

SELECT * FROM Workerr ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;


--13
select * from Workerr
SELECT * FROM Workerr WHERE FIRST_NAME IN ('Vipul', 'Satish')


--14

SELECT * FROM Workerr WHERE FIRST_NAME NOT IN ('Vipul', 'Satish');


--15

SELECT * FROM Workerr WHERE DEPARTMENT = 'Admin';


--16

SELECT * FROM Workerr WHERE CHARINDEX('a', FIRST_NAME) > 0;

--17

SELECT * FROM Workerr WHERE RIGHT(FIRST_NAME, 1) = 'a';


--18

SELECT * FROM Workerr WHERE RIGHT(FIRST_NAME, 1) = 'h' AND LEN(FIRST_NAME) = 6;
SELECT * FROM Workerr WHERE FIRST_NAME= '%h' AND LEN(FIRST_NAME) = 6;

--19

SELECT * FROM Workerr WHERE SALARY BETWEEN 100000 AND 500000;


--20


SELECT * FROM Workerr WHERE JOINING_DATE >= '2014-02-01' AND JOINING_DATE < '2014-03-01';


--21

SELECT FIRST_NAME FROM Workerr WHERE SALARY BETWEEN 50000 AND 100000;

--22


SELECT DEPARTMENT, COUNT(*) AS WorkerCount FROM Workerr GROUP BY DEPARTMENT ORDER BY WorkerCount DESC;



--23


SELECT * FROM Workerr w
JOIN Title t ON w.WORKER_ID = t.WORKER_REF_ID
WHERE t.WORKER_TITLE = 'Manager';


--24
SELECT GETDATE() AS CurrentDateTime;


--25

SELECT TOP 10 * FROM Workerr;