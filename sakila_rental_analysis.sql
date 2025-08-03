USE sakila;

-- 📌 Query 1: All Rentals with Film Titles by Customers
-- 🔄 Tables Used: customer, rental, inventory, film
SELECT c.first_name, c.last_name, f.title
FROM customer c 
JOIN rental r ON r.customer_id = c.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON f.film_id = i.film_id;

-- 📌 Query 2: Rentals in July 2005
-- 🔄 Tables Used: customer, rental, inventory, film
SELECT c.first_name, f.title, r.rental_date 
FROM customer c 
JOIN rental r ON r.customer_id = c.customer_id
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
WHERE r.rental_date BETWEEN '2005-07-01' AND '2005-07-31';

-- 📌 Query 3: View All Categories
-- 🔄 Tables Used: category
SELECT * FROM category;

-- 📌 Query 4: Customers Who Rented "Horror" Films
-- 🔄 Tables Used: customer, rental, inventory, film, film_category, category
SELECT c.first_name, c.last_name, COUNT(*) AS horror_rented
FROM customer c
JOIN rental r ON r.customer_id = c.customer_id 
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category cat ON cat.category_id = fc.category_id
WHERE cat.name = 'Horror'
GROUP BY c.first_name, c.last_name;

-- 📌 Query 5: Customers Who Rented "Comedy" Films
-- 🔄 Tables Used: customer, rental, inventory, film, film_category, category
SELECT c.first_name, c.last_name, COUNT(*) AS rental_comedy
FROM customer c
JOIN rental r ON r.customer_id = c.customer_id
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category cat ON cat.category_id = fc.category_id
WHERE cat.name = 'Comedy'
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 📌 Query 6: Top 5 Customers Who Rented the Most "Action" Films
-- 🔄 Tables Used: customer, rental, inventory, film, film_category, category
SELECT c.first_name, c.last_name, COUNT(*) AS rented_action
FROM customer c
JOIN rental r ON r.customer_id = c.customer_id
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category cat ON fc.category_id = cat.category_id
WHERE cat.name = 'Action'
GROUP BY c.first_name, c.last_name, c.customer_id
ORDER BY rented_action DESC
LIMIT 5;
