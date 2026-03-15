select * from sys.databases

use Case_Study_2
go

select * from DEPARTMENT
select * from JOB
select * from LOCATION
select * from EMPLOYEE

---------------------------------------------------------------------------------------------------
                              -- Simple Queries --

                                 -- Answers --

--1. List all the employee details
Select * from EMPLOYEE

--2. List all the department details. 
select * from DEPARTMENT

--3. List all job details. 
select * from JOB

--4. List all the locations. 
select * from LOCATION

--5. List out the First Name, Last Name, Salary, Commission for all Employees.
select FIRST_NAME,LAST_NAME,SALARY,COMM from EMPLOYEE

--6. List out the Employee ID, Last Name, Department ID for all employees and alias 
--Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id". 

select EMPLOYEE_ID AS ID_of_the_Employee,
LAST_NAME AS Name_of_the_Employee,
DEPARTMENT_ID  AS Dep_id
from EMPLOYEE 

--7. List out the annual salary of the employees with their names only.
select FIRST_NAME + ' '+ LAST_NAME AS Employee_Name, SALARY 
from EMPLOYEE

---------------------------------------------------------------------------------------------------

                                  -- WHERE Condition --

                                      -- Answers --

--1. List the details about "Smith".
select * from EMPLOYEE
where LAST_NAME = 'SMITH'

--2. List out the employees who are working in department 20. 
select * from EMPLOYEE
where DEPARTMENT_ID = '20'

--3. List out the employees who are earning salary between 2000 and 3000.
select * from EMPLOYEE
where SALARY between 2000 and 3000

--4. List out the employees who are working in department 10 or 20.
select * from EMPLOYEE
where DEPARTMENT_ID in (10,20)

--5. Find out the employees who are not working in department 10 or 30. 
select * from EMPLOYEE
where DEPARTMENT_ID not in (10,30)

--6. List out the employees whose name starts with 'L'.
select FIRST_NAME AS Emp_name from EMPLOYEE
where FIRST_NAME like 'L%'

--7. List out the employees whose name starts with 'L' and ends with 'E'.
select FIRST_NAME AS Emp_name from EMPLOYEE
where FIRST_NAME like ('L%E')

--8. List out the employees whose name length is 4 and start with 'J'. 
select FIRST_NAME 
from EMPLOYEE
where Len(FIRST_NAME) = 4 And FIRST_NAME like 'j%'

--9. List out the employees who are working in department 30 and draw the salaries more than 2500.
select * from EMPLOYEE
where DEPARTMENT_ID = '30' AND SALARY > 2500

--10. List out the employees who are not receiving commission.
select * from EMPLOYEE
where COMM is Null

---------------------------------------------------------------------------------------------------

                                -- ORDER BY Clause --

                                   -- Answeres --

--1. List out the Employee ID and Last Name in ascending order based on the Employee ID. 
select EMPLOYEE_ID,LAST_NAME
from EMPLOYEE
order by EMPLOYEE_ID 

--2. List out the Employee ID and Name in descending order based on salary. 
select EMPLOYEE_ID,LAST_NAME,SALARY
from EMPLOYEE
order by SALARY DESC

--3. List out the employee details according to their Last Name in ascending-order.
select * from EMPLOYEE
order by LAST_NAME

--4. List out the employee details according to their Last Name in ascending 
-- order and then Department ID in descending order.
select * from EMPLOYEE
order by LAST_NAME , DEPARTMENT_ID DESC

---------------------------------------------------------------------------------------------------

                                -- GROUP BY and HAVING Clause --

                                       -- Answers --

-- 1. List out the department wise maximum salary, minimum salary and average salary of the employees.
select DEPARTMENT_ID,
MIN(SALARY)AS MIN_SALARY,
MAX(SALARY) AS MAX_SALARY,
AVG(SALARY) AS AVG_SALARY
from EMPLOYEE
group by DEPARTMENT_ID

--2. List out the job wise maximum salary, minimum salary and average salary of the employees. 
select JOB_ID,
MIN(SALARY)AS MIN_SALARY,
MAX(SALARY) AS MAX_SALARY,
AVG(SALARY) AS AVG_SALARY
from EMPLOYEE
group by JOB_ID

--3. List out the number of employees who joined each month in ascending order.
select
month(HIRE_DATE) as hire_month,
count(*) as employee_count
from EMPLOYEE
group by month(HIRE_DATE)
order by hire_month

--4. List out the number of employees for each month and year in ascending order based on the year and month
select 
month(HIRE_DATE) AS hire_month,
year(HIRE_DATE) AS hire_year,
count(*) as employee_count
from EMPLOYEE
group by month(HIRE_DATE), year(HIRE_DATE)
order by hire_month,hire_year

--5. List out the Department ID having at least four employees. 
select DEPARTMENT_ID, count(*) as emp_counted
from EMPLOYEE
group by DEPARTMENT_ID
having count(*) >= 4

--6. How many employees joined in February month. 
select EMPLOYEE_ID,FIRST_NAME + ' ' + LAST_NAME as emp_name, HIRE_DATE,DEPARTMENT_ID
from EMPLOYEE
where month(hire_date) = 2

--7. How many employees joined in May or June month.
select EMPLOYEE_ID,FIRST_NAME + ' ' + LAST_NAME as emp_name, HIRE_DATE,DEPARTMENT_ID
from EMPLOYEE
where month(hire_date) = 5 or month(hire_date) = 6

-- 8. How many employees joined in 1985? 
select EMPLOYEE_ID,FIRST_NAME + ' ' + LAST_NAME as emp_name, HIRE_DATE,DEPARTMENT_ID
from EMPLOYEE
where year(hire_date) = 1985

--9. How many employees joined each month in 1985? 
select 
month(HIRE_DATE) AS hire_month,
year(HIRE_DATE) AS hire_year,
count(*) as employee_count
from EMPLOYEE
where year(HIRE_DATE) = 1985
group by month(HIRE_DATE), year(HIRE_DATE)

--10. How many employees were joined in April 1985? 
select
month(HIRE_DATE) AS hire_month,
year(HIRE_DATE) AS hire_year,
count(*) as counted_emps
from EMPLOYEE
where month(HIRE_DATE) = 4 and year(HIRE_DATE) = 1985
group by month(HIRE_DATE), year(HIRE_DATE)

--11. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?
select DEPARTMENT_ID,count (*) as counted_emps
from EMPLOYEE
where month(HIRE_DATE) = 4 and year(HIRE_DATE) = 1985
group by DEPARTMENT_ID
order by count(*)

---------------------------------------------------------------------------------------------------

                                         -- Joins --
 
                                        -- Answers --

--1. List out employees with their department names.
select 
E.EMPLOYEE_ID,
E.FIRST_NAME + ' ' + E.LAST_NAME as emp_name,
E.Department_Id,
D.Name as dept_name
from EMPLOYEE E
join DEPARTMENT D
ON E.DEPARTMENT_ID = D.Department_Id

--2. Display employees with their designations. 
select 
E.EMPLOYEE_ID,
E.FIRST_NAME + ' ' + E.LAST_NAME as emp_name,
E.JOB_ID,
J.DESIGNATION
from EMPLOYEE E 
JOIN JOB J 
ON
E.JOB_ID = J.JOB_ID

--3. Display the employees with their department names and city.
select 
D.Department_Id,
D.Name AS D_NAME,
L.City
from DEPARTMENT D JOIN LOCATION L 
ON
D.Location_Id = L.Location_ID

--4. How many employees are working in different departments? Display with department names. 
select 
D.Department_Id,
D.Name as D_name,
count(E.EMPLOYEE_ID) as counted_emps
from DEPARTMENT D join EMPLOYEE E
on 
D.DEPARTMENT_ID = E.Department_Id
group by D.Department_Id,D.Name
order by D.Name

--5. How many employees are working in the sales department? 

select  
D.DEPARTMENT_ID,
count(E.Employee_id) as counted_emp,
d.Name as dep_name
from EMPLOYEE E join DEPARTMENT D
on
E.DEPARTMENT_ID = D.Department_Id
where D.Name = 'Sales'
group by D.Department_Id, D.Name

--6. Which is the department having greater than or equal to 3 employees and 
--display the department names in ascending order. 

select D.DEPARTMENT_ID,
count(E.EMPLOYEE_ID) as counted_emp,
D.Name as dep_names
from EMPLOYEE E join DEPARTMENT D
on 
E.DEPARTMENT_ID = D.Department_Id
group by D.Department_Id, D.Name
having count(E.EMPLOYEE_ID) >=3
order by Department_Id asc

--7. How many employees are working in 'Dallas'? 
select L.city,
COUNT (E.EMPLOYEE_ID) as counted_emp
from EMPLOYEE E join DEPARTMENT D
on 
E.DEPARTMENT_ID = D.Department_Id
join LOCATION L 
on 
D.Location_Id = L.Location_ID
where L.City = 'Dallas'
group by L.City

--8. Display all employees in sales or operation departments. 
select E.EMPLOYEE_ID,
E.FIRST_NAME + ' ' + E.LAST_NAME as Emp_name,
D.Name as dep_name
from EMPLOYEE E join DEPARTMENT D
on E.DEPARTMENT_ID = D.Department_Id
where D.Name = 'sales'

---------------------------------------------------------------------------------------------------

                                -- CONDITIONAL STATEMENT --

                                      -- Answers --

--1. Display the employee details with salary grades. Use conditional statement to 
--create a grade column.
select EMPLOYEE_ID,
FIRST_NAME + ' ' + LAST_NAME as EMP_Name,
SALARY,
    case 
        when SALARY < 1000 then 'Grade C'
        when SALARY between 1000 and 2000 then 'Grade B'
        when SALARY > 2000 then 'Grade A'
    End as Salary_Grade
from EMPLOYEE
order by SALARY desc

--2. List out the number of employees grade wise. Use conditional statement to 
--create a grade column. 

select 
    case 
        when SALARY < 1000 then 'Grade C'
        when SALARY between 1000 and 2000 then 'Grade B'
        when SALARY > 2000 then 'Grade A'
    End as Salary_Grade,
    count(*) As Emp_count
From Employee
group by
    case 
        when SALARY < 1000 then 'Grade C'
        when SALARY between 1000 and 2000 then 'Grade B'
        when SALARY > 2000 then 'Grade A'
    End

--3. Display the employee salary grades and the number of employees between 
--2000 to 5000 range of salary. 
select 
    case 
        when SALARY between 2000 and 5000 then 'Grade A'
    End as Salary_Grade,
    count(*) As Emp_count
From Employee
where SALARY between 2000 and 5000
group by SALARY


---------------------------------------------------------------------------------------------------    
                                    -- Subqueries --  

                                     -- Answers --

--1. Display the employees list who got the maximum salary. 
select *
from EMPLOYEE
where SALARY = ( 
select max(SALARY) 
from EMPLOYEE
)

--2. Display the employees who are working in the sales department. 
select * from DEPARTMENT
where Name = 'sales'

--3. Display the employees who are working as 'Clerk'.
select * from JOB
where DESIGNATION = 'clerk'

--4. Display the list of employees who are living in 'Boston'. 
select 
E.EMPLOYEE_ID,L.City
from EMPLOYEE E 
join DEPARTMENT D
on E.DEPARTMENT_ID = D.Department_Id
join LOCATION L
on D.Location_Id = L.Location_ID
where L.City = 'Boston'


--5. Find out the number of employees working in the sales department.
select  
count( E.EMPLOYEE_ID ) as EMP_COUNT
from EMPLOYEE E JOIN DEPARTMENT D
ON 
E.DEPARTMENT_ID = D.Department_Id
where D.Name = 'sales'

--6. Update the salaries of employees who are working as clerks on the basis of 10%. 
update E
set E.SALARY = E.SALARY * 1.10
from Employee E
join Job J
on E.job_id = J.job_id
where J.Designation = 'clerk'

select * from EMPLOYEE

--7. Display the second highest salary drawing employee details. 
select * from EMPLOYEE
where SALARY  = (
select Max(salary) from EMPLOYEE
where SALARY <(
select Max(salary) from EMPLOYEE
)
)

--8.List out the employees who earn more than every employee in department 30.
select DEPARTMENT_ID,
FIRST_NAME + ' ' + LAST_NAME as Emp_name,
SALARY
from EMPLOYEE
where DEPARTMENT_ID = 30
order by SALARY desc

--9. Find out which department has no employees. 
select D.Department_Id,
D.Name
from DEPARTMENT D
left join EMPLOYEE E
On D.Department_Id = E.DEPARTMENT_ID
where E.EMPLOYEE_ID is null

--10. Find out the employees who earn greater than the average salary for their department.
select * from EMPLOYEE E
where SALARY > (
select avg(SALARY) from EMPLOYEE E
where E.DEPARTMENT_ID = E.department_id)