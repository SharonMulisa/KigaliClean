-- Name: Mulisa Sharon
-- Student ID: 20251IMA030
-- Group: C
-- Project: KIGALICLEAN
-- File: 09_cascade_tests.sql
-- PDB: KIGALICLEAN_PDB

-- Kigaliclean - Phase IV
-- Test ON DELETE CASCADE: deleting a parent deletes its children automatically.

-- BEFORE: show scans for product 8901030895473
SELECT * FROM SCAN WHERE product_barcode = '8901030895473';

-- DELETE the product. Its SCAN rows should disappear too.
DELETE FROM PRODUCT WHERE product_barcode = '8901030895473';

-- AFTER: should return 0 rows = CASCADE worked!
SELECT * FROM SCAN WHERE product_barcode = '8901030895473';
SELECT COUNT(*) AS remaining_scans FROM SCAN;

-- Restore the product for the demo (so final counts are correct)
INSERT INTO PRODUCT VALUES ('8901030895473', 'Fanta Orange 500ml', '500ml', 3, 510);
INSERT INTO SCAN VALUES (4, '8901030895473', 'RW', 20, 'https://kigaliclean.example/scan/4');
COMMIT;
