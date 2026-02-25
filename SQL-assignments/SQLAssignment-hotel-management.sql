
CREATE TABLE hotel
( hotel_no CHAR(4) NOT NULL,
name VARCHAR(20) NOT NULL,
address VARCHAR(50) NOT NULL)

CREATE TABLE room
( room_no VARCHAR(4) NOT NULL,
hotel_no CHAR(4) NOT NULL,
type CHAR(1) NOT NULL,
price DECIMAL(5,2) NOT NULL)

CREATE TABLE booking
(hotel_no CHAR(4) NOT NULL,
guest_no CHAR(4) NOT NULL,
date_from DATETIME NOT NULL,
date_to DATETIME NULL,
room_no CHAR(4) NOT NULL)

CREATE TABLE guest
( guest_no CHAR(4) NOT NULL,
name VARCHAR(20) NOT NULL,
address VARCHAR(50) NOT NULL)

INSERT INTO hotel
VALUES ('H111', 'Grosvenor Hotel', 'London')

INSERT INTO room
VALUES ('1', 'H111', 'S', 72.00)

INSERT INTO guest
VALUES ('G111', 'John Smith', 'London')

INSERT INTO booking (hotel_no, guest_no, date_from, date_to, room_no)
VALUES ('H111', 'G111', '1999-01-01', '1999-01-02', 'R001')

UPDATE room SET price = price*1.05

--Create a separate table with the same structure as the Booking table to hold archive records.
CREATE TABLE booking_archive
(
    hotel_no CHAR(4) NOT NULL,
    guest_no CHAR(4) NOT NULL,
    date_from DATETIME NOT NULL,
    date_to DATETIME NULL,
    room_no CHAR(4) NOT NULL
)
INSERT INTO booking_archive (hotel_no, guest_no, date_from, date_to, room_no)
SELECT 
    hotel_no,
    guest_no,
    date_from,
    date_to,
    room_no
FROM booking
WHERE date_from < '2000-01-01'

select * from booking_archive

--Using the INSERT statement, copy the records from the Booking table to the archive table relating to bookings before 1st January 2000. Delete all bookings
--before 1st January 2000 from the Booking
-- table.
DELETE FROM booking
WHERE date_from < '2000-01-01'


-- Step 1: Copy
INSERT INTO booking_archive
SELECT * FROM booking
WHERE date_from < '2000-01-01'

-- Step 2: Delete
DELETE FROM booking
WHERE date_from < '2000-01-01'


--1. List full details of all hotels.
SELECT * FROM hotel

--2. List full details of all hotels in London.
SELECT * 
FROM hotel
WHERE city = 'London'

--3. List the names and addresses of all guests in
--London, alphabetically ordered by name.

SELECT guest_name, guest_address
FROM guest
WHERE city = 'London'
ORDER BY guest_name

--4. List all double or family rooms with a price
--below £40.00 per night, in ascending order of
--price.
SELECT *
FROM room
WHERE type IN ('Double', 'Family')
  AND price < 40
ORDER BY price
--5. List the bookings for which no date_to has
--been specified.

SELECT *
FROM booking
WHERE date_to IS NULL

--Aggregate Functions

--1. How many hotels are there?
SELECT COUNT(*) AS total_hotels
FROM hotel
--2. What is the average price of a room?

SELECT AVG(price) AS avg_price
FROM room

--3. What is the total revenue per night from
--all double rooms?
SELECT SUM(price) AS total_revenue
FROM room
WHERE type = 'Double'

--4. How many different guests have made
--bookings for August?

SELECT COUNT(DISTINCT guest_no) AS total_guests
FROM booking
WHERE MONTH(date_from) = 8

--Subqueries and Joins

--1. List the price and type of all rooms at the Grosvenor Hotel.
SELECT r.price, r.type
FROM room r
JOIN hotel h
    ON r.hotel_no = h.hotel_no
WHERE h.hotel_name = 'Grosvenor Hotel'

--2. List all guests currently staying at the Grosvenor Hotel.
SELECT g.guest_name
FROM booking b
JOIN guest g ON b.guest_no = g.guest_no
JOIN hotel h ON b.hotel_no = h.hotel_no
WHERE h.hotel_name = 'Grosvenor Hotel'
  AND b.date_to IS NULL

--3. List the details of all rooms at the Grosvenor Hotel,
--including the name of the guest staying in the room, if
--the room is occupied.
SELECT 
    r.room_no,
    r.type,
    g.guest_name
FROM room r
JOIN hotel h ON r.hotel_no = h.hotel_no
LEFT JOIN booking b 
    ON r.room_no = b.room_no 
    AND r.hotel_no = b.hotel_no
    AND b.date_to IS NULL
LEFT JOIN guest g 
    ON b.guest_no = g.guest_no
WHERE h.hotel_name = 'Grosvenor Hotel'

--4. What is the total income from bookings for the
--Grosvenor Hotel today?
SELECT SUM(r.price) AS total_income
FROM booking b
JOIN room r 
    ON b.room_no = r.room_no AND b.hotel_no = r.hotel_no
JOIN hotel h 
    ON b.hotel_no = h.hotel_no
WHERE h.hotel_name = 'Grosvenor Hotel'
  AND CAST(GETDATE() AS DATE) BETWEEN b.date_from AND ISNULL(b.date_to, GETDATE())


--5. List the rooms that are currently unoccupied at the
--Grosvenor Hotel.
SELECT r.room_no
FROM room r
JOIN hotel h ON r.hotel_no = h.hotel_no
LEFT JOIN booking b 
    ON r.room_no = b.room_no 
    AND r.hotel_no = b.hotel_no
    AND b.date_to IS NULL
WHERE h.hotel_name = 'Grosvenor Hotel'
  AND b.room_no IS NULL

--6. What is the lost income from unoccupied rooms at the
--Grosvenor Hotel?
SELECT SUM(r.price) AS lost_income
FROM room r
JOIN hotel h ON r.hotel_no = h.hotel_no
LEFT JOIN booking b 
    ON r.room_no = b.room_no 
    AND r.hotel_no = b.hotel_no
    AND b.date_to IS NULL
WHERE h.hotel_name = 'Grosvenor Hotel'
  AND b.room_no IS NULL

--Grouping

--1. List the number of rooms in each hotel.
SELECT hotel_no, COUNT(*) AS total_rooms
FROM room
GROUP BY hotel_no

--2. List the number of rooms in each hotel in
--London.
SELECT h.hotel_name, COUNT(r.room_no) AS total_rooms
FROM hotel h
JOIN room r ON h.hotel_no = r.hotel_no
WHERE h.city = 'London'
GROUP BY h.hotel_name

--3. What is the average number of bookings
--for each hotel in August?
SELECT hotel_no, COUNT(*) * 1.0 / COUNT(DISTINCT hotel_no) AS avg_bookings
FROM booking
WHERE MONTH(date_from) = 8
GROUP BY hotel_no
--4. What is the most commonly booked
--room type for each hotel in London?
SELECT h.hotel_name, r.type, COUNT(*) AS total
FROM booking b
JOIN room r ON b.room_no = r.room_no AND b.hotel_no = r.hotel_no
JOIN hotel h ON b.hotel_no = h.hotel_no
WHERE h.city = 'London'
GROUP BY h.hotel_name, r.type
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM booking b2
        JOIN room r2 
            ON b2.room_no = r2.room_no AND b2.hotel_no = r2.hotel_no
        WHERE b2.hotel_no = b.hotel_no
        GROUP BY r2.type
    ) t
)
--5. What is the lost income from unoccupied
--rooms at each hotel today?
SELECT h.hotel_name, SUM(r.price) AS lost_income
FROM hotel h
JOIN room r ON h.hotel_no = r.hotel_no
LEFT JOIN booking b 
    ON r.room_no = b.room_no 
    AND r.hotel_no = b.hotel_no
    AND CAST(GETDATE() AS DATE) BETWEEN b.date_from AND ISNULL(b.date_to, GETDATE())
WHERE b.room_no IS NULL
GROUP BY h.hotel_name