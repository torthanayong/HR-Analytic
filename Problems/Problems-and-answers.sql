/*2. Who are the employees of the company?
What position do they hold?
How much is the salary?
Since when have they worked?
Answer:*/
select first_name, last_name, email, hire_date, role, salary
  from Employee a
left join Salary b on a.employee_id = b.employee_id;

/*3. Who are the three most recently hired employees? What team are they on? What day do they come to work?
Answer:*/
SELECT 
  first_name, 
  last_name, 
  email, 
  hire_date, 
  team_name,
  ROW_NUMBER() OVER (ORDER BY hire_date desc) AS hire_date_rank
FROM Employee a
JOIN Team b ON a.id_team = b.team_id
ORDER BY hire_date desc
LIMIT 3;

/*4. What is the average salary of employees in each position?
Answer:*/
select 
  role,
  avg(salary) as avg_salary
  from Employee a
  left join Salary b on a.employee_id = b.employee_id
  group by role;

/*5. Employees with a salary higher than 75,000 are called managers; salaries from 45,000 to 75,000 are called seniors; and those with salaries less than that are called staff.
Answer:*/
select
    case 
        when salary  > 75000 then 'Manager'
        when salary >= 45000 AND salary <= 75000 then 'Senior'
        when salary < 45000 then 'Staff'
    end as 'position'
from Salary;

/*6. If there is an employee joining on 14-Oct-23 in the marketing position with a salary of 45,000 baht, what will the latest average salary for the marketing position be?
Answer:*/
insert into Employee (employee_id,
  hire_date
  ) values 
((SELECT MAX(employee_id) + 1 FROM Employee),'14-Oct-23');

insert into Salary (employee_id,
  role,
  salary) values
(11, 'Marketing', 45000);

select 
role,
avg(salary) as avg_salary
from Employee a
left join Salary b on a.employee_id = b.employee_id
where role = 'Marketing';
