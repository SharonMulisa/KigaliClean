-- Name: Mulisa Sharon
-- Student ID: 20251IMA030
-- Group: C
-- Project: KIGALICLEAN
-- File: 06_clean.sql
-- PDB: KIGALICLEAN_PDB

-- Kigaliclean - Phase IV
-- Step 2: Clean the staging data.
-- Problems fixed: TRIM spaces, UPPER country, proper case brand, empty weight -> NULL, remove duplicates

DROP TABLE STG_PRODUCT_CLEAN CASCADE CONSTRAINTS;

CREATE TABLE STG_PRODUCT_CLEAN AS
SELECT DISTINCT
    TRIM(raw_barcode) AS product_barcode,
    TRIM(raw_label) AS product_label,
    INITCAP(TRIM(raw_brand)) AS brand_name,
    TRIM(raw_manufacturer) AS manufacturer_name,
    UPPER(TRIM(raw_country)) AS country_name,
    LOWER(TRIM(raw_size)) AS product_size,
    CASE
        WHEN TRIM(raw_weight) = '' THEN NULL
        ELSE TO_NUMBER(TRIM(raw_weight))
    END AS bottle_weight
FROM STG_PRODUCT_RAW
WHERE TRIM(raw_barcode) IS NOT NULL
  AND TRIM(raw_label) IS NOT NULL;

-- Show cleaned data (for screenshot)
SELECT * FROM STG_PRODUCT_CLEAN;
SELECT COUNT(*) AS clean_rows FROM STG_PRODUCT_CLEAN;
