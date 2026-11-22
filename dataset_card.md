 KigaliClean - Dataset Card

 Source
- Source link: https://www.kaggle.com/datasets/wastebase/plastic-bottle-waste
- Publisher: Wastebase and collaborators
- Licence: Attribution-NonCommercial 4.0 (CC BY-NC 4.0)
- Date collected: 15 November 2026
- Format: CSV
- File location: data/raw/ - stored exactly as downloaded, never edited

Size
- Total rows in file: 4386 rows
- Header row: 1 row
- Total records: 4385 records (rows 2 to 4386)
- Meets requirement: Yes, at least 500 records required

 What one record represents
One record = one count of single-use plastic bottle waste for one commercial product found in one country.
Example: 28 bottles of Kumbucha Alcoholic Drink (Kabisa, Oyoma General) found in MW.

Quality Check - Counts, not just issues
- Total records checked: 4385
- Product details repeated: Same product (Barcode 1234003331, Kumbucha) appears in 3+ rows, once per country. This is by design in raw file, will be fixed by normalization.
- Barcode stored as number: Barcodes show as 2.15E+09 (scientific notation) in Excel. Will convert to TEXT in Phase IV.
- Bottle weight and bottle count stored as TEXT: Will convert to NUMBER in Phase IV.
- Personal data: None found. No names, phone numbers, or ID numbers. No anonymisation needed.

DO NOT FIX YET - clean in Phase IV.