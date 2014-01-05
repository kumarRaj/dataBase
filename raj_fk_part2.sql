-- EMPLOYEES
SELECT * from tw_employees;
-- TW_DEPARTMENTSS
SELECT * from tw_departments;
/* Fill in your assignments below */

--
--1. What is the total count of employees in each of the departments ?
--
SELECT TW_DEPARTMENTS.DEPT_NAME,COUNT(1) FROM TW_EMPLOYEES INNER JOIN TW_DEPARTMENTS
	 ON TW_DEPARTMENTS.DEPT_ID = TW_EMPLOYEES.DEPT_ID
	 GROUP BY (TW_EMPLOYEES.DEPT_ID); 

--
--2. How many direct report employees are present for every HOD ?
--
SELECT TW_DEPARTMENTS.HOD,count(TW_EMPLOYEES.DEPT_ID)
	 FROM TW_EMPLOYEES INNER JOIN TW_DEPARTMENTS
	 ON TW_DEPARTMENTS.DEPT_ID = TW_EMPLOYEES.DEPT_ID
	 group by (TW_DEPARTMENTS.DEPT_ID);

--
--3. List all employees along with their department names, including who are not staffed yet.
--
SELECT TW_EMPLOYEES.EMP_NAME,TW_DEPARTMENTS.DEPT_NAME
		FROM TW_EMPLOYEES LEFT JOIN TW_DEPARTMENTS
		ON TW_EMPLOYEES.DEPT_ID = TW_DEPARTMENTS.DEPT_ID;

--
--4. List all departments with the names of the HOD, including departments that dont have any staff.
--
SELECT TW_DEPARTMENTS.DEPT_NAME,TW_EMPLOYEES.EMP_NAME
	from TW_DEPARTMENTS LEFT JOIN TW_EMPLOYEES
	on TW_DEPARTMENTS.HOD = TW_EMPLOYEES.EMP_ID;

--
--5. Get a list of all employee id, employee name and the department names. Include all employees and all departments even if they are not staffed.
--
SELECT TW_EMPLOYEES.EMP_ID,TW_EMPLOYEES.EMP_NAME,TW_DEPARTMENTS.DEPT_NAME
 	from TW_EMPLOYEES RIGHT OUTER JOIN TW_DEPARTMENTS 
	on TW_EMPLOYEES.DEPT_ID = TW_DEPARTMENTS.DEPT_ID
	UNION
SELECT TW_EMPLOYEES.EMP_ID,TW_EMPLOYEES.EMP_NAME,TW_DEPARTMENTS.DEPT_NAME
 	from TW_EMPLOYEES LEFT OUTER JOIN TW_DEPARTMENTS 
	on TW_EMPLOYEES.DEPT_ID = TW_DEPARTMENTS.DEPT_ID;
--
--6. How many employees in each TW_DEPARTMENTS are not managers ? Give me the count by each department with its name
--
SELECT TW_DEPARTMENTS.DEPT_NAME,count(TW_DEPARTMENTS.DEPT_ID) as Employees
	 from TW_EMPLOYEES RIGHT OUTER JOIN TW_DEPARTMENTS
	 ON TW_EMPLOYEES.DEPT_ID = TW_DEPARTMENTS.DEPT_ID
	 and TW_EMPLOYEES.MGR_ID <> TW_EMPLOYEES.EMP_ID	 
	 group by (TW_DEPARTMENTS.DEPT_ID);

--
--7. What is the total strength employees in the company ?
--
SELECT count(1) from TW_EMPLOYEES;