-- Name: Mulisa Sharon
-- Student ID: 20251IMA030
-- Group: C
-- Project: KIGALICLEAN
-- File: 01_create_tables.sql
-- PDB: KIGALICLEAN_PDB

-- Kigaliclean - Phase IV
-- Tables only. Constraints are added in 02_constraints.sql

DROP TABLE SCAN CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE BRAND CASCADE CONSTRAINTS;
DROP TABLE MANUFACTURER CASCADE CONSTRAINTS;
DROP TABLE COUNTRY CASCADE CONSTRAINTS;

CREATE TABLE COUNTRY (
    country_code VARCHAR2(5),
    country_name VARCHAR2(100),
    region VARCHAR2(100)
);

CREATE TABLE MANUFACTURER (
    manufacturer_id NUMBER(10),
    manufacturer_name VARCHAR2(100),
    manufacturer_country VARCHAR2(5)
);

CREATE TABLE BRAND (
    brand_id NUMBER(10),
    brand_name VARCHAR2(100),
    manufacturer_id NUMBER(10)
);

CREATE TABLE PRODUCT (
    product_barcode VARCHAR2(50),
    product_label VARCHAR2(200),
    product_size VARCHAR2(50),
    brand_id NUMBER(10),
    bottle_weight NUMBER(10,2)
);

CREATE TABLE SCAN (
    scan_id NUMBER(10),
    product_barcode VARCHAR2(50),
    scan_country VARCHAR2(5),
    bottle_count NUMBER(10),
    data_url VARCHAR2(500)
);
