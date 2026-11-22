-- Name: Mulisa Sharon
-- Student ID: 20251IMA030
-- Group: C
-- Project: KIGALICLEAN
-- File: 04_views.sql
-- PDB: KIGALICLEAN_PDB

-- Kigaliclean - Phase IV
-- Views: useful JOINs saved as virtual tables

-- View 1: Full product details (Product + Brand + Manufacturer + Country)
CREATE OR REPLACE VIEW vw_product_details AS
SELECT
    p.product_barcode,
    p.product_label,
    p.product_size,
    p.bottle_weight,
    b.brand_name,
    m.manufacturer_name,
    c.country_name AS manufacturer_country_name
FROM PRODUCT p
JOIN BRAND b ON p.brand_id = b.brand_id
JOIN MANUFACTURER m ON b.manufacturer_id = m.manufacturer_id
LEFT JOIN COUNTRY c ON m.manufacturer_country = c.country_code;

-- View 2: Scans with product + country
CREATE OR REPLACE VIEW vw_scan_summary AS
SELECT
    s.scan_id,
    s.product_barcode,
    p.product_label,
    b.brand_name,
    c.country_name AS scan_country_name,
    s.bottle_count,
    s.data_url
FROM SCAN s
JOIN PRODUCT p ON s.product_barcode = p.product_barcode
JOIN BRAND b ON p.brand_id = b.brand_id
JOIN COUNTRY c ON s.scan_country = c.country_code;

-- Test the views (for screenshot)
SELECT * FROM vw_product_details;
SELECT * FROM vw_scan_summary;
