
CREATE TABLE Person_Person (
    BusinessEntityID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
)

CREATE TABLE Person_Password (
    BusinessEntityID INT,
    PasswordHash VARCHAR(200),
    FOREIGN KEY (BusinessEntityID) REFERENCES Person_Person(BusinessEntityID)
)

CREATE TABLE Person_EmailAddress (
    BusinessEntityID INT,
    EmailAddress VARCHAR(100),
    FOREIGN KEY (BusinessEntityID) REFERENCES Person_Person(BusinessEntityID)
)
CREATE TABLE HumanResources_Employee (
    BusinessEntityID INT PRIMARY KEY,
    NationalIDNumber VARCHAR(20),
    JobTitle VARCHAR(100)
)

CREATE TABLE HumanResources_EmployeeDepartmentHistory (
    BusinessEntityID INT,
    DepartmentID INT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (BusinessEntityID) REFERENCES HumanResources_Employee(BusinessEntityID)
)

CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    ISBN VARCHAR(20),
    PublisherID INT
)

CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100)
)

CREATE TABLE BookAuthor (
    BookID INT,
    AuthorID INT,
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
)

CREATE TABLE Publisher (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(100)
)
-- Person
INSERT INTO Person_Person VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Alice', 'Brown')

INSERT INTO Person_Password VALUES
(1, 'hash123'),
(2, 'hash456'),
(3, 'hash789')

INSERT INTO Person_EmailAddress VALUES
(1, 'john@example.com'),
(2, 'jane@example.com'),
(3, 'alice@example.com')

-- Employee
INSERT INTO HumanResources_Employee VALUES
(1, 'N123', 'Manager'),
(2, 'N456', 'Developer')

INSERT INTO HumanResources_EmployeeDepartmentHistory VALUES
(1, 10, '2020-01-01', '2022-01-01'),
(1, 20, '2022-01-02', NULL),
(2, 30, '2021-05-01', NULL)

-- Book System
INSERT INTO Publisher VALUES
(1, 'Penguin'),
(2, 'HarperCollins');

INSERT INTO Book VALUES
(1, 'SQL Basics', 'ISBN001', 1),
(2, 'Advanced SQL', 'ISBN002', 2)

INSERT INTO Author VALUES
(1, 'Author A'),
(2, 'Author B')

INSERT INTO BookAuthor VALUES
(1, 1),
(1, 2),
(2, 2)


--1) Using the Person.Person and Person.Password tables, INNER JOIN the two tables 
--using the BusinessEntityID column and return the FirstName and LastName 
--columns from Person.Person and then PasswordHash column from 
--Person.Password 


SELECT 
    p.FirstName,
    p.LastName,
    pw.PasswordHash
FROM Person_Person p
INNER JOIN Person_Password pw
    ON p.BusinessEntityID = pw.BusinessEntityID

--2) Join the HumanResources.Employee and the 
--HumanResources.EmployeeDepartmentHistory tables together via an INNER JOIN 
--using the BusinessEntityID column.  Return the BusinessEntityID, 
--NationalIDNumber and JobTitle columns from HumanResources.Employee and the 
--DepartmentID, StartDate, and EndDate columns from 
--HumanResources.EmployeeDepartmentHistory.  Notice the number of rows 
--returned.  Why is the row count what it is? 

SELECT 
    e.BusinessEntityID,
    e.NationalIDNumber,
    e.JobTitle,
    edh.DepartmentID,
    edh.StartDate,
    edh.EndDate
FROM HumanResources_Employee e
INNER JOIN HumanResources_EmployeeDepartmentHistory edh
    ON e.BusinessEntityID = edh.BusinessEntityID


--3) Expand upon the query used in question 1.  Using the existing query, add another 
--INNER JOIN to the Person.EmailAddress table and include the EmailAddress column 
--in your select statement. 
SELECT 
    p.FirstName,
    p.LastName,
    pw.PasswordHash,
    e.EmailAddress
FROM Person_Person p
INNER JOIN Person_Password pw
    ON p.BusinessEntityID = pw.BusinessEntityID
INNER JOIN Person_EmailAddress e
    ON p.BusinessEntityID = e.BusinessEntityID


--4) Using the Book, BookAuthor and Author tables, join them together so that you 
--return the Title and ISBN columns from Book and the AuthorName column from 
--Author.  (Hint: You must start with the BookAuthor table in your FROM clause even 
--though we will not be returning any columns from this table) 
SELECT 
    b.Title,
    b.ISBN,
    a.AuthorName
FROM BookAuthor ba
INNER JOIN Book b
    ON ba.BookID = b.BookID
INNER JOIN Author a
    ON ba.AuthorID = a.AuthorID

--5) Using the query from example 4, add another INNER JOIN that joins the Publisher 
--table with your query.  Return the PublisherName column from this table.  So, you 
--should return the Title and ISBN columns from Book, the AuthorName column from 
--Author, and the PublisherName column from Publisher.  (Hint: this will require 
--three separate INNER JOINs). 
SELECT 
    b.Title,
    b.ISBN,
    a.AuthorName,
    p.PublisherName
FROM BookAuthor ba
INNER JOIN Book b
    ON ba.BookID = b.BookID
INNER JOIN Author a
    ON ba.AuthorID = a.AuthorID
INNER JOIN Publisher p
    ON b.PublisherID = p.PublisherID