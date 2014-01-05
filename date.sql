CREATE TABLE t1 (d DATE);
INSERT INTO t1 VALUES ("2010-01-12"), ("2011-2-28"), ('120314'),('13*04*21');

/* Date */
SELECT curdate();
SELECT current_date();
SELECT current_date;

/* Time */
SELECT current_time;
SELECT current_time();
select curtime();

/* Time Stamp */
SELECT current_timestamp();
SELECT now();

/* ADD date */

select adddate(curdate(),6);
select adddate(curdate(),-6);

select subdate(curdate(),6);
select subdate(curdate(),-6);
select subdate(curdate(),null);