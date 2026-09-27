USE INVENTORY_2026;
----------------------------------------------------------------------------

SELECT * FROM  SUPPLIER;
SELECT * FROM  PRODUCT;
SELECT * FROM  STOCK;
SELECT * FROM  CUST;
SELECT * FROM  ORDERS;

----------------------------------------------------------------------------
-- NITIN CHAUHAN -- PROJECT -- INVENTORY -- STARTED ON -- 26/SEPTEMBER/2026
----------------------------------------------------------------------------

-- ELECTRONICS INVENTORY IN DETAIL PUT EVERYTHING MANUALLY 

----------------------------------------------------------------------------
-- Q.1) CREATE DISPLAY THE INVENTORY STRUCTURE:
----------------------------------------------------------------------------

--> STEP 1 - -> CREATE DATABASE INVENTORY_2026:-

CREATE DATABASE INVENTORY_2026;
----	----	----	----	----	----	----	----	----	
--> STEP 2 - -> USE DATABASE:-

USE INVENTORY_2026;
----	----	----	----	----	----	----	----	----	
--> STEP 3 - -> CREATE TABLES STRUCTURE:-

								 ---- DATATYPE, SIZE & SEQUENCE: ----

   --> (SUPPLIER TABLE)--++--> (PRODUCT TABLE)--++-->  (STOCK TABLE)--++--> (CUST TABLE)----++-->  (ORDERS TABLE) <--

	-- SID CHAR (5)			-- PID CHAR (5)			-- PID CHAR (5)		-- CID CHAR (5)				--	OID CHAR (5)
	-- SNAME VARCHAR (30)	-- PDESC VARCHAR (60)	-- SQTY INT			-- CNAME VARCHAR (25)		--	ODATE DATE
	-- SADD VARCHAR (50)	-- PRICE DECIMAL(20, 4) -- ROL INT			-- CADDRESS VARCHAR (80)	--	PID CHAR (5) 
	-- SCITY VARCHAR (20)	-- CATEGORY CHAR (2)	-- MOQ INT			-- CCITY VARCHAR (20)		--	CID CHAR (5) 
	-- SPHONE CHAR (15)		-- SID CHAR (5)								-- CPHONE CHAR (15)			--	OQTY INT
	-- EMAIL VARCHAR (50)												-- CEMAIL VARCHAR (50)
																		-- CDOB DATE
----	----	----	----	----	----	----	----	----	

	----> { TABLE 1 SUPPLIER } <----

CREATE TABLE SUPPLIER
(
SID CHAR(5), 
SNAME VARCHAR (30),
SADD VARCHAR (50),
SCITY VARCHAR (20),
SPHONE CHAR (15),
SEMAIL VARCHAR (50)
);
---------------------
SELECT * FROM  SUPPLIER;

	----> { TABLE 2 PRODUCT } <----

CREATE TABLE PRODUCT 
(
PID CHAR (5),
PDESC VARCHAR (60),
PRICE DECIMAL (20, 4),
CATEGORY CHAR (2),
SID CHAR (5)
);
---------------------
SELECT * FROM PRODUCT;

	----> { TABLE 3 STOCK } <----

CREATE TABLE STOCK 

(
PID CHAR(5),
SQTY INT,
ROL INT,
MOQ INT, 
);
---------------------
SELECT * FROM  STOCK;

	----> { TABLE 4 CUST } <----

CREATE TABLE CUST
(
CID CHAR (5), 
CNAME VARCHAR (25),
CADDRESS VARCHAR (80),
CITY VARCHAR (20),
CPHONE CHAR (15),
CEMAIL VARCHAR (50),
CDOB DATE,
);
---------------------
SELECT * FROM  CUST;

	----> { TABLE 5 ORDERS } <----

CREATE TABLE ORDERS
(
OID CHAR(5),
ODATE DATE,	
PID CHAR(5),
CID CHAR(5),
OQTY INT, 
);
---------------------
SELECT * FROM  ORDERS;
----------------------------------------------------------------------------
SELECT * FROM  SUPPLIER;
SELECT * FROM  PRODUCT;
SELECT * FROM  STOCK;
SELECT * FROM  CUST;
SELECT * FROM  ORDERS;
----------------------------------------------------------------------------

--> STEP 4 - -> MANUALLY IMPLEMENTING THE CONSTRAINS ON THE TABLE:-

	--  SUPPLIER SID  SHOULD NOT BE NULL	-- NOT NULL
	--	SUPPLIER NAME SHOULD NOT BE NULL    -- NOT NULL
	--	SUPPLIER SADD SHOULD NOT BE NULL    -- NOT NULL
	--	ADD CONSTRAINT SUPPLIER SCITY SHOULD BE BY DEFAULT DELHI -- DEFAULT
	--	SUPPLIER SPHONE SHOULD BE UNIQUE    -- UNIQUE

	ALTER TABLE SUPPLIER 
	ALTER COLUMN SID CHAR(5) NOT NULL;

	ALTER TABLE SUPPLIER 
	ALTER COLUMN SNAME VARCHAR (30) NOT NULL;

	ALTER TABLE SUPPLIER 
	ALTER COLUMN SADD VARCHAR (50) NOT NULL;

	ALTER TABLE SUPPLIER 
	ALTER COLUMN SCITY VARCHAR (20) NOT NULL;

	ALTER TABLE SUPPLIER 
	ADD CONSTRAINT S1 DEFAULT 'DELHI' FOR SCITY;

	ALTER TABLE SUPPLIER
	ADD CONSTRAINT S2 UNIQUE (SPHONE);

	-- PRODUCT PID SHOULD NOT BE NULL		   -- NOT NULL
	-- PRODUCT PDESC SHOULD NOT BE LEFT BLANK  -- NOT NULL
	-- PRODUCT PRICE SHOULD BE LESS THEN >0    -- CHECK
	-- PRODUCT CATEGORY SHOULD BE (IT,HA,HC)   -- CHECK -- IN OPERATOR

	ALTER TABLE PRODUCT 
	ALTER COLUMN PID CHAR(5) NOT NULL;

	ALTER TABLE PRODUCT 
	ALTER COLUMN PDESC VARCHAR (60) NOT NULL;

	ALTER TABLE PRODUCT
	ADD CONSTRAINT P1 CHECK (PRICE > 0);

	ALTER TABLE PRODUCT 
	ADD CONSTRAINT P2 CHECK (CATEGORY IN ('IT', 'HA', 'HC'));

	-- STOCK SQTY SHOULD BE >=0  -- CHECK
	-- STOCK ROL SHOULD BE >0    -- CHECK
	-- STOCK MOQ SHOULD BE >=5   -- CHECK

	ALTER TABLE STOCK
	ADD CONSTRAINT STK1 CHECK (SQTY >= 0);

	ALTER TABLE STOCK
	ADD CONSTRAINT STK2 CHECK (ROL > 0);

	ALTER TABLE STOCK
	ADD CONSTRAINT STK3 CHECK (MOQ >= 5);
	
	-- CUST CID SHOULD NOT BE NULL		-- NOT NULL
	-- CUST CNAME SHOULD NOT BE NULL    -- NOT NULL
	-- CUST CADDRESS SHOULD NOT BE NULL -- NOT NULL
	-- CUST CCITY SHOULD NOT BE NULL    -- NOT NULL
	-- CUST CPHONE SHOULD NOT BE NULL   -- NOT NULL
	-- CUST CEMAIL SHOULD NOT BE NULL   -- NOT NULL
	-- CUST DOB SHOULD BE LESS THAN     -- < 01-JAN-2000

	ALTER TABLE CUST 
	ALTER COLUMN CID CHAR(5) NOT NULL;

	ALTER TABLE CUST 
	ALTER COLUMN CNAME VARCHAR (25) NOT NULL;
	
	ALTER TABLE CUST 
	ALTER COLUMN CADDRESS VARCHAR (80) NOT NULL;

	ALTER TABLE CUST 
	ALTER COLUMN CITY VARCHAR (20) NOT NULL;
	
	ALTER TABLE CUST 
	ALTER COLUMN CPHONE CHAR (15) NOT NULL;
		
	ALTER TABLE CUST 
	ALTER COLUMN CEMAIL VARCHAR (50) NOT NULL;
	
	ALTER TABLE CUST 
	ADD CONSTRAINT CU1 CHECK (CDOB < '2000-01-01');

	-- ORDERS OID SHOULD NOT BE NULL	-- NOT NULL   
	-- ORDERS OQTY SHOULD BE >=1		-- CHECK

	ALTER TABLE ORDERS 
	ALTER COLUMN OID CHAR(5) NOT NULL;

	ALTER TABLE ORDERS 
	ADD CONSTRAINT ORD1 CHECK (OQTY >=1); 
----	----	----	----	----	----	----	----	----	
--> STEP 5 - - MANULLAY ADDING PRIMARY KEY AND FORIGEN KEY							

				----->		SEQUENCE WOULD BE:- (PARENT & CHILD RELATIONSHIP)		<-----

--> (SUPPLIER TABLE)    -- (PRODUCT TABLE)   -- (STOCK TABLE)   -- (CUST TABLE)     -- (ORDERS TABLE) <--

	-- SID (PK)			-- PID (PK)			 -- PID (FK)		-- CID (PK)		    -- OID (PK)
	-- SNAME			-- PDESC			 -- SQTY		    -- CNAME		    -- ODATE
	-- SADD				-- PRICE			 -- ROL			    -- CADDRESS	 	    -- PID (FK) 
	-- SCITY			-- CATEGORY			 -- MOQ 		    -- CCITY		    -- CID (FK)
	-- SPHONE			-- SID (FK)						 	    -- CPHONE		    -- OQTY 
	-- EMAIL												    -- CEMAIL
															    -- CDOB
	
--> ADDING PRIMARY KEY TO THE ALL REQURIED FIELD:- (ADD 4 PRIMARY KEY)

	-- SUPPLIER TABLE ADD PRIMARY KEY TO SID -- 
	-- PRODUCT  TABLE ADD PRIMARY KEY TO PID -- 
	-- CUST		TABLE ADD PRIMARY KEY TO CID -- 
	-- ORDERS	TABLE ADD PRIMARY KEY TO OID -- 
													
	ALTER TABLE SUPPLIER 
	ADD CONSTRAINT PKS1 PRIMARY KEY (SID);

	ALTER TABLE PRODUCT 
	ADD CONSTRAINT PKP1 PRIMARY KEY (PID);

	ALTER TABLE CUST
	ADD CONSTRAINT PKC1 PRIMARY KEY (CID);

	ALTER TABLE ORDERS 
	ADD CONSTRAINT PKO1 PRIMARY KEY (OID);

--> ADDING FORIGEN KEY TO THE ALL REQURIED FIELD:- (ADD 4 FORIGEN KEY)
	
	-- ADD CONSTRAINT FOREIGN KEY TO [PARENT] SUPPLIER (SID) REFERENCES PRODUCT [CHILD] (SID)
	-- ADD CONSTRAINT FOREIGN KEY TO [PARENT] PRODUCT  (PID) REFERENCES STOCK   [CHILD] (PID)
	-- ADD CONSTRAINT FOREIGN KEY TO [PARENT] PRODUCT  (PID) REFERENCES ORDERS  [CHILD] (PID)
	-- ADD CONSTRAINT FOREIGN KEY TO [PARENT] CUST     (CID) REFERENCES ORDERS  [CHILD] (CID)

	ALTER TABLE PRODUCT 
	ADD CONSTRAINT FKPS1 FOREIGN KEY (SID) REFERENCES SUPPLIER (SID);

	ALTER TABLE STOCK 
	ADD CONSTRAINT FKSP1 FOREIGN KEY (PID) REFERENCES PRODUCT (PID);
	
	ALTER TABLE ORDERS 
	ADD CONSTRAINT FKOP1 FOREIGN KEY (PID) REFERENCES PRODUCT (PID);
	
	ALTER TABLE ORDERS 
	ADD CONSTRAINT FKOC1 FOREIGN KEY (CID) REFERENCES CUST (CID);

----	----	----	----	----	----	----	----	----	
--> STEP 6 - - DATA ENTRY WILL ALWAYS BE THE LAST PART 

-->				INSERTION OF RECORDS:-

	-- 5-10  RECORDS IN SUPPLIER TABLE (SENSABLE RECORDS NO GARBAGE)
	-- 15-20 RECORDS IN PRODUCT TABLE
	-- 10    RECORDS STOCK IN TABLE
	-- 5-10  RECORDS CUST IN TABLE
	-- 5     RECORDS ORDERS IN TABLE
----	----	----	----	----	----	----	----	----		 

				----> { TABLE 1 SUPPLIER } <----

INSERT INTO SUPPLIER (SID, SNAME, SADD, SCITY, SPHONE, SEMAIL) VALUES 
('S0001', 'Global Traders', '12 MG Road', 'Delhi', '9876543210', 'global@traders.com');

INSERT INTO SUPPLIER (SID, SNAME, SADD, SCITY, SPHONE, SEMAIL) VALUES 
('S0002', 'Tech Supplies', '45 Nehru Street', 'Mumbai', '9123456780', 'tech@supplies.com');

INSERT INTO SUPPLIER (SID, SNAME, SADD, SCITY, SPHONE, SEMAIL) VALUES 
('S0003', 'AgroMart', '88 Green Lane', 'Lucknow', '9988776655', 'contact@agromart.in');

INSERT INTO SUPPLIER (SID, SNAME, SADD, SCITY, SPHONE, SEMAIL) VALUES 
('S0004', 'BuildWell Co.', '23 Industrial Area', 'Chennai', '9012345678', 'info@buildwell.com');

INSERT INTO SUPPLIER (SID, SNAME, SADD, SCITY, SPHONE, SEMAIL) VALUES 
('S0005', 'Smart Retailers', '67 Market Road', 'Hyderabad', '9090909090', 'sales@smartretail.com');

INSERT INTO SUPPLIER (SID, SNAME, SADD, SCITY, SPHONE, SEMAIL) VALUES 
('S0006', 'Eco Goods', '21 Eco Park', 'Jaipur', '9345678901', 'support@ecogoods.in');

INSERT INTO SUPPLIER (SID, SNAME, SADD, SCITY, SPHONE, SEMAIL) VALUES 
('S0007', 'Metro Distributors', '101 City Center', 'Kolkata', '9871234567', 'metro@distributors.com');

---------------------
SELECT * FROM  SUPPLIER;
----	----	----	----	----	----	----	----	----		 

				----> { TABLE 2 PRODUCT } <----

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0001', 'Philips Infrared Thermometer', 1499.0000, 'HC', 'S0001');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0002', 'Omron Digital Blood Pressure Monitor', 2499.0000, 'HC', 'S0002');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0003', 'Dr. Trust Pulse Oximeter', 1299.0000, 'HC', 'S0001');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0004', 'Accu-Chek Active Glucometer Kit', 999.0000, 'HC', 'S0002');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0005', 'Dettol Antiseptic Liquid 1L', 199.0000, 'HC', 'S0001');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0006', 'Samsung Galaxy Tab S6 Lite 64GB', 23999.0000, 'IT', 'S0003');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0007', 'Dell Inspiron i5 Laptop 8GB RAM 512GB SSD', 52999.0000, 'IT', 'S0004');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0008', 'HP DeskJet 2331 All-in-One Printer', 4899.0000, 'IT', 'S0003');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0009', 'Logitech Wireless Keyboard & Mouse Combo', 1999.0000, 'IT', 'S0004');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0010', 'TP-Link Wi-Fi Range Extender', 1499.0000, 'IT', 'S0005');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0011', 'LG 7kg Front Load Washing Machine', 28999.0000, 'HA', 'S0006');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0012', 'Samsung 32" Smart LED TV', 15999.0000, 'HA', 'S0007');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0013', 'Voltas 1.5 Ton Split AC', 35999.0000, 'HA', 'S0006');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0014', 'Prestige Electric Kettle 1.5L', 1299.0000, 'HA', 'S0007');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0015', 'Bajaj 750W Mixer Grinder', 2499.0000, 'HA', 'S0006');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0016', 'Havells Room Heater 1200W', 1899.0000, 'HA', 'S0007');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0017', 'Philips Air Purifier AC1215/20', 9999.0000, 'HA', 'S0006');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0018', 'IFB 20L Convection Microwave Oven', 8499.0000, 'HA', 'S0007');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0019', 'Usha Ceiling Fan 1200mm', 2299.0000, 'HA', 'S0006');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0020', 'Kent Water Purifier RO+UV+UF', 14999.0000, 'HA', 'S0007');

---------------------
SELECT * FROM PRODUCT;
----	----	----	----	----	----	----	----	----		 

				----> { TABLE 3 STOCK } <----

INSERT INTO STOCK (PID, SQTY, ROL, MOQ) VALUES
('P0001', 150, 50, 100);

INSERT INTO STOCK (PID, SQTY, ROL, MOQ) VALUES
('P0002', 200, 60, 120);

INSERT INTO STOCK (PID, SQTY, ROL, MOQ) VALUES
('P0003', 75, 25, 50);

INSERT INTO STOCK (PID, SQTY, ROL, MOQ) VALUES
('P0004', 40, 10, 30);

INSERT INTO STOCK (PID, SQTY, ROL, MOQ) VALUES
('P0005', 300, 80, 200);

INSERT INTO STOCK (PID, SQTY, ROL, MOQ) VALUES
('P0006', 180, 45, 100);

INSERT INTO STOCK (PID, SQTY, ROL, MOQ) VALUES
('P0007', 90, 20, 60);

INSERT INTO STOCK (PID, SQTY, ROL, MOQ) VALUES
('P0008', 60, 15, 40);

INSERT INTO STOCK (PID, SQTY, ROL, MOQ) VALUES
('P0009', 160, 35, 100);

INSERT INTO STOCK (PID, SQTY, ROL, MOQ) VALUES
('P0010', 30, 5, 20);

---------------------
SELECT * FROM  STOCK;
----	----	----	----	----	----	----	----	----		 

				----> { TABLE 4 CUST } <----

INSERT INTO CUST (CID, CNAME, CADDRESS, CITY, CPHONE, CEMAIL, CDOB) VALUES
('C0001', 'Ravi Kumar', '22 Civil Lines', 'Delhi', '9812345678', 'ravi.kumar@gmail.com', '1990-05-12');

INSERT INTO CUST (CID, CNAME, CADDRESS, CITY, CPHONE, CEMAIL, CDOB) VALUES
('C0002', 'Sneha Mehta', '14 MG Road', 'Mumbai', '9823456789', 'sneha.mehta@gmail.com', '1988-11-23');

INSERT INTO CUST (CID, CNAME, CADDRESS, CITY, CPHONE, CEMAIL, CDOB) VALUES
('C0003', 'Amit Singh', '78 Park Street', 'Lucknow', '9834567890', 'amit.singh@gmail.com', '1992-03-05');

INSERT INTO CUST (CID, CNAME, CADDRESS, CITY, CPHONE, CEMAIL, CDOB) VALUES
('C0004', 'Priya Sharma', '33 Lake View', 'Jaipur', '9845678901', 'priya.sharma@gmail.com', '1995-07-19');

INSERT INTO CUST (CID, CNAME, CADDRESS, CITY, CPHONE, CEMAIL, CDOB) VALUES
('C0005', 'Vikram Joshi', '56 Hill Road', 'Chennai', '9856789012', 'vikram.joshi@gmail.com', '1985-09-30');

INSERT INTO CUST (CID, CNAME, CADDRESS, CITY, CPHONE, CEMAIL, CDOB) VALUES
('C0006', 'Neha Verma', '89 Garden Lane', 'Hyderabad', '9867890123', 'neha.verma@gmail.com', '1993-12-11');

INSERT INTO CUST (CID, CNAME, CADDRESS, CITY, CPHONE, CEMAIL, CDOB) VALUES
('C0007', 'Anil Kapoor', '101 Sector 9', 'Pune', '9878901234', 'anil.kapoor@gmail.com', '1978-06-22');

INSERT INTO CUST (CID, CNAME, CADDRESS, CITY, CPHONE, CEMAIL, CDOB) VALUES
('C0008', 'Meera Nair', '45 Residency Road', 'Bangalore', '9889012345', 'meera.nair@gmail.com', '1982-02-14');

INSERT INTO CUST (CID, CNAME, CADDRESS, CITY, CPHONE, CEMAIL, CDOB) VALUES
('C0009', 'Rajesh Pillai', '67 Fort Area', 'Kolkata', '9890123456', 'rajesh.pillai@gmail.com', '1996-08-08');

INSERT INTO CUST (CID, CNAME, CADDRESS, CITY, CPHONE, CEMAIL, CDOB) VALUES
('C0010', 'Kavita Desai', '12 Sunrise Apartments', 'Ahmedabad', '9901234567', 'kavita.desai@gmail.com', '1999-04-27');

---------------------
SELECT * FROM  CUST;

----	----	----	----	----	----	----	----	----		 
				----> { TABLE 5 ORDERS } <----

INSERT INTO ORDERS (OID, ODATE, PID, CID, OQTY) VALUES
('O0001', '2025-09-20', 'P0003', 'C0001', 2);

INSERT INTO ORDERS (OID, ODATE, PID, CID, OQTY) VALUES
('O0002', '2025-09-21', 'P0007', 'C0004', 1);

INSERT INTO ORDERS (OID, ODATE, PID, CID, OQTY) VALUES
('O0003', '2025-09-22', 'P0012', 'C0002', 3);

INSERT INTO ORDERS (OID, ODATE, PID, CID, OQTY) VALUES
('O0004', '2025-09-23', 'P0009', 'C0005', 5);

INSERT INTO ORDERS (OID, ODATE, PID, CID, OQTY) VALUES
('O0005', '2025-09-24', 'P0015', 'C0003', 4);
---------------------
SELECT * FROM  ORDERS;

----------------------------------------------------------------------------
--Q.2)  IN THE INVENTORY STRUCTURE GENERATE A VIEW BILL. IT SHOULD DISPLAY
--  	OID,ODATE,CNAME,ADDRESS,PHONE,PDESC, PRICE, OQTY, AMOUNT

CREATE VIEW BILL
AS
SELECT
	ORDERS.OID,										-- Order ID
	ORDERS.ODATE,									-- Order Date
	CUST.CNAME,										-- Customer Name
	CUST.CADDRESS,									-- Customer Address
	CUST.CPHONE,									-- Customer Phone
	PRODUCT.PDESC,									-- Product Description
	PRODUCT.PRICE,									-- Product Price
	ORDERS.OQTY,									-- Quantity Ordered
	(PRODUCT.PRICE * ORDERS.OQTY) AS AMOUNT			-- Total Amount
	FROM ORDERS										-- ORDERS is your main table.
	INNER JOIN CUST ON ORDERS.CID = CUST.CID		-- CUST is joined using CID to get customer details.
	INNER JOIN PRODUCT ON ORDERS.PID = PRODUCT.PID; -- PRODUCT is joined using PID to get product details.

SELECT * FROM BILL;

----------------------------------------------------------------------------
--------------------------> ASSIGNMENT QUESTIONS <--------------------------
----------------------------------------------------------------------------

-->  -->    CREATE BELOW PROCEDURES IN THE INVENTORY DATABASE AS SPECIFIED :

--			ADDSUPPLIER – SHOULD ADD THE SUPPLIER IN THE SUPPLIER TABLE AND  
-- 			DISPLAY THE DETAILS OF THE NEW SUPPLIER ADDED.
			
--			ADDPRO – SHOULD ADD THE PRODUCT IN THE PRODUCT TABLE AND DISPLAY THE  
--			DETAILS OF THE NEW PRODUCT ADDED.
			
--			ADDCUST – SHOULD ADD THE CUSTOMER IN THE CUSTOMER TABLE AND DISPLAY THE  
--			DETAILS OF THE NEW CUSTOMER ADDED.
			
--			ADDORDER – SHOULD ADD THE ORDER IN THE ORDERS TABLE AND DISPLAY THE  DETAILS 
--			OF THE ORDER. ORDER DATE SHOULD BE CURRENT DATE AND SHOULD COME AUTOMATICALLY.

----------------------------------------------------------------------------
--	ADDSUPPLIER – SHOULD ADD THE SUPPLIER IN THE SUPPLIER TABLE AND DISPLAY THE DETAILS OF THE NEW SUPPLIER ADDED.
----------------------------------------------------------------------------

CREATE PROCEDURE ADDSUPPLIER
@SID AS CHAR(5),
@SNA AS VARCHAR(30),
@SAD AS VARCHAR(50),
@SCT AS VARCHAR(20),
@SPH AS CHAR(15),
@SEM AS VARCHAR(50)
AS
BEGIN
SET NOCOUNT ON 

	INSERT INTO SUPPLIER
	VALUES(@SID, @SNA, @SAD, @SCT, @SPH, @SEM);

SELECT * FROM SUPPLIER WHERE SID = @SID;
END;

-----------------			-----------------
			-- INSERTING RECORDS 

ADDSUPPLIER
'S0008',
'FreshMart Supply',
'45 Market Lane',
'Delhi',
'9123456789',
'info@freshmart.in';

ADDSUPPLIER
'S0009',
'TechNova Pvt Ltd',
'88 Silicon Valley',
'Bangalore',
'9988776650',
'support@technova.com';


SELECT * FROM  SUPPLIER;

----------------------------------------------------------------------------
-- ADDPRO – SHOULD ADD THE PRODUCT IN THE PRODUCT TABLE AND DISPLAY DETAILS OF THE NEW PRODUCT ADDED.
----------------------------------------------------------------------------

CREATE PROCEDURE ADDPRO
@PID AS CHAR (5),
@PDESC AS VARCHAR (50),
@PRICE AS INT,
@PCAT AS CHAR (2),
@PSID AS CHAR (5)
AS
BEGIN 
SET NOCOUNT ON 

	INSERT INTO PRODUCT 
	VALUES (@PID, @PDESC, @PRICE, @PCAT, @PSID);

SELECT * FROM PRODUCT WHERE PID = @PID;
END;

-----------------			-----------------
			-- INSERTING RECORDS 

ADDPRO 'P0021', 'LENOVO LEGION OLED DISPLAY', '35000', 'IT', 'S0009';

-----------------

ADDPRO
'P0022',
'i7 PROCESSOR',
'45000',
'IT',
'S0002';


SELECT * FROM  PRODUCT;

----------------------------------------------------------------------------
-- ADDCUST – SHOULD ADD THE CUSTOMER IN THE CUSTOMER TABLE AND DISPLAY THE DETAILS OF THE NEW CUSTOMER ADDED.
----------------------------------------------------------------------------

CREATE PROCEDURE ADDCUST
@CID AS CHAR (5),
@CNAME AS VARCHAR (30),
@CADD AS VARCHAR (50),
@CCITY AS VARCHAR (20),
@CPH AS CHAR (15),
@CEM AS VARCHAR (50),
@CDOB AS DATE 
AS
BEGIN
SET NOCOUNT ON 

	INSERT INTO CUST
	VALUES (@CID, @CNAME, @CADD, @CCITY, @CPH, @CEM, @CDOB);

	SELECT * FROM CUST WHERE CID = @CID;
END;

-----------------			-----------------
			-- INSERTING RECORDS 

ADDCUST 
'C0011',
'AKANSHA',
'K-5, ELDICO ARENA',
'BANGALORE',
'9988776655',
'akaluv786@gmail.com',
'1999-09-14';

-----------------

ADDCUST 'C0012', 'KOMAL', 'M-12/5, SHIVAJI INSTITUTE', 'PUNE', '9966554488', 'gunanaya852@yahoo.com', '1995-12-31';


SELECT * FROM  CUST;

----------------------------------------------------------------------------
-- ADDORDER – SHOULD ADD THE ORDER IN THE ORDERS TABLE AND DISPLAY THE DETAILS OF THE ORDER. 
-- ORDER DATE SHOULD BE CURRENT DATE AND SHOULD COME AUTOMATICALLY.
----------------------------------------------------------------------------

CREATE PROCEDURE ADDORDER 
    @OID CHAR(5),
    @OPID CHAR(5),
    @OCID CHAR(5), 
    @OQTY INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO ORDERS (OID, PID, CID, OQTY, ODATE)
    VALUES (@OID, @OPID, @OCID, @OQTY, GETDATE());

    SELECT * FROM ORDERS WHERE OID = @OID;
END;
-----------------			-----------------
			-- INSERTING RECORDS 

ADDORDER 
'O0006',
'P0006',
'C0011',
'15';

-----------------

ADDORDER 'O0007', 'P0011', 'C0012', '7';

SELECT * FROM  ORDERS;
----------------------------------------------------------------------------

----------------------------------------------------------------------------
		-------------------------> ASSIGNMENT <--------------------------
----------------------------------------------------------------------------

--  A-1 : CREATE A FUNCTION FOR AUTOGENERATION OF 5 CHARACTERS ALPHA NUMERIC ID. IT
--		 SHOULD ACCEPT 2 PARAMETERS A CHARACTER AND THE NUMBER AND RETURN THE ID BY
--		 CONCANATING THE CHARACTER , REQUIRED ZEROS AND THE SPECIFIED NUMBER.
	
--	Q.1	 RECREATE BELOW PROCEDURES IN THE INVENTORY DATABASE AS SPECIFIED (ALL THE ID s SHOULD BE
--		 AUTOMATICALLY GENERATED USING ABOVE CREATED FUNCTION AND SEQUENCES) :

--	Q.2	 ADDSUPPLIER– SHOULD ADD THE SUPPLIER IN THE SUPLIER TABLE AND DISPLAY THE DETAILS OF THE
--		 NEW SUPPLIER ADDED.

--	Q.3	 ADDPRO– SHOULD ADD THE PRODUCT IN THE PRODUCT TABLE AND DISPLAY THE DETAILS OF THE
--		 NEW PRODUCT ADDED.

--	Q.4	 ADDCUST– SHOULD ADD THE CUSTOMER IN THE CUSTOMER TABLE AND DISPLAY THE DETAILS OF
--		 THE NEW CUSTOMER ADDED.

--	Q.5	 ADDORDER– SHOULD ADD THE ORDER IN THE ORDERS TABLE AND DISPLAY THE DETAILS OF THE
--		 ORDER. ORDER DATE SHOULD BE CURRENT DATE AND SHOULD COME AUTOMATICALLY.


----------------------------------------------------------------------------
----------------------------------------------------------------------------
------------>	NEED TO DROP AND RECREATE THE ABOVE ASSINGMENT PROCEDURES	<------------

------------>	IF YOU HAD INSERTED RECORDS IN THE TABLE SO CHECK 
-- AND START THE SEQUENCE FROM LIKE C00013, S00013 AND INCREMENT BY 1, YOU HAVE TO SEE THE LAST ID GENERATED & 
-- THE NEXT NUMBER SOULD BE THE STARTING NUMBER OF THE SEQUENCE 	<------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------

		--> DROPING THE ABOVE PROCEDURES 
		-- ADDSUPPLIER
		-- ADDPRO
		-- ADDCUST
		-- ADDORDER

DROP PROCEDURE ADDSUPPLIER;
DROP PROCEDURE ADDPRO;
DROP PROCEDURE ADDCUST;
DROP PROCEDURE ADDORDER;

----------------------------------------------------------------------------
--	Q1.	 CREATE A FUNCTION FOR AUTOGENERATION OF 5 CHARACTERS ALPHA NUMERIC ID. IT
--		 SHOULD ACCEPT 2 PARAMETERS A CHARACTER AND THE NUMBER AND RETURN THE ID BY
--		 CONCANATING THE CHARACTER , REQUIRED ZEROS AND THE SPECIFIED NUMBER.


CREATE FUNCTION SID (@C AS CHAR(1), @I AS INT)
RETURNS CHAR(5)
AS
BEGIN
    DECLARE @ID CHAR(5);
    SELECT @ID = CASE 
        WHEN @I < 10 THEN CONCAT(@C, '000', @I)
        WHEN @I < 100 THEN CONCAT(@C, '00', @I)
        WHEN @I < 1000 THEN CONCAT(@C, '0', @I)
        WHEN @I < 10000 THEN CONCAT(@C, @I)
        ELSE 'NA'
    END;
    RETURN @ID;
END;

----------------------------------------------------------------------------
--	Q2.	 ADDSUPPLIER– SHOULD ADD THE SUPPLIER IN THE SUPLIER TABLE AND DISPLAY THE DETAILS OFTHE
--		 NEW SUPPLIER ADDED.

-- Create a new sequence starting from 13

CREATE SEQUENCE SUPSEQ START WITH 13 INCREMENT BY 1;
-----------------	
CREATE PROCEDURE ADDSUPPLIER 
	@SNAME VARCHAR(50),
	@SADDR VARCHAR(50),
	@SCITY VARCHAR(40),
	@SPHONE CHAR(15),
	@SEMAIL VARCHAR(50)
AS 
BEGIN
	DECLARE @ID CHAR(5);
	DECLARE @NUM INT;

	SET @NUM = NEXT VALUE FOR SUPSEQ;
	SET @ID = DBO.SID('S', @NUM);

	INSERT INTO SUPPLIER 
	VALUES (@ID, @SNAME, @SADDR, @SCITY, @SPHONE, @SEMAIL);

	SELECT * FROM SUPPLIER WHERE SID = @ID;
END;
-----------------	
			-- INSERTING RECORDS 
ADDSUPPLIER
'ACER TOWN',
'45, THANE STREET',
'MUMBAI',
'8898788978',
'care12acer@gmail.com';

-----------------	
SELECT * FROM SUPPLIER ;

----------------------------------------------------------------------------
--	Q3.	 ADDPRO– SHOULD ADD THE PRODUCT IN THE PRODUCT TABLE AND DISPLAY THE DETAILS OF THE
--		 NEW PRODUCT ADDED.

CREATE SEQUENCE PROSEQ START WITH 23 INCREMENT BY 1;
-----------------	

CREATE PROCEDURE ADDPRO 
	@PDESC VARCHAR(50),
	@PRICE INT,
	@CATEGORY VARCHAR(40),
	@SID CHAR (5)

AS 
BEGIN
	DECLARE @PID CHAR(5);	
	DECLARE @PNUM INT;
-- Generate Product ID	
	SET @PNUM = NEXT VALUE FOR PROSEQ;
	SET @PID = DBO.SID('P', @PNUM);

-- Insert into PRODUCT table
	INSERT INTO PRODUCT 
	VALUES (@PID, @PDESC, @PRICE, @CATEGORY, @SID);
-- Display the newly added product
    SELECT * FROM PRODUCT WHERE PID = @PID;
END;

-----------------	
			-- INSERTING RECORDS 

EXEC ADDPRO
'GROFFS', '45896', HC, 'S0001';

-----------------	
SELECT * FROM  PRODUCT;
----------------------------------------------------------------------------
--	Q4.	 ADDCUST– SHOULD ADD THE CUSTOMER IN THE CUSTOMER TABLE AND DISPLAY THE DETAILS OF
--		 THE NEW CUSTOMER ADDED.

CREATE SEQUENCE CUSTSEQ
	START WITH 13
	INCREMENT BY 1;
-----------------	
CREATE PROCEDURE ADDCUST
	@CNAME VARCHAR (50),
	@CADDRESS VARCHAR (100),
	@CITY VARCHAR (20),
	@PHONE CHAR (15),
	@EMAIL VARCHAR (50),
	@DOB DATE
AS
BEGIN 
	DECLARE @CID CHAR(5);
	DECLARE @NUM INT;

	SET @NUM = NEXT VALUE FOR CUSTSEQ;
	SET @CID = DBO.SID('C', @NUM);

	INSERT INTO CUST
	VALUES (@CID, @CNAME, @CADDRESS, @CITY, @PHONE, @EMAIL, @DOB);

	SELECT * FROM CUST WHERE CID = @CID;
END;
-----------------

EXEC ADDCUST 
    'NITIN SHARMA',
    'A-45, KRISHNA ENCLAVE',
	'PUNE',
    '9876543210',
    'nitin.sharma@email.com',
	'1997-05-12';
-----------------	

SELECT * FROM  CUST;
----------------------------------------------------------------------------
--	Q5.	 ADDORDER– SHOULD ADD THE ORDER IN THE ORDERS TABLE AND DISPLAY THE DETAILS OF THE
--		 ORDER. ORDER DATE SHOULD BE CURRENT DATE AND SHOULD COME AUTOMATICALLY

-- LEFT HERE SO START FROM HERE ---------- ABOVE EXECUTED-------- 


CREATE SEQUENCE ODRSEQ
	START WITH 8
	INCREMENT BY 1; 
-----------------	

CREATE PROCEDURE ADDORDER 
	@PID CHAR(5),
	@CID CHAR(5),
	@OQTY INT
AS 
BEGIN
	DECLARE @OID CHAR(5);
	DECLARE @NUM INT;

	SET @NUM = NEXT VALUE FOR ODRSEQ;
	SET @OID = DBO.SID('O', @NUM);

	INSERT INTO ORDERS
	VALUES (@OID, GETDATE(), @PID, @CID, @OQTY);

	SELECT * FROM ORDERS WHERE OID = @OID;
END;
-----------------	

EXEC ADDORDER 
    'P0012', 
    'C0013', 
    2;

EXEC ADDORDER
	'P0011',
	'C0007',
	2;
-----------------	

SELECT * FROM  ORDERS;

----------------------------------------------------------------------------
		-------------------------> ASSIGNMENT <--------------------------
----------------------------------------------------------------------------

-- A-1: IMPLEMENT THE BELLOW TRIGGERS ON THE INVENTORY STRUCTURE.

-- WHEN EVER THE ORDER IS PLACED THE STOCK SHOULD BE UPDATED. 
-- ALSO THE ACCEPTABILITY OF ORDER SHOULD BE DEPENDENT ON AVAILABILITY OF STOCK.

-- IN CASE OF CHANGE IN THE ORDERED QUANTITY THE STOCK SHOULD ALSO BE UPDATED DEPENDENT ON THE AVAILABILITY OF STOCK.

-- CREATE THE PROCEDURES FOR BELOW REPORTS:-

-- DAILY REPORT - SHOULD DISPLAY THE DETAILS OF THE TRANSACTIONS DONE DURING THE DAY.

-- BILL-SHOULD GENERATE THE BILL FOR THE SPECIFIED ORDER NO.

-- CUSTOMER LEDGER - SHOULD GIVE THE DETAILS OF ALL THE TRANSACTIONS DONE BY THE SPECIFIED CUSTOMER.

-- SUPPLIER REPORT - SHOULD DISPLAY THE DETAILS OF THE PRODUCTS SUPPLIED BY THE SPECIFIED SUPPLIER.
----------------------------------------------------------------------------
--	Q1. WHEN EVER THE ORDER IS PLACED THE STOCK SHOULD BE UPDATED. 
--		ALSO THE ACCEPTABILITY OF ORDER SHOULD BE DEPENDENT ON AVAILABILITY OF STOCK.
----------------------------------------------------------------------------
-- This trigger needs to compare the old quantity (DELETED table) with the new quantity (INSERTED table) 
-- and adjust stock accordingly. If the quantity increases, it must check for sufficient stock.

	-- Trigger for handling updates to existing orders and adjusting stock
	-- Checks stock availability if order quantity increases and rolls back if insufficient.

CREATE TRIGGER TR_ORDER_UPDATE
ON ORDERS
AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	
	-- Check if OQTY (Ordered Quantity) was actually updated
	IF UPDATE(OQTY)
	BEGIN
		DECLARE @OldQTY INT;
		DECLARE @NewQTY INT;
		DECLARE @OrderedPID CHAR(5);
		DECLARE @CurrentStockQTY INT;
		DECLARE @QuantityDifference INT;

		SELECT @OrderedPID = PID, @OldQTY = OQTY FROM DELETED;
		SELECT @NewQTY = OQTY FROM INSERTED;
 
		-- Calculate the difference in quantity
		SET @QuantityDifference = @NewQTY - @OldQTY;

        -- Get the current stock quantity for the product
		SELECT @CurrentStockQTY = SQTY 
		FROM STOCK
		WHERE PID = @OrderedPID;

		IF @QuantityDifference > 0 -- Quantity has increased
		BEGIN

            -- Check if there's enough stock for the increase
			IF @CurrentStockQTY >= @QuantityDifference
			BEGIN
				UPDATE STOCK
				SET SQTY = SQTY - @QuantityDifference
				WHERE PID = @OrderedPID;
-- PRINT 'ORDER UPDATE ACCEPTED: Stock reduced by ' + CAST(@QuantityDifference AS VARCHAR) + ' for Product ' + @OrderedPID;
			END 
			ELSE
			BEGIN
-- Not enough stock for the increased quantity, rollback the order update
				ROLLBACK TRANSACTION;
-- PRINT 'ORDER UPDATE REJECTED: Insufficient stock to increase order for Product ' + @OrderedPID;
                RAISERROR ('Insufficient stock to increase order. Order update rejected.', 16, 1);
			END
		END
		ELSE IF @QuantityDifference < 0 -- Quantity has decreased
		BEGIN
            -- Add the difference (absolute value) back to stock
			UPDATE STOCK 
			SET SQTY = SQTY + ABS(@QuantityDifference)
			WHERE PID = @OrderedPID;
-- PRINT 'ORDER UPDATE ACCEPTED: Stock increased by ' + CAST(ABS(@QuantityDifference) AS VARCHAR) + ' for Product ' + @OrderedPID;
		END
		-- If @QuantityDifference is 0, no stock adjustment is needed.
	END
END;
----------------------------------------------------------------------------

--	Q2. Stored Procedure: Daily Report
--		This procedure will display all order transactions for a given date.

-- Stored Procedure to generate a daily report of transactions (orders)

CREATE PROCEDURE DailyOrderReport
    @ReportDate DATE = NULL -- Optional parameter, defaults to current date if not provided
AS
BEGIN
    SET NOCOUNT ON;

    -- If @ReportDate is NULL, set it to the current date
    IF @ReportDate IS NULL
    BEGIN
        SET @ReportDate = CAST(GETDATE() AS DATE);
    END

    SELECT
        O.OID,
        O.ODATE,
        C.CNAME AS CustomerName,
        C.CADDRESS AS CustomerAddress,
        P.PDESC AS ProductName,
        P.PRICE AS ProductUnitPrice,
        O.OQTY AS OrderedQuantity,
        (P.PRICE * O.OQTY) AS TotalPrice
    FROM
        ORDERS O
    INNER JOIN
        CUST C ON O.CID = C.CID
    INNER JOIN
        PRODUCT P ON O.PID = P.PID
    WHERE
        CAST(O.ODATE AS DATE) = @ReportDate
    ORDER BY
        O.OID;
END;

-----------------	
EXEC DailyOrderReport '2023-10-26';
EXEC DailyOrderReport; -- (for today's date)
-----------------	

----------------------------------------------------------------------------
--	Q3. Stored Procedure: Bill Generation
--		This procedure will generate a detailed bill for a specific order.
----------------------------------------------------------------------------
-- Stored Procedure to generate a bill for a specified Order ID

CREATE PROCEDURE GenerateBill
    @OrderID CHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the OrderID exists
    IF NOT EXISTS (SELECT 1 FROM ORDERS WHERE OID = @OrderID)
    BEGIN
        RETURN;
    END

    -- Customer Details
    SELECT
        'CUSTOMER DETAILS' AS Header,
        C.CNAME AS CustomerName,
        C.CADDRESS AS CustomerAddress,
        C.CITY AS CustomerCity,
        C.CPHONE AS CustomerPhone,
        C.CEMAIL AS CustomerEmail
    FROM
        ORDERS O
    INNER JOIN
        CUST C ON O.CID = C.CID
    WHERE
        O.OID = @OrderID;

    -- Order Details
    SELECT
        'ORDER DETAILS' AS Header,
        O.OID AS OrderID,
        O.ODATE AS OrderDate,
        P.PDESC AS ProductName,
        P.PRICE AS UnitPrice,
        O.OQTY AS Quantity,
        (P.PRICE * O.OQTY) AS ItemTotal
    FROM
        ORDERS O
    INNER JOIN
        PRODUCT P ON O.PID = P.PID
    WHERE
        O.OID = @OrderID;

    -- Grand Total
    SELECT
        'TOTAL AMOUNT' AS Header,
        SUM(P.PRICE * O.OQTY) AS GrandTotal
    FROM
        ORDERS O
    INNER JOIN
        PRODUCT P ON O.PID = P.PID
    WHERE
        O.OID = @OrderID;
END;

-----------------
EXEC GenerateBill 'O0001';
-----------------

----------------------------------------------------------------------------
--	Q4. Stored Procedure: Customer Ledger
--	    This procedure will display all transactions (orders) made by a specific customer.

-- Stored Procedure to display all transactions for a specified Customer ID

CREATE PROCEDURE CustomerLedger
    @CustomerID CHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the CustomerID exists
    IF NOT EXISTS (SELECT 1 FROM CUST WHERE CID = @CustomerID)
    BEGIN
        RETURN;
    END

    -- Customer Info (optional, can be removed if only transactions are needed)
    SELECT
        'CUSTOMER INFORMATION' AS Header,
        CNAME AS CustomerName,
        CADDRESS AS Address,
        CITY AS City,
        CPHONE AS Phone,
        CEMAIL AS Email,
        CDOB AS DateOfBirth
    FROM
        CUST
    WHERE
        CID = @CustomerID;

    -- Transactions (Orders)
    SELECT
        'TRANSACTION HISTORY' AS Header,
        O.OID AS OrderID,
        O.ODATE AS OrderDate,
        P.PDESC AS ProductName,
        P.PRICE AS UnitPrice,
        O.OQTY AS Quantity,
        (P.PRICE * O.OQTY) AS TotalAmount
    FROM
        ORDERS O
    INNER JOIN
        PRODUCT P ON O.PID = P.PID
    WHERE
        O.CID = @CustomerID
    ORDER BY
        O.ODATE DESC, O.OID DESC;
END;

-----------------
EXEC CustomerLedger 'C0001';
-----------------

----------------------------------------------------------------------------
--	Q5. Stored Procedure: Supplier Report
--		This procedure will display all products supplied by a specific supplier.
----------------------------------------------------------------------------

-- Stored Procedure to display products supplied by a specified Supplier ID


CREATE PROCEDURE SupplierReport
    @SupplierID CHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    -- Supplier Information (optional)
    SELECT
        'SUPPLIER INFORMATION' AS Header,
        SNAME AS SupplierName,
        SADD AS Address,
        SCITY AS City,
        SPHONE AS Phone,
        SEMAIL AS Email
    FROM
        SUPPLIER
    WHERE
        SID = @SupplierID;

    -- Products Supplied by this Supplier
    SELECT
        'PRODUCTS SUPPLIED' AS Header,
        P.PID AS ProductID,
        P.PDESC AS ProductDescription,
        P.PRICE AS UnitPrice,
        P.CATEGORY AS Category
    FROM
        PRODUCT P
    WHERE
        P.SID = @SupplierID
    ORDER BY
        P.PDESC;
END;

-----------------
EXEC SupplierReport 'S0001';
-----------------



----------------------------------------------------------------------------

SELECT * FROM  ORDERS;
SELECT * FROM  PRODUCT;
SELECT * FROM  STOCK;
----------------------------------------------------------------------------
		-------------------------> ASSIGNMENT <--------------------------
----------------------------------------------------------------------------

					-- AUTOMATING THE PURCHASE.

-- CREATE A PURCHASE TABLE CONTAINING PID, SID, PQTY, DOP. 
-- THIS TABLE WILL BE USED TO AUTOMATICALLY GENERATE THE PURCHASE ORDER

-- WHENEVER THE ORDER IS PLACED AND THE UPDATED STOCK QUANTITY GOES BELOW THE ROL, ENTRY SHOULD BE MADE IN PURCHASE TABLE.

-- PID - WILL BE THE ID OF THE PRODUCT WHICH IS BEING INSERTED

-- SID - SID OF THE PRODUCT WHICH IS BEING INSERTED NEEDS TO PICKED FROM SUPPLIER TABLE

-- PQTY - PURCHASE QUANTITY WILL BE THE MOQ FOR THE RESPECTIVE PRODUCT

-- DOP - SHOULD BE THE CURRENT DATE.
----------------------------------------------------------------------------
-- 1. Create the PURCHASE Table

-- Create the PURCHASE table for automated purchase orders

CREATE TABLE PURCHASE (
    PID CHAR(5) NOT NULL, -- Product ID (Foreign Key to PRODUCT table)
    SID CHAR(5) NOT NULL, -- Supplier ID (Foreign Key to SUPPLIER table)
    PQTY INT NOT NULL,    -- Purchase Quantity (will be MOQ)
    DOP DATE NOT NULL,    -- Date of Purchase (will be current date)
    CONSTRAINT PK_PURCHASE PRIMARY KEY (PID, DOP), -- Composite PK (a product can be ordered multiple times on different dates)
    CONSTRAINT FK_PURCHASE_PID FOREIGN KEY (PID) REFERENCES PRODUCT(PID),
    CONSTRAINT FK_PURCHASE_SID FOREIGN KEY (SID) REFERENCES SUPPLIER(SID)
);

SELECT * FROM PURCHASE;
----------------------------------------------------------------------------
-- 2. Trigger for Automating Purchase (TR_AUTO_PURCHASE)

-- Trigger to automate purchase orders when stock quantity falls below Reorder Level (ROL)
-- This trigger fires AFTER an UPDATE on the STOCK table.
-- It should ensure that the product already has an associated supplier in the PRODUCT table
-- to pick up the SID, and MOQ in the STOCK table.


CREATE TRIGGER TR_AUTO_PURCHASE
ON STOCK
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(SQTY)
    BEGIN
        INSERT INTO PURCHASE (PID, SID, PQTY, DOP)
        SELECT 
            STOCK.PID,
            PRODUCT.SID,
            STOCK.MOQ,
            GETDATE()
        FROM INSERTED
        JOIN STOCK ON INSERTED.PID = STOCK.PID
        JOIN PRODUCT ON STOCK.PID = PRODUCT.PID
        WHERE 
            STOCK.SQTY < STOCK.ROL
            AND NOT EXISTS (
                SELECT 1 FROM PURCHASE
                WHERE PID = STOCK.PID AND DOP = CAST(GETDATE() AS DATE)
            );
    END
END;









----------------------------------------------------------------------------
SELECT * FROM  SUPPLIER;
SELECT * FROM  PRODUCT;
SELECT * FROM  STOCK;
SELECT * FROM  CUST;
SELECT * FROM  ORDERS;
----------------------------------------------------------------------------
USE INVENTORY_2026;
----------------------------------------------------------------------------

-- PROBLEMS:-
-- 1.
-- 2.


