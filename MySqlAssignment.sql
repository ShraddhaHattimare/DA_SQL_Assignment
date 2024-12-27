CREATE DATABASE CONTACT_MANAGEMENT;
USE CONTACT_MANAGEMENT ;

#---------------------------------------------------------------------
-- Q1 Statement to create the Contact table --
Create table Contact
(
ContactID INT,
CompanyID INT,
FirstName varchar(45),
LastName varchar(45),
Street varchar(45),
City varchar(45),
State varchar(2),
Zip varchar(10),
IsMain bool,
Email varchar(45),
Phone varchar(12)
) ;

#---------------------------------------------------------------------
-- Q2 Statement to create the Employee table.
Create table Employee
(
EmployeeID INT,
FirstName varchar(45),
LastName varchar(45),
Salary Decimal(10,2),
HireDate date,
JobTitle varchar(25),
Email varchar(45),
Phone varchar(21)
) ;

#---------------------------------------------------------------------
-- Q3 Statement to create the ContactEmployee table --
Create table ContactEmployee
(
ContactEmployeeID INT,
ContactID INT,
EmployeeID INT,
ContactDate DATE,
Description varchar(100)
);
-- statement to create company table --
CREATE TABLE COMPANY
(
CompanyID INT Primary key,
CompanyName varchar(45),
Street varchar(45),
City varchar(45),
State varchar(20),
zip varchar(10)
) ;

#---------------------------------------------------------------------
/* Q4 In the Employee table, the statement that changes Lesley Bland’s phone number
to 215-555-8800 */
-- insert data into employee table
select * from employee ;

insert into Employee values
(
12,"Lesley Bland", "yumthang",
2000.00, '2023-12-14', "clerk", 
"lesley14@gmail.com", "9789789789"
) ;
insert into Employee values
(
1212,"shraddha", "hattimare",
2000.00, '2023-12-14', "SDE", 
"sh14@gmail.com", "9789789789"
) ;
# update record
update employee 
set phone = "215-555-8800" where firstname = "Lesley Bland" ;

#---------------------------------------------------------------------
/* Q5 In the Company table, the statement that changes the name of “Urban
Outfitters, Inc.” to “Urban Outfitters” . */

-- first insert values in company table --
insert into company values
( 7896, "Tops technologies","lane 3", "Ahmedabad", "GJ", "380008") ;

insert into company values
( 2345, "Urban Outfitters, Inc.","lane 3", "Ahmedabad", "GJ", "380008") ;

-- read value from company table --
select * from company;

-- update company name Outfitters, Inc. --
update company
set companyname = "Urban Outfitters"
where companyname = "Urban Outfitters, Inc." ;

# alter contact table and add foregin key in it
alter table contact add foreign key(companyid) references company(companyid) ;

# alter contact employee table and add 2 foregin key in it.
alter table contactemployee add foreign key(contactid) references contact(contactid) ;
alter table contactemployee add foreign key(employeeid) references employee(employeeid) ;

#---------------------------------------------------------------------
/*
Q6 ) In ContactEmployee table, the statement that removes Dianne Connor’s contact
event with Jack Lee (one statement).
*/
# insert 'jack lee' employee's data in employee table
insert into Employee values
(
1616,"Jack Lee", "Jong",
3000.00, '2021-05-01', "UI/UX Design", 
"jacklee10@gmail.com", "9789978789"
) ;
# insert 'Dianne Connor' contact data in contact table
INSERT INTO contact VALUES 
('3', '2345', 'Dianne Connor', 'Dianne Connor’s', 'bal kunj', 
'Jaypur', 'RJ', '381010', '1', 'dianne.connor@urbanoutfiller.com', '9821765430');

# insert 'Dianne Connor' contacted 'jack lee' data in to contact employee table
INSERT INTO contactemployee VALUES 
('3', '3', '1616', '2022-05-10', 'positive');

# finally apply delete query to delete 'Dianne Connor’s contact data from 
# contactemployee table
delete from contactemployee where contactid =
(select ContactID from contact where firstname = "Dianne Connor") and
employeeid = (select employeeid from employee where firstname = 'jack lee') ;

#---------------------------------------------------------------------
/*
Q7 Write the SQL SELECT query that displays the names of the employees that
have contacted Toll Brothers (one statement). Run the SQL SELECT query in
MySQL Workbench. Copy the results below as well. 
*/
select * from employee e, company c, contactemployee ce, contact ct where
(e.EmployeeID = ce.EmployeeID) and (ce.ContactID = ct.ContactID)  and
(c.CompanyName = "Toll brothers") ;

#---------------------------------------------------------------------
/* 
Q8 What is the significance of “%” and “_” operators in the LIKE statement? 
*/

/*
In SQL, the LIKE operator is used in a WHERE clause to search for a
specified pattern in a column. 
The % and _ are wildcard characters that are used with the LIKE operator
for pattern matching.

1. % Operator (Percentage Wildcard)
The % symbol represents zero, one, or multiple characters.
It is used to match any sequence of characters.
Examples:

LIKE 'A%': Matches any string starting with A (e.g., Apple, Ape, Ant).
LIKE '%son': Matches any string ending with son (e.g., Jackson, Harrison).
LIKE '%cat%': Matches any string containing cat anywhere (e.g., category, concatenate).

2. _ Operator (Underscore Wildcard)
The _ symbol represents exactly one character.
It is used when you want to match a specific number of characters.
Examples:

LIKE 'A_': Matches any two-character string starting with A (e.g., An, At, Al).
LIKE 'C__e': Matches any four-character string starting with C 
and ending with e (e.g., Code, Cake, Cane).
*/

#---------------------------------------------------------------------
/*
Q9 Explain normalization in the context of databases
ANS: Database Normalization is any systematic process of organizing a 
database schema such that no data redundancy occurs and there is least 
or no anomaly while performing any update operation on data. 
In other words, it means dividing a large table into smaller pieces such 
that data redundancy should be eliminated. The normalizing procedure 
depends on the functional dependencies among the attributes inside a 
table and uses several normal forms to guide the design process.

The Normalization Process Begins With the Following:
First Normal Form (1NF): Ensures that each column contains only atomic
						 values that cannot be divided, and each record is 
                         unique.
Second Normal Form (2NF): Includes 1NF and removes subsets of data that 
						  would apply for more than one row and places that 
                          data in a separate table. It deals with a partial 
                          dependency example when a non-key attribute 
                          depends on part of a composite primary key.
Third Normal Form(3NF): This applies further normalization to the schema by 
						removing transitive dependencies, which are where 
                        the non-key attributes depend on other non-key 
                        attributes.
                        
Normalization ensures that databases are structured efficiently, 
reducing redundancy. 
*/

#---------------------------------------------------------------------
/*
Q10 - What does a join in MySQL mean?
Ans: Join in MySql is used to fetch the data from two or more table 
using related column(foreign key)

example
select * from Order inner join Customer 
on Order.o_id = Customer.or_cu ;

here Order is left table, Custome is right table, 
o_id is primary key in order table 
or_cu is foreign key which reference o_id primary key of Order table.

when we execute above query then it will fetch all the recored which are 
matched(common) in both order and customer table.
*/

#---------------------------------------------------------------------
/*
Q11 What do you understand about DDL, DCL, and DML in MySQL?
ANS: 
In MySQL (and other relational database management systems), DDL, DML, 
and DCL are categories of SQL commands used to interact with and manage
the database and its data. Here's an explanation of each:

1. DDL (Data Definition Language)
DDL commands are used to define, modify, or manage the structure of a 
database and its objects, such as tables, schemas, indexes, views, and more.

Key Features:
Deals with schema and structure of the database.
Automatically commits changes (no rollback possible).
Common DDL Commands:
CREATE: Used to create a new database object (e.g., table, index, view).
Example:
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2)
);
ALTER: Modifies the structure of an existing database object.
	Example:
		ALTER TABLE Employees ADD DateOfJoining DATE;
DROP: Deletes a database object, such as a table or database.
	Example:
		DROP TABLE Employees;
TRUNCATE: Removes all records from a table but keeps its structure.
	Example:
		TRUNCATE TABLE Employees;
        
2. DML (Data Manipulation Language)
DML commands are used to manipulate or manage the data within database 
objects (e.g., inserting, updating, deleting, or retrieving data from tables).

Key Features:
Deals with data manipulation inside tables.
Can be rolled back if required (transaction-based).
Common DML Commands:
INSERT: Adds new records into a table.
	Example:
			INSERT INTO Employees (EmployeeID, Name, Position, Salary)
			VALUES (1, 'John Doe', 'Manager', 75000);
UPDATE: Modifies existing records in a table.
	Example:
			UPDATE Employees SET Salary = 80000 WHERE EmployeeID = 1;
DELETE: Removes specific records from a table.
	Example:
		DELETE FROM Employees WHERE EmployeeID = 1;
SELECT: Retrieves data from one or more tables.
	Example:
		SELECT * FROM Employees;
        
3. DCL (Data Control Language)
DCL commands are used to control access to data and manage user privileges 
in the database.

Key Features:
Manages permissions and security for database objects.
Not transaction-based (effects are immediately applied).
Common DCL Commands:
GRANT: Gives specific permissions to a user or role.
	Example:
		GRANT SELECT, INSERT ON Employees TO 'user123'@'localhost';
REVOKE: Removes specific permissions from a user or role.
	Example:
		REVOKE INSERT ON Employees FROM 'user123'@'localhost';
*/

#---------------------------------------------------------------------
/*
Q12 - What is the role of the MySQL JOIN clause in a query, and what are some
common types of joins?

Join in MySql is used to fetch the data from two or more table 
using related column(foreign key)

There is 4 types of joins in MySql
1) inner join - which fetch the data matched in both table.
2) left join - which fetch the data from left table and matched data in both table.
3) right join - which fetch the data from right table and matched data in both table.alter
4) full join - which fetch all the data from left, right table and common in both table.

first table in join query is left table and second table is consider as right table.

example
select * from Order inner join Customer 
on Order.o_id = Customer.or_cu ;

here Order is left table, Custome is right table, 
o_id is primary key in order table 
or_cu is foreign key which reference o_id primary key of Order table.

when we execute above query then it will fetch all the recored which are 
matched(common) in both order and customer table.

*/