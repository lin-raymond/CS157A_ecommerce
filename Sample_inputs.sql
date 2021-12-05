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

