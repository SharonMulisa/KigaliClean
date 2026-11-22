-- Name: Mulisa Sharon
-- Student ID: 20251IMA030
-- Group: C
-- Project: KIGALICLEAN
-- File: 10_verification.sql
-- PDB: KIGALICLEAN_PDB

-- Kigaliclean - Phase IV
-- Final verification: show everything works.

-- 1. Row counts
SELECT 'COUNTRY' AS table_name, COUNT(*) AS row_count FROM COUNTRY UNION ALL
SELECT 'MANUFACTURER', COUNT(*) FROM MANUFACTURER UNION ALL
SELECT 'BRAND', COUNT(*) FROM BRAND UNION ALL
SELECT 'PRODUCT', COUNT(*) FROM PRODUCT UNION ALL
SELECT 'SCAN', COUNT(*) FROM SCAN;

-- 2. Full JOIN: products with brand + manufacturer
SELECT p.product_label, b.brand_name, m.manufacturer_name, c.country_name
FROM PRODUCT p
JOIN BRAND b ON p.brand_id = b.brand_id
JOIN MANUFACTURER m ON b.manufacturer_id = m.manufacturer_id
LEFT JOIN COUNTRY c ON m.manufacturer_country = c.country_code;

-- 3. Aggregation: total bottles per country
SELECT c.country_name, SUM(s.bottle_count) AS total_bottles
FROM SCAN s JOIN COUNTRY c ON s.scan_country = c.country_code
GROUP BY c.country_name ORDER BY total_bottles DESC;

-- 4. Views work
SELECT * FROM vw_product_details;
SELECT * FROM vw_scan_summary;

-- 5. No orphan rows (should be 0)
SELECT COUNT(*) AS orphan_scans
FROM SCAN s LEFT JOIN PRODUCT p ON s.product_barcode = p.product_barcode
WHERE p.product_barcode IS NULL;
