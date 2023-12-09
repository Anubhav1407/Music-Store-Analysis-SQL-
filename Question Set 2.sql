-- Question Set 2 

-- Q1. Return the email, first name, last name & genre of all rock music listeners
-- and to return the list ordered alphabetically

SELECT DISTINCT email, first_name, last_name 
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoiceline ON invoice.invoice_id = invoiceline.invoice_id
WHERE track_id IN(
    SELECT track_id FROM track
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;

-- Q2. Return the artist name with the most rock music in our dataset 
-- and total track count of the top 10 rock bands

SELECT artist.artist_id, artist.name, COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.artist_id = track.artist_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
where genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;


SELECT artist.artist_id, artist.name, COUNT(track.track_id) AS number_of_songs
FROM artist
JOIN album ON album.artist_id = artist.artist_id
JOIN track ON track.album_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
where genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;

--Q3. Return all the track names that have a song length longer than the average song length
-- Return the name and milliseconds for each track
-- Order by the song length with the longest songs listed first

SELECT name, milliseconds
FROM track
WHERE milliseconds > (
    SELECT AVG(milliseconds) AS avg_track_length
	FROM track
)
ORDER BY milliseconds DESC