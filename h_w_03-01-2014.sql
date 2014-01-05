/* One more assignment to complete by tomorrow...

- Create a table with list of employees in an org
- Employee has an ID, Name
- Enter data for atleast 15 employees
- Introduce a new attribute called Manager ID
- A manager has to be another employee in the organization
- Enforce referential integrity to make sure that another employee is the manager
- The top most person in the organization wont have a manager. (The manager ID is NULL).


After creating the dataset in the exact order as defined above, answer the following questions.


1. Print all employee names, along with their manager names
2. Print the manager names with the number of employees who directly report to this manager */


alter table emp add constraint emp_fk_manager_id
	foreign key(ManagerId) references emp(EmpNo);

update emp set ManagerId = 10 where EmpNo = 15;
delete from emp where empNo = 0;

/* Count of employees under each manager */
select ManagerId,count(Empno) from emp group by ManagerId;

/* Left join gives at least one record  */

select empName.empname as empName,empManager.empName as ManagerName
	from emp as empManager left join emp as empName
	on empName.empNo = empManager.managerId

select ,empName from emp where mid = empNo;
select Empname as ManagerName from emp;

/* Creating Department */
create table department
	(deptNo smallInt,deptName varchar(30),
	 HODId smallInt constraint dept_fk foreign key references emp(empNo));


/* alter department to make deptNo primary key */

alter table department add constraint dept_pk_deptNo 
	primary key(deptNo);
/* alter emp to have department number */

alter table emp add column deptNo smallint;

/* alter emp to have department number 
	as foreign key of department's deptno */
	
alter table emp add constraint department_fk_deptno
  foreign key(deptNo) references department(deptNo); 
  
/* make employees belong to a department */

update emp set deptNo = 102 where empNo = 10

/* Adding undepartmental employees */

insert into emp (Empno,empname) values(18,'R')

/* Answers */

/*1 count of employees in each of the department*/

select deptName,count(emp.deptNo)
 from emp,department 
 where emp.deptNo = department.deptNo
 group by emp.deptNo;
 
/* 2 direct report employees for every HOD */

select department.HODId,count(emp.deptNo)
	 from emp,department 
	 where department.deptNo = emp.deptNo
	 group by (emp.deptNo);

/*	select emp.EmpName
		from emp,department
		where emp.empNo = department.HodId;*/
	 
/* 3 List all employees along with their department names, including who are not staffed yet */

select emp.EmpName,department.deptName
		from emp left join department
		on emp.deptno = department.deptNo;
/*4  List all departments with the names of the HOD, including departments that dont have any staff. */

select department.deptName,emp.EmpName
		from department left join emp
		on department.hodid = emp.empno;

/* 5 Get a list of all employee id, employee name and the department names. Include all employees and all departments even if they are not staffed. */

select emp.EmpNo,emp.EmpName,department.deptName
 	from emp left outer join department 
	on emp.deptNo = department.deptNo;

/* 6  How many employees in each department are not managers ? Give me the count by each department with its name */

select department.deptName,count(department.deptno)
	 from emp,department
	 where emp.deptNO = department.deptNo
	 
	 group by (department.deptNo);


/* 7 What is the total strength employees in the company */

select count(1) from emp;

/* View Department */	 
select * from department;
select * from emp;
update emp set deptno = NULL where empno = 1