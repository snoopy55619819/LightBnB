SELECT  properties.*, reservations.*, AVG(property_reviews.rating) AS average_rating
FROM properties
JOIN reservations ON properties.id = property_id
JOIN property_reviews ON reservations.property_id = property_reviews.property_id
WHERE reservations.guest_id = 1
AND now()::date > end_date
GROUP BY properties.id,reservations.id
ORDER BY start_date
LIMIT 10;