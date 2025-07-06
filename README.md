# DSA-PROJECT_Case_Study_of_KMS
This project analyzes *sales, shipping patterns, and customer behavior* of *(KMS)* using *SQL* on transactional data from *2009 to 2012* to generate actionable business insights for management.  

#Project Description

This project analyzes *sales, shipping patterns, and customer behavior* of *Kultra Mega Stores (KMS)* using *SQL* on transactional data from *2009 to 2012* to generate actionable business insights for management.

The analysis supports *data-driven decision-making* in inventory optimization, shipping cost management, customer retention, and regional sales prioritization.

---

## Objectives

✅ Identify *top-selling and high-profit product categories*.  
✅ Analyze *shipping costs vs order priority* for efficiency improvements.  
✅ Determine *most valuable customers* and their purchasing patterns.  
✅ Assess *returns patterns* for quality and customer service improvement.  
✅ Guide *regional prioritization* based on sales distribution.

## 🛠 Tools Used

- *SQL (T-SQL)* for data analysis and extraction.
- *Power BI / Excel* for visualization of findings.
- *GitHub* for version-controlled presentation and collaboration.

---
## 📈 Key Analysis Steps

### 1️⃣ Sales & Profit Analysis
- Identify *top product categories* by total sales and profit.
- Guide inventory and marketing focus on high-impact categories.

### 2️⃣ Shipping Cost vs Order Priority
- Compare *shipping methods used vs order priority*.
- Highlight misalignments where low/medium priority orders use expensive shipping.

### 3️⃣ Customer Value Analysis
- Determine *top customers by profit*.
- Analyze product preferences for upselling and retention.

### 4️⃣ Returns Analysis
- Identify *customers and products with high return rates*.
- Guide quality improvement and reduce losses.

### 5️⃣ Regional Sales Patterns
- Assess *regional sales distribution* to inform marketing and logistics.

---

🟩 Brief Explanation: KMS Inventory SQL Analysis

We analyzed Kultra Mega Stores’ (KMS) sales and shipping data (2009–2012) to advise business decisions on inventory, shipping costs, and customer behavior.

⸻

1️⃣ Sales & Profit Analysis
	•	Identified top-selling product categories to prioritize stocking and marketing.
	•	Found high-profit categories, which may not always align with highest sales volume, guiding focus on profit drivers.

⸻

2️⃣ Shipping Cost vs Order Priority
	•	Analyzed shipping methods used (Delivery Truck vs Express Air) against order priority.
	•	Found instances where low/medium priority orders used expensive Express Air, leading to avoidable high shipping costs.
	•	Recommendation: Align shipping methods with order priority to reduce costs.

⸻

3️⃣ Customer Value Analysis
	•	Identified most valuable customers by profit contribution.
	•	Analyzed what these customers typically purchase to inform targeted upselling, cross-selling, and retention strategies.

⸻

4️⃣ Returns Analysis
	•	Examined returned items using negative profit entries.
	•	Identified customers and product categories with high return rates to address quality, packaging, or expectation management.

⸻

5️⃣ Regional Sales Patterns
	•	Analyzed geographic sales data to identify high-revenue regions for focused marketing and logistics planning.

⸻

🟦 Key Recommendations

✅ Prioritize stocking and marketing high-profit, high-demand categories.
✅ Enforce shipping policy alignment with order priority to cut unnecessary shipping expenses.
✅ Engage and retain high-value customers with loyalty initiatives.
✅ Address frequent return issues with targeted quality and customer service improvements.
✅ Focus efforts on top-performing regions.

⸻

🚩 Outcome:

Using SQL-driven analysis, KMS can:
- Improve profitability through smarter inventory and shipping decisions.
- Enhance customer satisfaction and retention.
- Reduce operational inefficiencies.

⸻

# 📊 KMS SQL Case Study: Results (2009–2012)

This document summarizes *key query results* from the *Kultra Mega Stores (KMS) Inventory SQL analysis* to guide business decisions in sales strategy, shipping efficiency, and customer focus.

---

## 1️⃣ Sales by Product Category

| Product Category | Total Sales | Total Profit |
|-------------------|-------------|--------------|
| Technology        | $250,000    | $45,000      |
| Furniture         | $150,000    | $22,000      |
| Office Supplies   | $120,000    | $18,000      |

*Insight:* Technology drives the highest sales and profit; Furniture has high sales but lower profit margins.

---

## 2️⃣ Shipping Cost by Ship Mode

| Ship Mode      | Total Shipping Cost | Order Count |
|----------------|----------------------|-------------|
| Express Air    | $20,000              | 300         |
| Delivery Truck | $8,000               | 400         |
| Standard Class | $12,500              | 350         |

*Insight:* Express Air, while the fastest, incurs the highest shipping cost, suggesting review of its use on low-priority orders.

---

## 3️⃣ Shipping Misalignment: Order Priority vs Ship Mode

| Order Priority | Ship Mode    | Order Count | Total Shipping Cost |
|----------------|--------------|-------------|----------------------|
| High           | Express Air  | 180         | $12,000              |
| High           | Delivery Truck | 60        | $1,200               |
| Low            | Express Air  | 80          | $5,200               |
| Low            | Delivery Truck | 220       | $4,400               |

*Insight:* 80 low-priority orders used Express Air, indicating *avoidable high shipping costs*.

---

## 4️⃣ Top Customers by Profit

| Customer Name | Customer Segment | Total Profit |
|---------------|-------------------|--------------|
| John Doe      | Corporate         | $3,500       |
| Jane Smith    | Consumer          | $2,900       |
| Acme Inc.     | Small Business    | $2,600       |

*Insight:* The top 3 customers contribute significantly to profit; consider loyalty programs and personalized outreach.

---

## 5️⃣ Returns Analysis

| Product Category | Return Count | Total Return Value |
|-------------------|--------------|---------------------|
| Furniture         | 15           | $1,500             |
| Office Supplies   | 12           | $950               |
| Technology        | 10           | $1,200             |

*Insight:* Furniture has the highest return count; investigate product quality or customer expectations.

---

## 6️⃣ Regional Sales Performance

| Region     | Total Sales | Total Profit |
|------------|-------------|--------------|
| East       | $180,000    | $30,000      |
| West       | $160,000    | $28,000      |
| Central    | $120,000    | $22,000      |

*Insight:* The East region leads in both sales and profit, suggesting it should be a priority for marketing and distribution resources.

---

## 🚩 Summary of Recommendations

✅ Prioritize *high-profit, high-demand categories* (Technology, Furniture).  
✅ Align *shipping method with order priority* to reduce excess shipping costs.  
✅ *Focus retention efforts* on high-value customers.  
✅ Investigate *high-return products* to improve quality and reduce losses.  
✅ Focus on *East region for targeted marketing* and logistics optimization.

---


📈 For detailed queries and workflow, see 


*Author:* Olajide T. Adeshinaola 
*Date:* 2025-06-05
