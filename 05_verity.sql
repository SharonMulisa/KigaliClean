-- Name: Mulisa Sharon
-- Student ID: 20251IMA030
-- Group: C
-- Project Name: Kigaliclean
-- Task: 05 - Verification

SHOW CON_NAME;
SELECT name, open_mode FROM v$pdbs;
SELECT username, default_tablespace, temporary_tablespace FROM dba_users WHERE username = 'SHARON_ADMIN';
SELECT tablespace_name, bytes/1024/1024 AS size_mb, autoextensible, maxbytes/1024/1024 AS max_mb FROM dba_data_files;
SELECT tablespace_name, bytes/1024/1024 AS size_mb FROM dba_temp_files;
ARCHIVE LOG LIST;
