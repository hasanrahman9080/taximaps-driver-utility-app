-- KPI queries for sample events
-- Assumes you import data/sample_events.csv into a table named: events
-- Columns: user_id, event_name, event_time, feature, result

-- 1) Weekly Active Users (WAU) for week starting 2026-02-01
SELECT COUNT(DISTINCT user_id) AS wau
FROM events
WHERE event_time >= '2026-02-01' AND event_time < '2026-02-08';

-- 2) Feature adoption for utility_a (users who clicked/completed at least once / active users)
WITH active AS (
  SELECT DISTINCT user_id
  FROM events
  WHERE event_time >= '2026-02-01' AND event_time < '2026-02-08'
),
used AS (
  SELECT DISTINCT user_id
  FROM events
  WHERE feature = 'utility_a'
    AND event_name IN ('quick_action_click','quick_action_complete')
    AND event_time >= '2026-02-01' AND event_time < '2026-02-08'
)
SELECT
  (SELECT COUNT(*) FROM used) * 1.0 / NULLIF((SELECT COUNT(*) FROM active),0) AS adoption_rate;

-- 3) Completion rate for utility_a
WITH clicks AS (
  SELECT COUNT(*) AS n FROM events
  WHERE feature='utility_a'
    AND event_name='quick_action_click'
    AND event_time >= '2026-02-01' AND event_time < '2026-02-08'
),
completes AS (
  SELECT COUNT(*) AS n FROM events
  WHERE feature='utility_a'
    AND event_name='quick_action_complete'
    AND event_time >= '2026-02-01' AND event_time < '2026-02-08'
)
SELECT (SELECT n FROM completes) * 1.0 / NULLIF((SELECT n FROM clicks),0) AS completion_rate;

-- 4) Error rate for utility_a
WITH clicks AS (
  SELECT COUNT(*) AS n FROM events
  WHERE feature='utility_a'
    AND event_name='quick_action_click'
    AND event_time >= '2026-02-01' AND event_time < '2026-02-08'
),
errors AS (
  SELECT COUNT(*) AS n FROM events
  WHERE feature='utility_a'
    AND event_name='quick_action_error'
    AND event_time >= '2026-02-01' AND event_time < '2026-02-08'
)
SELECT (SELECT n FROM errors) * 1.0 / NULLIF((SELECT n FROM clicks),0) AS error_rate;
