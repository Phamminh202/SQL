IF EXISTS (SELECT * FROM sys.databases WHERE Name='RiverPlate')
DROP DATABASE RiverPlate
GO
CREATE DATABASE RiverPlate
GO
USE RiverPlate
GO



create table student
(
	studentno int primary key,
	studentname nvarchar(50),
	studentaddress nvarchar(100),
	phoneno int,
)
go

insert into student values (1,'A','TB',12345),
                           (2,'B','HN',23456),
						   (3,'c','CM',34567),
						   (4,'D','QN',45678)
go

create table department
(
	deptno int primary key,
	deptname varchar (50),
	managername nvarchar(30)
)
go

insert into department values (1,'nhom1','A'),
                              (2,'nhom1','A'),
							  (3,'nhom1','A'),
							  (4,'nhom1','A')
go

create table assignment
(
	assignmentno int primary key,
	description nvarchar(100),
)
go

insert into assignment values(1,'Viet 1 CT'),
                             (2,'Viet 1 CT'),
							 (3,'Viet 1 CT'),
							 (4,'Viet 1 CT')
go

create table works_assign
(
	jobid int primary key,
	studentno int,
	assignment int,
	totalhours int,
	jobdetails nvarchar(450)
	constraint lk foreign key (studentno) references student(studentno),
	constraint bk foreign key (assignment) references  assignment(assignmentno)
)
go

insert into works_assign values(123,1,1,5,'Viet 1 chuong trinh tao 1 danh sach quan li hs'),
                               (124,2,2,5,'Viet 1 chuong trinh tao 1 danh sach quan li hs'),
							   (125,3,3,5,'Viet 1 chuong trinh tao 1 danh sach quan li hs'),
							   (126,4,4,5,'Viet 1 chuong trinh tao 1 danh sach quan li hs')
go

select * from student go
select * from department go
select * from assignment go
select * from works_assign go

create clustered IX_Student on student(studentno)
go

alter index IX_student on student rebuild
go

create nonclustered index IX_Dept on department(deptname,managername)
go