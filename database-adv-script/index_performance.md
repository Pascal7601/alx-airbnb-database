### High-Usage Columns

Based on query patterns, the following columns were identified:

#### Users
  - email - used in login queries.
  - username - often searched.

#### Bookings
  - user_id - used in JOIN with users.
  - property_id - used in JOIN with properties.
  - booking_date - used in filtering and ordering.

#### Properties
  - location - used in searches.
  - price - used in filtering ranges.