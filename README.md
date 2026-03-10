# 🏬 Superstore Profitability Analysis

![Status](https://img.shields.io/badge/Status-Completed-green)
![Python](https://img.shields.io/badge/Python-3.x-blue)
![SQL](https://img.shields.io/badge/SQL-MySQL-orange)
![Tableau](https://img.shields.io/badge/Tableau-Dashboard-blueviolet)

A data-driven analysis of retail profitability across regions, product categories, and customer segments — identifying loss-making areas, quantifying the impact of discounts on profit, and delivering actionable recommendations to improve the bottom line.

🔗 **[View Interactive Tableau Dashboard](https://public.tableau.com/views/superstore_17705621059380/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

---

## 📌 Project Overview

A national retail Superstore is experiencing **inconsistent profitability** — certain regions, product lines, and customer segments are running at a **net loss** while others thrive. Leadership needs clarity on *where* money is being lost and *why*.

This project analyzes **~10,000 transactional records** to uncover the root causes of profit erosion and deliver a clear set of strategic recommendations, supported by SQL analysis, Python exploration, and an interactive Tableau dashboard.

### Objectives

- Pinpoint **loss-making regions, categories, and sub-categories**
- Quantify the **relationship between discount levels and profitability**
- Compare **customer segment performance** (Consumer, Corporate, Home Office)
- Deliver **actionable, data-backed recommendations** to improve margins

---

## 📊 Dataset Description

| Attribute | Detail |
|-----------|--------|
| **Source** | [Superstore Sales Dataset — Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final) |
| **Records** | ~10,000 rows |
| **Features** | 21 columns |
| **Time Span** | 4 years of order-level transactions |
| **Key Fields** | `Order Date`, `Region`, `State`, `Category`, `Sub-Category`, `Sales`, `Quantity`, `Discount`, `Profit`, `Segment` |

The dataset represents order-level sales data for a US-based retail superstore covering Furniture, Office Supplies, and Technology across four regions (East, West, South, Central).

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| **Google Sheets** | Initial data exploration, cleaning, and validation |
| **SQL (MySQL)** | Structured querying — aggregations, filtering, grouping, and profit analysis |
| **Python (Pandas, Matplotlib, Seaborn)** | Exploratory data analysis, statistical summaries, and visualizations |
| **Tableau Public** | Interactive dashboard for stakeholder-ready visual storytelling |

---

## 📁 Project Structure

Superstore-Profitability-Analysis/
│
├── Data/
│ 
├── Python_Analysis/
│ 
├── SQL_Queries/
│ 
├── Visualizations/
│ 
└── README.md


---

## ❓ Key Analysis Questions

| # | Business Question |
|---|-------------------|
| 1 | Which **regions** are profitable and which are losing money? |
| 2 | Which **product categories and sub-categories** are driving the largest losses? |
| 3 | Which **customer segments** are the most and least profitable? |
| 4 | Are **discounts** causing certain products to become unprofitable? |
| 5 | What is the **threshold discount level** beyond which profit turns negative? |
| 6 | What **actionable steps** can leadership take to improve overall profitability? |

---

## 🔍 Key Insights

### 1. Regional Profitability Is Uneven
- The **West** and **East** regions generate the highest profits.
- The **Central** region is the weakest performer and contains multiple loss-making states.
- **Texas** and **Illinois** are among the top states by sales volume but produce **negative profit**, indicating a structural margin problem.

### 2. Sub-Category Losses Are Concentrated
- **Tables**, **Bookcases**, and **Supplies** are consistently unprofitable sub-categories.
- **Copiers**, **Phones**, and **Accessories** are the strongest profit contributors.
- The Furniture category as a whole operates on razor-thin or negative margins.

### 3. Discounts Are Eroding Profit
- Orders with **discounts above 20%** show a sharp decline in profitability.
- At **40%+ discount levels**, the average order generates a **net loss**.
- There is a clear **negative correlation** between discount rate and profit margin.

### 4. Segment Performance Varies
- The **Consumer** segment drives the most revenue but also the most volume-weighted losses.
- The **Home Office** segment delivers the **highest profit-to-sales ratio**, making it the most efficient segment.
- The **Corporate** segment sits in between and benefits from moderate, targeted discounting.

### 5. High Sales ≠ High Profit
- Several high-revenue products and states are **profit-negative** — top-line growth is masking bottom-line losses.
- Profit analysis must supplement sales reporting to avoid misleading performance assessments.

---

## 📈 Visualizations

All charts are available in the [`Visualizations/`](./Visualizations) folder. Key visuals include:

| Visualization | What It Shows |
|---------------|---------------|
| Profit by Region | Regional profit comparison highlighting loss areas |
| Discount vs. Profit Scatter | Negative correlation between discount level and profit |
| Sub-Category Profit Ranking | Top profitable and loss-making sub-categories |
| Segment Profitability | Profit contribution by Consumer, Corporate, and Home Office |

### 📊 Interactive Dashboard

Explore the full interactive dashboard on Tableau Public:

🔗 **[Superstore Profitability Dashboard](https://public.tableau.com/views/superstore_17705621059380/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

The dashboard provides at-a-glance views of profitability trends, loss areas, discount impact, and segment-level performance — designed for non-technical stakeholders.

---

## 💡 Business Recommendations

| # | Recommendation |
|---|----------------|
| 1 | **Cap discounts at 20%** — profits decline sharply beyond this threshold; eliminate blanket 40%+ discounts entirely. |
| 2 | **Review the Furniture category** — Tables and Bookcases need pricing restructuring or SKU rationalization. |
| 3 | **Investigate Central region operations** — high sales with negative profit suggests cost, shipping, or discount issues specific to this region. |
| 4 | **Prioritize high-margin sub-categories** — shift marketing spend toward Copiers, Phones, and Accessories. |
| 5 | **Grow the Home Office segment** — it delivers the best margin efficiency and has room for volume growth. |
| 6 | **Implement profit-aware reporting** — supplement revenue dashboards with profit metrics to prevent "profitable-looking" losses. |

---

## 🚀 How to Run This Project

### Prerequisites
- Python 3.x with `pandas`, `matplotlib`, `seaborn`
- MySQL (or any SQL-compatible database)
- Tableau Public (free) to view/edit the dashboard

### Steps

```bash
# 1. Clone the repository
git clone https://github.com/your-username/Superstore-Profitability-Analysis.git
cd Superstore-Profitability-Analysis

# 2. Open the Python notebook
jupyter notebook Python_Analysis/Superstore_Profit_Analysis.ipynb

# 3. Run SQL queries
#    Import Data/Superstore_Sales.csv into MySQL
#    Execute queries from SQL_Queries/SQL_queries.sql

# 4. View the dashboard
#    Open the Tableau Public link above, or download and open in Tableau Desktop
```
---

## 🔮 Future Improvements
 Build a predictive model to forecast profit by region and category
 Add time-series analysis to identify seasonal profitability patterns
 Perform customer-level RFM segmentation for targeted marketing recommendations
 Conduct shipping cost analysis to isolate logistics-driven losses
 Automate reporting with a scheduled Python pipeline

 
### 👤 Author
Uzair Mukhtar

Aspiring Data & Business Analyst with a passion for turning raw data into clear, actionable business insights.

💼 **[LinkedIn](https://www.linkedin.com/in/uzair-mukhtar-b65ab6324)**
📧 uzairmukhtar176@gmail.com

⭐ If you found this project useful or interesting, please consider giving it a star!






