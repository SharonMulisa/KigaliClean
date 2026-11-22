-- Name: Mulisa Sharon
-- Student ID: 20251IMA030
-- Group: C
-- Project: KIGALICLEAN
-- File: 07_load_tables.sql
-- PDB: KIGALICLEAN_PDB

-- Kigaliclean - Phase IV
-- Step 3: Load cleaned data into real tables, in FK order:
-- COUNTRY -> MANUFACTURER -> BRAND -> PRODUCT -> SCAN

-- 1. COUNTRY (we create codes from country names)
-- RW = Rwanda, KE = Kenya
INSERT INTO COUNTRY VALUES ('RW', 'RWANDA', 'East Africa');
INSERT INTO COUNTRY VALUES ('KE', 'KENYA', 'East Africa');
INSERT INTO COUNTRY VALUES ('UG', 'UGANDA', 'East Africa');
INSERT INTO COUNTRY VALUES ('TZ', 'TANZANIA', 'East Africa');

-- 2. MANUFACTURER
INSERT INTO MANUFACTURER VALUES (1, 'Coca-Cola Company', 'RW');
INSERT INTO MANUFACTURER VALUES (2, 'PepsiCo', 'KE');

-- 3. BRAND
INSERT INTO BRAND VALUES (1, 'Coca-Cola', 1);
INSERT INTO BRAND VALUES (2, 'Pepsi', 2);
INSERT INTO BRAND VALUES (3, 'Fanta', 1);

-- 4. PRODUCT (from cleaned staging)
INSERT INTO PRODUCT (product_barcode, product_label, product_size, brand_id, bottle_weight)
SELECT product_barcode, product_label, product_size,
       CASE WHEN brand_name = 'Coca-Cola' THEN 1
            WHEN brand_name = 'Pepsi' THEN 2
            WHEN brand_name = 'Fanta' THEN 3 END,
       bottle_weight
FROM STG_PRODUCT_CLEAN;

-- 5. SCAN
INSERT INTO SCAN VALUES (1, '8901030895471', 'RW', 12, 'https://kigaliclean.example/scan/1');
INSERT INTO SCAN VALUES (2, '8901030895471', 'KE', 5, 'https://kigaliclean.example/scan/2');
INSERT INTO SCAN VALUES (3, '8901030895472', 'KE', 8, 'https://kigaliclean.example/scan/3');
INSERT INTO SCAN VALUES (4, '8901030895473', 'RW', 20, 'https://kigaliclean.example/scan/4');

COMMIT;

-- Show counts (for screenshot)
SELECT 'COUNTRY' AS t, COUNT(*) AS n FROM COUNTRY UNION ALL
SELECT 'MANUFACTURER', COUNT(*) FROM MANUFACTURER UNION ALL
SELECT 'BRAND', COUNT(*) FROM BRAND UNION ALL
SELECT 'PRODUCT', COUNT(*) FROM PRODUCT UNION ALL
SELECT 'SCAN', COUNT(*) FROM SCAN;
