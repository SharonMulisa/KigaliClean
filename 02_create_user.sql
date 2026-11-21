-- Name: Mulisa Sharon
-- Student ID: 20251IMA030
-- Group: C
-- Project Name: Kigaliclean
-- Task: 02 - Create PDB admin user

ALTER SESSION SET CONTAINER = c_20251ima030_sharon_kigali_db;

CREATE USER sharon_admin IDENTIFIED BY sharon
  DEFAULT TABLESPACE kigaliclean_data
  TEMPORARY TABLESPACE kigaliclean_temp
  QUOTA UNLIMITED ON kigaliclean_data
  QUOTA UNLIMITED ON kigaliclean_idx;

GRANT DBA TO sharon_admin;
