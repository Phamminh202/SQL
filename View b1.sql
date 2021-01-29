create database Lab11
go
use Lab11

create view ProductList
as
	select ProductID, Name 
	from AdventureWorks.Production.Product

select * from ProductList

create view SalesOrderDetail
as
	select pr.ProductID,pr.Name,od.UnitPrice,od.OrderQty,od.UnitPrice*od.OrderQty as [Total Price]
	from AdventureWorks.Sales.SalesOrderDetail od
	join AdventureWorks.Production.Product pr
	on od.ProductID=pr.ProductID
select * from SalesOrderDetail

create view V_Contact_Info AS
select FirstName,MiddleName,LastName
from Person.Person
go

create view V_Employee_Contact AS
select p.FirstName,p.LastName,e.BusinessEntityID,e.HireDate
from HumanResources.Employee e
join Person.Person as p on e.BusinessEntityID=p.BusinessEntityID;
go

select* from V_Employee_Contact
go

alter view V_Employee_Contact as
select p.FirstName,p.LastName,e.BusinessEntityID,e.HireDate,e.BirthDate
from HumanResources.Employee e
join Person.Person as p on e.BusinessEntityID=p.BusinessEntityID
where p.FirstName life '%B%';
go

drop view V_Contact_Info
go

execute sp_helptext 'V_Employee_Contact'
go
execute sp_depends 'V_Employee_Contact'
go

create view OrderRejects
with ENCRYPTION
as
select PurchaseOrderID,ReceivedQty,RejectedQty,
	RejectedQty / ReceivedQty as RejectRatio,DueDate
from Purchasing.PurchaseOrderDetail
where RejectedQty / ReceivedQty >0
and DuaDate >convert(Datetime,'20010630',101);

sp_helptext 'OrderRejects'
go

alter view V_Employee_Contact as
select p.FirstName,p.LastName,e.BusinessEntityID,e.HireDate
from HumanResources.Employee e
join Person.Person as p on e.BusinessEntityID=p.BusinessEntityID
where p.FirstName life '%A%'
with check option
go

select* from V_Employee_Contact

update V_Employee_Contact set FirstName='Atest' where LastName='Amy'
go
update V_Employee_Contact set FirstName='BCD' where LastName='Atest'
go

drop view V_Employee_Contact
go

create view V_Contact_Info with SCHEMABINDING AS
select FirstName,MiddleName,LastName,EmailAddress
from Person.Contact
go

select * from V_Contact_Info
go

create unique clustered index IX_Contact_Email
on V_Contact_Info(EmailAddress)
go

exec sp_rename V_Contact_Info,V_Contact_Infomation

select * from V_Contact_Infomation

insert into V_Contact_Infomation values ('ABC','DEF','GHI','abc@yahoo.com')

delete from V_Contact_Infomation where LastName='Gilbert' and FirstName='Guy'
