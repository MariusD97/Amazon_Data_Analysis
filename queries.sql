-- SQL Queries – Amazon Project

-- This file contains a set of SQL queries demonstrating key SQL concepts for the Amazon project, using the tables: companies, audits, and documents.

-- 1️⃣ Simple SELECT
-- Show all companies and their marketplace
SELECT Carrier_Name, Marketplace
FROM companies;

-- 2️⃣ JOIN between tables
-- Show each company with fleet, cargo, and OL status
SELECT c.Carrier_Name, c.Marketplace,
       d.fleet_status, d.cargo_status, d.ol_status
FROM companies c
JOIN audits a ON c.case_id = a.case_id
JOIN documents d ON a.audit_id = d.audit_id;

-- 3️⃣ Filtering
-- Show only companies with fleet currently requested
SELECT c.Carrier_Name, d.fleet_status
FROM companies c
JOIN audits a ON c.case_id = a.case_id
JOIN documents d ON a.audit_id = d.audit_id
WHERE d.fleet_status = 'requested';

-- 4️⃣ ORDER BY
-- Show companies ordered by number of days to close the case
SELECT c.Carrier_Name, a.days_to_close
FROM companies c
JOIN audits a ON c.case_id = a.case_id
ORDER BY a.days_to_close DESC;

-- 5️⃣ CASE for conditional values
-- Categorize cases as "Fast" or "Slow"
SELECT c.Carrier_Name,
       CASE 
           WHEN a.days_to_close <= 7 THEN 'Fast'
           ELSE 'Slow'
       END AS closure_speed
FROM companies c
JOIN audits a ON c.case_id = a.case_id;

-- 6️⃣ Date functions
-- Show companies whose RCA expires in the next 30 days
SELECT c.Carrier_Name, d.RCA_exp_date
FROM companies c
JOIN audits a ON c.case_id = a.case_id
JOIN documents d ON a.audit_id = d.audit_id
WHERE d.RCA_exp_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);

-- 7️⃣ Simple subquery
-- Show the company with the highest number of days to close the case
SELECT case_id, days_to_close
FROM audits
WHERE days_to_close = (SELECT MAX(days_to_close) FROM audits);

-- 8️⃣ Multiple conditions
-- Show companies with fleet or cargo not audited and high risk
SELECT c.Carrier_Name, d.fleet_status, d.cargo_status, a.`HIGH RISK`
FROM companies c
JOIN audits a ON c.case_id = a.case_id
JOIN documents d ON a.audit_id = d.audit_id
WHERE (d.fleet_status = 'Not Audited' OR d.cargo_status = 'Not Audited')
  AND a.`HIGH RISK` = 'Yes';

-- 9️⃣ Count with filtering and grouping
-- Count "High Risk" cases per marketplace
SELECT c.Marketplace, COUNT(*) AS high_risk_cases
FROM companies c
JOIN audits a ON c.case_id = a.case_id
WHERE a.`HIGH RISK` = 'Yes'
GROUP BY c.Marketplace;

-- 10️⃣ Marketplace with High Risk percentage
-- Show percentage of High Risk cases per marketplace
SELECT c.Marketplace,
       COUNT(*) AS total_cases,
       SUM(CASE WHEN a.`HIGH RISK` = 'Yes' THEN 1 ELSE 0 END) AS high_risk_cases,
       ROUND(SUM(CASE WHEN a.`HIGH RISK` = 'Yes' THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS high_risk_pct
FROM companies c
JOIN audits a ON c.case_id = a.case_id
GROUP BY c.Marketplace
ORDER BY high_risk_pct DESC;

-- 11️⃣ Average days to close per marketplace
-- Show the average number of days to close cases per marketplace
SELECT c.Marketplace,
       AVG(a.days_to_close) AS avg_days_to_close
FROM companies c
JOIN audits a ON c.case_id = a.case_id
GROUP BY c.Marketplace
ORDER BY avg_days_to_close DESC;