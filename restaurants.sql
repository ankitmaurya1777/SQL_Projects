USE swiggy;


-- 1. Select all columns from the restaurant table.


SELECT*FROM restaurants;


-- 2. Display the names and cities of all restaurants. 

SELECT name , city FROM restaurants;

-- 3. Find all restaurants located in Bangalore.
 
SELECT * FROM restaurants
WHERE city LIKE "%bangalore%";

-- 4. List the names and ratings of restaurants with a rating greater than 4.0.

SELECT name , rating FROM restaurants
WHERE rating>4;


-- 5. Find restaurants where the cost is less than or equal to 300. 

SELECT * FROM restaurants
WHERE cost<= 300;

-- 6. Find all restaurants serving Biryani cuisine. 

SELECT name , cuisine 
FROM restaurants
WHERE cuisine LIKE "%Biryani%"; 


-- 7. Display all distinct cuisine types available in the dataset.


SELECT DISTINCT cuisine
FROM restaurants;

-- 8. Show the top 5 restaurants with the highest ratings.

SELECT * FROM restaurants
ORDER BY rating DESC
LIMIT 5;


-- 9. List restaurants with a rating count greater than 1000.

SELECT name,rating_count 
FROM restaurants
WHERE rating_count > 1000; 

-- 10. Count the total number of restaurants in the dataset.

SELECT 
     COUNT(*) AS restaurants_count
     FROM restaurants;

-- 11. Find the average cost of all restaurants.


SELECT 
     AVG(cost) AS avg_cost
     FROM restaurants;
     
-- 12. Display restaurant names and costs ordered by cost in ascending order.   
  
SELECT name, cost 
FROM restaurants
ORDER BY cost ASC;  
  
-- 13. Find the average rating of restaurants for each city.

SELECT DISTINCT city, AVG(rating) AS avg_rating
FROM restaurants 
GROUP BY city
ORDER BY avg_rating ASC;

-- 14. Count the number of restaurants available in each city.

SELECT city, COUNT(*) AS restaurants_count
FROM restaurants
GROUP BY city 
ORDER BY restaurants_count DESC;

-- 15. Find the maximum and minimum cost of restaurants for each cuisine.

SELECT   cuisine,
MIN(cost) AS min_cost,
MAX(cost) AS max_cost
FROM restaurants 
GROUP BY cuisine;
	

-- 16. List cuisines that have more than 10 restaurants.

SELECT cuisine,
COUNT(*) AS no_of_restaurants 
FROM restaurants 
GROUP BY cuisine
HAVING no_of_restaurants>10;

-- 17. Find the top 3 cities with the highest number of restaurants.

SELECT city , COUNT(*) AS no_of_restaurants
FROM restaurants
GROUP BY city
ORDER BY no_of_restaurants DESC
LIMIT 3;

-- 18. Display the average cost of restaurants for each cuisine.

SELECT  cuisine 
, AVG(cost) as avg_cost 
FROM restaurants 
GROUP BY cuisine
ORDER BY avg_cost DESC;

-- 19. Find cities where the average restaurant rating is greater than 4.0.

SELECT city, AVG(rating) AS  avg_rating
FROM restaurants 
GROUP BY city 
HAVING avg_rating > 4.0
ORDER BY avg_rating DESC;

-- 20. List restaurants whose cost is higher than the average cost of all restaurants.

SELECT name , cost
FROM restaurants
WHERE cost > (SELECT AVG(cost) FROM restaurants);

-- 21. Find the total number of ratings (rating_count) for each city.

SELECT city , SUM(rating_count) AS total_rating
FROM restaurants 
GROUP BY city 
ORDER BY total_rating DESC;

-- 22. Display cuisines ordered by their average rating in descending order.

SELECT cuisine , AVG(rating) AS avg_rating
FROM restaurants
GROUP BY cuisine
ORDER BY avg_rating DESC;

-- 23. Find restaurants that have the highest rating within their city. (sub-query)

SELECT name , rating
FROM restaurants 
WHERE rating = (SELECT MAX(rating) 
                 FROM restaurants);


-- 24. List cities that have more than one cuisine type available.

SELECT city,COUNT(DISTINCT cuisine) AS total_cuisine 
FROM restaurants
GROUP BY city 
HAVING COUNT(DISTINCT cuisine)>1
ORDER BY total_cuisine DESC;

-- 25. Find the restaurant(s) with the maximum rating_count in the dataset.


SELECT name , MAX(rating_count) AS max_rating_count
FROM restaurants
GROUP BY name
ORDER BY max_rating_count DESC;

-- 26. HOW MANY CITIES ARE DATASETS?


SELECT COUNT(DISTINCT city) AS unique_cities FROM restaurants;




-- -------------------------------------------
-- -------------------------------------------


-- SOME EXTRA QUESTIONS


-- rating > 4 , rating_count > 3000

SELECT name , rating, rating_count FROM restaurants
WHERE rating > 4 AND rating_count >3000;

SELECT * FROM restaurants
WHERE city = "Mumbai" OR rating = 5;

SELECT * FROM restaurants 
WHERE rating_count BETWEEN 3000 AND 10000;

-- either in mumbai,  banglore, delhi,goa

SELECT*FROM restaurants
WHERE city IN ("Mumbai","Bangalore","Delhi","Goa");









		
    
    




 


