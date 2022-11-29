use sakila;
select store_id, city, country from store 
join address using(address_id)
join city using(city_id)
join country using(country_id); -- Q1

select st.store_id, sum(amount) from payment p
join staff s using(staff_id)
join store st using(store_id)
group by st.store_id; -- Q2


select c.category_id, title, avg(length) from film f
join film_category fc using(film_id)
join category c using(category_id)
group by c.category_id; -- Q3

select c.category_id, title, avg(length) from film f
join film_category fc using(film_id)
join category c using(category_id)
group by c.category_id
order by avg(length) desc limit 1; -- Q4

select title, count(film_id) from film f
join inventory using(film_id)
join rental using(inventory_id)
group by film_id
order by count(film_id) desc; -- Q5

select name, sum(amount) from payment p
join rental using (rental_id)
join inventory using(inventory_id)
join film_category using (film_id)
join category c using(category_id)
group by c.category_id
order by sum(amount) desc limit 5; -- Q6

select title, inventory_id, rental_id, rental_date, return_date from rental
join inventory using(inventory_id)
join film using(film_id)
where title = "Academy Dinosaur" and store_id =1; 
-- Q7 see 1 return_date null with inventory_id 1 and rental_id 16050 (the record was created in one of the labs), which means "Academy Dinosaur" is available for rent from store 1




