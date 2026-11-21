-- Name: Mulisa Sharon
-- Student ID: 20251IMA030
-- Group: C
-- Project Name: Kigaliclean
-- Task: 04 - Archive logging
-- Why ARCHIVELOG cannot be enabled for a single PDB:
-- ARCHIVELOG is a CDB-level setting, not a PDB setting.
-- Redo logs and archive logs belong to the whole CDB, shared by all PDBs.
-- A PDB has no separate redo log, so it cannot be put in ARCHIVELOG mode alone.
-- To enable it, the whole CDB must be shut down, mounted, and switched to ARCHIVELOG mode.

ALTER SESSION SET CONTAINER = CDB$ROOT;

ARCHIVE LOG LIST;

SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
ALTER DATABASE ARCHIVELOG;
ALTER DATABASE OPEN;
ALTER PLUGGABLE DATABASE ALL OPEN;

ARCHIVE LOG LIST;
