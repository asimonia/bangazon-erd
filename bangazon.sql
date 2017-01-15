DROP TABLE IF EXISTS Computers;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS EmployeesComputers;

CREATE TABLE `Computers` (
	`idComputers`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`purchased`		TEXT NOT NULL,
	`decomissioned`		TEXT
);

CREATE TABLE `Employees` (
	`idEmployees`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`first_name`	TEXT NOT NULL,
	`last_name`	TEXT NOT NULL,
	`type` TEXT NOT NULL,
	`idDepartments` INTEGER NOT NULL,
	FOREIGN KEY(`idDepartments`) REFERENCES `Employees`(`idEmployees`)
);

CREATE TABLE `EmployeesComputers` (
	`idEmployeesComputers`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`idEmployees`	INTEGER NOT NULL,
	`idComputers`	INTEGER NOT NULL,
	FOREIGN KEY(`idEmployees`) REFERENCES `Employees`(`idEmployees`),
	FOREIGN KEY(`idComputers`) REFERENCES `Computers`(`idComputers`)
);

CREATE TABLE `Departments` (
	`idDepartments` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	TEXT NOT NULL,
	`expense_budget`	REAL NOT NULL,
	`supervisor`	TEXT NOT NULL
);

CREATE TABLE `TrainingPrograms` (
	`idTrainingPrograms` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	TEXT NOT NULL,
	`start_date`	TEXT NOT NULL,
	`end_date`	TEXT NOT NULL,
	`max_attendees`	INTEGER NOT NULL
);

CREATE TABLE `EmployeesTrainingPrograms` (
	`idEmployeesTrainingPrograms` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`idEmployees`	INTEGER NOT NULL,
	`idTrainingPrograms`	INTEGER NOT NULL,
	FOREIGN KEY(`idEmployees`) REFERENCES `Employees`(`idEmployees`),
	FOREIGN KEY(`idTrainingPrograms`) REFERENCES `TrainingPrograms`(`idTrainingPrograms`)
);

CREATE TABLE `ProductTypes` (
	`idProductTypes` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`description`	TEXT NOT NULL
);

CREATE TABLE `Products` (
	`idProducts`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`description`	TEXT NOT NULL,
	`price`		REAL NOT NULL,
	`title`		TEXT NOT NULL,
	`idProductTypes`	INTEGER NOT NULL,
	FOREIGN KEY(`idProductTypes`) REFERENCES `Products`(`idProductTypes`)
);

CREATE TABLE `Accounts` (
	`idAccounts`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`date_created`	TEXT NOT NULL,
	`status_active`	TEXT NOT NULL
);

CREATE TABLE `Customers` (
	`idCustomers`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`date_purchased`	TEXT NOT NULL,
	`first_name`	TEXT NOT NULL,
	`last_name`	TEXT NOT NULL,
	`idAccounts`	INTEGER NOT NULL,
	FOREIGN KEY(`idAccounts`) REFERENCES `Accounts`(`idAccounts`)	
);

CREATE TABLE `ProductsCustomers` (
	`idProductsCustomers`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`idProducts`	INTEGER NOT NULL,
	`idCustomers`	INTEGER NOT NULL,
	FOREIGN KEY(`idProducts`) REFERENCES `Products`(`idProducts`),
	FOREIGN KEY(`idCustomers`) REFERENCES `Customers`(`idCustomers`)
);

CREATE TABLE `PaymentTypes` (
	`idPaymentTypes`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`description`	TEXT NOT NULL,
	`account`	TEXT NOT NULL
);

CREATE TABLE `Orders` (
	`idOrders`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`time_ordered`	TEXT NOT NULL,
	`idPaymentTypes`	INTEGER NOT NULL,
	`idCustomers`	INTEGER NOT NULL,
	FOREIGN KEY(`idPaymentTypes`) REFERENCES `PaymentTypes`(`idPaymentTypes`),
	FOREIGN KEY(`idCustomers`) REFERENCES `Customers`(`idCustomers`)
);



/*
INSERT INTO Superhero VALUES (null, 'Green Lantern', 'M', 'Green Room', 'Green');
INSERT INTO Superhero VALUES (null, 'Wonder Woman', 'F', 'Themyscira', 'Blue, Gold, Red');
INSERT INTO Superhero VALUES (null, 'Batman', 'M', 'Bat Cave', 'Grey');

INSERT INTO Sidekick  
  SELECT null, 'Robin', 'M', 'Neerdowell', SuperheroId
  FROM Superhero s
  WHERE s.Name = 'Batman';
 */