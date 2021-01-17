Use CUST_DB;
ALter DATABASE CUST_DB
ADD file(Name='Cust_DB1',filename='C:\ProgramFiles\Microsoft SQL Sever\MSSQL11.MSSQLSERVER\MSSQL\DATA\Customer_DB_log.ndf')
to filegroup FG_ReadOnly
Alter DATABASE CUST_DB
Modify filegroup FG_ReadOnly Default
