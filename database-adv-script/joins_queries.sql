-- retrieve all bookings and the respective users who made those bookings.
SELECT * FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

-- retrieve all properties and their reviews, including properties that have no reviews.
SELECT * FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;

-- retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT * FROM users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;