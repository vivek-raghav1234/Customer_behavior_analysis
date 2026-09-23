# Customer Shopping Behavior Analysis

## Overview
This project analyzes customer shopping behavior using transactional retail data to uncover insights into spending patterns, customer segments, product preferences, and subscription trends. The goal is to help a retail business understand who its customers are, how they shop, and where opportunities exist to grow revenue and subscriptions.

The analysis covers the full data workflow: data cleaning in Python, business querying in SQL, visualization in Power BI, and a final summary report and presentation.

## Dataset
- **Source file:** `customer_shopping_behavior.csv`
- **Size:** 3,900 customer transactions, 18 columns
- **Key fields:**
  - **Demographics:** Age, Gender, Location, Subscription Status
  - **Purchase details:** Item Purchased, Category, Purchase Amount (USD), Season, Size, Color
  - **Shopping behavior:** Discount Applied, Promo Code Used, Previous Purchases, Frequency of Purchases, Review Rating, Shipping Type, Payment Method
- **Data quality note:** 37 missing values in the Review Rating column, handled during cleaning.

## Tools Used
- **Python** (pandas) — data loading, cleaning, and feature engineering
- **Jupyter Notebook** (`customer_behave.ipynb`) — EDA workflow
- **PostgreSQL** — SQL querying for business questions (`customer_shopping_behavior.sql`)
- **Power BI** — interactive dashboard (`customer_behaviour.pbix`)
- **Gamma** — presentation deck for stakeholders
- **PDF report** — written summary of findings (`Customer_Shopping_Behavior_Analysis.pdf`)

## Project Steps
1. **Data Loading** — Imported the raw CSV dataset using pandas.
2. **Initial Exploration** — Used `df.info()` and `df.describe()` to understand structure and summary statistics.
3. **Missing Data Handling** — Imputed missing Review Rating values using the median rating per product category.
4. **Column Standardization** — Renamed columns to snake_case for consistency and readability.
5. **Feature Engineering** — Created an `age_group` column by binning ages, and a `purchase_frequency_days` column from purchase data.
6. **Data Consistency Check** — Compared `discount_applied` and `promo_code_used`; dropped the redundant `promo_code_used` column.
7. **Database Integration** — Loaded the cleaned dataset into PostgreSQL for structured SQL analysis.
8. **SQL Analysis** — Answered key business questions, including:
   - Revenue by gender
   - High-spending customers who used discounts
   - Top 5 products by average review rating
   - Standard vs. Express shipping spend comparison
   - Subscribers vs. non-subscribers (spend and revenue)
   - Products most dependent on discounts
   - Customer segmentation (New, Returning, Loyal)
   - Top 3 products per category
   - Repeat buyers vs. subscription likelihood
   - Revenue contribution by age group
9. **Dashboard Build** — Designed an interactive Power BI dashboard to visualize the findings.
10. **Reporting** — Compiled results into a written report (PDF) and a presentation deck (Gamma).

## Dashboard
The Power BI dashboard (`customer_behaviour.pbix`) presents:
- Total customers, average purchase amount, and average review rating (KPI cards)
- Customer split by subscription status
- Revenue and sales by product category
- Revenue and sales by age group
- Filters for gender, category, shipping type, and subscription status for interactive exploration

## Key Results
- **Revenue by gender:** Male customers generated significantly more total revenue (~$157,890) than female customers (~$75,191).
- **Subscriptions:** Only 27% of customers are subscribers, yet non-subscribers still generate the majority of revenue — highlighting a large under-subscribed customer base.
- **Customer loyalty:** The majority of customers (3,116) fall into the "Loyal" segment based on purchase history, with far fewer New (83) or Returning (701) customers.
- **Discount behavior:** Products like Hats, Sneakers, and Coats have the highest discount dependency (~48–50% of purchases discounted).
- **Shipping:** Express shipping customers spend slightly more on average ($60.48) than Standard shipping customers ($58.46).
- **Age groups:** Young Adults contribute the most revenue ($62,143), though revenue is fairly evenly spread across all age groups.

### Business Recommendations
- Boost subscription sign-ups with exclusive member benefits.
- Launch loyalty programs to reward and retain repeat buyers.
- Review discount strategy to protect margins on high-discount-dependent products.
- Highlight top-rated and best-selling products in marketing campaigns.
- Target marketing efforts toward high-revenue age groups and express-shipping users.

## How to Run
1. **Clone/download this project** and ensure the following files are together:
   - `customer_shopping_behavior.csv`
   - `customer_behave.ipynb`
   - `customer_shopping_behavior.sql`
   - `customer_behaviour.pbix`
2. **Python/EDA:**
   - Install dependencies: `pip install pandas numpy`
   - Open and run `customer_behave.ipynb` in Jupyter Notebook to reproduce the cleaning and feature engineering steps.
3. **SQL:**
   - Load the cleaned dataset into a PostgreSQL database (table name: `customer`).
   - Run the queries in `customer_shopping_behavior.sql` to reproduce the business analysis.
4. **Power BI:**
   - Open `customer_behaviour.pbix` in Power BI Desktop to explore the interactive dashboard.
5. **Report & Presentation:**
   - Refer to `Customer_Shopping_Behavior_Analysis.pdf` for the full written report.
   - Refer to the Gamma-generated slide deck for a presentation-ready summary of findings.

---
*This project is part of a data analyst portfolio, demonstrating end-to-end skills in data cleaning, SQL querying, dashboarding, and business reporting.*
