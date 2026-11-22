-- Name: Mulisa Sharon
-- Student ID: 20251IMA030
-- Group: C
-- Project: KIGALICLEAN
-- File: 08_constraint_tests.sql
-- PDB: KIGALICLEAN_PDB

-- Kigaliclean - Phase IV
-- Each test MUST FAIL (error) = proof the constraint works.
-- Run them ONE BY ONE. Take a screenshot of the error.

-- TEST 1: PK - duplicate barcode must fail
-- Expected: ORA-00001 unique constraint violated
INSERT INTO PRODUCT VALUES ('8901030895471', 'Duplicate Test', '500ml', 1, 500);

-- TEST 2: FK - brand_id 999 does not exist, must fail
-- Expected: ORA-02291 parent key not found
INSERT INTO PRODUCT VALUES ('9999999999999', 'Bad Brand Test', '500ml', 999, 500);

-- TEST 3: CHECK - bottle_count must be > 0, must fail
-- Expected: ORA-02290 check constraint violated
INSERT INTO SCAN VALUES (99, '8901030895471', 'RW', -5, 'https://test');

-- TEST 4: UNIQUE - duplicate country_name must fail
-- Expected: ORA-00001 unique constraint violated
INSERT INTO COUNTRY VALUES ('RW2', 'RWANDA', 'East Africa');

-- TEST 5: NOT NULL - product_label cannot be NULL, must fail
-- Expected: ORA-01400 cannot insert NULL
INSERT INTO PRODUCT (product_barcode, product_label, brand_id) VALUES ('8888888888888', NULL, 1);
