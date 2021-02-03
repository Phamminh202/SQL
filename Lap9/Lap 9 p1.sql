use AdventureWorks2019
go

create proc sp_DisplayEmployeesHireYear
	@HireYear int
as
select * from HumanResources.Employee
where DATEPART(YY,HireDate)=@HireYear
go

exec sp_DisplayEmployeesHireYear 2003
go

create proc sp_EmployeesHireYearCount
	@HireYear int,
	@Count int output
as
select @Count=COUNT(*) from HumanResources.Employee
where DATEPART(YY,HireDate)=@HireYear
go

declare @Number int
exec sp_EmployeesHireYearCount 2003,@Number output
print @Number
go

create proc sp_EmployeesHireYearCount2
	@HireYear int
as
declare @Count int
select @Count=COUNT(*) from HumanResources.Employee
where DATEPART(YY,HireDate)=@HireYear
Return @Count
go

declare @Number int
exec @Number=sp_EmployeesHireYearCount2 2003
print @Number
go

create table #Students
(
	RollNo varchar(6) constraint PK_Students primary key,
	FullName nvarchar(100),
	Birthday datetime constraint DF_StudentsBirthday default dateadd(yy,-18,getdate())
	)
	go

	create proc #spInsertStudents
		@RollNo varchar(6),
		@fullName nvarchar(100),
		@birthday datetime
	as begin
		if(@birthday is null)
			set @birthday=DATEADD(YY,-18,getdate())
		insert into #Students(RollNo,FullName,Birthday)
			values(@RollNo,@fullName,@birthday)
	end
	go

	exec #spStudents 'A12345','abc',NULL
	exec #spStudents 'A54321','abc','12/24/2011'
	select * from #Students

	create proc #spDeleteStudents
		@rollNo varchar(6)
	as begin
		delete from #Students where RollNo=@rollNo
	end

	exec #spDeleteStudents 'A12345'
	go

	create proc Cal_Square @num int=0 as
	begin
		return(@num * @num);
	end
	go

	declare @square int;
	exec @square=Cal_Square 10;
	print @square;
	go

	select OBJECT_DEFINTION_ID('HumanResources.uspEmployeePersonalInfo')) as DEFINTION

	select definition from sys.sql_modules
	where object_id=OBJECT_ID('HumanResources.uspEmployeePersonalInfo')
	go

	sp_depends 'HumanResources.uspEmployeePersonalInfo'
	go

	Use AdventureWorks
	go

	create proc sp_DisplayEmplyees as
	select * from HumanResources.Employee
	go

	alter proc sp_DisplayEmployees as
	select * from HumanResources.Employee
	where Gender='F'
	go

	exec sp_DisplayEmployees
	go

	drop proc sp_DisplayEmplyees
	go

	create proc sp_EmployeeHire
	as begin
		exec sp_DisplayEmployeesHireYear 1999
		declare @Number int
		exec sp_EmployeesHireYearCount 1999,@Number output
		print N'Số nhân viên vào làm năm 1999 là: '+ convert(varchar(13),@Number)
	end
	go

	exec sp_EmployeeHire
	go

	alter proc sp_EmployeeHire
		@HireYear int
	as begin
		begin try
			exec sp_DisplayEmployeesHireYear @HireYear
			declare @Number int

			exec sp_EmployeesHireYearCount @HireYear,@Number output,'123'
			print N'Số nhân viên vào làm năm là: '+ convert(varchar(3),@Number)
		end try
		begin catch
			print N'Có lỗi xảy ra trong khi thực hiện thủ tục lưu trữ'
		end catch
		print N'Kết thúc thủ tục lưu trữ'
	end
	go

	exec sp_EmployeeHire 1999
	go

	alter proc sp_EmployeeHire
		 @HireYear int
	as begin
		exec sp_DisplayEmployeesHireYear @HireYear
		declare @Number int

		exec sp_EmployeesHireYearCount @HireYear,@Number output,'123'
		if @@ERROR<>0
			print N'Có lỗi xảy ra trong khi thực hiện thủ tục lưu trữ'
		print N'Số nhân viên vào làm năm là: '+ convert(varchar(3),@Number)
	end
	go

	exec sp_EmployeeHire 1999