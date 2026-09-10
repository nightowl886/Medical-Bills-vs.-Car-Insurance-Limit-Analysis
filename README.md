# Medical-Bills-vs.-Car-Insurance-Limit-Analysis

## 📌 Overview
This project explores how medical expenses from accident-related treatments are allocated between car insurance and health insurance. Using SQL for data aggregation and Tableau for visualization, the analysis demonstrates how insurance limits affect cost distribution.

## 🧹Data Cleaning Step: 
### 1. Standardizing Department Names (Using Excel)
- Detected inconsistencies in the DEPARTMENT column of the admission dataset (e.g., ‘Emergency’ vs. misspelled ‘Emergancy’).

- Standardized values by applying Excel’s case‑insensitive Find & Replace to unify all variations into a single label: ER.

- Enabled cleaner analysis by ensuring SQL queries and Tableau visualizations reference one consistent department category.

### 2. Department Column Standardization (Using SQL)
- Uppercase normalization: Converted all department names to uppercase to avoid duplicates such as Onco, oncology, and ONCOLOGY being treated as separate categories.

- Spelling corrections: Fixed common typos, e.g., Cardiolgy → CARDIOLOGY, Peds → PEDIATRICS, ensuring consistent and professional labeling.

- Industry-standard abbreviations: Retained ER (Emergency Room) as a recognized abbreviation, while other departments were standardized to full names.

- Improved analytical accuracy: Standardization ensures clear ER vs Non-ER comparisons and prevents distorted ratios caused by inconsistent naming.

## 🛠️ Methodology

### 🚗 Identifying Car‑Accident–Related Cases Using ICD‑10 S‑Codes (Expanded Logic)
- Injury‑based detection: Records were classified as accident‑related if any ICD‑10 code within the diagnosis string begins with “S”, which corresponds to traumatic injuries (fractures, contusions, lacerations, internal injuries, etc.).

- Multi‑code parsing: Many admissions contain multiple ICD‑10 codes stored as comma‑separated values (e.g., I10,S72.001A). Each code was parsed individually to ensure that S‑codes appearing in second or later positions were also correctly identified.

- Inclusive trauma logic: The filtering logic does not rely solely on the first diagnosis code. Any presence of an S‑code—whether primary or secondary—was treated as a valid indicator of trauma potentially caused by motor‑vehicle accidents.

- Coverage assignment: Admissions containing at least one S‑code were labeled as CARINSURANCE, while all others were labeled as HEALTHINSURANCE, enabling downstream comparisons between accident‑related and non‑accident cases.

- Data quality safeguards: Additional filters were applied to remove records with inconsistent timestamps (e.g., discharge date earlier than admission date), ensuring that only valid encounters were included in the analysis.

- Limitations acknowledged: S‑codes capture trauma but do not explicitly encode accident type. Some motor‑vehicle accidents may instead use V‑codes (external cause codes). This project focuses on S‑codes as a practical and widely used proxy for accident‑related injuries within the dataset.
----

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
