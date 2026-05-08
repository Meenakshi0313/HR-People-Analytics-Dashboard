# IBM HR Analytics: Strategic Workforce Insights Dashboard


## 📌 Project Overview
This project transforms raw transactional HR data into a multi-page executive BI suite. The objective was to move beyond simple headcount reporting to identify the **root causes of attrition**, quantify the **financial impact ($7M replacement cost)**, and provide actionable insights for retaining **Top Talent**.

## 🚀 Documentation & Quick Links
* 📊 [Download Power BI Dashboard (.pbix)](#) - *Requires Power BI Desktop to view data model and DAX*
* 📄 [Download Project Summary (PDF)](#) - *A comprehensive report of insights and methodology*
* 💻 [View SQL Scripts](#) - *Database views and transformation logic*
* 📁 [Download Raw Dataset (.csv)](#)

---

## 🏗️ Technical Architecture
To ensure scalability and performance, I implemented a **Gold Layer** architecture:

* **Data Modeling:** Designed a **Star Schema** to optimize query performance and ensure clean relationship management between Fact and Dimension tables.
* **SQL Engineering:** Developed a suite of **T-SQL Views** to handle complex business logic (e.g., Burnout Risk flags, Performance Status mapping, and Compensation Tiers) at the database level.
* **Advanced DAX:** Authored complex measures including:
    * **Regrettable Attrition:** Filtering specifically for "Outstanding" performers who left.
    * **Attrition Variance:** Tracking performance against organizational benchmarks.
    * **Top Talent Concentration:** Measuring the density of high-performers across age demographics.

---

## 🖼️ Interactive Dashboard Suite

| Module | Analytical Focus | High-Res Preview |
| :--- | :--- | :--- |
| **01. Home Page** | Global Navigation & Entry Point | [View Image](./images/home_page.png) |
| **02. Executive Overview** | C-Suite Financials & Attrition Variance | [View Image](./images/executive_overview.png) |
| **03. Demographics Diversity** | Tenure Risk & Commute Vulnerability | [View Image](./images/demographics.png) |
| **04. Sentiment Performance** | Burnout Drivers & Top Talent Retention | [View Image](./images/sentiment.png) |

---

## 📈 Key Insights & Business Impact

* **Financial Leakage:** Identified a **$7M replacement cost**, with the **Research & Development** department accounting for nearly 50% of the total financial loss.
* **The "Burnout" Smoking Gun:** Using the **Overtime Slicer**, I discovered that **Regrettable Attrition % jumps from 16% to 35%** when overtime is required, proving that workload is the primary driver for losing "Outstanding" talent.
* **Commute Vulnerability:** Sales Executives with long commutes represent the highest volume of attrition, suggesting a need for remote-work or travel-stipend interventions.
* **First-Year Risk:** Data indicates a significant "New Hire" attrition spike (40% in the first year), highlighting a need for improved onboarding and mentorship programs.

---

## 🛠️ Tools Used:
* **SQL (T-SQL):** Data extraction, transformation, and "Gold Layer" view creation.
* **Power BI:** Data modeling, DAX development, and UI/UX design.
* **Excel:** Initial data exploration and validation.

---

**Author:** Meenakshi Singh  
**Role:** Data Analyst | SQL Engineering | Power BI Architecture


## 🤝 Connect with me
[LinkedIn](https://linkedin.com) | [Portfolio Site](#)

