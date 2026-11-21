-- Name: Mulisa Sharon
-- Student ID: 20251IMA030
-- Group: C
-- Project Name: Kigaliclean
-- Task: 03 - Create tablespaces

ALTER SESSION SET CONTAINER = c_IMA030_sharon_kigali_db;

CREATE TABLESPACE kigaliclean_data
  DATAFILE 'kigaliclean_data01.dbf' SIZE 100M
  AUTOEXTEND ON NEXT 10M MAXSIZE 1G;

CREATE TABLESPACE kigaliclean_idx
  DATAFILE 'kigaliclean_idx01.dbf' SIZE 50M
  AUTOEXTEND ON NEXT 10M MAXSIZE 500M;

CREATE TEMPORARY TABLESPACE kigaliclean_temp
  TEMPFILE 'kigaliclean_temp01.dbf' SIZE 50M
  AUTOEXTEND ON NEXT 10M MAXSIZE 500M;

ALTER USER sharon_admin
  DEFAULT TABLESPACE kigaliclean_data
  TEMPORARY TABLESPACE kigaliclean_temp
  QUOTA UNLIMITED ON kigaliclean_data
  QUOTA UNLIMITED ON kigaliclean_idx;
