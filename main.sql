-- Week 5 - Wednesday
-- Questions

-- 1. List all customers who live in Texas (use JOINs)
-- Jennifer Davis
-- Kim Cruz
-- Richard Mccrary
-- Bryan Hardison
-- Ian Still
SELECT first_name, last_name, customer.address_id, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
--There are 32 payments above $6.99
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)
--Mary Smith and Peter Menard have made payments over $175
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

-- 4. List all customers that live in Nepal (use the city table)
--Kevin Schuler lives in Nepal
SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

-- 5. Which staff member had the most transactions?
SELECT COUNT(rental_id), staff_id
FROM payment
GROUP BY staff_id
ORDER BY COUNT(payment_id) DESC;

SELECT staff_id, first_name, last_name
FROM staff
WHERE staff_id = 2;

-- 6. How many movies of each rating are there?
--PG-12 = 224
--NC-17 = 209
--R = 196
--PG = 194
--G = 178
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name, customer.customer_id
FROM customer
WHERE customer_id IN (
    SELECT amount
    FROM payment
    INNER JOIN customer
    ON payment.customer_id = customer.customer_id
    WHERE amount > 6.99
);

-- 8. How many free rentals did our stores give away?
--There were 0 free rentals given away. Did 'WHERE amount = 0' but it resulted in no data.
SELECT amount
FROM payment
ORDER BY amount DESC;

