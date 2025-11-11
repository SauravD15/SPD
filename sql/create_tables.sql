-- Sales table schema (ANSI SQL compatible)
CREATE TABLE IF NOT EXISTS sales (
  order_id INTEGER,
  order_date DATE,
  region VARCHAR(50),
  store VARCHAR(100),
  category VARCHAR(50),
  product VARCHAR(100),
  unit_price DECIMAL(10,2),
  unit_cost DECIMAL(10,2),
  quantity INTEGER,
  discount_pct DECIMAL(5,2)
);

-- Optional: derived fields view for Tableau
CREATE VIEW IF NOT EXISTS v_sales_enriched AS
SELECT
  order_id,
  order_date,
  region,
  store,
  category,
  product,
  unit_price,
  unit_cost,
  quantity,
  discount_pct,
  (unit_price * quantity * (1 - COALESCE(discount_pct, 0))) AS revenue,
  ((unit_price - unit_cost) * quantity) AS gross_margin,
  DATE_TRUNC('month', order_date) AS order_month
FROM sales;


