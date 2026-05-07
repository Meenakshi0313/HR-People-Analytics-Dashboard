# IBM HR Analytics: Strategic Workforce Insights Dashboard


## 📌 Project Overview

This project transforms raw transactional HR data into a multi-page executive BI suite. The goal is to move beyond simple headcount reporting to identify the root causes of attrition, quantify the financial impact ($7M replacement cost), and provide actionable insights for retaining Top Talent.

---

## 🚀  Documentation & Quick Links

* 📊 **[Download Power BI Dashboard (.pbix)](Report_and_Dashboard/IBM_HR_Analytics_Strategic_Dashboard.pbix)** - *Requires Power BI Desktop to view data model and DAX*
* 📄 **[Download Project Summary (PDF)](Report_and_Dashboard/IBM_HR_Analytics_Strategic_Dashboard.pdf)** - *A comprehensive report of insights and methodology*
* 💻 **[View SQL Scripts](Sql_Scripts/02_Gold_Reporting_Views.sql)** - *Database views and transformation logic*
* 📁 **[Download Raw Dataset (.csv)](Source_Data/HR-Employee-Attrition.csv)**

  ---

  ## 🖥️ Interactive Dashboard Suite
Click on any module below to view the high-resolution preview directly from the assets folder.

| Module | Analytical Focus | High-Res Preview |
| :--- | :--- | :--- |
| **01. Home Page** | Global Navigation & Entry Point | [🖼️ View](Assets/01_Home_Navigation.png) |
| **02. Executive Overview** | C-Suite Financial & Pareto Health | [🖼️ View](Assets/02_Executive_Overview.png) |
| **03. Demographics Diversity** | Unit Contribution & Price Erosion | [🖼️ View](Assets/03_Demographics_Diversity.png) |
| **04. Sentiment Performance** | Demographic & Income Distribution | [🖼️ View](Assets/04_Sentiment_Performance.png) |

<details>
  <summary>📸 **Click here to expand and view all screenshots in-line**</summary>

  ### 01. Home Page
  ![Home Navigation](Assets/01_Home-Navigation.png)

  ### 02. Executive Overview
  ![Executive Overview](Assets/02_Executive-Overview.png)

  ### 03. Demographics Diversity
  ![Demographics Diversity](Assets/03_Demographics_Diversity.png)

  ### 04. Sentiment Performance
  ![Sentiment Performance](Assets/04_Sentiment_Performance.png)
  
---

## 🏗️ Technical Architecture

To ensure scalability and performance, I implemented a Gold Layer architecture:

- **Data Modeling:** Designed a Star Schema to optimize query performance and ensure clean relationship management between Fact and Dimension tables.

  ![Data Model](./Assets/Data-Model.png)

- **SQL Engineering:** Developed a suite of T-SQL Views to handle complex business logic (e.g., Burnout Risk flags, Performance Status mapping, and Compensation Tiers) at the database level.

- **Advanced DAX:** Authored complex measures including:

    - Regrettable Attrition: Filtering specifically for "Outstanding" performers who left.
    
    - Attrition Variance: Tracking performance against organizational benchmarks.
    
    - Top Talent Concentration: Measuring the density of high-performers across age demographics.

---

## 📊 Key Insights & Business Impact

- **Financial Leakage:** Identified a $7M replacement cost, with the Research & Development department accounting for nearly 50% of the total financial loss.

- **The "Burnout" Smoking Gun:** Using the Overtime Slicer, I discovered that Regrettable Attrition % jumps from 16% to 35% when overtime is required, proving that workload is the primary driver for losing "Outstanding" talent.

- **Commute Vulnerability:** Sales Executives with long commutes represent the highest volume of attrition, suggesting a need for remote-work or travel-stipend interventions.

- **First-Year Risk:** Data indicates a significant "New Hire" attrition spike (40% in the first year), highlighting a need for improved onboarding and mentorship programs.

---

## 🛠️ Dashboard Features

- **Executive Overview:** High-level financials, Waterfall analysis of replacement costs, and talent loss vs. concentration.

- **Workforce Profile:** Deep-dive into tenure, commute distance correlations, and age-based talent density heatmaps.

- **Sentiment & Performance Analysis:** Diagnostic page linking Work-Life Balance and Job Satisfaction directly to attrition velocity.

- **Interactive Navigation:** Fully customized Landing Page with sync-slicers and "Clear All" functionality for a seamless user experience.

---

## 🚀 How to Use

- Open the .pbix file in Power BI Desktop.

- Use the Home Page buttons to navigate through the three analytical chapters.

- Utilize the Overtime Status and Department slicers to see how specific variables shift the attrition narrative

---

## Tools Used: 

SQL (T-SQL), Power BI, DAX

---

**Author:** Meenakshi Singh  
*Data Analyst | SQL Engineering | Power BI Architecture*
