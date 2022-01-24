/* Question 1 for lab 6 SQL */

SELECT country_table.name AS country, region_table.name AS region, resort_table.name AS resort
FROM country_table
INNER JOIN region_table
ON country_table.id = region_table.country
INNER JOIN resort_table
ON region_table.id = resort_table.region
ORDER BY country_table.name ASC, region_table.name ASC, resort_table.name ASC;

/* Question 2: working out the average vertical drop*/
SELECT country_table.name AS country, AVG(resort_table.vertical_drop) AS average_vertical_drop
FROM country_table
INNER JOIN region_table
ON country_table.id = region_table.country
INNER JOIN resort_table
ON region_table.id = resort_table.region
GROUP BY country_table.name
ORDER BY resort_table.vertical_drop DESC;

/* Question 3: calculating exchange rates into values*/
SELECT resort_table.name AS country, SUM(resort_table.vertical_drop / (resort_table.daily_price * country_table.exchange_rate)) AS value
FROM country_table
INNER JOIN region_table
ON country_table.id = region_table.country
INNER JOIN resort_table
ON region_table.id = resort_table.region
GROUP BY resort_table.name
ORDER BY value DESC;
