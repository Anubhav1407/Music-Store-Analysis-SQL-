-- Question Set 1

-- Q1. Senior most employee based on job title

SELECT * FROM employee
ORDER BY levels DESC
LIMIT 1

-- Q2. Countries having the most invoices

SELECT COUNT(*) AS No_of_Invoices, billing_country
FROM invoice
GROUP BY billing country
ORDER BY No_of_Invoices DESC

--Q3. Top three values of total invoice

SELECT * FROM invoice
ORDER BY total DESC
LIMIT 3

--Q4. City having the best customers
-- and also write a query that returns one city that has the highest sum of invoice total

SELECT SUM(total) as invoice_total, billing_city
FROM invoice
GROUP BY billing_city
ORDER BY invoice_total DESC
LIMIT 1

-- Q5. Best customer who has spent the most money

SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as total
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC
LIMIT 1


