-- 1
select a.actor_id,concat(a.first_name,' ',a.last_name) as full_name,fa.film_id
from actor as a join film_actor as fa 
on a.actor_id = fa.actor_id;

-- 2
select f.film_id, f.title, fa.actor_id
from film as f join film_actor as fa 
on f.film_id = fa.film_id;

-- 3
select a.actor_id,concat(a.first_name,' ',a.last_name) as actor_name,f.title as movie
from actor as a join film_actor as fa 
on a.actor_id = fa.actor_id
join film as f on fa.film_id = f.film_id; 

-- 4
select a.actor_id,concat(a.first_name,' ',a.last_name) as actor_name,f.film_id
from actor as a join film_actor as fa 
on a.actor_id = fa.actor_id
join film as f on fa.film_id = f.film_id
where f.length > 120 order by a.actor_id; 

-- 5
select a.actor_id,concat(a.first_name,' ',a.last_name) as actor_name,
count(fa.film_id) as total_movies
from actor as a join film_actor as fa 
on a.actor_id = fa.actor_id
group by a.actor_id, actor_name;

-- 6 - completed questions-
select f.title,count(fa.actor_id) as total_actors
from film as f join film_actor as fa
on f.film_id=fa.film_id
group by f.title;