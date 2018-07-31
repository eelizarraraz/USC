use sakila;
select first_name, last_name
from actor;

select concat(first_name," ",last_name) as 'Actor Name' from sakila.actor;

-- 2a
select actor_id, first_name, last_name from actor
where first_name = 'Joe';


-- 2b
select * from actor where last_name like "%GEN%";

-- 2c
select * from actor where last_name like "%li%" order by last_name, first_name;

-- 2d
select country_id, country from country
where country in ("Afghanistan", "Bangladesh", "China");

 -- 3a
ALTER TABLE sakila.actor
ADD COLUMN `description` BLOB NULL AFTER `last_update`;

 -- 3b
alter table sakila.actor
drop column description;

-- 4a
select last_name, count(*) from actor group by last_name;

-- 4b
select last_name, count(*) as cnt
from actor
group by last_name
having cnt > 1;

-- 4c
select * from actor where first_name = 'GROUCHO' and last_name = 'WILLIAMS';

update actor set first_name = 'HARPO' where actor_id = 172;

select * from actor where actor_id = 172;

-- 4d

-- 5a
-- CREATE TABLE IF NOT EXISTS 'ADDRESS'

-- 6a
select staff.first_name, staff.last_name, address.address
from staff
inner join address on
staff.staff_id=address.address_id;

select * from payment;

-- 6b
 select staff.first_name, staff.last_name, payment.amount, payment.payment_id
 from staff
 left join payment on
 staff.staff_id=payment.staff_id
 where payment_date >= Date(2005-08-01) 
 and payment_date <= Date(2005-08-31);
 
 -- 6c
 select film.title, count(film_actor.actor_id) as 'Actor Count'
 from film_actor
 join film on
 film_actor.film_id=film.film_id
 group by film_actor.film_id;
 
 
 -- 6d
 select count(*)
 from inventory
 where film_id in (select film_id from film where 
 title = 'Hunchback Impossible');
 
 -- 6e
 select customer.first_name, customer.last_name, payment.amount
 from customer
 join payment on
 customer.customer_id
 group by customer.customer_id
 order by customer.last_name;
 
 
 -- 7a
 select * from language;
 
 select title from film
 where title like "K%" or "Q%"
 and language_id IN  
 (select language_id
 from `language`
 where `name` = "English");
 
 
  
 -- 7b
 select actor.first_name, actor.last_name
 from actor
 where actor_id in (select actor_id from film_actor where 
 film_id in (select film_id from film where title = 'ALONE TRIP'));
 
 -- 7C
 select customer.first_name, customer.last_name, customer.email
 from customer join address
 on customer.address_id = address.address_id
 join city
 on address.city_id = city.city_id
 join country on city.country_id = country.country_id 
 where country.country = "Canada";
 
 -- 7d
select * from film_category;
select * from film;

select film.title
from film join film_category
on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
where category.`name`='family';

-- 7e
select film.title from film
join inventory on 
film.film_id = inventory.film_id
join rental
on inventory.inventory_id = rental.inventory_id
order by (rental.rental_date) desc;

-- 7f
select store.store_id, sum(payment.amount) from payment
join staff
on payment.staff_id = staff.staff_id
join store
on staff.store_id = store.store_id
group by store.store_id;

-- 7g
select store.store_id, city.city, country.country from store
join address
on store.address_id = address.address_id
join city
on address.city_id=city.city_id
join country
on city.country_id=country.country_id;

-- 7h
select category.`name`, sum(payment.amount) from category
join film_category
on category.category_id = film_category.category_id
join inventory
on film_category.film_id = inventory.film_id
join rental
on inventory.inventory_id = rental.inventory_id
join payment
on rental.rental_id = payment.rental_id
group by category.`name`
order by (sum(payment.amount)) desc
limit 5;

-- 8a
create view `top_five_genres` as
(select category.`name`, sum(payment.amount) from category
join film_category
on category.category_id = film_category.category_id
join inventory
on film_category.film_id = inventory.film_id
join rental
on inventory.inventory_id = rental.inventory_id
join payment
on rental.rental_id = payment.rental_id
group by category.`name`
order by (sum(payment.amount)) desc
limit 5);

-- 8b
select * from top_five_genres;

-- 8c
-- Drop View top_five_genres;
