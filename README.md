# Capstone Project – The Incubator Hub LITA

## Overview
This project focuses on analysing the sales performance of a retail store to derive insights about the business’s performance and segment customers based on purchasing behaviour for a subscription service and to identify trends. This report summarizes the key findings from the sales data analysis and customer segmentation. The analysis is conducted using **SQL**, **Excel**, and **Power BI**, with the following objectives:
1. Analyse sales trends, customer lifetime value, and other key metrics.
2. Segment customers using their subscription patterns to inform marketing strategies.
3. Visualize the findings in Power BI dashboards.

## Table of Contents
- [Data](#data)
- [SQL Queries](#sql-queries)
- [Excel Reports](#excel-reports)
- [Power BI Dashboards](#power-bi-dashboards)
- [Reports](#reports)
- [Setup](#setup)

## Data
- `LITA Capstone Dataset CustomerData.csv`, `LITA Capstone Dataset SalesData.csv`: Contains the raw sales and customer data used for the analysis.
- `data/processed`: Contains cleaned and transformed data (processed using Excel).
## SQL Queries
- **`LITAPROJECT_SQL.sql`**: SQL queries for analysing sales data for the retail store and customer data for the subscription service.

Example snippet:
```sql
---Total Revenue for Each Product---
SELECT PRODUCT, SUM(TotalRevenue) AS TOTALREVENUE FROM CapstoneDatasetSalesData
GROUP BY PRODUCT
ORDER BY 2 DESC
```

Example snippet:
```sql
---Total Number of Customers from Each Region---
SELECT Region, COUNT(CUSTOMERID) AS TOTALCUSTOMERS FROM CapstoneDatasetCustomerData
GROUP BY Region
```

## Excel Reports
- **`excel_reports/sales_analysis.xlsx`**: Contains data analysis and visualizations of sales trends, revenue, and customer metrics.
- **`excel_reports/customer_segmentation.xlsx`**: Contains customer segmentation analysis for a subscription service.

## Power BI Dashboards
- **`power_bi/sales_dashboard.pbix`**: Power BI dashboard that visualizes total sales, units sold, sales growth, and profit margin.
- **`power_bi/customersegmentation_dashboard.pbix`**: Power BI dashboard that visualizes customer segmentation insights (e.g., customer clusters, behaviors).

## Reports
- **`reports/final_report.md`**: Summarizes the analysis and insights from the project, including charts and customer segments.

## Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/sales-analysis-customer-segmentation.git
   ```
2. Review the **SQL Queries** in the `sql_queries` folder to extract and clean the data.
3. Open the **Excel Reports** and **Power BI Dashboards** to review the analysis and visualizations.
