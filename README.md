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
They were converted to proper SQL `DATE` using the script [sql_scripts/01_data_cleaning.sql](SQL/sql_scripts/01_data_cleaning.sql) to ensure accurate time-based analysis in Power BI.

**Steps performed in `01_data_cleaning.sql`:**

1. Added new DATE columns (`RCA_exp_date`, `CMR_exp_date`, `LIC_exp_date`) to the `documents` table  
2. Converted Excel numeric serials to proper SQL `DATE` values  
3. Verified the conversion with sample queries  
4. Dropped the original numeric columns after validation  
5. Replaced invalid date placeholders (`1899-12-30`) with `NULL` to accurately reflect missing values  

---

## 🧠 SQL Queries

A collection of analytical queries was created to extract insights from the data, such as:

- Carriers and their document status  
- High-risk companies with multiple expired policies  
- Expiry tracking and document renewal alerts  
- Marketplace-level compliance summary  

All queries are included in:  
[SQL/queries.sql](SQL/queries.sql)

---

## 📊 Power BI Dashboard

The MySQL database was connected to Power BI to visualize KPIs and document compliance rates.  
The dashboard includes:

- Expired vs. valid document metrics  
- Risk percentage cards  
- Marketplace and carrier breakdowns  
- Trend visuals for document renewal  

Power BI file: [PowerBI/project_dashboard.pbix](PowerBI/project_dashboard.pbix)

---

## 🧾 Documentation

All development steps (schema creation, importing tables, adding indexes, primary keys, and relationships) are documented in:

- [SQL/documentation.xlsx](SQL/documentation.xlsx)  
- [notes/development_steps.md](notes/development_steps.md)

---

## ⚙️ Tools Used

- **MySQL Workbench** – database creation and SQL development  
- **Power BI Desktop** – data visualization and reporting  
- **Excel** – data documentation and tracking  
- **GitHub** – project version control and portfolio hosting  

---

## 🚀 Future Improvements

- Add DAX measures to calculate dynamic KPIs  
- Implement data refresh automation for live updates  
- Extend schema to include audit team performance metrics  

---

## 👤 Author

**Marius Dahorea**  
Data Analyst in progress | SQL & Power BI Enthusiast  

📧 Contact: [marius.dahorea@gmail.com](mailto:marius.dahorea@gmail.com)  
💼 GitHub Profile: [https://github.com/MariusD97](https://github.com/MariusD97)
