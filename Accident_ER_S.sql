--ICD‑10 Code Standardization Process

-- Step 1 
--– Trim and uppercase: Remove leading/trailing spaces and convert all ICD‑10 codes to uppercase.

UPDATE medical_bills.diagnosis
SET icd_code = UPPER(TRIM(icd_code));

-- Step 2 
--– Replace hyphens: Standardize format by replacing hyphens with dots (e.g., M54-5 → M54.5).

UPDATE medical_bills.diagnosis
SET icd_code = REPLACE(icd_code, '-', '.');

-- Step 3 
–-- Fix missing decimals: Insert decimal points where required (e.g., C50911 → C50.911).
  
UPDATE medical_bills.diagnosis
SET icd_code = REGEXP_REPLACE(icd_code, '^(C[0-9]{2})([0-9]{3})$', '\1.\2');

-- Step 4 
--– Normalize comma‑separated codes: Standardize formatting by removing extra spaces after commas. 

UPDATE medical_bills.diagnosis
SET icd_code = REPLACE(icd_code, ', ', ',');

----

