SELECT d.diagnosis_id,
       d.admission_id,
       d.icd_code,
	   d.severity,
	   a.patient_id,
	   a.admission_date,
	   a.discharge_date,
	   CASE 
         WHEN d.icd_code LIKE 'S%' or d.icd_code LIKE '%,S%' THEN 'CARINSURANCE'
         ELSE 'HEALTHINSURANCE'
       END AS Coverage

FROM medical_bills.diagnosis d
left JOIN medical_bills.admissions a
  ON a.admission_id = d.admission_id
where a.department = 'ER' and d.icd_code like 'S%' or d.icd_code LIKE '%,S%' ; 
