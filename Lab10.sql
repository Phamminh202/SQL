CREATE DATABASE Lab10

--Sao dữ liệu từ bảng WorkOrder của cơ sở dữ liệu AdventueWorks sang cơ sở dữ liệu Lab10 vừa tạo
use AdventureWorks2019
select * into Lab10.dbo.WorkOrder from Production.WorkOrder go

--Sao dữ liệu từ bảng WorkOrder của cơ sở dữ liệu Lab10 sang bảng WorkOrderIX của cơ sở dữ liệu Lab10
use Lab10
select * into WorkOrderIX from WorkOrder go

select * from WorkOrder go
select * from WorkOrderIX go

--Sao dữ liệu từ bảng WorkOrder của cơ sở dữ liệu Lab10 sang bảng WorkOrderIX của cơ sở dữ liệu Lab10
create index IX_WorkOrderID on WorkOrderIX(WorkOrderID)


select * from WorkOrder where WorkOrderID=72000
select * from WorkOrderIX where WorkOrderID=72000