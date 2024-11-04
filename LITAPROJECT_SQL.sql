---SALES DATA---
select * from [dbo].[CapstoneDatasetSalesData]

---Total Sales For Each Product---
SELECT PRODUCT, SUM(Quantity) AS TOTALSALE FROM CapstoneDatasetSalesData
GROUP BY PRODUCT
ORDER BY 2 DESC

---Total Sales For Each Region---
SELECT REGION, SUM(Quantity) AS TOTALSALE FROM CapstoneDatasetSalesData
GROUP BY REGION
ORDER BY 2 DESC

---Product With The Most Sales---
SELECT TOP 1 PRODUCT, SUM(Quantity) AS MAXSALE FROM CapstoneDatasetSalesData
GROUP BY PRODUCT
ORDER BY 2 DESC

---Total Revenue For Each Product---
SELECT PRODUCT, SUM(TotalRevenue) AS TOTALREVENUE FROM CapstoneDatasetSalesData
GROUP BY PRODUCT
ORDER BY 2 DESC

---Total Revenue For Each Region---
SELECT REGION, SUM(TotalRevenue) AS TOTALREVENUE FROM CapstoneDatasetSalesData
GROUP BY REGION
ORDER BY 2 DESC

---Total Sales in Each Month in the Current Year---
SELECT DATENAME(MONTH,OrderDate) AS MONTH, SUM(Quantity) AS TOTALSALE
FROM CapstoneDatasetSalesData
WHERE YEAR(OrderDate) = YEAR(GETDATE())
GROUP BY MONTH(OrderDate), DATENAME(MONTH,OrderDate)
ORDER BY MONTH(OrderDate)

---Total Revenue in Each Month in the Current Year---
SELECT DATENAME(MONTH,OrderDate) AS MONTH, SUM(TotalRevenue) AS TOTALREVENUE
FROM CapstoneDatasetSalesData
WHERE YEAR(OrderDate) = YEAR(GETDATE())
GROUP BY MONTH(OrderDate), DATENAME(MONTH,OrderDate)
ORDER BY MONTH(OrderDate)

---Top 5 Customers By Total Purchase Amount---
SELECT TOP 5 Customer_Id, SUM(Quantity) AS MAXSPURCHASE FROM CapstoneDatasetSalesData
GROUP BY Customer_Id
ORDER BY 2 DESC

---Top 5 Customers By Total Amount Spent---
SELECT TOP 5 Customer_Id, SUM(TotalRevenue) AS MAXSPENT FROM CapstoneDatasetSalesData
GROUP BY Customer_Id
ORDER BY 2 DESC

--- Percentage of Total Sales Contributed by Each Region---
SELECT REGION, SUM(Quantity) * 100 / (SELECT SUM(Quantity) FROM CapstoneDatasetSalesData) AS PERCENTAGEOFTOTALSALE
FROM CapstoneDatasetSalesData
GROUP BY REGION
ORDER BY 2 DESC

--- Percentage of Total Revenue Contributed by Each Region---
SELECT REGION, SUM(TotalRevenue) * 100 / (SELECT SUM(TotalRevenue) FROM CapstoneDatasetSalesData) AS PERCENTAGEOFTOTALREVENUE
FROM CapstoneDatasetSalesData
GROUP BY REGION
ORDER BY 2 DESC

---Products With no Sales in the Last Quarter---
SELECT PRODUCT FROM CapstoneDatasetSalesData L1
WHERE NOT EXISTS (
     SELECT 1
	 FROM CapstoneDatasetSalesData L2
	 WHERE L2.PRODUCT = L1.PRODUCT
	 AND L2.ORDERDATE >= DATEADD(QUARTER, -1, GETDATE())
)
GROUP BY PRODUCT

---CUSTOMER DATA---

select * from [dbo].[CapstoneDatasetCustomerData]

---Total Number of Customers From Each Region---
SELECT Region, COUNT(CUSTOMERID) AS TOTALCUSTOMERS FROM CapstoneDatasetCustomerData
GROUP BY Region

---Most Popular Subscription Type by the Number of Customers---
SELECT SUBSCRIPTIONTYPE, COUNT(SUBSCRIPTIONTYPE) AS TOTALCUSTOMERS FROM CapstoneDatasetCustomerData
GROUP BY SUBSCRIPTIONTYPE

--- Customers Who Canceled Their Subscription Within 6 Months---
SELECT CUSTOMERID FROM CapstoneDatasetCustomerData
WHERE Canceled = 'TRUE'
  AND DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) <= 6

---Average Subscription Duration---
SELECT AVG(DATEDIFF(DAY, SubscriptionStart, SubscriptionEnd)) AS AvgSubscriptionDuration
FROM CapstoneDatasetCustomerData

---Customers With Subscriptions Longer than 12 Months---
SELECT CustomerID FROM CapstoneDatasetCustomerData
WHERE DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) > 12

---Total Revenue by Subscription Type---
SELECT SubscriptionType, SUM(Revenue) AS TOTALREVENUE FROM CapstoneDatasetCustomerData
GROUP BY SubscriptionType

---Top 3 Regions by Subscription Cancellations
SELECT TOP 3 Region, COUNT(*) AS TotalCancellations FROM CapstoneDatasetCustomerData
WHERE Canceled = 'TRUE'
GROUP BY Region
ORDER BY TotalCancellations DESC

---Total Number of Active and Canceled Subscriptions---
SELECT Canceled, COUNT(*) AS TotalSubscriptions FROM CapstoneDatasetCustomerData
GROUP BY Canceled;
