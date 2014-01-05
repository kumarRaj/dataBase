/* ceil gives smallest int greater than number*/
select ceil(2.45)
SELECT CEIL(-2.4)
select ceil(NULL)
/* ceil gives greatest int smaller than number*/
select floor(2.45)
SELECT floor(-2.4)
select floor(NULL)
select floor(1)

/*Round off to specified places
Takes 2 values 2nd value is 0 if not specified*/
select ROUND(1.345,2)
select ROUND(1.5)
select ROUND(-1.5)
select ROUND(NULL)
select ROUND(1345,2)

/*Truncate Takes 2 values 2nd value is 
used to truncate extra digits after decimal*/
select truncate(1.45,1);

/* Returns greatest value. if Null returns Null*/
select greatest (1,2,54,12,67,3,ifNull(NULL,8));

/* Returns smallest value. if Null returns Null*/
select least (21,2,54,12,67,3,ifNull(NULL,8));

/* Returns 1 for positive 0 for 0 and -1 for negative */
SELECT SIGN(NULL);
SELECT sign(67);

select MOD(5,2);
select(5 % 2);
select(5 MOD 2);
select(101 mod 0);
select(101 mod 20);
select(101 mod 1);


/* Random values between 0 to 1*/
select rand(100);
show variables where variable_name like '%group%'