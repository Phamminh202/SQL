IF EXISTS (SELECT * FROM sys.databases WHERE Name='Ex3')
DROP DATABASE Ex3
GO
CREATE DATABASE Ex3
GO
USE Ex3
GO

create table GiayDangKi(
	Ten nvarchar(50),
	SoCMT int primary key,
	DiaChi nvarchar(50),
	SDT int,
	Loai nvarchar(30),
	NgayDK datetime
)
go

Insert into GiayDangKi(Ten,SoCMT,DiaChi,SDT,Loai,NgayDK)
	values ('Nguyen Nguyet Nga',123456789,'Ha Noi',123456789,'Tra truoc',12/12/02)
go
select * from GiayDangKi
go
	--3
Insert into GiayDangKi(Ten,SoCMT,DiaChi,SDT,Loai,NgayDK)
	values ('Pham Minh',141012345,'Thai Binh',987654321,'Tra truoc',26/01/21)
go
	--4
select Ten,DiaChi from GiayDangKi
go
select SDT,Ten from GiayDangKi
go
	--5
select Ten,SoCMT,DiaChi from GiayDangKi where SDT=0123456789
go
select Ten,DiaChi,SDT from GiayDangKi where SoCMT=123456789
go
select SDT from GiayDangKi where SoCMT=123456789
go
select SDT,Ten from GiayDangKi where NgayDK=12/12/09
go
select SDT,Ten from GiayDangKi where DiaChi='Ha Noi'
go

	--6
select count(Ten) from GiayDangKi
go
select count(SDT) from GiayDangKi
go
select count(SDT) from GiayDangKi where NgayDK=12/12/09
go

	--7
alter table GiayDangKi modify NgayDK
go
alter table GiayDangKi add constraint  NgayDK check(NgayDK<1/26/21)
go