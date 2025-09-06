SELECT *
FROM "RETAIL"."TRANSACTIONS"."DATA";
  
SELECT MIN(Total_Amount)AS Min_Total_Amount,
       MAX(Total_Amount)AS Max_Total_Amount
FROM "RETAIL"."TRANSACTIONS"."DATA";

SELECT

---Dates

    TO_DATE(Purchase_Date)AS purchase_date,
    MONTHNAME(Purchase_Date)AS month_name,
    DAYNAME(Purchase_Date)AS day_of_week,
    DAYOFMONTH(TO_DATE(Purchase_Date))AS day_of_month,
    TO_CHAR(TO_DATE(Purchase_Date),'MM') AS month_id,
    YEAR(TO_DATE(Purchase_Date))AS year_of_purchase,

---Aggregates

    COUNT(DISTINCT Transaction_ID)AS number_of_transactions,
    COUNT(DISTINCT Customer_ID)AS number_of_customers,
    SUM(Quantity)AS total_number_of_quantity,
    SUM(total_amount)AS total_revenue, 
    
---Case Statements  
 
       CASE
            WHEN age BETWEEN 18 AND 24 THEN '18-24:Youth'
            WHEN age BETWEEN 25 AND 34 THEN '25-34:Young Adults'
            WHEN age BETWEEN 35 AND 54 THEN'35-54:Mature Adults'
            ELSE '55+:Senior'
      END AS Age_Group,

        CASE 
            WHEN TOTAL_AMOUNT BETWEEN 0 AND 100 THEN '0-100:Low'
            WHEN TOTAL_AMOUNT BETWEEN 101 AND 500 THEN '100-500:Medium'
            WHEN TOTAL_AMOUNT BETWEEN 501 AND 1500 THEN '501-1500:High'
            ELSE'1500+:Very High'
        END AS Spender_Bucket,
             
        CASE    
            WHEN DAYOFWEEK(TO_DATE(Purchase_Date)) BETWEEN 1 AND 5 THEN 'Weekday'
    ELSE 'Weekend'
END AS Week_Part,  

CASE
    WHEN MONTH(purchase_date) IN (12, 1, 2) THEN 'Summer'
    WHEN MONTH(purchase_date) IN (3, 4, 5) THEN 'Autumn'
    WHEN MONTH(purchase_date) IN (6, 7, 8) THEN 'Winter'
    ELSE 'Spring'
END AS Season,

CASE
    WHEN day_of_week= 'Mon' THEN 1
    WHEN day_of_week= 'Tue' THEN 2
    WHEN day_of_week= 'Wed' THEN 3
    WHEN day_of_week= 'Thu' THEN 4
    WHEN day_of_week= 'Fri' THEN 5
    WHEN day_of_week= 'Sat' THEN 6
    WHEN day_of_week= 'Sun' THEN 7
END AS Day_ID,

---Groups

Product_Category,
Gender,

FROM "RETAIL"."TRANSACTIONS"."DATA"

GROUP BY ALL;
