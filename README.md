# Medical-Bills-vs.-Car-Insurance-Limit-Analysis

## 📌 Overview
This project explores how medical expenses from accident-related treatments are allocated between car insurance and health insurance. Using SQL for data aggregation and Tableau for visualization, the analysis demonstrates how insurance limits affect cost distribution.

## Data Cleaning Step: Standardizing Department Names
- Identified inconsistencies in the DEPARTMENT column of the admission dataset (values like ‘Emergency’ and misspelled ‘Emergancy’).

- Standardized department names in the admission dataset by using Excel’s case‑insensitive Find & Replace to unify all variations (Emergency, Emergancy) into a single label: ER.

- Simplified SQL queries (e.g., WHERE DEPARTMENT = 'ER') without handling multiple spellings.

## 🛠️ Methodology
- SQL Queries:
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
