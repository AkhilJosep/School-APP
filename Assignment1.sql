create database Assignment

use Assignment
-------111111111111111--------
create table Customers(Customerid char(5),CompanyName varchar(40) not null,contactName char(30) null,Address varchar(60) null,City char(15) null,
Phone char(24) null,Fax char(24) null)
select * FROM Customers

create table Orders(OrderId int not null,customerId char(5) not null,Orderdate datetime null,Shippeddate datetime null,Freight money null,
Shipname varchar(40) null,Shipaddres varchar(60) null,Quantity integer null)
select * from Orders
-------22222222222222------

alter table Orders add Shipregion int null
select * from Orders

-------333333333333---------

alter table Orders alter column Shipregion char(8) null
select * from Orders

-------444444444------------

alter table Orders drop column Shipregion
select * from Orders

------5555555555-----------
insert into Orders Values( 10, 'ord01', getdate(), getdate(), 100.0, 'Windstar', 'Ocean' ,1)
select * from Orders

-------6666666666-----------
alter table Orders add constraint date_default default getdate() for Orderdate
select * from Orders
---------7777777777----------
sp_rename 'Customers.City','Town'
select * from Customers


