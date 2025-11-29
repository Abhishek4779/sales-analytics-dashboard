# 📊 Sales Analytics Dashboard (Power BI + SQL Server)

This project is an end-to-end **Sales Analytics Dashboard** built using **Power BI** and **Microsoft SQL Server (SSMS)**.  
The goal is to analyze sales, profit, customer segments, and product performance using interactive BI visualizations and SQL-based data processing.

The dataset used is the **Superstore dataset** obtained from Kaggle.

---

## 🚀 Project Overview

This repository contains the full analytics workflow:

- Power BI Dashboard (`.pbix`)
- PDF version of the dashboard
- SQL queries used for data extraction & transformations
- Dashboard images for quick preview
- Source dataset

The dashboard provides detailed insights into **sales trends**, **profitability**, **customer behavior**, and **product performance**.

---
## 🛠️ Tools & Technologies Used

| Tool | Purpose |
|------|---------|
| **Power BI** | Dashboard creation, DAX calculations, data modelling |
| **Microsoft SQL Server (SSMS)** | Data extraction and SQL transformations |
| **Power Query** | Cleaning & shaping data before loading into Power BI |
| **Kaggle Superstore Dataset** | Source dataset |

---

## 🔍 Key KPIs (Business Metrics)

- Total Sales  
- Total Profit  
- Profit Margin %  
- Total Quantity Sold  
- Sales by Category & Subcategory  
- Regional Sales Performance  
- Customer Segment Analysis  
- Monthly & Yearly Sales Trends  
- Top Performing Products  

---

## 📊 Dashboard Preview

### **1️⃣ Sales Overview**
![Sales Overview](Images/Sales%20Overview.png)

---

### **2️⃣ Customer Analysis**
![Customer Analysis](Images/Customer%20Analysis.png)

---

### **3️⃣ Product Analysis**
![Product Analysis](Images/Product%20Analysis.png)

---

### **4️⃣ Time Series & Trends**
![Time Series and Trends](Images/Time%20Seies%20and%20Trends.png)

---

## 🧠 Insights Generated

- **Sales increased steadily over time**, with noticeable seasonal spikes.
- **Technology and Office Supplies** categories drive most revenue.
- Certain subcategories show **high sales but low profit**, indicating discount issues.
- **West region** performs best in total revenue.
- A small percentage of customers contribute significantly to overall sales.
- Profitability varies strongly across segments and product categories.

---

## 🗄️ SQL Workflow

### **SQLQuery1.sql — Data Extraction**
- Imported the Superstore dataset into SQL Server  
- Selected essential columns  
- Removed duplicates and null entries  

### **SQLQuery2.sql — Data Cleaning & Preparation**
- Standardized date formats  
- Corrected data types  
- Created additional fields (Year, Month, Profit Calculation)  

### **SQLQuery3.sql — KPI Calculations**
- Calculated Total Sales, Total Profit, Profit Ratios  
- Created category-wise and region-wise aggregations  
- Generated monthly trend metrics for Power BI  

---

## 📥 How to Use This Project

1. Clone the repository:

```bash
git clone https://github.com/Abhishek4779/sales-analytics-dashboard.git

2. Open the .pbix file from PowerBI Dashboard/.

3. If needed, update SQL Server connection settings.

4. Refresh the Power BI model.
