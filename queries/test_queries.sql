-- Name: Mulisa Sharon
-- Student ID: 20251IMA030
-- Group: C
-- Project: KIGALICLEAN
-- File: test_queries.sql
-- PDB: KIGALICLEAN_PDB

-- 1. JOIN: Product + Brand + Manufacturer
SELECT p.product_label, b.brand_name, m.manufacturer_name
FROM PRODUCT p
JOIN BRAND b ON p.brand_id = b.brand_id
JOIN MANUFACTURER m ON b.manufacturer_id = m.manufacturer_id;

-- 2. JOIN + WHERE: All scans in Rwanda
SELECT p.product_label, s.bottle_count, s.scan_country
FROM SCAN s
JOIN PRODUCT p ON s.product_barcode = p.product_barcode
WHERE s.scan_country = 'RW';

-- 3. GROUP BY: Total bottles per country
SELECT c.country_name, SUM(s.bottle_count) AS total_bottles
FROM SCAN s JOIN COUNTRY c ON s.scan_country = c.country_code
GROUP BY c.country_name ORDER BY total_bottles DESC;

-- 4. GROUP BY + HAVING: Brands with more than 1 product
SELECT b.brand_name, COUNT(*) AS product_count
FROM PRODUCT p JOIN BRAND b ON p.brand_id = b.brand_id
GROUP BY b.brand_name HAVING COUNT(*) > 1;

-- 5. SUBQUERY: Products heavier than average weight
SELECT product_label, bottle_weight FROM PRODUCT
WHERE bottle_weight > (SELECT AVG(bottle_weight) FROM PRODUCT);

-- 6. SUBQUERY with IN: Brands that have a scanned product
SELECT brand_name FROM BRAND
WHERE brand_id IN (SELECT DISTINCT brand_id FROM PRODUCT WHERE product_barcode IN (SELECT product_barcode FROM SCAN));

-- 7. VIEW: Product details view
SELECT * FROM vw_product_details;

-- 8. VIEW: Scan summary view
SELECT * FROM vw_scan_summary;

-- 9. ORDER BY + Aggregation: Top scanned product
SELECT p.product_label, SUM(s.bottle_count) AS total
FROM SCAN s JOIN PRODUCT p ON s.product_barcode = p.product_barcode
GROUP BY p.product_label ORDER BY total DESC;
