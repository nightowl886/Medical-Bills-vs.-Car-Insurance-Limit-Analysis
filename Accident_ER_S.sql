-- Calculate accident rate 
SELECT 
  COUNT(*) FILTER (WHERE d.icd_code LIKE 'S%' OR d.icd_code LIKE '%,S%') AS accident_cases,
  COUNT(*) AS total_er_cases,
  ROUND(
    COUNT(*) FILTER (WHERE d.icd_code LIKE 'S%' OR d.icd_code LIKE '%,S%')::numeric 
    / COUNT(*) * 100, 2
  ) AS accident_percentage
FROM medical_bills.diagnosis d
LEFT JOIN medical_bills.admissions a
       ON a.admission_id = d.admission_id
WHERE a.department = 'ER';


---------------------------------------------

SELECT DISTINCT d.diagnosis_id,
       d.admission_id,
       d.icd_code,
	   d.severity,
	   a.patient_id,
	   a.admission_date,
	   a.discharge_date,
	   a.department,
	   CASE 
         WHEN d.icd_code LIKE 'S%' or d.icd_code LIKE '%,S%'  THEN 'CARINSURANCE'
         ELSE 'HEALTHINSURANCE'
       END AS Coverage,
	   CASE 
         WHEN a.department = 'ER' THEN 'ER'
         ELSE 'NON-ER'
       END AS Source

FROM medical_bills.diagnosis d
left JOIN medical_bills.admissions a
  ON a.admission_id = d.admission_id
where d.icd_code like 'S%' or d.icd_code LIKE '%,S%' 
; 
