CREATE TABLE Employee(
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  email NVARCHAR(320),
  hire_date DATE,
  id_team INT
);

CREATE TABLE Salary(
  employee_id INT PRIMARY KEY,
  role TEXT,
  salary DECIMAL(10, 2),
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE Team(
  team_id INT PRIMARY KEY,
  team_name TEXT
);

insert into Employee (employee_id,
  first_name,
  last_name,
  email,
  hire_date,
  id_team) values 
(1, 'Warde',	'Remon',	'wremon0@zimbio.com',	'1-Jun-23',	1),
(2,	'Orlando',	'Groneway',	'ogroneway1@wikipedia.org',	'22-Jun-23',	1),
(3, 'Amalita', 'Shorland', 'ashorland2@npr.org', '25-Mar-23', 1),
(4, 'Reinwald', 'Pickersail', 'rpickersail3@skyrock.com', '24-Jun-23', 1),
(5, 'Ilario', 'Anfray', 'ianfrey@google.com', '2-Jan-23', 1),
(6, 'Davey', 'Frowen', 'dfrowen5@nsw.gov.au', '3-Mar-23', 6),
(7, 'Leigha', 'Randlesome', 'lrandlesome6@alibaba.com', '15-Oct-22', 6),
(8, 'Junia', 'Yakovliv', 'jyakovliv7@artisteer.com', '31-Jul-23', 6),
(9, 'Rochell', 'Waggatt', 'rwaggatt8@opera.com', '15-Apr-23', 6),
(10, 'Moises', 'Ardley', 'mardley9@webnode.com', '21-Jun-23', 6);

insert into Salary (employee_id,
  role,
  salary) values
(1, 'Sales', 40153),
(2, 'Marketing', 46670),
(3, 'Legal', 71983),
(4, 'Sales', 15857),
(5, 'Software Engineer', 95174),
(6, 'Sales', 27819),
(7, 'Legal', 75323),
(8, 'Software Engineer', 90525),
(9, 'Tax Accountant', 85946),
(10, 'Marketing', 56575);

insert into Team (team_id,
  team_name) values
(1, 'plan A'),
(6, 'plan B');

--Convert months to numbers.
UPDATE Employee
SET hire_date = 
    CASE 
        WHEN substr(hire_date, instr(hire_date, '-') + 1, 3) = 'Jan' THEN replace(hire_date, '-Jan-', '-01-')
        WHEN substr(hire_date, instr(hire_date, '-') + 1, 3) = 'Feb' THEN replace(hire_date, '-Feb-', '-02-')
        WHEN substr(hire_date, instr(hire_date, '-') + 1, 3) = 'Mar' THEN replace(hire_date, '-Mar-', '-03-')
        WHEN substr(hire_date, instr(hire_date, '-') + 1, 3) = 'Apr' THEN replace(hire_date, '-Apr-', '-04-')
        WHEN substr(hire_date, instr(hire_date, '-') + 1, 3) = 'May' THEN replace(hire_date, '-May-', '-05-')
        WHEN substr(hire_date, instr(hire_date, '-') + 1, 3) = 'Jun' THEN replace(hire_date, '-Jun-', '-06-')
        WHEN substr(hire_date, instr(hire_date, '-') + 1, 3) = 'Jul' THEN replace(hire_date, '-Jul-', '-07-')
        WHEN substr(hire_date, instr(hire_date, '-') + 1, 3) = 'Aug' THEN replace(hire_date, '-Aug-', '-08-')
        WHEN substr(hire_date, instr(hire_date, '-') + 1, 3) = 'Sep' THEN replace(hire_date, '-Sep-', '-09-')
        WHEN substr(hire_date, instr(hire_date, '-') + 1, 3) = 'Oct' THEN replace(hire_date, '-Oct-', '-10-')
        WHEN substr(hire_date, instr(hire_date, '-') + 1, 3) = 'Nov' THEN replace(hire_date, '-Nov-', '-11-')
        WHEN substr(hire_date, instr(hire_date, '-') + 1, 3) = 'Dec' THEN replace(hire_date, '-Dec-', '-12-')
    END;

--Edit years.
UPDATE Employee
SET hire_date =
    '20' || substr(hire_date, -2) || '-' || 
    CASE 
        WHEN substr(hire_date, 3, 2) = '01' THEN '01'
        WHEN substr(hire_date, 3, 2) = '02' THEN '02'
        WHEN substr(hire_date, 3, 2) = '03' THEN '03'
        WHEN substr(hire_date, 3, 2) = '04' THEN '04'
        WHEN substr(hire_date, 3, 2) = '05' THEN '05'
        WHEN substr(hire_date, 3, 2) = '06' THEN '06'
        WHEN substr(hire_date, 3, 2) = '07' THEN '07'
        WHEN substr(hire_date, 3, 2) = '08' THEN '08'
        WHEN substr(hire_date, 3, 2) = '09' THEN '09'
        ELSE substr(hire_date, 4, 2)
    END || '-' || substr(hire_date, 1, 2);

--Remove the last line.
UPDATE Employee
SET hire_date =
    substr(hire_date, 1, length(hire_date) - 1)
WHERE substr(hire_date, -1) = '-';

--Change date to 2 digit number.
UPDATE Employee
SET hire_date =
    printf('%04d-%02d-%02d',
        substr(hire_date, 1, 4),
        substr(hire_date, 6, 2),
        substr(hire_date, 9, 2)
    );
