-- SAMPLE DATA: USERS
INSERT INTO users (id, first_name, last_name, email, password, created_at)
VALUES
  (gen_random_uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pwd_1', NOW()),
  (gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pwd_2', NOW()),
  (gen_random_uuid(), 'Charlie', 'Davis', 'charlie@example.com', 'hashed_pwd_3', NOW());

-- SAMPLE DATA: PROPERTIES
-- Assume Alice and Bob are hosts
INSERT INTO properties (id, host_id, name, description, address, city, country, price_per_night, status, created_at, updated_at)
VALUES
  (gen_random_uuid(), (SELECT id FROM users WHERE email = 'alice@example.com'),
   'Cozy Downtown Apartment', 'A nice 2-bedroom apartment in the city center.',
   '123 Main St', 'New York', 'USA', 120.00, 'available', NOW(), NOW()),
  (gen_random_uuid(), (SELECT id FROM users WHERE email = 'bob@example.com'),
   'Beach House Retreat', 'Enjoy ocean views and private beach access.',
   '456 Ocean Ave', 'Miami', 'USA', 250.00, 'available', NOW(), NOW());

-- SAMPLE DATA: BOOKINGS
-- Charlie books the beach house from Bob
INSERT INTO bookings (id, property_id, user_id, start_date, end_date, status, created_at)
VALUES
  (gen_random_uuid(),
   (SELECT id FROM properties WHERE name = 'Beach House Retreat'),
   (SELECT id FROM users WHERE email = 'charlie@example.com'),
   '2025-09-10', '2025-09-15', 'confirmed', NOW()),
  (gen_random_uuid(),
   (SELECT id FROM properties WHERE name = 'Cozy Downtown Apartment'),
   (SELECT id FROM users WHERE email = 'bob@example.com'),
   '2025-09-20', '2025-09-22', 'pending', NOW());

-- SAMPLE DATA: PAYMENTS
INSERT INTO payments (id, booking_id, amount, method, status, created_at)
VALUES
  (gen_random_uuid(),
   (SELECT id FROM bookings WHERE status = 'confirmed' LIMIT 1),
   1250.00, 'credit_card', 'completed', NOW());

-- SAMPLE DATA: REVIEWS
INSERT INTO reviews (id, property_id, user_id, rating, comment, created_at)
VALUES
  (gen_random_uuid(),
   (SELECT id FROM properties WHERE name = 'Beach House Retreat'),
   (SELECT id FROM users WHERE email = 'charlie@example.com'),
   5, 'Amazing stay, highly recommend!', NOW()),
  (gen_random_uuid(),
   (SELECT id FROM properties WHERE name = 'Cozy Downtown Apartment'),
   (SELECT id FROM users WHERE email = 'bob@example.com'),
   4, 'Clean and comfortable, good location.', NOW());

-- SAMPLE DATA: MESSAGES
INSERT INTO messages (id, sender_id, recipient_id, content, created_at)
VALUES
  (gen_random_uuid(),
   (SELECT id FROM users WHERE email = 'charlie@example.com'),
   (SELECT id FROM users WHERE email = 'bob@example.com'),
   'Hi Bob, is the beach house available next month?', NOW()),
  (gen_random_uuid(),
   (SELECT id FROM users WHERE email = 'bob@example.com'),
   (SELECT id FROM users WHERE email = 'charlie@example.com'),
   'Hi Charlie, yes, it is available. Let me know your dates.', NOW());
