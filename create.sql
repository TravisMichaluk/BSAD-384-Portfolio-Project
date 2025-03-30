DROP TABLE IF EXISTS MayQualifyFor;
DROP TABLE IF EXISTS CartItems; 
DROP TABLE IF EXISTS FoodItem; 
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS GovSupportProgram; 
DROP TABLE IF EXISTS Retailers; 
DROP TABLE IF EXISTS Province;

CREATE TABLE Customer (
    CustomerID INT, 
    Lname VARCHAR(25),
    Fname VARCHAR(25),
    IncomeLevel NUMERIC(12, 2),
    ProvCode VARCHAR(15),
    PRIMARY KEY (CustomerID),
    FOREIGN KEY (ProvCode) REFERENCES Province(ProvCode));

CREATE TABLE FoodItem (
    ItemID INT,
    Price NUMERIC(10, 2),
    PriceChangeLastYear NUMERIC(4, 2),
    Name VARCHAR(25),
    Category VARCHAR(100),
    RetailerID INT,
    PRIMARY KEY (ItemID),
    FOREIGN KEY (RetailerID) REFERENCES Retailers(RetailerID));

CREATE TABLE Retailers (
	RetailerID INT,
	RetName VARCHAR (100),
	RetLocation VARCHAR (100),
	PRIMARY KEY (ReatailerID));


CREATE TABLE Province (
	ProvCode VARCHAR (15),
	AvgIncome NUMERIC (12,2),
	PRIMARY KEY ( ProvCode ));


CREATE TABLE MayQualifyFor (
	CustomerID INT,
	ProgName VARCHAR (100),
	PRIMARY KEY (CustomerID, ProgName), 
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID), 
	FOREIGN KEY (ProgName) REFERENCES GovSupportProgram(ProgName));


CREATE TABLE GovSupportProgram (
    ProgName VARCHAR(100) PRIMARY KEY,
    Criteria VARCHAR(250),
    BenefitAmount DECIMAL(10,2));

CREATE TABLE CartItems (
    CartItemID INT,
    Date DATE,
    Quantity INT,
    CustomerId INT,
    ItemID INT,
    PRIMARY KEY (CartItemID),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ItemID) REFERENCES FoodItem (ItemID));

