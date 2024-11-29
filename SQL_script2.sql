USE world;

#TASK 1 - Retrieving the total cities in USA 
SELECT COUNT(DISTINCT Name) AS city_count_USA
FROM city
WHERE CountryCode='USA';


/*TASK 2 - Retrieving Find out what the population and 
average life expectancy for people in Argentina (ARG).*/

SELECT Name, Population, AVG(LifeExpectancy) AS Average_LifeExpectancy
FROM country
WHERE Code='ARG';


/* TASK 3 - Using ORDER BY, LIMIT retrieving a country  
which has the highest life expectancy.*/
SELECT Name, LifeExpectancy
FROM country
ORDER BY LifeExpectancy DESC
LIMIT 1;

# TASK 4 Retreiving 25 cities around the world that start with the letter 'F' 
SELECT Name 
FROM city
WHERE Name LIKE 'F%'
LIMIT 25;

/* TASK 5 Creating a SQL statement to display columns Id, Name, Population 
from the city table and limit results to first 10 rows */
SELECT ID, Name , Population
FROM city
LIMIT 10;

/* TASK 6 Creating a SQL statement to find only those cities
 from city table whose population is larger than 2000000. */
SELECT *
FROM city
WHERE population > 2000000 ;

/* TASK Creating a SQL statement to find all city names
 from city table whose name begins with “Be” prefix */
SELECT Name 
FROM city	
WHERE Name LIKE 'Be%' ;

/* TASK 8 Creating a SQL statement to find only those cities 
from city table whose population is between 500000-1000000. */
SELECT Name, Population
FROM city
WHERE Population BETWEEN 500000 AND 1000000;

#TASK 9 Creating a SQL statement to find a city with the lowest population 
SELECT *
FROM city
ORDER BY Population ASC
LIMIT 1;

# BONUS

# TASK 1- Creating a SQL statement to find the capital of Spain (ESP).
SELECT city.CountryCode, country.name AS Country, city.name AS City
FROM country
JOIN city
ON city.ID = country.capital
WHERE country.name = 'Spain';

# TASK 2 Creatign a SQL statement to list all the languages spoken in the Caribbean region.
SELECT distinct country.Region, countrylanguage.language
FROM countrylanguage
INNER JOIN country ON countrylanguage.CountryCode = country.Code
WHERE country.Region = 'Caribbean' ;

# TASK 3 Creating a SQL statement to find all cities from the Europe continent.
SELECT  country.Continent AS country_continent, 
country.Name AS country_name, city.name AS city_name
FROM city
INNER JOIN country ON city.CountryCode = country.Code
WHERE country.Continent = 'Europe' ;


# Tasks from word document .

#TASK 1 - Retrieving the total cities in USA 
SELECT COUNT(DISTINCT Name) AS city_count_USA
FROM city
WHERE CountryCode='USA';

/* TASK 2 - Using ORDER BY, LIMIT retrieving a country  
which has the highest life expectancy.*/
SELECT Name, LifeExpectancy
FROM country
ORDER BY LifeExpectancy DESC
LIMIT 1;

# TASK 3- Rerieving citites with starts with work New
SELECT Name
FROM city
WHERE Name LIKE '%New%';

#TASK 4- Retrieving the top 10 the most populous cities in the world.
SELECT Name, Population
FROM city
ORDER BY Population DESC
LIMIT 10;

#TASK 5- Retrieving cities with population > 2 million. 
SELECT Name, Population 
FROM city
WHERE population > 2000000 ;

# TASK 6- Rerieving citites with starts with word Be
SELECT Name
FROM city
WHERE Name LIKE 'Be%';

/*TASK 6- Rerieving citites with population between
500000 and 1000000.*/

SELECT Name, Population
FROM city
WHERE Population BETWEEN 500000 AND 1000000;

# TASK 8- Retrieving cities in Ascending order
SELECT Name
FROM city
ORDER BY Name ASC;

#TASK 9- Retrieving the most populated cites in the world.
SELECT Name, Population
FROM city
ORDER BY Population DESC
LIMIT 10;

/* TASK 10- Retrieving unique name of the cities 
with number of occurance in the database*/
SELECT Name, COUNT(*) AS no_of_occurance
FROM City
GROUP BY Name
ORDER BY Name ASC;

#TASK 11- Retrieving city with low population.
SELECT Name, Population
FROM city
ORDER BY Population ASC
LIMIT 1;

#TASK 12- Retrieving the most populated country.
SELECT Name, Population
FROM country
ORDER BY Population DESC
LIMIT 1;

# TASK 13- Retrieving the capital city of Spain
SELECT city.CountryCode, country.name AS Country, city.name AS City
FROM country
JOIN city
ON city.ID = country.capital
WHERE country.name = 'Spain';



#TASK 14- Retrieving country with high life of expectancy.
SELECT Name, LifeExpectancy
FROM country
ORDER BY LifeExpectancy DESC
LIMIT 1;


# TASK 15- Retrieving all cities from Europe
SELECT  country.Continent AS country_continent, country.Name AS country_name, city.name AS city_name
FROM city
INNER JOIN country ON city.CountryCode = country.Code
WHERE country.Continent = 'Europe' ;

#TASK 16- Retrieving average population of country
SELECT Name ,  ROUND(AVG(Population), 0)  AS Average_Population
FROM country
GROUP BY Name
ORDER BY Average_Population DESC;

#TASK 17- Retrieving data from city and country to analysis population of capital cities
SELECT city.CountryCode, country.name AS Country, city.name AS Capital_City, city. Population
FROM country
JOIN city
ON city.ID = country.capital
ORDER BY city.Population DESC;


#TASK 18- Retrieving countries with low population density 
SELECT Name, Population, SurfaceArea, 
       (Population / SurfaceArea) AS Population_Density
FROM country
WHERE Population >0 
ORDER BY population_density ASC
LIMIT 10;

#TASK 19- Retrieving cities with High GNP per Capita
SELECT 
    city.Name AS city_name,
    city.Population AS city_population,
    (country.GNP / country.Population) AS Country_GNP_per_Capita,
    (country.GNP / country.Population) *(city.Population) AS City_GNP
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE  (country.GNP / city.Population) * (city.Population)> (country.GNP / country.Population)
ORDER BY City_GNP DESC;

# TASK 20- Retrieving cities ranked between 31st and 40th by population
SELECT Name, Population
FROM city
ORDER BY population DESC
LIMIT 10 OFFSET 30;

SELECT city.Name
FROM city
JOIN country
ON city.CountryCode = country.Code
WHERE country.GNP / country.Population > (
    SELECT AVG(country.GNP / country.Population)
    FROM country
);
 


