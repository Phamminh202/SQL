use AdventureWorks2019
go

create table Toys
(
	ProductCode varchar(5) primary key,
	Name varchar(30) Not Null,
	Categoroy varchar(30),
	Manufaturer varchar(40),
	AgeRanger varchar(15),
	UnitPrice money NOT NULL,
	Netweight int,
	QtyOnHand int NOT NULL
)
go

insert into Toys(ProductCode,Name,Categoroy,Manufaturer,AgeRanger,UnitPrice,Netweight,QtyOnHand)
values  ('T12','o to','lap ghep','A','3-10',20000,1000,64),
		('C20','may bay','lap ghep','A','3-10',35000,1000,85),
		('C25','tau hoa','lap ghep','A','3-10',50000,2000,45),
		('A56','can cau','lap ghep','A','3-10',30000,2000,48),
		('B21','tau thuyen','lap ghep','A','3-10',39000,3000,52),
		('G85','khu vuon','xep hinh','B','5-13',22000,300,50),
		('K50','ngoi nha','xep hinh','B','5-13',25000,500,34),
		('F36','song nui','xep hinh','B','5-13',42000,800,46),
		('H09','bau troi','xep hinh','B','5-13',20000,300,28),
		('A57','nha hang','xep hinh','B','5-13',31000,600,55),
		('M14','dua xe','game','C','7-18',120000,5000,84),
		('T04','ban sung','game','C','7-18',200000,7000,60),
		('J68','cau ca','game','C','7-18',99000,3000,46),
		('G25','genshin','game','C','7-24',999000,10000,20),
		('L64','lengend','game','C','7-24',890000,9000,26)
go

select * from Toys
go

create proc HeavyToys as
select * from Toys
where Netweight>500
go

exec HeavyToys
go

create proc PriceIncrease
@price money,
 as
 begin
 select * from Toys
 update Toys set UnitPrice=UnitPrice + @price
 end

 exec PriceIncrease 10
 go

 create proc QtyOnHand
@qtyonhand int
 as
 begin
 select * from Toys
 update Toys set QtyOnHand=QtyOnHand + @qtyonhand
 end

 exec QtyOnHand5
 go

 --drop proc PriceIncrease
 --go

 --p3

 exec sp_helptext HeavyToys
 go
 exec sp_helptext PriceIncrease
 go
 exec sp_helptext QtyOnHand
 go

select definition from sys.sql_modules
where object_id=OBJECT_ID('HeavyToys')
go

select definition from sys.sql_modules
where object_id=OBJECT_ID('PriceIncrease')
go
	
select definition from sys.sql_modules
where object_id=OBJECT_ID('QtyOnHand')
go

 select OBJECT_DEFINITION(OBJECT_ID('HeavyToys'));
 select OBJECT_DEFINITION(OBJECT_ID('PriceIncrease'));
 select OBJECT_DEFINITION(OBJECT_ID('QtyOnHand'));

 alter proc PriceIncrease
 as
 select UnitPrice from Toys
 go

 alter proc QtyOnHand
 as
 select QtyOnHand from Toys
 go


 
