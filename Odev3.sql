

-- Soru 1 : AdventureWorks2017 veritabanýndaki "Product" tablosundaki ürünlerin toplam sayýsýný bulun.

SELECT COUNT(*) AS toplamUrunSayisi FROM Production.Product 

-- Soru 2: AdventureWorks2017 veritabanýndaki "SalesOrderDetail" tablosundaki tüm satýþlarýn toplam tutarýný bulun.

SELECT SUM(LineTotal) AS toplamSatisTutari FROM Sales.SalesOrderDetail 

-- Soru 3: AdventureWorks2017 veritabanýndaki "Employee" tablosundaki çalýþanlarýn ortalama maaþýný bulun.

SELECT AVG(Rate) AS ortalamaMaas FROM HumanResources.EmployeePayHistory

-- Soru 4 : AdventureWorks2017 veritabanýndaki "Employee" tablosundaki en yüksek maaþa sahip çalýþanýn adýný ve maaþýný bulun.

SELECT TOP 1 FirstName,Rate FROM Person.Person T0
LEFT JOIN  HumanResources.EmployeePayHistory T1 ON T0.BusinessEntityID = T1.BusinessEntityID
ORDER BY Rate DESC

-- Soru 4 ikinci yöntem 

SELECT TOP 1 BusinessEntityID, MAX(Rate) AS enYuksekMaas FROM HumanResources.EmployeePayHistory
GROUP BY BusinessEntityID

-- Soru 5: AdventureWorks2017 veritabanýndaki "Product" tablosundaki en düþük stok miktarýna sahip ürünün adýný ve stok miktarýný bulun.

SELECT TOP 1 Name,Quantity FROM Production.ProductInventory T2
LEFT JOIN Production.Product T3 ON T2.ProductID = T3.ProductID
ORDER BY Quantity ASC 

-- Soru 5 ikinci yöntem

SELECT TOP 1 ProductID,MIN(Quantity) FROM Production.ProductInventory
GROUP BY ProductID,Quantity
ORDER BY Quantity ASC

-- Soru 6 : AdventureWorks2017 veritabanýndaki "Customer" tablosundaki müþterilerin ülkelere göre sayýsýný bulun ve en yüksek müþteri sayýsýna sahip ilk 5 ülkeyi sýralayýn

SELECT TOP 5 TerritoryID,SUM(StoreID) AS musteriSayisi from Sales.Customer
GROUP BY TerritoryID
ORDER BY musteriSayisi DESC