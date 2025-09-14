# Partitioning Performance Report
## 1. Objective
The goal was to optimize queries on the large **bookings** table by implementing **table partitioning** based on the `start_date` column.


## 2. Implementation
The `bookings` table was re-created with **RANGE partitioning** on `YEAR(start_date)`:

```sql
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);
