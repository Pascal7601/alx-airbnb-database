--Write SQL CREATE INDEX commands to create appropriate indexes for those columns 

CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);