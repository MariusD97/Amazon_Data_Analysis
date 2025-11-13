-- =========================================================
-- Amazon Transport Audit Project (Anonymized Data)
-- Author: Marius D.
-- Description: SQL schema including primary keys, indexes,
--              and relationships between Companies, Audits,
--              and Documents tables.
-- =========================================================

CREATE DATABASE IF NOT EXISTS transport_audit;
USE transport_audit;

-- =========================================================
-- TABLE: Companies
-- =========================================================
CREATE TABLE Companies (
    case_id VARCHAR(20) NOT NULL,
    Marketplace VARCHAR(100),
    Carrier_Name VARCHAR(150),
    PRIMARY KEY (case_id)
);

-- Index for faster queries on case_id
CREATE INDEX idx_case_id ON Companies(case_id);

-- =========================================================
-- TABLE: Audits
-- =========================================================
CREATE TABLE Audits (
    audit_id INT AUTO_INCREMENT,
    case_id VARCHAR(20),
    assigned_to VARCHAR(100),
    assigned_week INT,
    assigned_date DATE,
    resolved_status VARCHAR(100),
    specific_resolved_status VARCHAR(150),
    resolved_date DATE,
    high_risk VARCHAR(50),
    status_optimus VARCHAR(100),
    days_to_close INT,
    PRIMARY KEY (audit_id),
    CONSTRAINT fk_case
        FOREIGN KEY (case_id)
        REFERENCES Companies(case_id)
        ON DELETE CASCADE
);

-- Index for audit_id
CREATE INDEX idx_audit_id ON Audits(audit_id);

-- =========================================================
-- TABLE: Documents
-- =========================================================
CREATE TABLE Documents (
    document_id INT AUTO_INCREMENT,
    audit_id INT,
    fleet_status VARCHAR(100),
    cargo_status VARCHAR(100),
    ol_status VARCHAR(100),
    RCA_exp_date DATE,
    CMR_exp_date DATE,
    LIC_exp_date DATE,
    PRIMARY KEY (document_id),
    CONSTRAINT fk_audit
        FOREIGN KEY (audit_id)
        REFERENCES Audits(audit_id)
        ON DELETE CASCADE
);

-- Index for audit_id in Documents table
CREATE INDEX idx_doc_audit_id ON Documents(audit_id);

-- =========================================================
-- END OF SCHEMA
-- =========================================================
