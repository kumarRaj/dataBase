create table EMP(EmpNo int,EmpName varchar(25),
			Salary int,DeptNo int);
/*H.W. fully group by
	order of execution of clauses in 
	select query
	
	select sth 		5
	from sth 		1
	where sth		2
	group by sth	3
	having sth		4
	order by sth	6
	
*/
/*RULE 1
	All non aggregate functions need not be in the select clause
  RULE 2
  	NULL values in non-aggregate column are considered a different group
  RULE 3
  	NULL values in aggregate column are omitted
  RULE 4
  	All non aggregate columns in select should be part of group by clause
  	
  	
  	
	When we use havin we use aggregate functions
			agg fns() --- COUNT,SUM,MAX,MIN,AVG
	*/
insert into EMP (EmpNo,EmpName,DEPTNO)
			values (8,'H',30);
select * from EMP
select COUNT(DEPTNO),DEPTNO,SUM(salary) from EMP
		Group by DEPTNO

select COUNT(DEPTNO),DEPTNO,SUM(salary),AVG(salary) from EMP
		Group by DEPTNO

select EMPNO,DEPTNO,MAX(salary) from EMP
		Group by DEPTNO,EMPNO

select EMPNO,DEPTNO,MAX(salary) from EMP
	 Group by DEPTNO

select DEPTNO,MAX(SALARY)
	from emp
	where DEPTNO IS NOT NULL
	GROUP BY DEPTNO
	HAVING MAX(salary) >= 5000

select DEPTNO,MAX(SALARY),COUNT(*)
	from emp
	where DEPTNO IS NOT NULL
	GROUP BY DEPTNO
	HAVING COUNT(*) >= 2


select SUM(salary) from emp
select 4000+NULL

select COUNT(*) as count from emp where count = 8


select empname,salary+5000 as newsal from emp
	where salary+5000 > 5000