-- 1. unn movies chahiye where the reantal rate is same for the movie of african egg
select rental_rate from film where title='AFRICAN EGG';
select title, rental_rate from film where rental_rate=(select rental_rate from film where title='AFRICAN EGG');

-- 2. get the movie id and name where the reantal rate = min rental rate
select film_id, title ,rental_rate
 from film where rental_rate=(select  min(rental_rate) from film);


-- 3. get movie id ,name, duration where the duration>avg duration of the movies
select film_id, title, rental_duration from film;
select avg(rental_duration) from film;
select film_id, title, rental_duration from film
where rental_duration>(select avg(rental_duration) from film);


-- 4. get the movie id for the movies where the release year of the movie should be= the realsing yr of the movie aline trip
-- and the rating should be same as of the movie apollo teen
select film_id, title, release_year from film;
select  release_year from film where title='ALONE TRIP';
select rental_rate from film where title='apollo teen';
select film_id, title, release_year from film where release_year=(select  release_year from film where title='ALONE TRIP')
and rental_rate=(select rental_rate from film where title='apollo teen');