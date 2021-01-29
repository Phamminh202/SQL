use AdventureWorks2019
go

create table Class
(
	ClassCode varchar(10) primary key,
	HeadTeacher varchar(30),
	Room varchar(30),
	TimeSlot char,
	CloseDate datetime
)
go

create table Subject
(
	SubjectCode varchar(10),
	SubjectName varchar(40),
	WTest bit,
	PTest bit,
	WTest_per int,
	PTest_per int
)
go

create table Student
(
	RollNo varchar(10),
	ClassCode varchar(10),
	FullName varchar(30),
	Male bit,
	BirthDate datetime,
	Address varchar(30),
	Province char(2),
	Email varchar(30)
	constraint FK_Class foreign key(ClassCode) references Class(ClassCode) on Update cascade
)
go

create table Mark
(
	RollNo varchar(10),
	SubjectCode varchar(10),
	WMark float,
	PMark float,
	Mark float,
	constraint LK foreign key(RollNo) references Student(RollNo) on update cascade
	constraint MK foreign key(SubjectCode) references Subject(SubjectCode) on update cascade
)
go

insert into Class(ClassCode,HeadTeacher,Room,TimeSlot,CloseDate)
values  ('T2010A','Dang Kim Thi','206','T',05/02/21),
		('T2010B','Dang Kim Thi','205','T',04/02/21),
		('T2010C','Dang Kim Thi','204','T',03/02/21),
		('T2010D','Dang Kim Thi','203','T',02/02/21),
		('T2010E','Dang Kim Thi','202','T',01/02/21)
go

insert into Student(RollNo,ClassCode,,FullName,Male,BirthDate,Address,Province,Email)
values  ('TH1001','T2010A','A',1,10/01/01,'HN','HN','A@gmai.com'),
		('TH1002','T2010B','B',0,11/01/01,'HN','HN','B@gmai.com'),
		('TH1003','T2010C','C',0,01/01/01,'HN','HN','C@gmai.com'),
		('TH1004','T2010D','D',1,19/01/01,'HN','HN','D@gmai.com'),
		('TH1005','T2010E','E',1,31/01/01,'HN','HN','E@gmai.com')
go

insert into Subject(SubjectCode,SubjectName,WTest,PTest,WTest_per,PTest_per)
values  ('SQL','View',1,1,1,1),
		('SQL','View',1,1,1,1),
		('SQL','View',1,1,1,1),
		('SQL','View',1,1,1,1),
		('SQL','View',1,1,1,1)
go

insert into Mark(RollNo,SubjectCode,WMark,PMark,Mark)
values  ('TH1001','SQL',50,50),
		('TH1002','SQL',99,19),
		('TH1003','SQL',19,99),
		('TH1004','SQL',75,60),
		('TH1005','SQL',85,80)
go