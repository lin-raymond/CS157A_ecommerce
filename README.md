# CS157A_ecommerce

The CS157A_Project.sql file contains the SQL code required to create the database and the tables as per the design specification in the Design section and Implementation and Testing section of the proposal 

The Sample_inputs.sql file contains all the sample input data used during testing.

The Views.sql file contains all the SELECT SQL statements created for all the view requirements specified in the Design section and Implementation and Testing section of the proposal. 

# SQL Queries

To create all the tables, use the following SQL statements to make the database:

```
CREATE DATABASE cs157a_ecommerce;
USE cs157a_ecommerce;
CREATE TABLE CUSTOMER (
  CUSTOMER_ID int AUTO_INCREMENT,
  FIRST_NAME varchar(15) NOT NULL,
  LAST_NAME varchar(15) NOT NULL,
  EMAIL varchar(30) NOT NULL UNIQUE,
  PASSWORD varchar(255) NOT NULL,
  PRIMARY KEY (CUSTOMER_ID)
);
CREATE TABLE SUPPLIER (
	SUPPLIER_ID int AUTO_INCREMENT,
	NAME varchar(50) NOT NULL,
	EMAIL varchar(30) NOT NULL,
	PRIMARY KEY (SUPPLIER_ID)
);
CREATE TABLE ADDRESS (
	ADDRESS_ID int AUTO_INCREMENT,
	CUSTOMER_ID int NULL,
	SUPPLIER_ID int NULL,
	ADDRESS_LINE1 varchar(50) NOT NULL,
	ADDRESS_LINE2 varchar(50) NULL,
	CITY varchar(30) NOT NULL,
	STATE varchar(50) NOT NULL,
	ZIP char(5) NOT NULL,
	COUNTRY varchar(50) NOT NULL,
	ADDRESS_TYPE varchar(10) NOT NULL,
	PRIMARY KEY (ADDRESS_ID),
	FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID),
	FOREIGN KEY (SUPPLIER_ID) REFERENCES SUPPLIER (SUPPLIER_ID)
);
CREATE TABLE ORDERS (
    ORDER_ID int AUTO_INCREMENT,
    CUSTOMER_ID int NOT NULL,
    SHIP_ADDRESS_ID int NOT NULL,
    DATE date,
    PRIMARY KEY (ORDER_ID),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID),
    FOREIGN KEY (SHIP_ADDRESS_ID) REFERENCES ADDRESS (ADDRESS_ID)
);
CREATE TABLE PRODUCT (
    PRODUCT_ID int NOT NULL UNIQUE,
    PRODUCT_NAME varchar(30) NOT NULL,
    PRODUCT_DESCRIPTION varchar(255) NOT NULL,
    SUPPLIER_ID int NOT NULL,
    PRICE double NOT NULL,
    QUANTITY int NOT NULL,
    PRIMARY KEY (PRODUCT_ID),
    FOREIGN KEY (SUPPLIER_ID) REFERENCES SUPPLIER (SUPPLIER_ID)
);
CREATE TABLE PRODUCTS_ORDER (
    PRODUCTS_ORDER_ID int AUTO_INCREMENT,
    ORDER_ID int NOT NULL,
    PRODUCT_ID int NOT NULL,
    QUANTITY int NOT NULL,
    SUB_TOTAL double NOT NULL,
    PRIMARY KEY (PRODUCTS_ORDER_ID),
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS (ORDER_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT (PRODUCT_ID)
);
```

To add some sample data, use these SQL statements:

```
USE cs157a_ecommerce;
INSERT INTO CUSTOMER (FIRST_NAME, LAST_NAME, EMAIL, PASSWORD) VALUES
    ('Alfred', 'Sendo', 'alfred.sendo@email.com', 'password1'),
    ('Andrew', 'Shido', 'andrew.shido@email.com', 'password2'),
    ('Alexander', 'Mastrano', 'alexander.mastrano@email.com', 'password3'),
    ('Arthur', 'Aido', 'arthur.aido@email.com', 'password4'),
    ('Albert', 'Minato', 'albert.minato@email.com', 'password5'),
    ('Angel', 'Hio', 'angel.hio@email.com', 'password6'),
    ('Angelo', 'Ichijo', 'angelo.ichijo@email.com', 'password7');
	
INSERT INTO ADDRESS (CUSTOMER_ID, ADDRESS_LINE1, ADDRESS_LINE2, CITY, STATE, ZIP, COUNTRY, ADDRESS_TYPE) VALUES
	(1, '3124 Brookview Drive', NULL, 'Beaumont', 'TX', '77708', 'US', 'HOME'),
	(2, '2342 Earnhardt Drive', NULL, 'Louisville', 'KY', '40202', 'US', 'HOME'),
	(3, '4875 Rockwell Lane', NULL, 'Kinston', 'NC', '28504', 'US', 'COMMERICAL'),
	(4, '459 Rockwell Lane', 'APT 1', 'Miramar', 'FL', '33025', 'US', 'HOME'),
	(5, '1448 Dennison Street', NULL, 'Sonora', 'CA', '95370', 'US', 'HOME'),
	(6, '4880 Centennial Farm Road', NULL, 'Anita', 'IA', '50020', 'US', 'HOME'),
	(7, '1573 Harter Street', NULL, 'Urbana', 'OH', '43078', 'US', 'HOME');
	
INSERT INTO SUPPLIER (name, email) VALUES
	('Technology Corp', 'orders@techcorp.net'),
	('Gifts Corp', 'orders@giftcorp.net'),
	('General Supply', 'orders@generalsupply.net');
	
INSERT INTO ADDRESS (SUPPLIER_ID, ADDRESS_LINE1, ADDRESS_LINE2, CITY, STATE, ZIP, COUNTRY, ADDRESS_TYPE) VALUES
	(1, '3256 Conifer Drive', NULL, 'Bellevue', 'WA', '98004', 'US', 'COMMERICAL'),
	(2, '4134 Ocala Street', NULL, 'Orlando', 'FL', '32808', 'US', 'COMMERICAL'),
	(3, '173 Linda Street', NULL, 'Philadelphia', 'PA', '19146', 'US', 'COMMERICAL');
	
INSERT INTO PRODUCT (PRODUCT_ID, PRODUCT_NAME, PRODUCT_DESCRIPTION, SUPPLIER_ID, PRICE, QUANTITY)
VALUES 
    ('1248', 'Measuring Bowls x5', 'Measuring bowls 4 inches tall', 3, '9.99', '10'),
    ('3546', 'Watch Battery C100', 'Watch Battery C100', 3, '5.99', '100'),
    ('1289', 'AMZan Gift Card', 'A Gift Card for AMZan', 2, '10.00', '20'),
    ('8569', 'Projector', 'A Projector supporting HD resolution', 1, '100.00', '25'),
    ('7856', 'Seeg 4 TB external HDD', 'A 4TB HDD from Seeg! One of the best in the industry!', 1, '170.49', '20'),
    ('3154', 'Hyper 15 inch laptop i6-500G', 'A 15 inch laptop that can handle light gaming', 1, '599.99', '5');

INSERT INTO ORDERS (CUSTOMER_ID, DATE, SHIP_ADDRESS_ID)
VALUES
    ('1', '2021-01-17', 1),
    ('2', '2021-07-24', 2),
    ('3', '2021-04-20', 3);
    
INSERT INTO PRODUCTS_ORDER (ORDER_ID, PRODUCT_ID, QUANTITY, SUB_TOTAL)
VALUES
	('1', '1248', '3', '30.00'),
    ('2', '7856', '1', '170.00'),
    ('3', '8569', '10', '1000.00');
```

Queries:

All queries use the cs157a_ecommerce database.

```
USE cs157a_ecommerce;
```

For the order history view, show all the order id numbers and dates that the customer is associated with. 

```
SELECT ORDER_ID, DATE FROM `orders` WHERE CUSTOMER_ID = <CUSTOMER ID # HERE>;
```

Replace <CUSTOMER ID # HERE> with an actual customer ID number.

Example:

```
SELECT ORDER_ID, DATE FROM `orders` WHERE CUSTOMER_ID = 1;
```

For the inventory view, show the product name, product details, supplier name, quantity, and product price.
 
```
SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_DESCRIPTION, SUPPLIER.NAME, PRICE, QUANTITY FROM PRODUCT INNER JOIN SUPPLIER ON PRODUCT.SUPPLIER_ID = SUPPLIER.SUPPLIER_ID WHERE PRODUCT_ID = <PRODUCT ID # HERE>;
```

Replace <PRODUCT ID # HERE> with an actual customer ID number.

Example:

```
SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_DESCRIPTION, SUPPLIER.NAME, PRICE, QUANTITY FROM PRODUCT INNER JOIN SUPPLIER ON PRODUCT.SUPPLIER_ID = SUPPLIER.SUPPLIER_ID WHERE PRODUCT_ID = 3154;
```

For the order details view, show the order information: order id number, date, customer first name, customer last name, email address, shipping address, items ordered, quantity ordered, subtotal, total. 

 ```
 SELECT ORDERS.ORDER_ID, CUSTOMER.FIRST_NAME, CUSTOMER.LAST_NAME, CUSTOMER.EMAIL, ADDRESS.ADDRESS_LINE1, ADDRESS.ADDRESS_LINE2, ADDRESS.CITY, ADDRESS.STATE, ADDRESS.ZIP, ADDRESS.COUNTRY, PRODUCT.PRODUCT_NAME, ORDERS.DATE, PRODUCTS_ORDER.SUB_TOTAL FROM ORDERS INNER JOIN CUSTOMER ON ORDERS.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID INNER JOIN PRODUCTS_ORDER ON ORDERS.ORDER_ID = PRODUCTS_ORDER.ORDER_ID INNER JOIN PRODUCT ON PRODUCTS_ORDER.PRODUCT_ID = PRODUCT.PRODUCT_ID INNER JOIN ADDRESS ON ADDRESS.ADDRESS_ID = ORDERS.SHIP_ADDRESS_ID WHERE ORDERS.ORDER_ID = <ORDER ID # HERE>;
 ```
 
 Replace <ORDER ID # HERE> with an actual order ID number.
 
 Example:
 
 ```
 SELECT ORDERS.ORDER_ID, CUSTOMER.FIRST_NAME, CUSTOMER.LAST_NAME, CUSTOMER.EMAIL, ADDRESS.ADDRESS_LINE1, ADDRESS.ADDRESS_LINE2, ADDRESS.CITY, ADDRESS.STATE, ADDRESS.ZIP, ADDRESS.COUNTRY, PRODUCT.PRODUCT_NAME, ORDERS.DATE, PRODUCTS_ORDER.SUB_TOTAL FROM ORDERS INNER JOIN CUSTOMER ON ORDERS.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID INNER JOIN PRODUCTS_ORDER ON ORDERS.ORDER_ID = PRODUCTS_ORDER.ORDER_ID INNER JOIN PRODUCT ON PRODUCTS_ORDER.PRODUCT_ID = PRODUCT.PRODUCT_ID INNER JOIN ADDRESS ON ADDRESS.ADDRESS_ID = ORDERS.SHIP_ADDRESS_ID WHERE ORDERS.ORDER_ID = 1;
 ```

For the product details view, show the product name, product details, supplier name, and product price.

```
SELECT PRODUCT_NAME, PRODUCT_DESCRIPTION, SUPPLIER.NAME, PRICE FROM PRODUCT INNER JOIN SUPPLIER ON PRODUCT.SUPPLIER_ID = SUPPLIER.SUPPLIER_ID WHERE PRODUCT_ID = <PRODUCT ID # HERE>;
```

Replace <PRODUCT ID # HERE> with an actual product ID number.

Example:

```
SELECT PRODUCT_NAME, PRODUCT_DESCRIPTION, SUPPLIER.NAME, PRICE FROM PRODUCT INNER JOIN SUPPLIER ON PRODUCT.SUPPLIER_ID = SUPPLIER.SUPPLIER_ID WHERE PRODUCT_ID = 1248;
```

For the customer profile view, show the customer name, email, and shipping address associated with the customer. The customer profile view will only be available to that logged-in customer.

```
SELECT FIRST_NAME, LAST_NAME, EMAIL, ADDRESS.ADDRESS_LINE1, ADDRESS.ADDRESS_LINE2, ADDRESS.CITY, ADDRESS.STATE, ADDRESS.ZIP, ADDRESS.COUNTRY, ADDRESS.ADDRESS_TYPE FROM CUSTOMER INNER JOIN ADDRESS ON CUSTOMER.CUSTOMER_ID = ADDRESS.CUSTOMER_ID WHERE CUSTOMER.CUSTOMER_ID = <CUSTOMER ID # HERE>;
```

Replace <CUSTOMER ID # HERE> with an actual customer ID number.

Example:

```
SELECT FIRST_NAME, LAST_NAME, EMAIL, ADDRESS.ADDRESS_LINE1, ADDRESS.ADDRESS_LINE2, ADDRESS.CITY, ADDRESS.STATE, ADDRESS.ZIP, ADDRESS.COUNTRY, ADDRESS.ADDRESS_TYPE FROM CUSTOMER INNER JOIN ADDRESS ON CUSTOMER.CUSTOMER_ID = ADDRESS.CUSTOMER_ID WHERE CUSTOMER.CUSTOMER_ID = 3;
```

# Deploy Database using Preconfigured Docker Image

Assuming that docker is installed on your machine.

There are two docker images available. One image only contains the configured tables: "linraymond/cs157a_sql_database_no_sample_data". Another image contains the tables and sample data: "linraymond/cs157a_sql_database_with_sample_data".

To pull the docker image with only the configured tables: 

```
docker pull linraymond/cs157a_sql_database_no_sample_data
```

To pull the docker image with the configured tables and sample data:

```
docker pull linraymond/cs157a_sql_database_with_sample_data
```

To start the docker image:

For image without sample data:

```
docker run --name=cs157a-sql-database -e MYSQL_ROOT_PASSWORD=changeme-security -e MYSQL_USER=user -e MYSQL_PASSWORD=changeme-security -dp 3306:3306 --expose 3306 -d linraymond/cs157a_sql_database_no_sample_data:latest
```

For image with sample data:

```
docker run --name=cs157a-sql-database -e MYSQL_ROOT_PASSWORD=changeme-security -e MYSQL_USER=user -e MYSQL_PASSWORD=changeme-security -dp 3306:3306 --expose 3306 -d linraymond/cs157a_sql_database_with_sample_data:latest
```

Both docker containers have a password for the root user set to "changeme-security" without quotes. It is highly recommended to change the root password to something more secure. To access the mysql application in docker:

```
docker exec -it cs157a-sql-database mysql -uroot -p
```

It is possible to have any any other SQL application access the database.
