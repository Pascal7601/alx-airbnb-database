### Query Optimization Report

### 1. Objective
The goal is to **refactor a complex query** that retrieves bookings along with user, property, and payment details to improve execution time and resource usage.


### 2. Initial Query
The initial query joined `bookings`, `users`, `properties`, and `payments` tables:

```sql
SELECT 
    b.id, b.booking_date,
    u.id, u.username, u.email,
    p.id, p.name, p.location,
    pay.id, pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;
