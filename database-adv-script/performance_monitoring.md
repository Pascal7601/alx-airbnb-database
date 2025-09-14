# Database Performance Monitoring Report

## 1. Objective
The goal is to **continuously monitor and refine database performance** by analyzing query execution plans, identifying bottlenecks, and applying schema/index adjustments to improve efficiency.


## 2. Queries Monitored
We selected frequently used queries in the Airbnb database:

### Query – Fetch bookings with user and property details
```sql
EXPLAIN ANALYZE
SELECT b.id, b.booking_date, u.username, p.name
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.booking_date >= CURDATE() - INTERVAL 6 MONTH
ORDER BY b.booking_date DESC;
