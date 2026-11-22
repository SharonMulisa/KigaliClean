-- Kigaliclean - Phase IV
-- 03_validation.sql
-- Run each test one by one. Expected result is in the comment.

-- TEST 1: PK test - same barcode twice must FAIL
-- Expected: ORA-00001 unique constraint violated
INSERT INTO PRODUCT VALUES ('1234003331', 'Duplicate Test', '500ml', 1, 500);

-- TEST 2: FK test - scan for product that does not exist must FAIL
-- Expected: ORA-02291 parent key not found
INSERT INTO SCAN VALUES (99, '9999999999', 'MW', 10, 'test');

-- TEST 3: CHECK test - bottle_count 0 must FAIL
-- Expected: ORA-02290 check constraint violated
INSERT INTO SCAN VALUES (98, '1234003331', 'MW', 0, 'test');

-- TEST 4: UNIQUE test - same product + same country twice must FAIL
-- Expected: ORA-00001 unique constraint violated
INSERT INTO SCAN VALUES (97, '1234003331', 'MW', 50, 'test');

-- TEST 5: NO ACTION test - delete BRAND that still has PRODUCTs must FAIL
-- Expected: ORA-02292 child record found
DELETE FROM BRAND WHERE brand_id = 1;

-- TEST 6: CASCADE test - delete PRODUCT, its SCANs disappear too
-- Run this, then check: SELECT * FROM SCAN WHERE product_barcode = '1234003332';
-- Expected: 0 rows for that product in SCAN
-- DELETE FROM PRODUCT WHERE product_barcode = '1234003332';
-- ROLLBACK; -- undo test 6, so we keep our data

-- TEST 7: Count check - how many rows do we have?
-- Expected: COUNTRY 4, MANUFACTURER 2, BRAND 2, PRODUCT 3, SCAN 4
SELECT 'COUNTRY' AS table_name, COUNT(*) AS total FROM COUNTRY
UNION ALL
SELECT 'MANUFACTURER', COUNT(*) FROM MANUFACTURER
UNION ALL
SELECT 'BRAND', COUNT(*) FROM BRAND
UNION ALL
SELECT 'PRODUCT', COUNT(*) FROM PRODUCT
UNION ALL
SELECT 'SCAN', COUNT(*) FROM SCAN;

-- TEST 8: Join check - show full story
-- Expected: 4 rows, with brand and country names
SELECT s.scan_id, p.product_label, b.brand_name, c.country_name, s.bottle_count
FROM SCAN s
JOIN PRODUCT p ON s.product_barcode = p.product_barcode
JOIN BRAND b ON p.brand_id = b.brand_id
JOIN COUNTRY c ON s.scan_country = c.country_code;
