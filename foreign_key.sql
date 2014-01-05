CREATE TABLE products (product_id int primary key,
product_name varchar(20),
unit_price int,
p_category varchar(20),
off_start_date date,
p_availability char(1));

select * from products;

DELETE from products;

CREATE TABLE sales (sales_id int primary key,
	Product_Id int,
	FOREIGN KEY product_ID (Product_Id) REFERENCES Products(product_id));
describe sales

ALTER table sales add column amount int;
drop table perm_emp
update sales set amount=100;

INSERT INTO sales values(1,2,9,1000)
INSERT INTO products values(2,'TV','Y',100);

select * from sales;

alter table sales add constraint fk_prod_id
foreign key(P_Id) references products(product_id) on delete cascade;

select sales_id,product_name,quantity from sales s,products p where p.product_id=s.P_Id;
<>
select sales_id,product_name,quantity from sales,products where products.product_id=sales.P_Id;

	/*	If you join using equal operator it is equi join 
	As the results provided by it satisfy the equation or 
	condition they are also called inner join */
	
