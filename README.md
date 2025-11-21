# Amazon Transport Document Audit - SQL & Power BI Project

This project is inspired by my real work as a **Document Auditor** for Amazon transport carriers.  
It simulates the data verification and reporting process for companies that deliver goods for Amazon, using **SQL** for database design and **Power BI** for visualization.

⚠️ **Note:** All data used in this project has been fully anonymized.  
No real company names, document numbers, or sensitive business information are included.

---

## 🧩 Project Overview

The goal of this project is to replicate and analyze the workflow of auditing transport documents, such as insurance policies and carrier licenses, and track the overall compliance and document status across multiple carriers.

The analysis helps identify:

- Expired or missing documents (RCA, CMR, OL)  
- Carriers with high or low compliance rates  
- Risk trends by marketplace or document type  

## 📘 Case Study: Real-World Workflow Simulation

### 🔍 1. Problem Overview  
In my real role as a **Document Auditor for Amazon transport carriers**, I validate insurance documents and operating licenses submitted by hundreds of companies.  
Common issues include:

- expired or missing documents  
- inconsistent submissions  
- manual reviews that slow down the process  
- limited visibility on risk levels  

This project reproduces that workflow and transforms it into a clean, automated analytics system.

---

### 🎯 2. Objective  
Design an end-to-end solution that:

- centralizes carrier, document, and audit information  
- automatically identifies expired or missing documents  
- highlights high-risk carriers  
- evaluates auditor performance  
- provides a clear reporting dashboard using Power BI  

---

### 🔧 3. Process Summary

#### **Data Cleaning**
- Converted Excel serial dates to SQL `DATE`  
- Removed invalid placeholders (e.g., `1899-12-30`)  
- Standardized document fields and fixed missing values  

#### **Database Design (MySQL)**
- Three main tables: `companies`, `documents`, `audits`  
- Includes primary keys, foreign keys, and indexing  
- Ensures clean relational structure and high-quality queries  

#### **SQL Logic**
- Detect expired/missing RCA, CMR, OL  
- Identify documents expiring in the next 30 days  
- Classify high-risk carriers  
- Calculate compliance KPIs  
- Measure auditor performance (speed & case quality)

#### **Power BI Dashboard**
- Compliance overview cards  
- Document expiration KPIs  
- Marketplace-level risk comparison  
- Auditor performance insights  
- Fully interactive filters and drill-downs  

---

### 📊 4. Key Insights  
- **84% compliance rate** across all carriers  
- **151 expired documents** currently active  
- **France** has the highest non-compliance levels  
- **31 RCA** and **30 CMR** expiring within 30 days  
- Auditor performance varies by speed and non-compliance rate  

---

### 🧭 5. Impact  
This project simulates Amazon’s real audit workflow and turns a manual, repetitive process into a structured analytics system that:

- improves visibility  
- reduces operational risk  
- highlights performance differences  
- enables better decision-making  
---

## 🗄️ Database Design (MySQL)

The database schema was designed in MySQL and includes:

- Primary keys and foreign key relationships  
- Indexes for optimization  
- Data integrity constraints  

### Main Tables

- **companies** – stores carrier details and marketplaces  
- **documents** – includes RCA, CMR, and OL document data  
- **audits** – tracks audit checks, document status (valid, expired, missing), and assigned risk levels  

You can find the schema and relationships in:  
[SQL/database_schema.sql](SQL/database_schema.sql)

---

## 🧹 Data Cleaning

The Excel date columns were originally stored as numeric serials.  
They were converted to proper SQL `DATE` using the script [SQL/data_cleaning.sql](SQL/data_cleaning.sql) to ensure accurate time-based analysis in Power BI.

**Steps performed in `01_data_cleaning.sql`:**

1. Added new DATE columns (`RCA_exp_date`, `CMR_exp_date`, `LIC_exp_date`) to the `documents` table  
2. Converted Excel numeric serials to proper SQL `DATE` values  
3. Verified the conversion with sample queries  
4. Dropped the original numeric columns after validation  
5. Replaced invalid date placeholders (`1899-12-30`) with `NULL` to accurately reflect missing values  

---

## 🧠 SQL Queries

A series of SQL scripts were created to replicate real auditing logic from Amazon’s carrier compliance workflow.  
These queries demonstrate essential SQL concepts and generate the analytical outputs used later in Power BI.

### Examples of analysis performed:
- Retrieve each carrier with the status of their RCA, CMR, and Operating License  
- Identify high-risk carriers based on expired or missing documents  
- Track upcoming document expirations using date functions  
- Categorize audit performance using `CASE` logic  
- Use subqueries to find the slowest or fastest cases  
- Calculate marketplace-level KPIs (high-risk %, average days to close)  
- Aggregate and group data for compliance summaries  

All SQL scripts are available in:  
📄 **[SQL/queries.sql](SQL/queries.sql)**

---

## 📊 Power BI Dashboard

The MySQL database was imported into Power BI to create an interactive dashboard for tracking carrier compliance and document risks.

The dashboard provides:
- Expired vs. valid document KPIs  
- High-risk percentage cards  
- Marketplace and carrier-level drill-downs  
- Trend visuals for upcoming document renewals  
- Filters for document type, marketplace, and risk level  

Data modeling included relationships between companies, audits, and documents, along with DAX measures for dynamic KPIs.

Power BI file:  
[📄 Power BI Dashboard File](PowerBI/Project_v1.pbix)
---

## ⚙️ Tools Used

- **MySQL Workbench** – database creation and SQL development  
- **Power BI Desktop** – data visualization and reporting  
- **Excel** – data documentation and tracking  
- **GitHub** – project version control and portfolio hosting  
---

## 👤 Author

**Marius Dahorea**  
Data Analyst in progress | SQL & Power BI Enthusiast  

📧 Contact: [marius.dahorea@gmail.com](mailto:marius.dahorea@gmail.com)  
💼 GitHub Profile: [https://github.com/MariusD97](https://github.com/MariusD97)
