-- Name: Mulisa Sharon
-- Student ID: 20251IMA030
-- Group: C
-- Project: KIGALICLEAN
-- File: 02_constraints.sql
-- PDB: KIGALICLEAN_PDB

-- Kigaliclean - Phase IV
-- Add PK, FK, UNIQUE, CHECK. Run AFTER 01_create_tables.sql

-- ========== PRIMARY KEYS ==========
ALTER TABLE COUNTRY ADD CONSTRAINT pk_country PRIMARY KEY (country_code);
ALTER TABLE MANUFACTURER ADD CONSTRAINT pk_manufacturer PRIMARY KEY (manufacturer_id);
ALTER TABLE BRAND ADD CONSTRAINT pk_brand PRIMARY KEY (brand_id);
ALTER TABLE PRODUCT ADD CONSTRAINT pk_product PRIMARY KEY (product_barcode);
ALTER TABLE SCAN ADD CONSTRAINT pk_scan PRIMARY KEY (scan_id);

-- ========== UNIQUE ==========
ALTER TABLE COUNTRY ADD CONSTRAINT uq_country_name UNIQUE (country_name);
ALTER TABLE MANUFACTURER ADD CONSTRAINT uq_manufacturer_name UNIQUE (manufacturer_name);
ALTER TABLE BRAND ADD CONSTRAINT uq_brand_name UNIQUE (brand_name);
ALTER TABLE SCAN ADD CONSTRAINT uq_scan_product_country UNIQUE (product_barcode, scan_country);

-- ========== NOT NULL (via MODIFY) ==========
ALTER TABLE COUNTRY MODIFY country_name NOT NULL;
ALTER TABLE MANUFACTURER MODIFY manufacturer_name NOT NULL;
ALTER TABLE BRAND MODIFY brand_name NOT NULL;
ALTER TABLE BRAND MODIFY manufacturer_id NOT NULL;
ALTER TABLE PRODUCT MODIFY product_label NOT NULL;
ALTER TABLE PRODUCT MODIFY brand_id NOT NULL;
ALTER TABLE SCAN MODIFY product_barcode NOT NULL;
ALTER TABLE SCAN MODIFY scan_country NOT NULL;
ALTER TABLE SCAN MODIFY bottle_count NOT NULL;

-- ========== FOREIGN KEYS with ON DELETE actions ==========
-- MANUFACTURER -> COUNTRY : SET NULL
ALTER TABLE MANUFACTURER ADD CONSTRAINT fk_manufacturer_country
  FOREIGN KEY (manufacturer_country) REFERENCES COUNTRY(country_code)
  ON DELETE SET NULL;

-- BRAND -> MANUFACTURER : NO ACTION (default in Oracle = do not allow delete)
ALTER TABLE BRAND ADD CONSTRAINT fk_brand_manufacturer
  FOREIGN KEY (manufacturer_id) REFERENCES MANUFACTURER(manufacturer_id)
  ON DELETE NO ACTION;

-- PRODUCT -> BRAND : NO ACTION
ALTER TABLE PRODUCT ADD CONSTRAINT fk_product_brand
  FOREIGN KEY (brand_id) REFERENCES BRAND(brand_id)
  ON DELETE NO ACTION;

-- SCAN -> PRODUCT : CASCADE
ALTER TABLE SCAN ADD CONSTRAINT fk_scan_product
  FOREIGN KEY (product_barcode) REFERENCES PRODUCT(product_barcode)
  ON DELETE CASCADE;

-- SCAN -> COUNTRY : NO ACTION
ALTER TABLE SCAN ADD CONSTRAINT fk_scan_country
  FOREIGN KEY (scan_country) REFERENCES COUNTRY(country_code)
  ON DELETE NO ACTION;

-- ========== CHECKS ==========
ALTER TABLE PRODUCT ADD CONSTRAINT ck_bottle_weight CHECK (bottle_weight IS NULL OR bottle_weight > 0);
ALTER TABLE SCAN ADD CONSTRAINT ck_bottle_count CHECK (bottle_count > 0);
