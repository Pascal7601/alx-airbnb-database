-- Write an initial query that retrieves all bookings along with the user details, property details, and payment details
SELECT b.*, u.*, p.*, pay.*
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;