Select Sales OrderID,CustomerID,Sales PersonID,TerritoruID,YEAR(Order Date)
As Current Year,Year(Order Date)+1 AS NextYear
From Sales.SalesOrderHeader