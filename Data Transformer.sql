create database Project2;
use project2;

CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
RegistrationDate DATE
);

INSERT INTO Customers (CustomerID,FirstName,LastName,Email,RegistrationDate) VALUES
(1,'John','Doe','john.doe@email.com','2022-03-15'),
(2,'Jane','Smith','jane.smith@email.com','2021-11-02');

CREATE TABLE Orders (
OrderID  INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
TotalAmount DECIMAL(10,2),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID,CustomerID,OrderDate,TotalAmount) VALUES
(101,1,'2023-07-01',150.50),
(102,2,'2023-07-03',200.75);

CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Department VARCHAR(50),
HireDate DATE,
Salary DECIMAL(10,2)
);

INSERT INTO Employees (EmployeeID,FirstName,LastName,Department,HireDate,Salary) VALUES
(1,'Mark','Johnson','Sales','2020-01-15',50000),
(2,'Susan','Lee','HR','2021-03-20',55000);

SELECT * FROM customers;

SELECT * FROM orders;

SELECT * FROM employees;

A-1
SELECT o.orderid,o.orderdate,o.totalamount,c.customerid,c.firstname,c.lastname,c.email 
FROM orders o 
INNER JOIN customers c 
ON o.customerid = c.customerid;

A-2
SELECT c.customerid,c.firstname,c.lastname,o.orderid,o.orderdate,o.totalamount
FROM customers c
LEFT JOIN orders o
ON c.customerid = o.customerid;

A-3
SELECT c.customerid,c.firstname,c.lastname,o.orderid,o.orderdate,o.totalamount
FROM customers c
RIGHT JOIN orders o
ON c.customerid = o.customerid;

A-4
SELECT c.customerid,c.firstname,c.lastname,o.orderid,o.orderdate,o.totalamount
FROM customers c
LEFT JOIN orders o
ON c.customerid = o.customerid
UNION
SELECT c.customerid,c.firstname,c.lastname,o.orderid,o.orderdate,o.totalamount
FROM customers c
RIGHT JOIN orders o
ON c.customerid = o.customerid;

A-5
SELECT DISTINCT c.customerid,c.firstname,c.lastname
FROM customers c
JOIN orders o
ON c.customerid = o.customerid
WHERE o.totalamount > (SELECT AVG(totalamount) FROM orders);

A-6
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

A-7
SELECT orderid,orderdate,
YEAR(orderdate) AS orderyear,
MONTH(orderdate) AS ordermonth
FROM orders;

A-8
SELECT orderid,orderdate,
DATEDIFF(CURDATE(), ORDERDATE) AS dayssinceorder
FROM orders;

A-9
SELECT orderid,
DATE_FORMAT (orderdate, '%d-%b-%Y') as formatteddate
FROM orders;

A-10
SELECT customerid,
CONCAT(firstname, ' ', lastname) as fullname,
email
FROM customers;

A-11
SELECT customerid,
REPLACE(firstname, 'john','jonathan') as updatedfirstname,
lastname,
email
FROM customers;

A-12
SELECT customerid,
UPPER(firstname) as firstnameupper,
LOWER(lastname) as lastnamelower,
email
FROM customers;

A-13
SELECT customerid,
TRIM(email) as cleanemail
FROM customers;

A-14
SELECT orderid,orderdate,totalamount,
SUM(totalamount) OVER(ORDER BY orderdate,orderid) as runningtotal
FROM orders;

A-15
SELECT orderid,totalamount,
RANK() OVER(ORDER BY totalamount DESC) as amountrank
FROM orders;

A-16
SELECT  OrderID,TotalAmount,
CASE
WHEN TotalAmount > 1000 THEN 0.10
WHEN TotalAmount > 500  THEN 0.05
ELSE 0.00
END AS DiscountRate,
TotalAmount *
CASE
WHEN TotalAmount > 1000 THEN 0.10
WHEN TotalAmount > 500  THEN 0.05
ELSE 0.00
END AS DiscountAmount
FROM Orders;

A-17
SELECT  EmployeeID,FirstName,LastName,Salary,
CASE
WHEN Salary >= 60000 THEN 'High'
WHEN Salary >= 40000 THEN 'Medium'
ELSE 'Low'
END AS SalaryCategory
FROM Employees;














