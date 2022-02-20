create database TravelOnTheGo;
USE TravelOnTheGo;

CREATE TABLE IF NOT EXISTS PASSENGER
(
Passenger_name varchar(50),
Category varchar (50),
Gender varchar(5),
Boarding_City varchar (50),
Destination_City varchar (50),
Distance int,
Bus_Type varchar (50)
);

CREATE TABLE IF NOT EXISTS PRICE
(
Bus_Type varchar (50),
Distance int,
Price int
);

-- INSERTING RECORDS IN PASSENGER
INSERT INTO PASSENGER values ('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');

INSERT INTO PASSENGER values ('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');

INSERT INTO PASSENGER values('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper');

INSERT INTO PASSENGER values ('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');

INSERT INTO PASSENGER values ('Udit','Non-AC','M','Trivandrum','panaji',1000,'Sleeper');

INSERT INTO PASSENGER values ('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');

INSERT INTO PASSENGER values ('Hemant','Non-AC','M','panaji','Mumbai',700,'Sleeper');

INSERT INTO PASSENGER values ('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');

INSERT INTO PASSENGER values ('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

-- INSERTING RECORDS IN PRICE

INSERT INTO PRICE values ('Sleeper',350,770);
INSERT INTO PRICE values ('Sleeper',500,1100);
INSERT INTO PRICE values ('Sleeper',600,1320);
INSERT INTO PRICE values ('Sleeper',700,1540);
INSERT INTO PRICE values ('Sleeper',1000,2200);
INSERT INTO PRICE values ('Sleeper',1200,2640);
INSERT INTO PRICE values ('Sleeper',1500,2700);

INSERT INTO PRICE values ('Sitting',500,620);
INSERT INTO PRICE values ('Sitting',600,744);
INSERT INTO PRICE values ('Sitting',700,868);
INSERT INTO PRICE values ('Sitting',1000,1240);
INSERT INTO PRICE values ('Sitting',1200,1488);
INSERT INTO PRICE values ('Sitting',1500,1860);

-- SELECT * FROM PRICE;
-- SELECT * FROM PASSENGER;

-- 3. How many females and how many male passengers travelled for a minimum distance of
-- 600 KM s?

SELECT Gender, count(Gender)
FROM PASSENGER
WHERE Distance >= 600
GROUP BY (GENDER);

-- 4. Find the minimum ticket price for Sleeper Bus.

SELECT MIN(price) FROM price where price.bus_type like '%sleeper' ;

-- 5. Select passenger names whose names start with character 'S'
SELECT Passenger_name
FROM PASSENGER
WHERE Passenger_name like 'S%';

-- 6. Calculate price charged for each passenger displaying Passenger name, Boarding City,
-- Destination City, Bus_Type, Price in the output

SELECT pass.Passenger_name, pass.Boarding_City, pass.Destination_City, pr.Bus_Type, pr.Price
FROM PASSENGER AS pass, PRICE AS pr
WHERE pass.Distance = pr.Distance AND pass.Bus_Type = pr.Bus_Type;

-- 7.What are the passenger name/s and his/her ticket price who travelled in the Sitting bus
-- for a distance of 1000 KM s

SELECT pass.Passenger_name, pr.Price
FROM PASSENGER AS pass, PRICE AS pr
WHERE pass.Bus_Type = 'Sitting' and pass.Distance=1000;

-- 8. What will be the Sitting and Sleeper bus charge for Pallavi 
-- to travel from Bangalore to Panaji?

SELECT Bus_Type, Price
FROM PRICE 
WHERE Distance =
(
SELECT Distance FROM PASSENGER
WHERE Passenger_name = 'Pallavi' AND 
(Boarding_City = 'Bengaluru' OR Boarding_City = 'Panaji') AND
(Destination_City = 'Bengaluru' OR Destination_City = 'Panaji')
);

-- 9. List the distances from the "Passenger" table which are unique 
-- (non-repeated distances) in descending order.

SELECT distinct(Distance)
FROM PASSENGER
ORDER BY Distance desc;

-- 10. Display the passenger name and percentage of distance travelled by that passenger
-- from the total distance travelled by all passengers without using user variables

SELECT Passenger_name, Distance*100/
(SELECT sum(Distance) FROM PASSENGER) as distance_percentage
FROM PASSENGER;

-- 11. Display the distance, price in three categories in table Price
-- a) Expensive if the cost is more than 1000
-- b) Average Cost if the cost is less than 1000 and greater than 500
-- c) Cheap otherwise

SELECT Distance, Price,
CASE
WHEN Price > 1000 THEN 'Expensive'
WHEN Price > 500 THEN 'Average Cost'
ELSE 'Cheap'
END AS PriceCategory
FROM PRICE;
