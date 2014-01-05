
	/* concatenated without space */
select concat('a','b','c');

	/*To concatenated with space put space with text */
select concat('a ','b ','c');

	/* With null gives null */
select concat('a','b',NULL);

	/* With null gives null */
select concat('a','b',ifNULL(NULL,' c'));

	/* With integers it concats them */
select concat('a','b',10);

	/* empty string is not space */
select concat('a','','b',10);

	/* Concat with seperator */


	/* B4 concatenating it excludes null values */	
select concat_ws('_','a','b','c',null,'');
select concat_ws ('cdan','a','b');

	/* returns ascii of first character in string */
select ASCIi('9');

	/* returns character of given ascii */

select char(97);
select char(NULL);
select char(49,52,NULL,65);

	/* LEFT function */

select left('rajkum',3);
select left('rajkum',13);
select left('rajkum',NULL);
select left('r a j kum',3);
select left(NULL,3);
select left(NULL,NULL);

	/* RIGHT function */
	
select right('rajkum',3);
select right('rajkum',NULL);
select right('r a j kum',3);
select right(NULL,3);
select right(NULL,NULL);

	/* Cast and Convert function */

select cast(current_date as char(6));
select cast(current_date as char(10));
select cast(current_date as int);
select cast(NULL as char(30));
select current_date as date;

CREATE TABLE enum_list (enum_field enum('c','a','b'));
INSERT INTO enum_list (enum_field) VALUES('c'),('a'),('c'),('b');
SELECT * FROM enum_list ORDER BY enum_field;
SELECT * FROM enum_list ORDER BY CAST(enum_field AS CHAR);

	/* substr and substring */

select SUBSTR('RAMANUJAN',2,4);
select SUBSTRING('RAMANUJAN',2,7);
select SUBSTR(NULL,2,4);
select SUBSTR('NULL',-2,2);
select SUBSTR('NULL',null,2);
select SUBSTR('NULL',null,2);
select SUBSTRING('RAMANUJAN',2,-2);
select SUBSTRING('RAMANUJAN',-5,-2);
select SUBSTRING('RAMANUJAN',-5,5);

	/* Reverse */
	
select reverse('jar');
select reverse(NULL);
select reverse('NULL');

	/* INsert -- sth more like replace
	insert (string,position,noOfcharacters,replacementString)
	 */
select insert('RAMA NUJAN',6,5,'RAMAN');
select insert('RAMA NUJAN',-6,5,'RAMAN');

	/* INSTRING 
	sth like charAT
	*/

select instr('RAMAN'	,'AN');
	