# customer-lifetime-value-analysis
data analytics project showcasing customer lifetime value analysis using python, sql and powerbi
Project Overview

The project analyzes customer lifetime value using transactional and account data from 7,043 telecom customers across various contract types, service plans, and payment methods. The goal is to uncover insights into customer value segmentation, retention drivers, and churn risk to guide strategic business decisions.

This project also demonstrates an end-to-end data analytics workflow, from data preparation to business insights. The analysis was performed using Python, SQL (BigQuery), and Power BI to clean, explore, and visualize the dataset. The findings were summarized in a report and presentation.

Tools & Technologies: Python (Pandas) · SQL (BigQuery) · Power BI · Microsoft Word (Reporting)

Project Steps

Data Loading: Imported the dataset into Python. Inspected data structure and data types.
Exploratory Data Analysis (EDA): Analyzed distributions and trends. Identified missing values and data quality issues. Explored relationships between tenure, contract, and CLTV.
Data Cleaning: Handled missing values. Standardized column names. Removed redundant columns. Corrected data types.
Feature Engineering: Binned tenure into New/Established/Loyal customer types. Segmented CLTV into Low/Medium/High quantile tiers.
SQL Analysis: Loaded cleaned data into BigQuery. Wrote SQL queries to answer business questions on customer value and churn risk. Generated summary statistics and segment-level metrics.
Dashboard Development: Connected data to Power BI. Built interactive dashboards and visualizations. Created KPIs and customer value performance metrics.
Reporting & Presentation: Prepared a project report summarizing findings, insights, and recommendations.

Dashboard Highlights

The Power BI dashboard includes:

KPI Overview (Total Customers, Average CLTV, Average Tenure, Churn Rate)
CLTV Segment Distribution
CLTV by Contract Type
CLTV by Payment Method
CLTV by Customer Type
Interactive Filters (Customer Type, Contract Type, Payment Method)

Results

Key outcomes of the analysis include:

Identification of contract length and tenure as the strongest drivers of customer value
Business insights into which customer segments carry the highest churn risk
Actionable retention recommendations based on analytical findings, prioritized by expected impact




