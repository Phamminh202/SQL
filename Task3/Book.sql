if exists (select * from sys.databases where name='BookLibrary')
drop database BookLibrary
go

create DATABASE BookLibrary
Go

use BookLibrary
go

create table Book(
	BookCode int primary key identity,
	BookTitle varchar(100) NOT NULL,
	Author varchar(50) NOT NULL,
	Edition int,
	BookPrice money,
	Copies int
)
go

create table Member(
	MemberCode int primary key identity,
	Name varchar(50)NOT NULL,
	Address varchar(100)NOT NULL,
	PhoneNumber int
)
go

create table IssueDetails(
	BookCode int NOT NULL,
	MemberCode int NOT NULL,
	IssueDate datetime ,
	ReturnDate datetime ,
	constraint fk foreign key (BookCode) references Book(BookCode)
)
go

--A
alter table IssueDetails
	drop constraint fk
go

--B
alter table Member drop constraint MemberCode;
go
alter table Book drop constraint BookCode;
go

--C
alter table Member add constraint MemberCode primary key
go
alter table Book add constraint BookCode  primary key
go

--D
alter table IssueDetails add constraint fk foreign key references BookCode
go

--E
alter table Book add constraint BookPrice check(0<BookPrice and BookPrice<200)
go

--F
alter table Member add primary key(PhoneNumber)
go

--G
alter table IssueDetails modify BookCode Not Null
alter table IssueDetails modify MemberCode Not Null

--H
ALTER TABLE  IssueDetails ADD CONSTRAINT PK_CUSTID PRIMARY KEY (BookCode,MemberCode);
go

--I
insert into Book(BookTitle,Author,Edition,BookPrice,Copies)values('Book1','Minh',10,50000,6);
insert into Book(BookTitle,Author,Edition,BookPrice,Copies)values('Book2','Minh',12,52000,6);
insert into Book(BookTitle,Author,Edition,BookPrice,Copies)values('Book3','Minh',15,54000,6);
insert into Book(BookTitle,Author,Edition,BookPrice,Copies)values('Book4','Minh',18,56000,6);
go
select * from Book
go

insert into Member(Name,Address,PhoneNumber)values(Tam,TB,081234567)
insert into Member(Name,Address,PhoneNumber)values(Manh,TB,031234567)
insert into Member(Name,Address,PhoneNumber)values(Quyet,TB,091234567)
insert into Member(Name,Address,PhoneNumber)values(Minh,TB,081234567)
go
select * from Member
go

insert into IssueDetails(IssueDate,ReturnDate)values(1-1,15-1)
insert into IssueDetails(IssueDate,ReturnDate)values(2-1,18-1)
insert into IssueDetails(IssueDate,ReturnDate)values(3-1,20-1)
insert into IssueDetails(IssueDate,ReturnDate)values(4-1,14-1)
select * from IssueDetails
go