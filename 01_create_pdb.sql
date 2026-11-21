-- Name: Mulisa Sharon
-- Student ID: 20251IMA030
-- Group: C
-- Project Name: Kigaliclean
-- Task: 01 - Create PDB

ALTER SESSION SET CONTAINER = CDB$ROOT;

CREATE PLUGGABLE DATABASE c_20251ima030_sharon_kigali_db
  ADMIN USER sharon_admin IDENTIFIED BY sharon
  FILE_NAME_CONVERT = ('/pdbseed/', '/c_20251ima030_sharon_kigali_db/');

ALTER PLUGGABLE DATABASE c_20251ima030_sharon_kigali_db OPEN;
ALTER PLUGGABLE DATABASE c_20251ima030_sharon_kigali_db SAVE STATE;
