-- Create database
CREATE DATABASE college;

-- Switch to college database
USE college;

-- Create student table
CREATE TABLE student (
    roll_no INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    marks INT,
    grade CHAR(1),
    city VARCHAR(50)
);

-- Insert sample data
INSERT INTO student (roll_no, name, marks, grade, city) VALUES
(1, 'Ali Khan', 85, 'A', 'Lahore'),
(2, 'Sara Malik', 78, 'B', 'Karachi'),
(3, 'John Doe', 92, 'A', 'Islamabad'),
(4, 'Fatima Noor', 67, 'C', 'Multan'),
(5, 'Ahmad Raza', 55, 'D', 'Peshawar');

-- View the table




SELECT * FROM student
WHERE marks > 80 OR city = 'Lahore';

 SELECT * FROM student WHERE marks > 80 AND city= "lahore";
 SELECT * FROM student WHERE city IN ( "lahore","Islamabad");

  
SELECT * FROM student;

SELECT * FROM student  ORDER BY city ASC; 
SELECT * FROM student  ORDER BY city DESC; 
 SELECT MIN("marks") FROM student;
 
 SELECT city, avg(marks)
 FROM student
 GROUP BY city
 ORDER BY city DESC ;

USE college;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_mode VARCHAR(50),
    city VARCHAR(50),
    payment_amount DECIMAL(10,2)
);
INSERT INTO customer (customer_id, customer_name, customer_mode, city, payment_amount) VALUES
(1, 'Ali Khan', 'Net Banking', 'Lahore', 5000.00),
(2, 'Sara Malik', 'Credit Card', 'Karachi', 3000.00),
(3, 'John Doe', 'Net Banking', 'Islamabad', 7000.00),
(4, 'Fatima Noor', 'Credit Card', 'Multan', 2500.00),
(5, 'Ahmad Raza', 'Net Banking', 'Peshawar', 6000.00);

SELECT customer_mode, SUM(payment_amount) AS total_payment
FROM customer
GROUP BY customer_mode;

UPDATE customer
SET payment_amount = 4000.00
WHERE customer_id = 2;




SET SQL_SAFE_UPDATES = 0;

DELETE FROM customer
WHERE payment_amount < 3000;

SET SQL_SAFE_UPDATES = 1;

CREATE TABLE dept (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE teacher (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dept INT,
    FOREIGN KEY (dept) REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
USE college;
-- Insert departments
INSERT INTO dept (id, name)
 VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics');

-- Insert teachers
INSERT INTO teacher (id, name, dept)
VALUES
(101, 'Ali Khan', 1),
(102, 'Sara Malik', 2),
(103, 'John Doe', 1),
(104, 'Fatima Noor', 3);

ALTER TABLE teacher
ADD salary DECIMAL(10,2);

ALTER TABLE teacher
DROP COLUMN salary;

ALTER TABLE teacher
MODIFY name VARCHAR(150);

ALTER TABLE teacher
CHANGE name full_name VARCHAR(150);

ALTER TABLE teacher
ADD CONSTRAINT fk_teacher_dept
FOREIGN KEY (dept) REFERENCES dept(id);


















