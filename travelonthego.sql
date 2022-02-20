create database TravelOnTheGo;
USE TravelOnTheGo;
Create table PASSENGER
(Passenger_name varchar(50),
 Category varchar(50),
 Gender varchar(50),
 Boarding_City varchar(50),
 Destination_City varchar(50),
 Distance bigint,
 Bus_Type varchar(50)
);  
Create table PRICE
(
 Bus_Type varchar(50),
 Distance bigint,
 Price int
  );
  
insert into PASSENGER(Passenger_name , Category , Gender , Boarding_City, Destination_City , Distance , Bus_Type) values ( 'Sejal', 'AC', 'F' , 'Bengaluru' , 'Chennai' , 350 , 'Sleeper');
insert into PASSENGER(Passenger_name , Category , Gender , Boarding_City, Destination_City , Distance , Bus_Type) values ( 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting');
insert into PASSENGER(Passenger_name , Category , Gender , Boarding_City, Destination_City , Distance , Bus_Type) values ( 'Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper');
insert into PASSENGER(Passenger_name , Category , Gender , Boarding_City, Destination_City , Distance , Bus_Type) values ( 'Khusboo' ,'AC', 'F' ,'Chennai' ,'Mumbai' ,1500, 'Sleeper');
insert into PASSENGER(Passenger_name , Category , Gender , Boarding_City, Destination_City , Distance , Bus_Type) values ( 'Udit', 'Non-AC', 'M', 'Trivandrum', 'panaji', 1000, 'Sleeper');
insert into PASSENGER(Passenger_name , Category , Gender , Boarding_City, Destination_City , Distance , Bus_Type) values ( 'Ankur', 'AC', 'M', 'Nagpur','Hyderabad', 500, 'Sitting');
insert into PASSENGER(Passenger_name , Category , Gender , Boarding_City, Destination_City , Distance , Bus_Type) values ( 'Hemant', 'Non-AC', 'M', 'panaji', 'Mumbai', 700, 'Sleeper');
insert into PASSENGER(Passenger_name , Category , Gender , Boarding_City, Destination_City , Distance , Bus_Type) values ( 'Manish' ,'Non-AC' ,'M' ,'Hyderabad' ,'Bengaluru' ,'500' ,'Sitting');
insert into PASSENGER(Passenger_name , Category , Gender , Boarding_City, Destination_City , Distance , Bus_Type) values ('Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');
 
insert into PRICE(Bus_Type, Distance, Price) values ('Sleeper', 350 , 770);
insert into PRICE(Bus_Type, Distance, Price) values ('Sleeper', 500 , 1100);
insert into PRICE(Bus_Type, Distance, Price) values ('Sleeper', 600, 1320);
insert into PRICE(Bus_Type, Distance, Price) values ('Sleeper', 700 ,1540);
insert into PRICE(Bus_Type, Distance, Price) values ('Sleeper', 1000 ,2200);
insert into PRICE(Bus_Type, Distance, Price) values ('Sleeper', 1200 , 2640);
insert into PRICE(Bus_Type, Distance, Price) values ('Sleeper', 1500 , 2700);
insert into PRICE(Bus_Type, Distance, Price) values ('Sitting', 500, 620);
insert into PRICE(Bus_Type, Distance, Price) values ('Sitting', 600, 744);
insert into PRICE(Bus_Type, Distance, Price) values ('Sitting', 700, 868);
insert into PRICE(Bus_Type, Distance, Price) values ('Sitting', 1000, 1240);
insert into PRICE(Bus_Type, Distance, Price) values ('Sitting', 1200, 1488);
insert into PRICE(Bus_Type, Distance, Price) values ('Sitting', 1500, 1860);

----- 3) How many females and how many male passengers travelled for a minimum distance of600 KM s?
select gender from `passenger` where distance > 600;


----- 4) Find the minimum ticket price for Sleeper Bus.
SELECT MIN(price) FROM price where price.bus_type like '%sleeper' ;

----- 5) Select passenger names whose names start with character 'S'.
select passenger_name from passenger where passenger.passenger_name like 'S%' ;

----- 6) Calculate price charged for each passenger displaying 
----- Passenger name, Boarding City,Destination City, Bus_Type, Price in the output.
select Passenger_name, Boarding_City,Destination_City from passenger
 inner join  price on passenger.Bus_Type = price.Bus_Type and price.price;


----- 7) What are the passenger name/s and his/her ticket price who travelled in the Sitting bus
 ----- for a distance of 1000 KM s
 select passenger_name from passenger where passenger.passenger_name like 'S%' ;
 
 
8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to
Panaji?
9) List the distances from the "Passenger" table which are unique (non-repeated
distances) in descending order.
10) Display the passenger name and percentage of distance travelled by that passenger
from the total distance travelled by all passengers without using user variables
11) Display the distance, price in three categories in table Price
a) Expensive if the cost is more than 1000
b) Average Cost if the cost is less than 1000 and greater than 500
c) Cheap otherwise

