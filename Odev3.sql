

-- Soru 1 : AdventureWorks2017 veritaban�ndaki "Product" tablosundaki �r�nlerin toplam say�s�n� bulun.

SELECT COUNT(*) AS toplamUrunSayisi FROM Production.Product 

-- Soru 2: AdventureWorks2017 veritaban�ndaki "SalesOrderDetail" tablosundaki t�m sat��lar�n toplam tutar�n� bulun.

SELECT SUM(LineTotal) AS toplamSatisTutari FROM Sales.SalesOrderDetail 

-- Soru 3: AdventureWorks2017 veritaban�ndaki "Employee" tablosundaki �al��anlar�n ortalama maa��n� bulun.

SELECT AVG(Rate) AS ortalamaMaas FROM HumanResources.EmployeePayHistory

-- Soru 4 : AdventureWorks2017 veritaban�ndaki "Employee" tablosundaki en y�ksek maa�a sahip �al��an�n ad�n� ve maa��n� bulun.

SELECT TOP 1 FirstName,Rate FROM Person.Person T0
LEFT JOIN  HumanResources.EmployeePayHistory T1 ON T0.BusinessEntityID = T1.BusinessEntityID
ORDER BY Rate DESC

-- Soru 4 ikinci y�ntem 

SELECT TOP 1 BusinessEntityID, MAX(Rate) AS enYuksekMaas FROM HumanResources.EmployeePayHistory
GROUP BY BusinessEntityID

-- Soru 5: AdventureWorks2017 veritaban�ndaki "Product" tablosundaki en d���k stok miktar�na sahip �r�n�n ad�n� ve stok miktar�n� bulun.

SELECT TOP 1 Name,Quantity FROM Production.ProductInventory T2
LEFT JOIN Production.Product T3 ON T2.ProductID = T3.ProductID
ORDER BY Quantity ASC 

-- Soru 5 ikinci y�ntem

SELECT TOP 1 ProductID,MIN(Quantity) FROM Production.ProductInventory
GROUP BY ProductID,Quantity
ORDER BY Quantity ASC

-- Soru 6 : AdventureWorks2017 veritaban�ndaki "Customer" tablosundaki m��terilerin �lkelere g�re say�s�n� bulun ve en y�ksek m��teri say�s�na sahip ilk 5 �lkeyi s�ralay�n

SELECT TOP 5 TerritoryID,SUM(StoreID) AS musteriSayisi from Sales.Customer
GROUP BY TerritoryID
ORDER BY musteriSayisi DESC