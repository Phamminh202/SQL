IF EXISTS (SELECT * FROM sys.databases WHERE Name='Example5')
DROP DATABASE Example5
GO
CREATE DATABASE Example5
GO
USE Example5
GO

--2
create table Danhsachcacmathang(
	STT int identity,
	TenHang nvarchar,
	MoTaHang nvarchar,
	DonVi nvarchar,
	Gia money,
	SoLuong int,
	ThanhTien money
)
go

insert into Danhsachcacmathang(TenHang,MoTaHang,DonVi,Gia,SoLuong,ThanhTien)
	values('May Tinh T450','May nhap moi','Chiec',1000,1,1000),
		  ('Đien Thoai Nokia5670','Dien thoai dang hot','Chiec',200,2,400),
		  ('May In Samsung 450','May in dang e','Chiec',100,1,100)
go
select * from Danhsachcacmathang
go

Create table Dondathang(
	Masodonhang int,
	Nguoidathang nvarchar,
	Diachi nvarchar,
	Dienthoai int,
	Ngaydathang datetime
)
go

insert into Dondathang(Masodonhang,Nguoidathang,Diachi,Dienthoai,Ngaydathang)
		values(123,'Nguyen Van A','111 Nguyen Trai Thanh Xuan Ha Noi',987654321,11/18/09)
go
select * from Dondathang
go

--3
insert into Danhsachcacmathang(TenHang,MoTaHang,DonVi,Gia,SoLuong,ThanhTien)
	values('Laptop','May nhap hot','Chiec',10000,3,30000),
		  ('Tivi Samsung','Tivi moi ra','Chiec',20000,4,80000),
go


--4
Create table Chitietdonhang(
	KhachHang nvarchar,
	SanPham nvarchar,
	MaSoDonHang nvarchar
)
go
insert into Chitietdonhang(KhachHang,MaSoDonHang) select Nguoidathang,Masodathang from Dondathang
insert into CHitietdonhang(SanPham) select TenHang from Danhsachcacmathang
go

--5
select KhachHang from Chitietdonhang Order by KhachHang
go
select Tenhang from Danhsachcacmahang Order by Gia DESC
go
select Tenhang from Danhsachcacmahang Where Gia<10000
go

--6
select count(KhachHang) from Chitietdonhang
go
select count(Tenhang) from Danhsachcacmathang
go


--7
alter table Danhsachcacmathang alter column Gia check(Gia>0)
go
alter table Dondathang alter column Ngaydathang check(Ngaydathang<curdate())
go
alter table Chitietdonhang add Ngayxuathien datetime
go
