

-- câu 1

select k.SalesOrderNumber,k.SalesOrderLineNumber,k.ProductKey,DP.EnglishProductName,k.SalesTerritoryCountry ,k.SalesAmount,k.OrderQuantity from DimProduct as DP inner join
(select FIS.SalesOrderNumber,FIS.SalesOrderLineNumber,FIS.ProductKey,DST.SalesTerritoryCountry,FIS.SalesAmount,FIS.OrderQuantity from FactInternetSales as FIS inner join 
DimSalesTerritory as DST on DST.SalesTerritoryKey=FIS.SalesTerritoryKey and YEAR(OrderDate) in ('2013','2014')) as k on k.ProductKey=DP.ProductKey

-- câu 2


select DP.ProductKey,N.SalesTerritoryCountry,DP.EnglishProductName,N.InternetTotalSales,N.NumberofOrders from DimProduct as DP inner join
(select DST.SalesTerritoryKey,FIS.ProductKey,DST.SalesTerritoryCountry,Sum(TotalProductCost) as InternetTotalSales,Sum(SalesOrderLineNumber) as NumberofOrders from FactInternetSales as FIS inner join  DimSalesTerritory as DST on DST.SalesTerritoryKey=FIS.SalesTerritoryKey
group by FIS.ProductKey,DST.SalesTerritoryCountry,DST.SalesTerritoryKey) 
as N on N.ProductKey=DP.ProductKey order by SalesTerritoryCountry asc


-- câu 3



SELECT	C.SalesTerritoryCountry,C.ProductKey,C.InternetTotalSales, (C.InternetTotalSales *100 )/ (SELECT InternetTotal FROM ( SELECT SUM(TotalProductCost)  AS InternetTotal,DST.SalesTerritoryCountry FROM DimSalesTerritory AS DST , FactInternetSales as FIS WHERE  DST.SalesTerritoryKey = FIS.SalesTerritoryKey
GROUP BY DST.SalesTerritoryCountry ) AS D WHERE C.SalesTerritoryCountry = D.SalesTerritoryCountry) AS  PercentofTotaInCountry
FROM (SELECT DP.ProductKey,A.SalesTerritoryCountry,DP.EnglishProductName,A.InternetTotalSales,A.NumberofOrders FROM DimProduct AS DP INNER JOIN 
(SELECT  ProductKey,DST.SalesTerritoryCountry,FIS.SalesTerritoryKey,SUM(TotalProductCost) AS InternetTotalSales ,SUM(SalesOrderLineNumber) AS NumberofOrders FROM DimSalesTerritory AS DST INNER JOIN FactInternetSales as FIS ON DST.SalesTerritoryKey = FIS.SalesTerritoryKey 
GROUP BY FIS.SalesTerritoryKey,DST.SalesTerritoryCountry,FIS.ProductKey) AS A ON A.ProductKey = DP.ProductKey  ) AS C 



-- câu 4

SELECT   DG.City,SUM(A.InternetTotalSales)AS DOANHTHU ,A.YEAR as YEAR,DG.EnglishCountryRegionName  FROM 
(SELECT FIS.CustomerKey,COUNT(*) AS SOLUONG,SUM(FIS.TotalProductCost) AS InternetTotalSales ,DC.GeographyKey,YEAR(FIS.ShipDate) AS YEAR  FROM FactInternetSales AS FIS INNER JOIN DimCustomer AS DC 
ON FIS.CustomerKey = DC.CustomerKey GROUP BY FIS.CustomerKey,DC.GeographyKey,YEAR(FIS.ShipDate)
) AS A
INNER JOIN DimGeography AS DG ON A.GeographyKey = DG.GeographyKey GROUP BY DG.CITY,DG.EnglishCountryRegionName,A.YEAR  ORDER BY DG.CITY DESC 