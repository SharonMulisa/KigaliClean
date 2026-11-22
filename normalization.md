KigaliClean - Normalization UNF -> 1NF -> 2NF -> 3NF

 Raw example - 3 real rows from raw file
Barcode 1234003331 | Kumbucha Alcoholic Drink | Kabisa | Oyoma General | MW | 28 bottles
Barcode 1234003331 | Kumbucha Alcoholic Drink | Kabisa | Oyoma General | MZ | 376 bottles
Barcode 1234003331 | Kumbucha Alcoholic Drink | Kabisa | Oyoma General | UG | 2 bottles

 UNF
One big table with everything mixed, product details repeated in every row.
Dependency removed: none yet, this is the raw file.
Rows (3):
1. 1234003331, Kumbucha Alcoholic Drink, Kabisa, Oyoma General, MW, 28
2. 1234003331, Kumbucha Alcoholic Drink, Kabisa, Oyoma General, MZ, 376
3. 1234003331, Kumbucha Alcoholic Drink, Kabisa, Oyoma General, UG, 2

 1NF
Remove repeating group: one row per (product_barcode + scan_country), every cell holds one single value.
Dependency removed: Repeating group - one product had many countries in one record.
Key: (product_barcode, scan_country)
Rows (3):
1. 1234003331, MW, 28
2. 1234003331, MZ, 376
3. 1234003331, UG, 2

 2NF
Remove partial dependency: product_label, product_size, brand_name depend only on product_barcode, not on scan_country, so they move to PRODUCT.
Dependency removed: Partial dependency on product_barcode.
Tables:
PRODUCT (3 columns shown, 1 row for this product):
1. 1234003331, Kumbucha Alcoholic Drink, Kabisa
SCAN (3 rows):
1. 1234003331, MW, 28
2. 1234003331, MZ, 376
3. 1234003331, UG, 2

3NF
Remove transitive dependency: manufacturer_name depends on brand_name, and manufacturer_country depends on manufacturer_name, not directly on product, so they move out.
Dependency removed: Transitive dependency via brand -> manufacturer -> country.
Final 3NF tables (rows for this example):
COUNTRY (3 rows): MW, MZ, UG
MANUFACTURER (1 row): Oyoma General, MW
BRAND (1 row): Kabisa, Oyoma General
PRODUCT (1 row): 1234003331, Kumbucha Alcoholic Drink, Kabisa
SCAN (3 rows): 1234003331-MW-28, 1234003331-MZ-376, 1234003331-UG-2

Field Mapping - every raw field to target
- product_barcode -> PRODUCT.product_barcode
- product_label -> PRODUCT.product_label
- product_size -> PRODUCT.product_size
- brand_name -> BRAND.brand_name
- manufacturer_name -> MANUFACTURER.manufacturer_name
- manufacturer_country -> MANUFACTURER.manufacturer_country / COUNTRY.country_code
- scan_country -> SCAN.scan_country / COUNTRY.country_code
- data_url -> SCAN.data_url
- bottle_weight -> PRODUCT.bottle_weight
- bottle_count -> SCAN.bottle_count
- Dropped: none. All 10 raw fields are used.

 Type Conversions for Phase IV - Cleaning Checklist
- product_barcode: NUMBER -> TEXT (to stop 2.15E+09)
- bottle_weight: TEXT -> NUMBER
- bottle_count: TEXT -> NUMBER