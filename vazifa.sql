------------------------1
CREATE TABLE IF NOT EXISTS Departments(
ID SERIAL PRIMARY KEY, 
NAME NOT NULL,
LOCATION NOT NULL,

);

CREATE TABLE IF NOT EXISTS Employees (
ID SERIAL PRIMARY KEY,
NAME NOT NULL,
POSITION NOT NULL ,
 department_id INT,
 FOREIGN KEY (department_id) REFERENCES Departments(id)
);

CREATE TABLE Projects (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    title VARCHAR(100) NOT NULL,
    department_id INT,  
	FOREIGN KEY (department_id) REFERENCES Departments(id)
);

CREATE TABLE Tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    project_id INT,                     
    employee_id INT,                   
    FOREIGN KEY (project_id) REFERENCES Projects(id),  
    FOREIGN KEY (employee_id) REFERENCES Employees(id) 
);

-------------------------2
ALTER TABLE Employees
ADD COLUMN email VARCHAR(100);

ALTER TABLE Tasks
MODIFY COLUMN description VARCHAR(255);

--------------------------3
UPDATE Employees
SET position = 'Senior Developer'
WHERE id = 1;

UPDATE Projects
SET title = 'New Project Title'
WHERE id = 2;
-----------------------------------4
DELETE FROM Tasks WHERE project_id = 3;

DELETE FROM Projects WHERE id = 3;

UPDATE Tasks
SET employee_id = NULL
WHERE employee_id = 4;

DELETE FROM Employees WHERE id = 4;

