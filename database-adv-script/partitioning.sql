-- Assume the Booking table is large and query performance is slow. Implement partitioning on the Booking table based on the start_date column
DROP TABLE IF EXISTS bookings;

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);
