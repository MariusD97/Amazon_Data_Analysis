-- ==========================================================
-- 📘 PROJECT: Amazon Transport Audit Dashboard
-- 🧾 FILE: 01_data_cleaning.sql
-- 🎯 PURPOSE: Clean and prepare imported Excel data for SQL use
-- ==========================================================

-- The 'documents' table contains date columns imported from Excel 
-- (RCA_exp, CMR_exp, LIC_exp) stored as numeric serial values (e.g., 46082)
-- Excel stores dates as the number of days since 1899-12-30
-- This script converts those integer values into proper SQL DATE format.

-- ----------------------------------------------------------
-- STEP 1️⃣: Add new DATE columns
-- ----------------------------------------------------------
ALTER TABLE documents
ADD COLUMN RCA_exp_date DATE,
ADD COLUMN CMR_exp_date DATE,
ADD COLUMN LIC_exp_date DATE;

-- ----------------------------------------------------------
-- STEP 2️⃣: Convert numeric values to real dates
-- ----------------------------------------------------------
UPDATE documents
SET 
    RCA_exp_date = DATE_ADD('1899-12-30', INTERVAL RCA_exp DAY),
    CMR_exp_date = DATE_ADD('1899-12-30', INTERVAL CMR_exp DAY),
    LIC_exp_date = DATE_ADD('1899-12-30', INTERVAL LIC_exp DAY);

-- ----------------------------------------------------------
-- STEP 3️⃣: Verify that conversion worked
-- ----------------------------------------------------------
-- The following query should show the original numeric value
-- next to the newly converted DATE value for quick validation
SELECT 
    audit_id,
    RCA_exp AS RCA_exp_numeric,
    RCA_exp_date AS RCA_exp_converted,
    CMR_exp AS CMR_exp_numeric,
    CMR_exp_date AS CMR_exp_converted,
    LIC_exp AS LIC_exp_numeric,
    LIC_exp_date AS LIC_exp_converted
FROM documents
LIMIT 10;

-- ----------------------------------------------------------
-- STEP 4️⃣: Drop the old numeric columns (after verification)
-- ----------------------------------------------------------
ALTER TABLE documents
DROP COLUMN RCA_exp,
DROP COLUMN CMR_exp,
DROP COLUMN LIC_exp;

-- STEP 5️⃣: Handle missing dates
-- Some records imported as 'n/a' were converted to 1899-12-30.
-- These are replaced with NULL to accurately represent missing values.

UPDATE documents
SET RCA_exp_date = NULL WHERE RCA_exp_date = '1899-12-30';
UPDATE documents
SET CMR_exp_date = NULL WHERE CMR_exp_date = '1899-12-30';
UPDATE documents
SET LIC_exp_date = NULL WHERE LIC_exp_date = '1899-12-30';


-- ✅ FINAL NOTE:
-- The new columns (RCA_exp_date, CMR_exp_date, LIC_exp_date)
-- are now true DATE types compatible with SQL date functions
-- and can be used directly in Power BI for time-based analysis.
