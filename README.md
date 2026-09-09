# Medical-Bills-vs.-Car-Insurance-Limit-Analysis

## 📌 Overview
This project explores how medical expenses from accident-related treatments are allocated between car insurance and health insurance. Using SQL for data aggregation and Tableau for visualization, the analysis demonstrates how insurance limits affect cost distribution.

## Data Cleaning Step: Standardizing Department Names
- Detected inconsistencies in the DEPARTMENT column of the admission dataset (e.g., ‘Emergency’ vs. misspelled ‘Emergancy’).

- Standardized values by applying Excel’s case‑insensitive Find & Replace to unify all variations into a single label: ER.

- Enabled cleaner analysis by ensuring SQL queries and Tableau visualizations reference one consistent department category.

## 🛠️ Methodology
### SQL Queries:
🚑 Accident-related Case Identification
- Defined criteria: Accident-related cases are identified as admissions where

  - DEPARTMENT = 'ER' (Emergency Room visits), and

- icd_code starts with S (injury-related ICD‑10 codes).

- Applied SQL filtering:

sql
SELECT d.diagnosis_id,
       d.admission_id,
       d.icd_code,
       d.diagnosis,
       a.department
FROM medical_bills.diagnosis d
LEFT JOIN medical_bills.admissions a
       ON a.admission_id = d.admission_id
WHERE a.department = 'ER'
  AND d.icd_code LIKE 'S%';
- Standardized department values: Prior cleaning ensured all variations of Emergency/Emergancy were unified into ER, preventing misclassification.

- Result: The query isolates ER admissions with injury codes, representing cases most likely linked to accidents.

- Impact on analysis: Enables accurate separation of CarInsurance vs HealthInsurance coverage in subsequent cost aggregation and Tableau visualization.


Aggregate itemized bills by category (Emergency Room, CT scans, Physician fees, Medications).
Apply logic to determine which expenses fall within the car insurance coverage limit (e.g., $10,000) and which exceed the threshold, requiring health insurance coverage.

- Business Logic:

  - If total accident-related costs ≤ $10,000 → covered by car insurance.

  - If costs exceed $10,000 → remaining balance shifts to health insurance.

## 📊 Tableau Visualizations
- Stacked Bar Chart: Shows the proportion of costs by category (ER, CT, Physician, Medication).

- Pie Chart: Illustrates the split between car insurance and health insurance coverage.

- Dynamic Parameter: Allows users to input different car insurance limits (e.g., $10,000, $15,000) and instantly see updated coverage distribution.

## 🎯 Key Insights
- Highlights how quickly accident-related medical costs can exceed car insurance limits.

- Demonstrates the importance of secondary health insurance in covering excess expenses.

- Provides a clear, interactive dashboard for understanding insurance cost allocation.
