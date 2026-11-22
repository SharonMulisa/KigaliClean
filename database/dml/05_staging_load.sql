-- Name: Mulisa Sharon
-- Student ID: 20251IMA030
-- Group: C
-- Project: KIGALICLEAN
-- File: 05_staging_load.sql
-- PDB: KIGALICLEAN_PDB

-- Kigaliclean - Phase IV
-- Step 1: Create a STAGING table (raw, messy data) and load it.
-- This simulates loading from CSV / Open Food Facts.

DROP TABLE STG_PRODUCT_RAW CASCADE CONSTRAINTS;

CREATE TABLE STG_PRODUCT_RAW (
    raw_barcode VARCHAR2(50),
    raw_label VARCHAR2(200),
    raw_brand VARCHAR2(100),
    raw_manufacturer VARCHAR2(100),
    raw_country VARCHAR2(100),
    raw_size VARCHAR2(50),
    raw_weight VARCHAR2(50)
);

-- Raw data: notice the mess - spaces, lowercase, missing weight
INSERT INTO STG_PRODUCT_RAW VALUES (' 8901030895471 ', 'Coca Cola 500ml', 'Coca-Cola', 'Coca-Cola Company', 'rwanda', '500ml', '500');
INSERT INTO STG_PRODUCT_RAW VALUES ('8901030895472', 'Pepsi 500ML', 'pepsi', 'PepsiCo', 'Kenya', '500ml', '');
INSERT INTO STG_PRODUCT_RAW VALUES ('8901030895473', 'Fanta Orange 500ml', 'Fanta', 'Coca-Cola Company', 'RWANDA', '500ml', '510');
INSERT INTO STG_PRODUCT_RAW VALUES ('8901030895471', 'Coca Cola 500ml', 'Coca-Cola', 'Coca-Cola Company', 'rwanda', '500ml', '500');

-- Show staging (for screenshot)
SELECT * FROM STG_PRODUCT_RAW;
SELECT COUNT(*) AS staging_rows FROM STG_PRODUCT_RAW;
