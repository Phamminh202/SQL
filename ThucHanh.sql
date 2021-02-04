create database ThucHanh
go
use ThucHanh
go

create table Categories
(
	CateID char(6) primary key,
	CateName nvarchar(100) not null,
	Description nvarchar(200)
)
go

create table Parts
(
	PartID int primary key identity,
	PartName nvarchar(100) not null,
	CateID char(6) foreign key references Categories(CateID),
	Description nvarchar(1000),
	Price money not null default '0',
	Quantity int default '0',
	Warranty int default '1',
	Photo nvarchar(200) default 'photo/nophoto.png'
)
go

insert into Categories(CateID,CateName,Description)
values  ('112','RAM','RAM 164Gb'),
		('113','CPU','Loai tot nhat hien nay'),
		('114','HDD','Loai tan tien nhat')
go

insert into Parts(PartName,CateID,Description,Price,Quantity,Warranty,Photo)
values  ('AAA','112','Hien dai,de su dung',1000000,2,12,'AAA.png'),
		('BBB','113','Tan tien',1500000,4,24,'BBB.png'),
		('CCC','114','Tot nhat',2000000,5,24,'CCC.png'),
		('DDD','112','Thu tu',1500000,3,12,'DDD.png'),
		('EEE','113','Thu nam',1850000,4,18,'EEE.png')
go

select * from Parts where Price>100
go
  
select * from Parts join Categories  on (CateName='CPU' and Parts.CateID=Categories.CateID)
go

create view v_Part as
select PartID,PartName,CateName,Price,Quantity
from Parts,Categories
go

create view v_TopParts as
select * from Parts
where COUNT(Max(Price))<=5
go