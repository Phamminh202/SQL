
IF EXISTS (SELECT * FROM sys.databases WHERE Name='CodeLean')
DROP DATABASE CodeLean
GO
CREATE DATABASE CodeLean
GO
USE CodeLean
GO

 create table Classes
 (
	ClassName char(6) primary key,
	Teacher varchar(30),
	TimeSlot varchar(30),
	Class int,
	Lab int
)
go
--1
create unique index MyClusteredIndex on Classes(ClassName)
go
--2
create nonclustered index TeacherIndex on Classes(Teacher)
go
--3
drop index TeacherIndex on Classes
go
--4
alter index MyClusteredIndex on Classes rebuild with(fillfactor=60)
go
--5
create index ClassLabIndex on Classes(Class,Lab)
go
--6
exec sp_helpindex 'classes'
go
