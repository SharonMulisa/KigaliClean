# KigaliClean

## Phase I – Business Process Modeling

**Process:** Citizen Reports Dirty Spot -> City Verifies -> Cleaning Team Cleans -> Citizen Confirms

**Tool used:** draw.io

**Published Diagram Link:** https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=KigaliClean.drawio&dark=auto#R%3Cmxfile%3E%3Cdiagram%20name%3D%22Page-1%22%20id%3D%22KyIlFDiMOGi8C9oo5pEZ%22%3E1Vldd6IwFPw1PnYPEEB5tGq3Pe3antr96L5FSCFtJGyIq%2Byv3wChmGC72oJrXzxkuNzEmeHeGHtgtFh%2FZjCJvtAAkZ5lBOseGPcsy%2FM88ZkDWQnYwCiBkOGghMwamOE%2FSIJV2BIHKFUCOaWE40QFfRrHyOcKBhmjKzXsgRJ11gSGqAHMfEia6Hcc8KhEB45R4%2BcIh1E1s2nIOwtYBUsgjWBAVxsQmPTAiFHKy6vFeoRIzl3FS%2Fnc2Qt3nxfGUMx3eWB2M818%2FEhsMna%2FzS%2FAOl39ONmSRUIpzyoOGF3GAcrTGD1wuoowR7ME%2BvndlRBdYBFfEDEyxSUkOIzFtS8SIiaAMt1vSJYynQQQ42i9MaVc9WdEF4izTIREm8T2JY2rWgVQmUSmsVw5ll4zK%2BqhNEH4nLvmSVxIqvagzWqdtgOy5KksAacrlsCxsmTvz5LTBktkdOYmeDS18Pr87no%2Bm558%2FXZiOmViFDQqUZM3umQ%2BeoVyu8FvnnYmh5TxiIY0hmRSo6eqAnXMFaWJ5P0RcZ7J4gyXnKqqBOgBLgm%2FgnNETqH%2FFBYZR5RQ8f6PyworpeOQhYi%2FxoaxVeOmoAwRyPFvlbLWLWx3b%2BHrBMUCGSbJm8zsNL080Kw80MrioDMr78KW%2BHJcpWQbYyln9AlVHoppnHvoAROiQY12k9OHRf8eyhsLHARbbN6QYXRxd%2FFzMn2TBqCpgatq4PQ7aE1bNXA%2Ftgb3Avl%2BfXs5ue1ICdfU2p%2FblRLeR1biajKcdqeBoTXXzjQwB3s01%2BNrmmKJLPuRT%2FLJqYb3cs5iMF4ro0zR89%2FN9gU1t%2FZWqZ3xyTC8wctyFdmGjMFsIyChOObpxmQ3OVAntT1HMYTV137LaPFA2%2Blr8eKiXMGOswHNfuU2Sz61xzIcvaqXCjQSFVZ%2B5vsd7n7%2BFdrd9uQuS5BACPWFJWi%2BU%2BlZp%2FmcERWWbmnH4qn1wbYPtmNx96gPG5vvV16noywkuxYEq6H%2FHhWifXXaP55odroI%2BU%2FFN0oE%2BR0ZGphqxbGNzgzttWlo638Y%2Bq1Nr9UXAbytMwKr5c7oaM5xjH90Rvud8e5%2BnVeLVztva33O6r4OzFAcCOSRznN%2FiM5m%2BATBWOyiWyoJpnbCZDsqkx3WhH6bNQF8%2BCZnH1eTO8Ax6Si3cs9y4SKPjOdpUkQZCclTtGRw7dgJWFql6G4Td4BTuq9JADkqMkK%2BFAXbGF9PJx1tF%2Bz%2BoaizdvoFcaSHFMLQJF%2BXqNhuyIuIEnigRcuqv4H7a0mrGydpUWSGIsC0k3X5mLxfJbrEoVjlS2%2FNrdwqGrMs5WhRzSoEKCdWFyPgjQW2c55i6u%2Ba1sXN%2Ff0ihvV%2FkWXjrv%2FQBZO%2F%3C%2Fdiagram%3E%3C%2Fmxfile%3E

**Diagram PDF:** docs/business_process/business_process_diagram.pdf

**Explanation PDF:** docs/business_process/business_process_explanation.pdf
### 📄 Phase I Files
- [View Business Process Diagram](KigaliClean.drawio.png)
- [View Business Process Explanation](business%20proposal%20explanation.pdf)
- [View Business Process Document](KigaliClean%20business%20process.docx)


# KIGALICLEAN

**Name:** Mulisa Sharon
**Student ID:** 20251IMA030
**Group:** C
**PDB:** KIGALICLEAN_PDB

## Project Description
Kigaliclean tracks plastic bottle scans in Kigali. Users scan a bottle barcode, the system identifies the product, brand, and manufacturer, and records where it was scanned.

## Tables
- **COUNTRY** - country_code (PK), country_name, region
- **MANUFACTURER** - manufacturer_id (PK), manufacturer_name, manufacturer_country (FK -> COUNTRY)
- **BRAND** - brand_id (PK), brand_name, manufacturer_id (FK -> MANUFACTURER)
- **PRODUCT** - product_barcode (PK), product_label, product_size, brand_id (FK -> BRAND), bottle_weight
- **SCAN** - scan_id (PK), product_barcode (FK -> PRODUCT ON DELETE CASCADE), scan_country (FK -> COUNTRY), bottle_count, data_url

## How To Run (In Order)
1. `database/ddl/01_schema.sql`
2. `database/ddl/02_constraints.sql`
3. `database/ddl/03_indexes.sql`
4. `database/ddl/04_views.sql`
5. `database/dml/05_staging_load.sql`
6. `database/dml/06_clean.sql`
7. `database/dml/07_load_tables.sql`
8. `database/tests/08_constraint_tests.sql` - each INSERT must FAIL (proves constraints work)
9. `database/tests/09_cascade_tests.sql` - deleting a PRODUCT deletes its SCANs
10. `database/tests/10_verification.sql` - final counts, JOINs, views

## Data Cleaning Done
- TRIM spaces from barcode / label
- UPPER country names, INITCAP brand names
- Empty weight `''` -> NULL
- DISTINCT to remove duplicate rows

## Constraints Tested
- PK: duplicate barcode fails
- FK: brand_id 999 fails
- CHECK: bottle_count -5 fails
- UNIQUE: duplicate RWANDA fails
- NOT NULL: NULL product_label fails
