-- Name: Mulisa Sharon
-- Student ID: 20251IMA030
-- Group: C
-- Project: KIGALICLEAN
-- File: 03_indexes.sql
-- PDB: KIGALICLEAN_PDB

-- Kigaliclean - Phase IV
-- Indexes to speed up JOINs and searches on FK columns

-- FK columns are searched a lot, so we index them
CREATE INDEX idx_brand_manufacturer ON BRAND(manufacturer_id);
CREATE INDEX idx_product_brand ON PRODUCT(brand_id);
CREATE INDEX idx_scan_product ON SCAN(product_barcode);
CREATE INDEX idx_scan_country ON SCAN(scan_country);

-- Search by product label is common
CREATE INDEX idx_product_label ON PRODUCT(product_label);

-- Show indexes (for screenshot)
SELECT index_name, table_name FROM user_indexes
WHERE table_name IN ('COUNTRY','MANUFACTURER','BRAND','PRODUCT','SCAN')
ORDER BY table_name;
