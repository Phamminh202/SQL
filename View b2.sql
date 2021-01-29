use AdventureWorks2019
go

create table BookSold
(
	BookSoldID int primary key,
	BookCode int,
	Date datetime,
	Price int,
	Amount int
	CustomerID int constraint Cus foreign key references Customers(CusromerID) on Update cascade,
	constraint Book foreign key(BookCode) references Books(BookCode) on update cascade,
)
go

create table Books
(
	BookCode int,
	Category varchar(50),
	Author varchar(50),
	Publisher varchar(50),
	Title varchar(100),
	Price int,
	InStore int
)
go

create table Customers
(
	CustomerID int primary key identity,
	CustomerName varchar(50),
	Address varchar(100),
	Phone varchar(12)
)
go

insert into BookSold(BookSoldID,CustomerID,BookCode,Date,Price,Amount)
values(12,1,12,15/12/01,20000,5),
	  (13,2,13,25/01/01,25000,4),
	  (14,3,14,26/03/01,15000,9),
	  (15,3,15,28/07/01,50000,1),
	  (16,3,16,04/01/01,36000,9),
	  (17,3,17,29/02/01,34500,6),
	  (18,3,18,26/03/01,20000,5),
	  (19,3,19,31/01/01,20000,8),
	  (20,3,20,05/05/01,21000,8),
	  (21,3,21,24/04/01,49999,4)
go

insert into Books(BookCode,Category,Author,Publisher,Title,Price,InStore)
values  (12,'Van Hoc','A','AA','Van Hoa Viet',20000,25),
		(13,'Kinh Te','B','BB','Kinh Te 2021',25000,10),
		(14,'Toan Hoc','C','CC','Dai Cuong',15000,5),
		(15,'Hoa Hoc','D','DD','Hop Chat Hoa Hoc',50000,34),
		(16,'Lich Su','E','EE','Cach mang Viet Nam 1975',40000,0)
go

insert into Customers(CustomerName,Address,Phone)
values  ('Pham Minh','TB',0123456),
		('Pham Minh2','HN',0126548),
		('Pham Minh3','ND',0124575),
		('Pham Minh4','HP',0126414),
		('Pham Minh5','QN',0129734)
go

create view Cau2 as
select Books.BookCode,Books.Title,Books.Price,BookSold.Amount
from Books,BookSold
where Books.BookCode=BookSold.BookCode
go

create view Cau3 as
select Customers.CustomerID,Customers.CustomerName,Customers.Address,BookSold.Amount
from Customers,BookSold
where Customers.CustomerID=BookSold.CustomerID
go

create view Cau4 as
select Customers.CustomerID,Customers.CustomerName,Customers.Address,Books.Title
from Customers,Books
go

select * from Customers go
select * from Books go
select * from BookSold go
select * from Cau2 go
select * from Cau3 go
select * from Cau4 go