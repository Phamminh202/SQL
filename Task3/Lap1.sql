if exists (select * from sys.databases where name='Example5')
drop database Example5
go

create DATABASE Example5
Go

use Example5
go
--tạo bảng lớp học
create table LopHoc(
	malophoc INT primary key identity,
	tenlophoc varchar(10)
)
go

--Tạo bảng sinh viên có khóa ngoài là cột malophoc, nối với bảng LopHoc
create table SinhVien(
	MaSV int primary key,
	TenSV nvarchar(40),
	malophoc int,
	constraint fk foreign key (malophoc) references LopHoc(malophoc)
)
go
--Tạo bảng SanPham với một cột NULL, một cột NOT NULL
create table SanPham(
	MaSP int not null,
	TenSP varchar(40) null
)
--Tạo bảng với thuộc tính default cho cột Price
create table StoreProduct(
	ProductID int NOT NULL,
	Name varchar(40)NOT NULL,
	Price money NOT NULL default(100)
)

--Thử kiểm tra xem giá trị  default có được sử dụng hay không
insert into StoreProduct(ProductID,Name)values(111,Rivets)
go
--Tạo bảng ContactPhone với thuộc tính INDENITY
create table ContactPhone(
	Person_ID int IDENTITY(500,1)NOT NULL,
	MobileNumber bigint NOT NULL
)
go
--Tạo cột nhận dạng duy nhất tổng thể
create table CellularPhone(
	Person_ID uniqueidentifier default NEWID() NOT NULL,
	PersonName varchar(60) NOT NULL
)
--Chèn một record vào
insert into CellularPhone(PersonName)values('William Smith')
go
--Kiểm tra giá trị của cột Person_ID tự động sinh
select * from CellularPhone
go
--Tạo bảng ContactPhone với cột MobileNumber có thuộc tính UNIQUE
create table ContactPhone(
	Person_ID int primary key,
	MobileNumber bigint unique,
	ServiceProvider varchar(30),
	LandlineNumber bigint unique
)
--Chèn 2 bản ghi có giá trị giống nhau ở cột MobileNumber và LandlineNumber để qua sát lỗi
insert into ContactPhone values(101,983345674,'Hutch',null)
insert into ContactPhone values(102,983345674,'Alex',null)
go
--Tạo bảng PhoneExpenses có một CHECT ở cột Amount
create table PhoneExpenses(
	Expense_ID int primary key,
	MobileNumber bigint foreign key references  ContactPhone(MobileNumber),
	Amount bigint check (Amount>0)
)
go
--Chỉnh sửa cột trong bảng
alter table ContactPhone
	alter column ServiceProvider varchar(45)
go
--Xóa cột trong bảng
alter table ContactPhone
	drop ServiceProvider
go
--Thêm một ràng buộc vào bảng
alter table ContactPhone add constraint CHK_RC check (RentalCharges>0)
go
--Xóa một ràng buộc
alter table Person.ContactPhone
	drop constraint CHK_RC
go
