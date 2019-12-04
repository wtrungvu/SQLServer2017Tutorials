-- https://youtu.be/2hhmkLgnwxg

-- run ssms.exe in command line

CREATE LOGIN MyLogin WITH PASSWORD='123456';
DROP LOGIN MyLogin;
DROP DATABASE sqltutorials;

-- ============================ Create DB ============================
CREATE DATABASE sqltutorials;
USE sqltutorials;
-- ===================================================================

BACKUP DATABASE sqltutorials TO DISK = 'c:\mssql\sqltutorials.bak';
RESTORE DATABASE sqltutorials FROM DISK = 'c:\mssql\sqltutorials.bak';

-- DROP USER hoangnd;
-- CREATE USER hoangnd for login MyLogin;

DROP TABLE Customers;

-- IDENTITY = Auto Increment (+1)
-- ============================ Customers Table ============================
CREATE TABLE Customers
    (
      CustomerID INT NOT NULL
                     IDENTITY
                     PRIMARY KEY ,
      CustomerName VARCHAR(300) ,
      Address VARCHAR(1000) ,
      Phone VARCHAR(20) ,
      City VARCHAR(150) ,
      Country VARCHAR(200),
    );
-- =========================================================================

-- ============================ Insert Value of Customers Table ============================
INSERT  INTO Customers
        ( CustomerName ,
          Address ,
          Phone ,
          City ,
          Country
        )
VALUES  ( 'Thomas Hardy' ,
          '120 Hanover Sq' ,
          '0123-456-789' ,
          'London' ,
          'UK'
        );
INSERT  INTO Customers
        ( CustomerName ,
          Address ,
          Phone ,
          City ,
          Country
        )
VALUES  ( 'Ann Devon' ,
          '35 King George' ,
          '0234-458-417' ,
          'Madrid' ,
          'Spain'
        );
INSERT  INTO Customers
        ( CustomerName ,
          Address ,
          Phone ,
          City ,
          Country
        )
VALUES  ( 'Maria Larsson' ,
          'Åkergatan 24' ,
          '0111-456-325' ,
          'Bräcke' ,
          'Sweden'
        );
INSERT  INTO Customers
        ( CustomerName ,
          Address ,
          Phone ,
          City ,
          Country
        )
VALUES  ( 'Christina Berglund' ,
          'Berguvsvägen 8' ,
          '0111-456-325' ,
          'Luleå' ,
          'Sweden'
        );
INSERT  INTO Customers
        ( CustomerName ,
          Address ,
          Phone ,
          City ,
          Country
        )
VALUES  ( 'André Fonseca' ,
          'Av. Brasil, 442' ,
          '0333-142-687' ,
          'Campinas' ,
          'Brazil'
        );
INSERT  INTO Customers
        ( CustomerName ,
          Address ,
          Phone ,
          City ,
          Country
        )
VALUES  ( 'Lehmanns Marktstand' ,
          'Magazinweg 7' ,
          '0222-596-977' ,
          'Frankfurt' ,
          'Germany'
        );
-- ==========================================================================================

-- ============================ List all records of Customers Table ============================
SELECT  *
FROM    Customers;
-- =============================================================================================

-- ============================ Display one or some specific fields ============================
SELECT  CustomerName ,
        Phone ,
        City ,
        Country
FROM    Customers;
-- =============================================================================================

-- ============================ Distinct = Remove duplicate records ============================
SELECT DISTINCT
        ( Country )
FROM    Customers;
-- =============================================================================================

-- ============================ Count + Distinct ============================
SELECT  COUNT(DISTINCT ( Country ))
FROM    Customers;
-- ==========================================================================

-- ============================ WHERE = Use like condition ============================
SELECT  *
FROM    Customers
WHERE   Country = 'Sweden';
-- ====================================================================================

-- ============================ BETWEEN => CustomerID = [1,2,3] ============================
SELECT  *
FROM    Customers
WHERE   CustomerID BETWEEN 1 AND 3;
-- =========================================================================================

-- ============================ AND ============================
SELECT  *
FROM    Customers
WHERE   Country = 'Sweden'
        AND City = 'Luleå';
-- =============================================================

-- ============================ OR ============================
SELECT  *
FROM    Customers
WHERE   Country = 'Germany'
        OR Country = 'Spain';
-- ============================================================

-- ============================ NOT ============================
SELECT  *
FROM    Customers
WHERE   NOT CustomerID = 1;
-- =============================================================

-- ============================ Order by Ascending: From a-z ============================
SELECT  *
FROM    Customers
ORDER BY Country;
-- ======================================================================================

-- ============================ Order by Descending: From z-a ============================
SELECT  *
FROM    Customers
ORDER BY Country DESC;
-- =======================================================================================

-- ============================ Add new value for Customers table, but country is null ============================
INSERT  INTO Customers
        ( CustomerName ,
          Address ,
          Phone ,
          City ,
          Country
        )
VALUES  ( 'John Steel' ,
          '12 Orchestra Terrace' ,
          '0222-596-977' ,
          'Walla Walla' ,
          NULL
        );
-- ================================================================================================================

-- ============================ NULL = Has no value ============================
-- List all records is "null" of Customers Table
SELECT  *
FROM    Customers
WHERE   Country IS NULL;
-- =============================================================================

-- ============================ List all records is NOT "null" of Customers Table ============================
SELECT  *
FROM    Customers
WHERE   Country IS NOT NULL;
-- ===========================================================================================================

-- ============================ Update a record??? ============================
-- Check Customer has ID = 1
SELECT  *
FROM    Customers
WHERE   CustomerID = 1;
-- ============================================================================

-- ============================ Update record customer has ID = 1 ============================
UPDATE  Customers
SET     CustomerName = 'Thomas Hardy A' ,
        City = 'England'
WHERE   CustomerID = 1;
-- ===========================================================================================

-- DELETE FROM Customers WHERE ;


-- ============================ Get top 4 record? ============================
SELECT TOP 4
        *
FROM    Customers;
-- ===========================================================================

-- ============================ Get 50% record of table? ============================
SELECT TOP 50 PERCENT
        *
FROM    Customers;
-- ==================================================================================

-- ============================ m% = Start with 'm' or 'M' ============================
SELECT  *
FROM    Customers
WHERE   CustomerName LIKE 'm%';
-- ====================================================================================

-- ============================ %d = End with 'd' or 'D' ============================
SELECT  *
FROM    Customers
WHERE   CustomerName LIKE '%d';
-- ==================================================================================

-- ============================ %_%_% = Has at least 2 characters ============================
SELECT  *
FROM    Customers
WHERE   CustomerName LIKE '%_%_%';
-- ===========================================================================================

-- ============================ [ace]% = Contains at least one of characters a,c,e ============================
SELECT  *
FROM    Customers
WHERE   CustomerName LIKE '[ace]%';
-- ============================================================================================================

-- ============================ [a-e]% = Contains at least one of characters a -> e ============================
SELECT  *
FROM    Customers
WHERE   CustomerName LIKE '[a-e]%';
-- =============================================================================================================

-- ============================ [a-e]% = Contains at least one of characters a -> e , but query use NOT LIKE = Reverse query result ============================
SELECT  *
FROM    Customers
WHERE   CustomerName NOT LIKE '[a-e]%';
-- =============================================================================================================================================================

-- ============================ Country is "Brazil" or "Sweden" ============================
SELECT  *
FROM    Customers
WHERE   Country IN ( 'Brazil', 'Sweden' );
-- =========================================================================================

-- ============================ Suppliers Table ============================
DROP TABLE Suppliers;
CREATE TABLE Suppliers
    (
      SupplierID INT NOT NULL
                     IDENTITY
                     PRIMARY KEY ,
      SupplierName VARCHAR(400) ,
      ContactName VARCHAR(400) ,
      Address VARCHAR(1000) ,
      Phone VARCHAR(20) ,
      City VARCHAR(150) ,
      Country VARCHAR(200)
    );
-- ==========================================================================

-- ============================ Show all tables of your database ============================
SELECT  *
FROM    sys.tables;
-- ==========================================================================================

-- ============================ Insert values of Suppliers table ============================
-- " = Single quote(')
INSERT  INTO Suppliers
        ( SupplierName ,
          ContactName ,
          Address ,
          Phone ,
          City ,
          Country
        )
VALUES  ( 'Pavlova, Ltd' ,
          'Ian Devling' ,
          '74 Rose St. Moonie Ponds' ,
          '(03) 444-2343' ,
          'Melbourne' ,
          'Australia'
        );
INSERT  INTO Suppliers
        ( SupplierName ,
          ContactName ,
          Address ,
          Phone ,
          City ,
          Country
        )
VALUES  ( 'G''s day' ,
          'Wendy Mackenzie' ,
          '170 Prince Edward Parade Hunter''s Hill' ,
          '(02) 555-5914' ,
          'Sydney' ,
          'Australia'
        );
INSERT  INTO Suppliers
        ( SupplierName ,
          ContactName ,
          Address ,
          Phone ,
          City ,
          Country
        )
VALUES  ( 'New Orleans Cajun Delights' ,
          'Shelley Burke' ,
          'P.O. Box 78934' ,
          '(03) 444-2343' ,
          'New Orleans' ,
          'USA'
        );
INSERT  INTO Suppliers
        ( SupplierName ,
          ContactName ,
          Address ,
          Phone ,
          City ,
          Country
        )
VALUES  ( 'Svensk Sjöföda AB' ,
          'Michael Björn' ,
          'Brovallavägen 231' ,
          '08-123 45 67' ,
          'Melbourne' ,
          'Sweden'
        );
INSERT  INTO Suppliers
        ( SupplierName ,
          ContactName ,
          Address ,
          Phone ,
          City ,
          Country
        )
VALUES  ( 'Karkki Oy' ,
          'Anne Heikkonen' ,
          'Valtakatu 12' ,
          '(953) 10956' ,
          'Lappeenranta' ,
          'Finland'
        );
INSERT  INTO Suppliers
        ( SupplierName ,
          ContactName ,
          Address ,
          Phone ,
          City ,
          Country
        )
VALUES  ( 'Escargots Nouveaux' ,
          'Marie Delamare' ,
          '22, rue H. Voiron' ,
          '85.57.00.07' ,
          'Montceau' ,
          'France'
        );
INSERT  INTO Suppliers
        ( SupplierName ,
          ContactName ,
          Address ,
          Phone ,
          City ,
          Country
        )
VALUES  ( ' Leka Trading' ,
          'Chandra Leka' ,
          '471 Serangoon Loop, Suite #402' ,
          '555-8787' ,
          'Singapore' ,
          'Singapore'
        );
-- ===========================================================================================

-- ============================ Categories Table ============================
DROP TABLE Categories;
CREATE TABLE Categories
    (
      CategoryID INT NOT NULL
                     IDENTITY
                     PRIMARY KEY ,
      CategoryName VARCHAR(400) ,
      Description TEXT
    );
-- ===========================================================================

-- ============================ Insert values of Categories table ============================
INSERT  INTO Categories
        ( CategoryName ,
          Description
        )
VALUES  ( 'Beverages' ,
          'Soft drinks, beer, coffee, tea'
        );
INSERT  INTO Categories
        ( CategoryName ,
          Description
        )
VALUES  ( 'Seafood' ,
          'Fish, crabs, oysters'
        );
INSERT  INTO Categories
        ( CategoryName ,
          Description
        )
VALUES  ( 'Cereals' ,
          'Bread, cereals, corn'
        );
INSERT  INTO Categories
        ( CategoryName ,
          Description
        )
VALUES  ( 'Confections' ,
          'Candies, and sweet breads'
        );
INSERT  INTO Categories
        ( CategoryName ,
          Description
        )
VALUES  ( 'Electronics' ,
          'Laptop, desktop, iphone, ipad, macbook'
        );
-- ===========================================================================================

-- ============================ Products Table ============================
DROP TABLE Products;
CREATE TABLE Products
    (
      ProductID INT NOT NULL
                    IDENTITY
                    PRIMARY KEY ,
      ProductName VARCHAR(400) ,
      SupplierID INT ,
      CategoryID INT ,
      Unit VARCHAR(250) ,
      Price FLOAT,
    );
-- =========================================================================

-- ============================ Insert values of Products table ============================
INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Chocolade' ,
          2 ,
          4 ,
          'boxes' ,
          12
        );
INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Macbook pro 15.4 inches 2017' ,
          2 ,
          6 ,
          'boxes' ,
          2200
        );
INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Ipad mini 2014' ,
          2 ,
          6 ,
          'pieces' ,
          712.35
        );
INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Japanese seafood sushi' ,
          7 ,
          2 ,
          'dishes' ,
          25.5
        );
INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Beer 555' ,
          3 ,
          1 ,
          'cups' ,
          12
        );
INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Bird-watching Coffee' ,
          4 ,
          4 ,
          'cups' ,
          10.2
        );
INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Schoggi Schokolade' ,
          5 ,
          4 ,
          'cups' ,
          12
        );
INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Northwoods Cranberry Sauce' ,
          5 ,
          2 ,
          'jars' ,
          12
        );
-- ==========================================================================================

-- ============================ Find all records SupplierID = 2 of Product table ============================
SELECT  *
FROM    Products
WHERE   SupplierID = 2;
-- ==========================================================================================================

-- ============================ Show Price of Products ============================
SELECT Price
FROM dbo.Products
-- ================================================================================

-- ============================ Find a min price of Products ============================
SELECT  MIN(Price)
FROM    Products;
-- ======================================================================================

-- ============================ Find a max price of Products, but set name of new field has name "Highest price" ============================
-- AS ... = After AS is "Alias name"
SELECT  MAX(Price) AS "Highest price"
FROM    Products;
-- ==========================================================================================================================================

-- ============================ Average Price of Products ============================
SELECT  AVG(Price) AS "Average Price"
FROM    Products;
-- ===================================================================================

-- ============================ Sum Price of Products ============================
SELECT  SUM(Price) AS "Sum"
FROM    Products;
-- ===============================================================================

-- ============================ Combine Price & Count ============================
SELECT  SUM(Price) AS "Sum" ,
        COUNT(*) AS "Number of Products"
FROM    Products;
-- ===============================================================================

-- ============================ INNER JOIN = GET records that exist in both "Categories" and "Products" ============================
-- Show all records Categories
SELECT  *
FROM    Categories

-- Show all records Products
SELECT  *
FROM    Products

--inner join 1-n
SELECT  Categories.* ,
        Products.*
FROM    Categories
        INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
ORDER BY Categories.CategoryID;
-- ==================================================================================================================================

-- ============================ LEFT JOIN = GET records that exist in ("Categories" AND "Products") OR "Categories" ============================
-- Show all records Categories
SELECT  *
FROM    Categories

-- Show all records Products
SELECT  *
FROM    Products

--left join 1-n
SELECT  Categories.* ,
        Products.*
FROM    Categories
        LEFT JOIN Products ON Categories.CategoryID = Products.CategoryID
ORDER BY Categories.CategoryID;
-- =============================================================================================================================================

-- ============================ RIGHT JOIN = GET records that exist in ("Categories" AND "Products") OR "Products" ============================
-- Show all records Categories
SELECT  *
FROM    Categories

-- Show all records Products
SELECT  *
FROM    Products

--right join 1-n
SELECT  Categories.* ,
        Products.*
FROM    Categories
        RIGHT JOIN Products ON Categories.CategoryID = Products.CategoryID
ORDER BY Categories.CategoryID;
-- ============================================================================================================================================

-- ============================ FULL OUTER JOIN = GET records that exist in "Categories" OR "Products" ============================
-- Show all records Categories
SELECT  *
FROM    Categories

-- Show all records Products
SELECT  *
FROM    Products

--full outer join 1-n
SELECT  Categories.* ,
        Products.*
FROM    Categories
        FULL OUTER JOIN Products ON Categories.CategoryID = Products.CategoryID
ORDER BY Categories.CategoryID;
-- =================================================================================================================================

-- ============================ INNER JOIN N-1 ============================
-- Show all records Products
SELECT  *
FROM    Products

-- Show all records Products
SELECT  *
FROM    Categories

--inner join n-1
SELECT  Products.* ,
        Categories.*
FROM    Products
        INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
ORDER BY Products.ProductID;
-- =========================================================================

-- ============================ Union??? ============================
-- Table "Supliers" has "Country" field
-- Show all records Suppliers
SELECT  *
FROM    Suppliers

-- Show all records Customers
SELECT  *
FROM    Customers

--union
SELECT  Suppliers.Country
FROM    Suppliers
UNION
SELECT  Customers.Country
FROM    Customers
ORDER BY Country;
-- ===================================================================

-- ============================ UNION ALL??? SHOW DUPLICATES ============================
-- Show all records Suppliers
SELECT  *
FROM    Suppliers

-- Show all records Products
SELECT  *
FROM    Customers

--union all => show duplicates
SELECT  Suppliers.Country
FROM    Suppliers
UNION
SELECT  Customers.Country
FROM    Customers
ORDER BY Country;
-- =======================================================================================

-- ============================ having = "WHERE" of "GROUP BY" ============================
-- Show all records Customers
SELECT  *
FROM    Customers

--group by
SELECT  COUNT(Customers.CustomerID) ,
        Customers.Country
FROM    Customers
GROUP BY Customers.Country
HAVING  Customers.Country IS NOT NULL;
-- ========================================================================================

-- ============================ EXISTS = Must have at 1 record in Result =============================
-- Show all records Suppliers
SELECT  *
FROM    Suppliers

-- EXISTS
SELECT  Suppliers.*
FROM    Suppliers
WHERE   EXISTS ( SELECT ProductName
                 FROM   Products
                 WHERE  SupplierID = Suppliers.SupplierID
                        AND Price > 1000 );
-- ===================================================================================================
 
-- ============================ CLONE A TABLE ============================
-- Clone Products table
DROP TABLE ProductsBackup

SELECT  Products.*
INTO    ProductsBackup
FROM    Products;

-- Show Products table clone
SELECT  *
FROM    ProductsBackup

-- Clone Customers table
DROP TABLE CustomersBackup

SELECT  Customers.*
INTO    CustomersBackup
FROM    Customers

-- Show Customers table clone
SELECT  *
FROM    CustomersBackup


-- Clone Customers table but ONLY Customers has country = 'Sweden'
DROP TABLE CustomersBackup

SELECT  Customers.*
INTO    CustomersBackup
FROM    Customers
WHERE   Customers.Country = 'Sweden';

-- Show Customers table clone
SELECT  *
FROM    CustomersBackup
-- ========================================================================

-- ============================  clone a backup table with no-data ============================
DROP TABLE ProductsBackup

-- 2 = 3 : This must be False
-- clone a backup table with no-data
SELECT  Products.*
INTO    ProductsBackup
FROM    Products
WHERE   2 = 3;

SELECT  *
FROM    ProductsBackup;
-- ============================================================================================

-- ============================ backup using "insert into" ============================
DROP TABLE ProductsBackup

INSERT  INTO ProductsBackup
        ( ProductName ,
          Price
        )
        SELECT  Products.ProductName ,
                Products.Price
        FROM    Products;

SELECT *
FROM ProductsBackup
-- ====================================================================================

-- ============================ case when (Edit when display records) ============================
SELECT  Products.* ,
        CASE WHEN Products.Price > 10 THEN 'Price: greater than 10'
             WHEN Products.Price > 100 THEN 'Price: greater than 100'
             ELSE 'Price: under 10'
        END AS TextPrice
FROM    Products;

SELECT *
FROM Products
-- ================================================================================================

-- ============================ SHOW ALL TABLE IN YOUR CURRENT DB ============================
SELECT *
FROM sys.tables
--============================================================================================



-- ============================ NOTICE ============================
-- One Customer can make many Orders
-- One Shipper can serve many Orders
-- One Order can have many OrderDetails
-- 1 Employee can handle many Orders
-- ================================================================



-- ======================================================== ORDER TABLE ========================================================
-- One Customer can make many Orders

--sell and deliver products:
--A customer meet one of my company's employee and order product.A shipper will deliver product to customer's house
DROP TABLE Orders;
CREATE TABLE Orders
    (
      OrderID INT NOT NULL
                  IDENTITY
                  PRIMARY KEY ,
      CustomerID INT ,
      EmployeeID INT ,
      OrderDate DATETIME ,
      ShipperID INT, 
    );
-- ============================================================================================================================

-- ============================ SHIPPERS TABLE ============================
-- One Shipper can serve many Orders

DROP TABLE Shippers;
CREATE TABLE Shippers
    (
      ShipperID INT NOT NULL
                    IDENTITY
                    PRIMARY KEY ,
      ShipperName VARCHAR(400) ,
      Phone VARCHAR(20) ,
      Description TEXT
    );
-- ========================================================================

-- ============================ INSERT VALUE OF SHIPPERS TABLE ============================
INSERT  INTO Shippers
        ( ShipperName ,
          Phone ,
          Description
        )
VALUES  ( 'Grab' ,
          '(123)-456-789' ,
          'Install Grab in App Store and call'
        );
INSERT  INTO Shippers
        ( ShipperName ,
          Phone ,
          Description
        )
VALUES  ( 'Speedy Express' ,
          '(503) 555-9831' ,
          'Deliver very fast'
        );
INSERT  INTO Shippers
        ( ShipperName ,
          Phone ,
          Description
        )
VALUES  ( 'Federal Shipping' ,
          '(500) 555-9931' ,
          'Deliver with low cost'
        );
-- =========================================================================================

-- ============================ EMPLOYEES TABLE ============================
-- 1 Employee can handle many Orders

DROP TABLE Employees;
CREATE TABLE Employees
    (
      EmployeeID INT NOT NULL
                     IDENTITY
                     PRIMARY KEY ,
      FullName VARCHAR(400) ,
      DateOfBirth DATETIME ,
      Notes TEXT
    );
-- ==========================================================================

-- ============================ ORDER DETAILS TABLE ============================
-- One Order can have many OrderDetails

DROP TABLE OrderDetails;
CREATE TABLE OrderDetails
    (
      OrderDetailID INT NOT NULL
                        IDENTITY
                        PRIMARY KEY ,
      OrderID INT ,
      ProductID INT ,
      Quantity INT
    );
-- ==============================================================================

-- ============================ SHOW ALL TABLE IN YOUR CURRENT DB ============================
SELECT *
FROM sys.tables
--============================================================================================



-- Vid2
-- https://youtu.be/5AeZyWZjkyk



-- ============================ How to make constraints "foreign keys" between Categories and Products ? ============================
-- Making constraints has 2 types:
-- 1. Drop and recreate Products table
-- 2. Use Alter table...

-- I will using type 1: Drop and recreate Products table

DROP TABLE Products;
CREATE TABLE Products
    (
      ProductID INT NOT NULL
                    IDENTITY
                    PRIMARY KEY ,
      ProductName VARCHAR(400) ,
      SupplierID INT ,
      CategoryID INT ,
      Unit VARCHAR(250) ,
      Price FLOAT ,

	  -- 1 Category has N Products
      CONSTRAINT FK_CategoryProduct 
	  FOREIGN KEY ( CategoryID ) 
	  REFERENCES Categories ( CategoryID )
    --CONSTRAINT Check_Product CHECK (Price>=0 AND Price<=2000)
    );

SELECT *
FROM Products
-- ==================================================================================================================================

-- ============================ INSERT VALUE INTO Products TABLE (To Test Constraint 1) ============================

-- This CategoryID(4) exist in Categories Table
-- You can insert normally
INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Chocolade' ,
          2 ,
          4 ,
          'boxes' ,
          12
        );

-- Check Categories table but CategoryID = 4
SELECT *
FROM Categories
WHERE CategoryID = 4
-- ==================================================================================================================

-- ============================ INSERT VALUE INTO Products TABLE (To Test Constraint 2) ============================

-- This CategoryID(6) does not exist Categories Table
-- You can NOT insert
-- This will display error about FOREIGN KEY constraint => Constraint Violation
INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Macbook pro 15.4 inches 2017' ,
          2 ,
          6 ,
          'boxes' ,
          2200
        );

-- CategoryID = 6 is not exist
SELECT  *
FROM    Categories
WHERE   CategoryID = 6
-- ================================================================================================================

-- ============================ USING ALTER TABLE TO CREATE CONSTRAINTS ============================
-- I will using type 2: Use Alter table...

-- DROP OLD CONSTRAINT
ALTER TABLE Products
DROP CONSTRAINT FK_CategoryProduct;

-- DO NOT NEED TO CREATE Products Table

-- USING ALTER TABLE TO CREATE CONSTRAINTS
ALTER TABLE Products
ADD CONSTRAINT FK_CategoryProduct
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

-- TESTING CONSTRAINT
-- THIS QUERY WILL SHOW ERROR BECAUSE WE HAVE CONSTRAINT FK_CategoryProduct
INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Ipad mini 2014' ,
          2 ,
          6 ,
          'pieces' ,
          712.35
        );

-- CategoryID = 6 is not exist
SELECT  *
FROM    Categories
WHERE   CategoryID = 6
-- ==============================================================================================

-- ============================ Constraints of Products Table ============================

-- This is a "check" constraint
ALTER TABLE Products
ADD CONSTRAINT Check_Product CHECK (Price>=0 AND Price<=2000);

-- TESTING CONSTRAINT
-- This "Price = 2001" > 2000 => Violate Check_Product
INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Japanese seafood sushi' ,
          7 ,
          2 ,
          'dishes' ,
          2001
        );

--Modify to:
-- This "Price = 25.5" <= 2000 => Meet Check_Product Constraint => Add Record Successful
INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Japanese seafood sushi' ,
          7 ,
          2 ,
          'dishes' ,
          25.5
        );
-- =======================================================================================

SELECT  *
FROM    INFORMATION_SCHEMA.COLUMNS
WHERE   TABLE_NAME = 'Products'


-- ============================ Now Constraint: Each product must have an "UNIQUE" name ============================
-- UNIQUE CONSTRAINT
ALTER TABLE Products
ADD CONSTRAINT UN_Product UNIQUE (ProductName);

-- TESTING CONSTRAINT
-- Insert the first time => Successful
-- Insert the second time => failed, because "Beer 555" exists
INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Beer 555' ,
          3 ,
          1 ,
          'cups' ,
          12
        );


INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Bird-watching Coffee' ,
          4 ,
          4 ,
          'cups' ,
          10.2
        );
INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Schoggi Schokolade' ,
          5 ,
          4 ,
          'cups' ,
          12
        );
INSERT  INTO Products
        ( ProductName ,
          SupplierID ,
          CategoryID ,
          Unit ,
          Price
        )
VALUES  ( 'Northwoods Cranberry Sauce' ,
          5 ,
          2 ,
          'jars' ,
          12
        );


-- ============================ datetime values ============================
INSERT  INTO Employees
        ( FullName ,
          DateOfBirth ,
          Notes
        )
VALUES  ( 'Margaret Fuller' ,
          '1994-10-25' ,
          'He is in sales department'
        );

-- CHECKING EMPLOYEES TABLE TO SHOW DATETIME
SELECT *
FROM dbo.Employees
-- ==========================================================================

-- ============================ default date ============================
-- Get this "current Date" if NULL
ALTER TABLE Orders
ADD CONSTRAINT DF_OrderDate 
DEFAULT GETDATE() FOR OrderDate;

-- TESTING CONSTRAINT
-- I deliberately did not add OrderDate
INSERT  INTO Orders
        ( CustomerID, EmployeeID, ShipperID )
VALUES  ( 2, 1, 3 );

-- CHECKING OrderDate
-- OrderDate will get "current Date" automatically
SELECT  *
FROM    Orders;
-- ======================================================================


-- ============================ TRIGGER = "functions" which are called after insert, update, deleted, ... ============================
-- DELETE TRIGGER
DROP TRIGGER trg_UpdateProduct;

-- CREATE TRIGGER HERE
-- Call after calling "update Product"
CREATE TRIGGER trg_UpdateProduct 
ON Products AFTER UPDATE AS
DECLARE @Price AS FLOAT
SET @Price = (SELECT TOP 1 Price FROM Products WHERE Price<0)
IF @Price < 0
BEGIN
    RAISERROR  ('Cannot update negative Price',16,10);
    ROLLBACK
END

-- Line: RAISERROR  ('Cannot update negative Price',16,10);
-- 16: severity level = mức độ nghiêm trọng = 11->20 = error
-- 10: error state = 0->255

-- TESTING TRIGGER trg_UpdateProduct ?
SELECT * FROM dbo.Products

-- We will test trigger by update record ProductID = 5 has Price=25.5
-- Try to set a "negative" price
-- It query update will show error conflict "the trigger"
UPDATE Products 
SET Price=-2.2
WHERE ProductID=5;
-- ===================================================================================================================================

ALTER TABLE Products
DROP CONSTRAINT Check_Product;



-- ============================ Add "counts" field to Categories ============================
SELECT * FROM dbo.Categories

-- Add "counts" field to Categories
ALTER TABLE Categories
ADD counts INT;

--update NULL to 0
UPDATE Categories
SET Categories.counts=0
WHERE Categories.counts is NULL;

-- Checking
SELECT * FROM dbo.Categories

-- DELETE "counts" field to Categories
ALTER TABLE Categories
DROP COLUMN counts;
-- ==========================================================================================

-- ============================ TRIGGER trg_InsertProduct ============================
-- DELETE TRIGGER
DROP TRIGGER trg_InsertProduct;

-- CREATE TRIGGER HERE
CREATE TRIGGER trg_InsertProduct 
ON Products AFTER INSERT AS
DECLARE @CategoryID AS INT
BEGIN

    set @CategoryID=(select CategoryID from inserted) -- inserted: It mean Inserted product
    UPDATE Categories
    SET counts = counts+1
    WHERE CategoryID = @CategoryID;
END

-- How to test this trigger?
-- TESTING TRIGGER 1
INSERT INTO Products(ProductName, SupplierID, CategoryID, Unit, Price)
VALUES('Iphone XS Plus', 2,1,'pieces',233);

-- CHECKING 1
SELECT * 
FROM dbo.Categories

-- TESTING TRIGGER 2
INSERT INTO Products(ProductName, SupplierID, CategoryID, Unit, Price)
VALUES('Iphone XS Plus', 2,5,'pieces',233);

-- CHECKING 2
SELECT *
FROM dbo.Products
-- =================================================================================

-- ============================ Constraint: "After delete a Product" ============================
-- DELETE TRIGGER
DROP TRIGGER trg_DeleteProduct;

-- CREATE TRIGGER HERE
CREATE TRIGGER trg_DeleteProduct 
ON Products AFTER DELETE AS
DECLARE @CategoryID AS INT
BEGIN
    set @CategoryID=(select CategoryID from deleted) -- deleted: It mean Deleted product
    UPDATE Categories
    SET counts = counts-1
    WHERE CategoryID = @CategoryID AND counts > 0;
END

--- Test this constraint?
SELECT *
FROM dbo.Products

-- We will delete record "Iphone XS Plus"
SELECT *
FROM dbo.Categories

-- Delete ProductID = 8
DELETE  FROM dbo.Products
WHERE   ProductID = 8

-- And checking
SELECT *
FROM dbo.Products
SELECT *
FROM dbo.Categories
-- ==============================================================================================



-- ============================ Procedure = function without "return value" ============================
--drop a procedure
DROP PROCEDURE IF EXISTS searchProducts;   

--Create a procedure
CREATE PROCEDURE searchProducts
    @NameContain nvarchar(200)
AS   
    SELECT *  
    FROM Products   
    WHERE ProductName LIKE '%'+@NameContain+'%';  
GO 

-- Run a procedure
-- N: It mean Unicode
EXECUTE  searchProducts  N'japanese'
-- =====================================================================================================




-- ========================================= ????? =========================================
DELETE FROM Products
WHERE ProductID=15;

SELECT * FROM Categories;

ALTER TABLE Products
DROP COLUMN ProductionDate;

ALTER TABLE Products
ADD ProductionDate datetime;

DROP TRIGGER trg_InsertProduct2;

CREATE TRIGGER trg_InsertProduct2
ON Products AFTER INSERT AS
DECLARE @ProductionDate AS DATETIME
set @ProductionDate=(SELECT ProductionDate FROM inserted)
IF @ProductionDate > GETDATE()
BEGIN
    RAISERROR ('ProductionDate must be before Today',16,10);
    ROLLBACK
END  

-- =========================================================================================



-- ========================================= Create View, view does not have "ORDER BY" =========================================
-- DELETE VIEW
DROP VIEW view_category_products;

-- CREATE VIEW HERE
CREATE VIEW view_category_products
AS
    SELECT  Categories.CategoryName ,
            Products.ProductName ,
            Products.Price
    FROM    Categories
            INNER JOIN Products ON Categories.CategoryID = Products.CategoryID;

-- CHECKING VIEW view_category_products
SELECT * FROM view_category_products;
-- ==============================================================================================================================


