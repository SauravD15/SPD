-- Monthly KPIs
WITH m AS (
  SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(unit_price * quantity * (1 - COALESCE(discount_pct, 0))) AS revenue,
    SUM(quantity) AS units_sold,
    SUM((unit_price - unit_cost) * quantity) AS gross_margin,
    COUNT(DISTINCT order_id) AS orders
  FROM sales
  GROUP BY 1
)
SELECT
  month,
  revenue,
  units_sold,
  gross_margin,
  CASE WHEN orders = 0 THEN 0 ELSE revenue::DECIMAL / orders END AS aov
FROM m
ORDER BY month;

-- Regional performance
SELECT
  region,
  SUM(unit_price * quantity * (1 - COALESCE(discount_pct, 0))) AS revenue,
  SUM((unit_price - unit_cost) * quantity) AS gross_margin,
  SUM(quantity) AS units_sold
FROM sales
GROUP BY region
ORDER BY revenue DESC;

-- Category breakdown
SELECT
  category,
  SUM(unit_price * quantity * (1 - COALESCE(discount_pct, 0))) AS revenue,
  SUM(quantity) AS units_sold,
  AVG(unit_price) AS avg_price
FROM sales
GROUP BY category
ORDER BY revenue DESC;


