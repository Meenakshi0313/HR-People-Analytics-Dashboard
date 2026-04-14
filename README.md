# HR People Analytics: Strategic Workforce Insights


## 📋 Project Overview

This project features a comprehensive 4-page Power BI dashboard designed to help HR leadership understand employee turnover (attrition) and workforce health. By analyzing the IBM HR Analytics dataset, this dashboard identifies the key drivers behind employee departures and provides actionable insights for improving retention.

---

## 🚀  Documentation

* 📊 **[Download Power BI Dashboard (.pbix)](Report_and_Dashboard/IBM_HR_Analytics_Strategic_Dashboard.pbix)** - *Requires Power BI Desktop to view data model and DAX*
* 📄 **[Download Project Summary (PDF)](Report_and_Dashboard/IBM_HR_Analytics_Strategic_Dashboard.pdf)** - *A comprehensive report of insights and methodology*
* 💻 **[View SQL Scripts](Sql_Scripts/Gold_Layer_Views.sql)** - *Database views and transformation logic*
* 🗄️ **[Source Data (.csv)](Source/HR-Employee-Attrition.csv)** 
---

## 🛠️ Technical Implementation

I implemented several advanced Power BI techniques to ensure the data was accurate and the user experience was seamless:

1. Data Modeling (Star Schema)
   
- Developed a robust Star Schema to optimize performance.

- Central Fact Table: factHRPerformance containing 1,470 employee records.

- Dimension Tables: dimEmployeeDetails, dimJobDetails, and dimSatisfaction.

- Relationship Logic: Utilized One-to-Many relationships with single-direction filtering to ensure slicer integrity across all pages.

2. Advanced DAX & Power Query
   
- Custom Sorting: Resolved alphabetical sorting issues for qualitative data (e.g., Work-Life Balance levels: Poor, Good, Better, Best) by implementing a Conditional Column index in Power Query to break circular dependencies.

- Dynamic Measures: Created measures for Average Monthly Income, Attrition Rate %, and Job Involvement Scores.

3. Insight-Driven Visualization
   
- Action-Oriented Titling: Moved beyond generic labels (e.g., "Distance from Home") to descriptive titles (e.g., "Attrition Risk by Commute Distance") to provide immediate context for stakeholders.

- Interactive UI: Designed a custom Navigation Home Page with interactive buttons for intuitive report exploration.

---

## 📈 Key Insights

- Overtime Impact: Employees working overtime show a significantly higher attrition rate (53.6%) compared to those who do not.

- Commute Sensitivity: Attrition risk increases significantly as "Distance from Home" increases, suggesting a need for flexible work options in those areas.

- Financial Drivers: A strong correlation was identified between Stock Option levels and employee retention, particularly at the Senior level.

---

## 📂 Folder Structure

01_Assets/: High-resolution PNGs of each dashboard page.

02_Dataset/: Raw data used for the analysis.

03_Report_and_Dashboard/: A single-file export of the full 4-page report & the source Power BI file.

---

## 💡 How to use this repository

- Download the .pbix file to explore the interactive elements.

- View the 03_Report_PDF for a quick overview of the findings.

- Review the Data Model in the images folder to see the schema architecture.
