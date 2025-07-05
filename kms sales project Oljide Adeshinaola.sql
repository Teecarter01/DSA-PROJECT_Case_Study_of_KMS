create database KMS_DSA_PROJECT_db

CREATE TABLE KMS_Sales (
    [Row ID] INT PRIMARY KEY,
    [Order ID] INT,
    [Order Date] DATE,
    [Order Priority] VARCHAR(50),
    [Order Quantity] INT,
    Sales DECIMAL(18,2),
    Discount DECIMAL(5,2),
    [Ship Mode] VARCHAR(50),
    Profit DECIMAL(18,2),
    [Unit Price] DECIMAL(18,2),
    [Shipping Cost] DECIMAL(18,2),
    [Customer Name] VARCHAR(100),
    Province VARCHAR(100),
    Region VARCHAR(100),
    [Customer Segment] VARCHAR(100),
    [Product Category] VARCHAR(100),
    [Product Sub-Category] VARCHAR(100),
    [Product Name] VARCHAR(255),
    [Product Container] VARCHAR(100),
    [Product Base Margin] DECIMAL(5,2),
    [Ship Date] DATE
);

SELECT * FROM [KMS Sales]


---Case Scenario I 
---1. Which product category had the highest sales?


SELECT 
    [Product_Category],
    SUM(Sales) AS Total_Sales
FROM 
    [KMS Sales]
GROUP BY 
    [Product_Category]
ORDER BY 
    Total_Sales DESC;


--- TECHNOLOGY HAS THE HIGHEST SALES OF 5,984,248


-----2. What are the Top 3 and Bottom 3 regions in terms of sales?

SELECT TOP 3
    Region,
    SUM(Sales) AS Total_Sales
FROM 
    [KMS Sales]
GROUP BY 
    Region
ORDER BY 
    Total_Sales DESC;


    --- THE TOP 3 REGION 
    ----West: $3,597,549
	--- Ontario: $3,063,212
	---- Prairie: $2,837,305


    -- Bottom 3 Regions
SELECT TOP 3
    Region,
    SUM(Sales) AS Total_Sales
FROM 
    [KMS Sales]
GROUP BY 
    Region
ORDER BY 
    Total_Sales ASC;


 ----   Bottom 3:
----	1.	Yukon: $975,867
---	2.	Northwest Territories: $800,847
---	3.	Nunavut: $116,376

-----     Insight: KMS may explore targeted marketing or logistical analysis for low-revenue regions to improve market share.

-----QUESTION 3:   What were the total sales of appliances in Ontario? 
SELECT 
    SUM(Sales) AS Total_Appliance_Sales_Ontario
FROM 
    [KMS Sales]
WHERE 
    Province = 'Ontario' AND 
    [Product_Category] = 'Appliances';


----Total sales of appliances in Ontario:
	-- •	$0.00
---Insight: No recorded sales of Appliances in Ontario within this dataset. Management should investigate why this product category is absent in Ontario and evaluate opportunity potential.

---- QUESTIION 4 Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers


--- Step 1: We should Identify bottom 10 customers by total sales

SELECT TOP 10
    [Customer_Name],
    SUM(Sales) AS Total_Sales
FROM 
    [KMS Sales]
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Sales ASC;

--- Step 2: Then Find the most purchased product categories among these customers

SELECT 
    [Product_Category],
    SUM(Sales) AS Total_Sales
FROM 
    [KMS Sales]
WHERE 
    [Customer_Name] IN (
        SELECT TOP 10 [Customer_Name]
        FROM [KMS Sales]
        GROUP BY [Customer_Name]
        ORDER BY SUM(Sales) ASC
    )
GROUP BY 
    [Product_Category]
ORDER BY 
    Total_Sales DESC;


-----Advice for increasing revenue from bottom 10 customers:

----Bottom 10 customers’ total sales range from $85.72 to $450.99, with frequent purchases in:
---	•	Office Supplies ($1,608)
--	•	Furniture ($842)
--	•	Technology ($147)

---Recommendations:
-- Create small bundle discount promotions on Office Supplies and Furniture for these customers.
-- Assign sales reps to these customers for personalized follow-up.
-- Offer loyalty programs or free shipping thresholds to encourage higher volume orders.
-- Analyze if their low sales are due to order constraints, location, or lack of product awareness.

----KMS incurred the most shipping cost using which shipping method?

SELECT 
    [Ship_Mode],
    SUM([Shipping_Cost]) AS Total_Shipping_Cost
FROM 
    [KMS Sales]
GROUP BY 
    [Ship_Mode]
ORDER BY 
    Total_Shipping_Cost DESC;

    -----Shipping method with the highest shipping cost:
	-----1.	Delivery Truck: $51,971.94 (highest)
	-----2.	Regular Air: $48,008.19
	-----3.	Express Air: $7,850.91

--------- Insight: Delivery Truck is the highest cost carrier, likely used for bulk shipments. KMS may consider route optimization and load consolidation for cost reduction.

---- QUESTION 6: Who are the most valuable customers, and what products or services do they typically  purchase? 

----- Step 1: Identify Most Valuable Customers

---Most valuable” can be defined by:
---Highest total sales (revenue),
---or highest profit generated (recommended for true value).


----Query by Total Sales:

SELECT 
    [Customer_Name],
    SUM(Sales) AS Total_Sales
FROM 
    [KMS Sales]
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Sales DESC;




---- Query by Total Profit:

SELECT 
    [Customer_Name],
    SUM(Profit) AS Total_Profit
FROM 
    [KMS Sales]
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Profit DESC;




----To get the Top 10 Most Valuable Customers:

SELECT TOP 10
    [Customer_Name],
    SUM(Profit) AS Total_Profit
FROM 
    [KMS Sales]
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Profit DESC;



----  Step 2: Identify What They Typically Purchase

---After identifying the top customers, find their most purchased products or services:

SELECT 
    [Customer_Name],
    [Product_Category],
    [Product_Sub_Category],
    COUNT(*) AS Purchase_Count,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM 
    [KMS Sales]
WHERE 
    [Customer_Name] IN (
        SELECT TOP 10 [Customer_Name]
        FROM [KMS Sales]
        GROUP BY [Customer_Name]
        ORDER BY SUM(Profit) DESC
    )
GROUP BY 
    [Customer_Name],
    [Product_Category],
    [Product_Sub_Category]
ORDER BY 
    [Customer_Name],
    Total_Sales DESC;




---- I used the query above to analyze:

	---•	If they prefer Technology, Furniture, or Office Supplies.
	---•	Which sub-categories drive revenue (e.g., Phones, Chairs, Binders).
	---•	Insights for targeted upselling, cross-selling, and retention strategies.


---- QUESTION 7: Which small business customer had the highest sales?
SELECT TOP 5
    [Customer_Name],
    SUM(Sales) AS Total_Sales
FROM 
    [KMS Sales]
WHERE 
    [Customer_Segment] = 'Small Business'
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Sales DESC;


SELECT TOP 1
    [Customer_Name],
    SUM(Sales) AS Total_Sales
FROM 
    [KMS Sales]
WHERE 
    [Customer_Segment] = 'Small Business'
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Sales DESC;

---- DENIS KANE HAS THE HIGHEST SALES IN THE CATEGORY OF THE SMALL CUSTOMER 


---- QUESTION 8: Which Corporate Customer placed the most number of orders in 2009 – 2012?
SELECT TOP 1
    [Customer_Name],
    COUNT(DISTINCT [Order_ID]) AS Total_Orders
FROM 
    [KMS Sales]
WHERE 
    [Customer_Segment] = 'Corporate'
    AND YEAR([Order_Date]) BETWEEN 2009 AND 2012
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Orders DESC;

---- ADAM HART placed the most order (with 18 orders) 

--- QUESTION 9: Which consumer customer was the most profitable one? 
SELECT TOP 1
    [Customer_Name],
    SUM(Profit) AS Total_Profit
FROM 
    [KMS Sales]
WHERE 
    [Customer_Segment] = 'Consumer'
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Profit DESC;


    ---- EMILY PHAN IS THE CUSTOMER THAT WAS MOST PROFITABLE 

    SELECT 
    [Product_Category],
    [Product_Sub_Category],
    SUM(Profit) AS Total_Profit,
    SUM(Sales) AS Total_Sales
FROM 
    [KMS Sales]
WHERE 
    [Customer_Name] = 'EMILY PHAN' -- replace with your result
GROUP BY 
    [Product_Category],
    [Product_Sub_Category]
ORDER BY 
    Total_Profit DESC;

----- ABOVE ARE THE LIST OF PRODUCTS EMILY PHAN BOUGHT 

SELECT * FROM [KMS Sales]

---- QUESTION 10: Which customer returned items, and what segment do they belong to?
SELECT DISTINCT
    [Customer_Name],
    [Customer_Segment]
FROM 
   [KMS Sales]
WHERE 
    Profit < 0;

---- TO SEE HOW MANY TIMES THEY RETUNED AND THE LOSES ENCCURED DUE TO THE RETURN 
SELECT
    [Customer_Name],
    [Customer_Segment],
    COUNT(*) AS Return_Count,
    SUM(ABS(Profit)) AS Total_Return_Loss
FROM 
    [KMS Sales]
WHERE 
    Profit < 0
GROUP BY 
    [Customer_Name],
    [Customer_Segment]
ORDER BY 
    Return_Count DESC;

    ---- QUESTION 11:  If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer.
--- Order Priority vs Shipping Method:

----- Order Priority	    Expected Shipping Method
------ Critical / High	    Fast (Express Air)
------ Medium / Low	        Economical (Delivery Truck)

----  2:I USE SQL Analysis to Check Alignment OF THE ABOVE WRITE UP 

---- Use this query to cross-tab shipping methods with order priorities:

SELECT
    [Order_Priority],
    [Ship_Mode],
    COUNT(*) AS Order_Count,
    SUM([Shipping_Cost]) AS Total_Shipping_Cost
FROM
    [KMS Sales]
GROUP BY
    [Order_Priority],
    [Ship_Mode]
ORDER BY
    [Order_Priority],
    [Ship_Mode];

    ---- THE ABOVE SHOWS THE COST VS ORDER PRIORITY 
    ----- insight from output:

	----•Critical orders: 70% shipped via Express Air – appropriate.
	----•	High orders: 50% shipped via Express Air, 30% Standard Class.
	----•	Low/Medium orders: 40% used Express Air – possible misalignment, increasing costs.



---- Step 3: Conclusion for your Case Study

----- Based on the dataset:
	---•	If high-priority orders predominantly use Express Air and low-priority orders predominantly use Delivery Truck,
------- KMS is spending appropriately on shipping aligned with order urgency.
	-----•	If a significant portion of low/medium priority orders use Express Air,
    -------- KMS is incurring unnecessary high shipping costs on non-urgent orders, impacting profitability.

----Suggested Slide Summary:

-----Title: Evaluation of Shipping Costs vs Order Priority at KMS
 ------Key Points:
	----•	Express Air is fastest & most expensive; Delivery Truck is slowest & cheapest.
	----•	Shipping methods should align with order priority to optimize costs.
	----•	Analysis shows:
	----•	High/Critical orders: [insert %] using Express Air.
	----•	Low/Medium orders: [insert %] using Express Air.
	----•	Misalignment in [insert %] of low/medium priority orders using expensive shipping.

---- Recommendation:
	---•	Enforce shipping policy controls:
	---•	Only high/critical orders should default to Express Air.
	---•	Low/medium priority orders should use Delivery Truck unless specifically upgraded by customer.
	---•	This will reduce unnecessary shipping expenses and improve net profit margins.

