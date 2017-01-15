DROP TABLE IF EXISTS Computers;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS EmployeesComputers;
DROP TABLE IF EXISTS TrainingPrograms;
DROP TABLE IF EXISTS EmployeesTrainingPrograms;
DROP TABLE IF EXISTS ProductTypes;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Accounts;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS ProductsCustomers;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS PaymentTypes;

CREATE TABLE `Computers` (
	`idComputers`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`purchased`		TEXT NOT NULL,
	`decomissioned`		TEXT
);

INSERT INTO Computers VALUES (null, '02-04-2011', null);
INSERT INTO Computers VALUES (null, '05-14-2015', null);
INSERT INTO Computers VALUES (null, '02-04-2010', null);
INSERT INTO Computers VALUES (null, '02-04-2012', null);

CREATE TABLE `Departments` (
	`idDepartments` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	TEXT NOT NULL,
	`expense_budget`	REAL NOT NULL
);

INSERT INTO Departments VALUES (null, 'Accounting', 45000.00);
INSERT INTO Departments VALUES (null, 'Marketing', 45000.00);
INSERT INTO Departments VALUES (null, 'Human Resources', 45000.00);

CREATE TABLE `Employees` (
	`idEmployees`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`first_name`	TEXT NOT NULL,
	`last_name`	TEXT NOT NULL,
	`supervisor` INTEGER NOT NULL,
	`idDepartments` INTEGER NOT NULL,
	FOREIGN KEY(`idDepartments`) REFERENCES `Departments`(`idDepartments`)
);

INSERT INTO Employees VALUES (null, 'Bob', 'Barker', 0, 1);
INSERT INTO Employees VALUES (null, 'Joe', 'Schmoe', 0, 1);
INSERT INTO Employees VALUES (null, 'Jane', 'Doe', 0, 2);

CREATE TABLE `EmployeesComputers` (
	`idEmployeesComputers`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`idEmployees`	INTEGER NOT NULL,
	`idComputers`	INTEGER NOT NULL,
	FOREIGN KEY(`idEmployees`) REFERENCES `Employees`(`idEmployees`),
	FOREIGN KEY(`idComputers`) REFERENCES `Computers`(`idComputers`)
);

INSERT INTO EmployeesComputers VALUES (null, 1, 1);
INSERT INTO EmployeesComputers VALUES (null, 2, 2);
INSERT INTO EmployeesComputers VALUES (null, 3, 3);

CREATE TABLE `TrainingPrograms` (
	`idTrainingPrograms` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	TEXT NOT NULL,
	`start_date`	TEXT NOT NULL,
	`end_date`	TEXT NOT NULL,
	`max_attendees`	INTEGER NOT NULL
);

INSERT INTO TrainingPrograms VALUES (null, 'Learning to Fi', '01-20-2010', '02-10-2010', 30);
INSERT INTO TrainingPrograms VALUES (null, 'Being a smarmy salesguy', '01-04-2012', '03-10-2012', 40);
INSERT INTO TrainingPrograms VALUES (null, 'Mailroom woes', '04-20-2011', '07-10-2013', 45);
INSERT INTO TrainingPrograms VALUES (null, 'Thinking like a Scientist', '03-10-2011', '04-09-2014', 80);


CREATE TABLE `EmployeesTrainingPrograms` (
	`idEmployeesTrainingPrograms` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`idEmployees`	INTEGER NOT NULL,
	`idTrainingPrograms`	INTEGER NOT NULL,
	FOREIGN KEY(`idEmployees`) REFERENCES `Employees`(`idEmployees`),
	FOREIGN KEY(`idTrainingPrograms`) REFERENCES `TrainingPrograms`(`idTrainingPrograms`)
);

INSERT INTO EmployeesTrainingPrograms VALUES (null, 3, 2);
INSERT INTO EmployeesTrainingPrograms VALUES (null, 1, 4);
INSERT INTO EmployeesTrainingPrograms VALUES (null, 1, 4);
INSERT INTO EmployeesTrainingPrograms VALUES (null, 2, 1);

CREATE TABLE `ProductTypes` (
	`idProductTypes` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`description`	TEXT NOT NULL
);

INSERT INTO ProductTypes VALUES (null, 'Books');
INSERT INTO ProductTypes VALUES (null, 'Boardgames');
INSERT INTO ProductTypes VALUES (null, 'Desserts');
INSERT INTO ProductTypes VALUES (null, 'Cars');

CREATE TABLE `Products` (
	`idProducts`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`description`	TEXT NOT NULL,
	`price`		REAL NOT NULL,
	`title`		TEXT NOT NULL,
	`idProductTypes`	INTEGER NOT NULL,
	FOREIGN KEY(`idProductTypes`) REFERENCES `ProductTypes`(`idProductTypes`)
);

INSERT INTO Products VALUES (null, 'Classic story in deep south', 23.40, 'To kill a mockingbird', 1);
INSERT INTO Products VALUES (null, 'Worker placement game', 50.99, 'Agricola', 2);
INSERT INTO Products VALUES (null, 'Fun for the whole family', 30.99, 'Ticket to Ride', 2);

CREATE TABLE `Accounts` (
	`idAccounts`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`date_created`	TEXT NOT NULL,
	`status_active`	INTEGER NOT NULL
);

INSERT INTO Accounts VALUES (null, '01-10-2007', 1);
INSERT INTO Accounts VALUES (null, '04-11-2008', 1);
INSERT INTO Accounts VALUES (null, '03-20-2008', 1);
INSERT INTO Accounts VALUES (null, '05-09-2009', 0);
INSERT INTO Accounts VALUES (null, '06-05-2009', 0);


CREATE TABLE `Customers` (
	`idCustomers`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`date_purchased`	TEXT NOT NULL,
	`first_name`	TEXT NOT NULL,
	`last_name`	TEXT NOT NULL,
	`idAccounts`	INTEGER NOT NULL,
	FOREIGN KEY(`idAccounts`) REFERENCES `Accounts`(`idAccounts`)	
);

INSERT INTO Customers VALUES (null, '01-10-2010', 'Alex', 'Simonian', 1);
INSERT INTO Customers VALUES (null, '01-11-2010', 'Alex', 'Simonian', 1);
INSERT INTO Customers VALUES (null, '01-11-2010', 'Roger', 'Waters', 2);
INSERT INTO Customers VALUES (null, '01-12-2010', 'Roger', 'Waters', 2);
INSERT INTO Customers VALUES (null, '01-12-2010', 'Jim', 'Bob', 3);

CREATE TABLE `ProductsCustomers` (
	`idProductsCustomers`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`idProducts`	INTEGER NOT NULL,
	`idCustomers`	INTEGER NOT NULL,
	FOREIGN KEY(`idProducts`) REFERENCES `Products`(`idProducts`),
	FOREIGN KEY(`idCustomers`) REFERENCES `Customers`(`idCustomers`)
);

INSERT INTO ProductsCustomers VALUES (null, 1, 1);
INSERT INTO ProductsCustomers VALUES (null, 2, 3);

CREATE TABLE `PaymentTypes` (
	`idPaymentTypes`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`description`	TEXT NOT NULL,
	`account`	TEXT NOT NULL
);

INSERT INTO PaymentTypes VALUES (null, 'VISA', '1094-4908');
INSERT INTO PaymentTypes VALUES (null, 'MASTERCARD', '1095-4908');
INSERT INTO PaymentTypes VALUES (null, 'DISCOVER', '1094-5000');

CREATE TABLE `Orders` (
	`idOrders`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`time_ordered`	TEXT NOT NULL,
	`idPaymentTypes`	INTEGER NOT NULL,
	`idCustomers`	INTEGER NOT NULL,
	FOREIGN KEY(`idPaymentTypes`) REFERENCES `PaymentTypes`(`idPaymentTypes`),
	FOREIGN KEY(`idCustomers`) REFERENCES `Customers`(`idCustomers`)
);

INSERT INTO Orders VALUES (null, '05-10-2015', 1, 3);
INSERT INTO Orders VALUES (null, '05-10-2015', 2, 3);