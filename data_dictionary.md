 KigaliClean - Data Dictionary (Logical, no Oracle types)

COUNTRY
- country_code (PK): Country code, e.g. MW, MZ, UG. Required, Unique.
- country_name: Full country name. Required.

 MANUFACTURER
- manufacturer_id (PK): Manufacturer ID. Required, Unique.
- manufacturer_name: Name of manufacturer, e.g. Oyoma General. Required.
- manufacturer_country (FK -> COUNTRY.country_code): Country where manufacturer is based. Required.

 BRAND
- brand_id (PK): Brand ID. Required, Unique.
- brand_name: Brand name, e.g. Kabisa. Required.
- manufacturer_id (FK -> MANUFACTURER.manufacturer_id): Who makes this brand. Required.

 PRODUCT
- product_barcode (PK): Barcode of product, e.g. 1234003331. Required, Unique.
- product_label: Product name, e.g. Kumbucha Alcoholic Drink. Required.
- product_size: Size, e.g. 500 ml. Required.
- brand_id (FK -> BRAND.brand_id): Brand of product. Required.
- bottle_weight: Weight of one bottle. Optional.

 SCAN
- scan_id (PK): Scan record ID. Required, Unique.
- product_barcode (FK -> PRODUCT.product_barcode): Which product was found. Required.
- scan_country (FK -> COUNTRY.country_code): Where it was found. Required.
- bottle_count: How many bottles found. Required.
- data_url: Link to Wastebase record. Optional.

Relationships - Cardinality and Optionality
- COUNTRY (1) -> MANUFACTURER (many): One country can have many manufacturers. Each manufacturer MUST belong to 1 country.
- MANUFACTURER (1) -> BRAND (many): One manufacturer can have many brands. Each brand MUST belong to 1 manufacturer.
- BRAND (1) -> PRODUCT (many): One brand can have many products. Each product MUST belong to 1 brand.
- PRODUCT (1) -> SCAN (many): One product can have many scans. Each scan MUST belong to 1 product.
- COUNTRY (1) -> SCAN (many): One country can have many scans. Each scan MUST be in 1 country.