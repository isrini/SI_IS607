-- Srini Illapani, MSDA - IS607, Week 2 Assignment, 9/3/2015

-- 1. How many airplanes have listed speeds? 
--    What is the minimum listed speed and the maximum listed speed?

SELECT COUNT(*) FROM planes WHERE speed is NOT NULL;
SELECT MIN(speed) FROM planes WHERE speed is NOT NULL;
SELECT MAX(speed) FROM planes WHERE speed is NOT NULL;

-- 2. What is the total distance flown by all of the planes in January 2013? 
--    What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?

SELECT SUM(distance) FROM flights WHERE year = 2013 AND month = 1;
SELECT SUM(distance) FROM flights WHERE year = 2013 AND month = 1 AND tailnum IS NULL;


-- 3. What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer?
--    Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN.
--    How do your results compare?

SELECT a.manufacturer, SUM(b.distance) as distance_travelled FROM planes a INNER JOIN flights b
ON a.tailnum = b.tailnum WHERE b.year = 2013 AND b.month = 7 AND b.day = 5 GROUP BY a.manufacturer;

SELECT a.manufacturer, SUM(b.distance) as distance_travelled FROM planes a LEFT JOIN flights b
ON a.tailnum = b.tailnum WHERE b.year = 2013 AND b.month = 7 AND b.day = 5 GROUP BY a.manufacturer;

-- The results from both the queries produce same results. All the unique tailnumbers in flights table have a corresponding tailnumber in the planes table.

-- 4. Write and answer at least one question of your own choosing that joins information from at least three of the tables in the flights database.
-- What are the destination airports with code and name that had zero arrival delays where the temperature was less than 20 degrees in the month of January?

SELECT a.dest, c.name, count(a.arr_delay) as on_time FROM flights a INNER JOIN weather b ON a.origin = b.origin
INNER JOIN airports c ON a.dest = c.faa 
WHERE a.arr_delay = 0 AND b.temp < 20 AND a.month = 1
GROUP BY a.dest




