-- select all the fields available in clients table
select * from clients; 

-- select first_name column from clients table
select first_name from clients; 

-- list only different (distinct) values in 'first_name' column from clients table
select distinct first_name from clients; 

-- list all Male clients 
select * from clients 
where gender = 'Male'; 

-- list all not Male clients. But this list does not include Null records.
select * from clients 
where not gender = 'Male'; 

-- select the info of client 864. Numeric fields should not be enclosed like other data types.
select * from clients 
where client_id = 864; 

-- select all female clients whoose name is Barr
select * from clients 
where gender = 'Female' and first_name='Levey'; 

-- select all clients whoose name is Barr or Bronnie
select * from clients 
where first_name='Levey' or first_name='Bronnie'; 

-- list all records from clients table and sort results alphabetically by the column last_name
select * from clients order by last_name;

-- list all records from clients table and sort results reversed alphabetically by the column last_name
select * from clients order by last_name desc;

-- list all records from clients table. First sort results ascending by age and then nhs_number
select * from clients order by age, nhs_number asc;

-- insert a new record to clients table
insert into clients (client_id, nhs_number, first_name, middle_name, last_name, gender, age) 
values (1001, '8560589686', 'Melih', null , 'DUMANLI', 'Male', 32);

-- list all records where gender is not stated.
select * from clients where gender is Null;

-- list all records where gender is stated (not null).
select * from clients where gender is not Null;

-- update a record and set middle name as 'Can' where client name is 'Melih'
update clients set middle_name ='Can' where first_name ='Melih';

-- delete a record where first_name is Olly. After you did this, Olly will not be exists in clients list.
delete from clients where first_name='Olly';

-- delete all records from the clients table. this command is not recommended unless its necessary.
delete from clients where first_name='Olly';

-- select minimum value of price from order_list
select min(price) from order_list;

-- select maximum value of price from order_list
select max(price) from order_list;

-- count all records where model year is 2005;
select count(*) from order_list where model_year=2005;

-- calculate average price of all orders;
select avg(price) from order_list ;

-- calculate the sum of all the price values;
select sum(price) from order_list ;

-- select all records where the value of the Country column starts with the letter 'T'
select * from client_adress where country_name like 'T%';

-- select all records where the value of the Country column starts with the letter 'T' and sort and sort results alphabetically
select * from client_adress where country_name like 'T%' order by country_name asc;

-- select all records where the value of the Country column ends with the letter 'd' and sort and sort results alphabetically
select * from client_adress where country_name like '%d' order by country_name asc;

-- select all records where the value of the Country column contains letter 'b' and sort and sort results alphabetically
select * from client_adress where country_name like '%b%' order by country_name asc;

-- select all records where the value of the Country column starts with the letter 'C' and ends with the letter 'a'. Sort results alphabetically
select * from client_adress where country_name like 'C%a' order by country_name asc;

-- select all records where the value of the Country column does not start with the letter 'A'. Sort results alphabetically
select * from client_adress where country_name not like 'A%' order by country_name asc;

-- select all records where the second letter of the Country is 'a'. Sort results alphabetically
select * from client_adress where country_name like '_a%' order by country_name asc;

-- select all records where the first letter of the Country is an 'A' or is a 'C'. Sort results alphabetically
select * from client_adress where country_name like 'A%' or country_name like 'C%' order by country_name asc;

-- select all records where Country is either 'Sweden' or 'Poland'. Sort results alphabetically
select * from client_adress where country_name in ('Sweden','Poland') order by country_name asc;

-- select all records where Country is not 'China' and not 'Indonesia'. Sort results alphabetically
select * from client_adress where country_name not in ('China','Indonesia') order by country_name asc;

-- select all records from order list where the value of model year is between 2000 and 2010. Sort results ascending
select * from order_list where model_year between 2000 and 2010 order by model_year asc;

-- select all records from order list where the value of model year is NOT between 2000 and 2010. Sort results descending
select * from order_list where model_year not between 2000 and 2010 order by model_year desc;

-- select all records from order list where the value of make is between 'Ford' and 'Porsche'. Sort results descending
select * from order_list where make between 'Ford' and 'Porsche' order by make desc;

-- when displaying user_info table, the table can be called ui instead. Table names and column names can have ALIAS.
select ui.user_name from user_info as ui;

-- when displaying tables, coumns also can have ALIAS instead.
select ui.user_name as un from user_info as ui where ui.user_name like 'a%';

-- create realtionship between clients and client_adress tables using client_id and personal_id fields
select * from clients join client_adress on client_id=personal_id;

-- if personal_id values do not match the client_id values, the client_address table shows those values as NULL 
select * from clients left join client_adress on client_id=personal_id;

-- if client_id values do not match the personal_id values, the clients table shows those values as NULL 
select * from clients right join client_adress on client_id=personal_id;

--select all records from the two tables where there is a match in both tables
select * from clients inner join client_adress on client_id=personal_id;

--count clients by gender
select count(c.client_id),c.gender from clients as c group by c.gender;

-- time and date queries
select CURRENT_TIME;
select CURRENT_DATE;
select CURRENT_TIMESTAMP;

-- create database named TestDB
create DATABASE TestDB;
--delete database named TestDB
drop DATABASE TestDB;

-- create new table named new_table including columns like person_id as serial, person_name as character varying,person_surname as character varying
-- set person_id as primary key
create table if not exists new_table (
	person_id serial NOT NULL,
	person_name varchar(50),
	person_surname varchar(50),
	PRIMARY KEY (person_id)
);

-- add new columns to new_table
alter table new_table
add movie varchar(50),
add character varchar(50),
add created_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP;

-- insert new records to new_table
-- person_id and created_date will be automatically generated and inserted to new_table
insert into new_table (person_name,person_surname,movie,character) values ('Melih','DUMANLI','Life','Human');
insert into new_table (person_name,person_surname,movie,character) values ('Keanu','Reeves','Life','Human');
insert into new_table (person_name,person_surname,movie,character) values ('Keanu ','Reeves','Speed','Jack Traven');
insert into new_table (person_name,person_surname,movie,character) values ('Keanu ','Reeves','John Wick','John Wick');
-- delete record from new table where person_name value is 'John'
delete from new_table where movie ='Speed';
-- delete created_date column from new_table
alter table new_table
drop created_date;

-- delete all records in new_table and restart identity numbers from 1
TRUNCATE table new_table
RESTART IDENTITY;

-- delete new_table
drop table new_table;

------------------------------------------------OTHER EXAMPLES-------------------------------------------------------------------
select c.client_id from clients as c union select ca.personal_id from client_adress as ca order by client_id asc;
select count(ol.make),ol.model_year from order_list as ol group by ol.model_year order by ol.model_year asc; 
select max(ol.price) from order_list as ol;
select min(ol.price) from order_list as ol;
select avg(ol.price) from order_list as ol;
select sum(ol.price) from order_list as ol where ol.model_year between 2010 and 2020;
select count(ol.make) from order_list as ol
select ol.model_year, count(ol.make) as counted from order_list as ol group by ol.model_year order by counted desc limit 1;
select upper(c.first_name),upper(c.middle_name),upper(c.last_name) from clients as c order by c.client_id asc;
select upper(ol.make) as upper_make,upper(ol.model) as upper_model,lower(ol.color) as lower_color from order_list as ol order by ol.car_vin asc;
select ol.car_vin,length(ol.car_vin) as car_vin_length from order_list as ol group by ol.car_vin order by ol.car_vin desc;
select SUBSTRING(ol.car_vin,10,17) as vin_number from order_list as ol order by vin_number asc;
select ca.personal_id,ca.country_name,replace(ca.country_code,'US','USA') as replaced_country_code from client_adress as ca where ca.personal_id = 87;
select ceil(avg(ol.price)) from order_list as ol;
select round(avg(c.age)) from clients as c;
select * from clients as c where c.client_id = (select floor(random()*1000+1));
select * from order_list as ol where ol.model_year = (select CAST(random()*48+1965 AS INTEGER));
select ol.make,ol.model,ol.model_year, ceil(round(ol.price*0.2)) as discounted_price from order_list as ol group by ol.make, ol.model, ol.model_year, ol.price having ol.model_year<1990 order by ol.model_year,discounted_price asc; 
select ca.street,ca.postal_code,ca.city_name,ca.time_zone from client_adress as ca where ca.time_zone like 'Europe%' group by ca.personal_id, ca.street, ca.postal_code,ca.city_name,ca.time_zone having ca.personal_id<100 or ca.personal_id>800;
select * from user_info as ui where ui.email like '%github%';
SELECT ui.user_name, ui."password",
	CASE 
		WHEN length(ui."password") <= 6 THEN 'Password is too short'
		WHEN length(ui."password") > 10 THEN 'Password is too long'
		ELSE 'Password is OK!'
END AS recommendation_text
FROM user_info as ui;

-- please do the queries in the following order.
-- you do not have to use all query commands unless you need it. if you don't need someone below, skip that one keep going with others that you need.
-- select + from + join + where (like+between+in (subQuery) )+ group by + Having + order by id +limit; 




