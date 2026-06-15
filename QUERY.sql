--Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.

SELECT * FROM matches

WHERE tournament_category='Champions League' AND match_status='Available';

--Query 2: Search for all users whose full names start with 'Tanvir' or contain the phrase 'Haque' (case-insensitive).

SELECT
    user_id,
    full_name,
    email
FROM users
WHERE full_name LIKE 'Tanvir%'
   OR full_name LIKE '%Haque%';


--Query 3: Retrieve all booking records where the payment status is missing (NULL), replacing the empty result with 'Action Required'.
SELECT
    booking_id,
    user_id,
    match_id,
    COALESCE(payment_status, 'Action Required') 
FROM bookings
WHERE payment_status IS NULL;

--Query 4: Retrieve match booking details along with the User's full name and the scheduled Match fixture teams
SELECT
    b.booking_id,
    u.full_name,
    m.fixture,
    b.total_cost
FROM bookings b
INNER JOIN users u
    ON b.user_id = u.user_id
INNER JOIN matches m
    ON b.match_id = m.match_id;

--