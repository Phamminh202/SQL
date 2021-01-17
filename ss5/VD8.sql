Select SalesPersonID,Year(Order Date)As OrderYear
From Sales.SalesOrderHeader
Where CustomerID=30084
Group By SalesPersonID,Year(Order Date)
Having count(*)>1
Order By SalesPersonID,Order Year;