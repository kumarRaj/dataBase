/*
ASSIGNMENT

1. using size as int vs int(4)
2. Number 
*/
create table vehicle_info (
	VIN varchar(16),
	year_of_manufacturing int(4),
	model_name varchar(10),
	is_ac_vehicle char(1),
	fuel_type varchar(10),
	vehicle_type char(1)
);

/* INSERT* */
insert into vehicle_info(VIN,year_of_manufacturing,model_name,is_ac_vehicle,fuel_type,vehicle_type) values('INDMH15443',2013,'alto800','y','gasoline','p');
insert into vehicle_info values('INDMH123',2010,'maruti800','y','diesel','c');
insert into vehicle_info values('INDDL45',2001,'innovaxs','n','diesel','p');
insert into vehicle_info values('INDBNG45',2009,'innovaxg','y','gasoline','p');
insert into vehicle_info values('INDMUM456',2013,'innovaxd','n','gasoline','c');

/* select */

select * from vehicle_info;

/* create new table using existing */
create table b_vehicle_info as select * from vehicle_info;
select * from b_vehicle_info;



insert into vehicle_info 
	(VIN,year_of_manufacturing,model_name,is_ac_vehicle,fuel_type,vehicle_type)
	values ('TRefkY',2017,'E560','Y','CNG','P');
	
	
/* Non factual primary key is a unique reference created
	for sake of simplicity as in conditions are present where
	there is no natural primary key. */