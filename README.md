Sales Performance Dashboard

Overview

Interactive Tableau dashboard analyzing retail sales trends, regional performance, and key KPIs (Revenue, AOV, Conversion Rate, Units Sold). Insights support marketing strategy and stock optimization.

Tools
- Tableau
- Excel
- SQL (ANSI-compatible; examples provided for PostgreSQL/SQLite)

Dataset
- `data/sales.csv`: Sample synthetic retail transactions.
- Suggested schema is defined in `sql/create_tables.sql`.

Key Questions
- Which regions, categories, and products drive revenue and profit?
- How do seasonality and promotions impact sales?
- What are weekly/monthly trends for Revenue, AOV, Units Sold, and Margin?
- Which stores/regions are underperforming vs target?

Repository Structure
- `data/` sample input data
- `sql/` DDL and example analytical queries
- `tableau/` workbook notes/instructions
- `excel/` helper sheets (e.g., data dictionary)

How to Use
1) Load data:
   - Load `data/sales.csv` into your SQL database using `sql/create_tables.sql` as schema reference, or connect Tableau directly to CSV.
2) Run SQL for views/KPIs:
   - Use `sql/analysis_queries.sql` to create reusable views for Tableau or export result sets to CSV and connect Tableau.
3) Build in Tableau:
   - Follow `tableau/README.md` for recommended sheets/dashboards and calculated fields.
4) Excel support:
   - Use `excel/data_dictionary.csv` for field definitions and KPI formulas.

Suggested KPIs
- Revenue = SUM(`unit_price` * `quantity`)
- Units Sold = SUM(`quantity`)
- AOV (Average Order Value) = Revenue / COUNT(DISTINCT `order_id`)
- Gross Margin = SUM((`unit_price` - `unit_cost`) * `quantity`)
- Conversion Rate (if web sessions available) = Orders / Sessions

Deliverables
- Executive dashboard: Revenue trend, Map by Region, Category Performance, Top Products, KPIs.
- Drill-down sheets: Product, Category, Region/Store.
- Insights summary: 5-8 bullets guiding marketing and inventory actions.

Notes
- Data is synthetic for portfolio use.


