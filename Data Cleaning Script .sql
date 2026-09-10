-- ICD‑10 Code Standardization Process
--- Trim and uppercase: Remove leading/trailing spaces and convert all ICD‑10 codes to uppercase.
--– Replace hyphens: Standardize format by replacing hyphens with dots (e.g., M54-5 → M54.5).
–-- Fix missing decimals: Insert decimal points where required (e.g., C50911 → C50.911).
--– Normalize comma‑separated codes: Standardize formatting by removing extra spaces after commas. 

UPDATE medical_bills.diagnosis
SET icd_code = UPPER(TRIM(icd_code));

UPDATE medical_bills.diagnosis
SET icd_code = REPLACE(icd_code, '-', '.');
  
UPDATE medical_bills.diagnosis
SET icd_code = REGEXP_REPLACE(icd_code, '^(C[0-9]{2})([0-9]{3})$', '\1.\2');

UPDATE medical_bills.diagnosis
SET icd_code = REPLACE(icd_code, ', ', ',');

-----------------------------------

-- Trim and uppercase
  
UPDATE medical_bills.diagnosis
SET severity = UPPER(TRIM(severity));

-----------------------------------
