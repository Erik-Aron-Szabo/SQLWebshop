DROP TABLE IF EXISTS "Customer" CASCADE;
DROP TABLE IF EXISTS "Order" CASCADE;
DROP TABLE IF EXISTS "order_detail" CASCADE;
DROP TABLE IF EXISTS "product" CASCADE;

CREATE TABLE "Customer"(
	customerid serial PRIMARY KEY,
	companyname varchar(30),
	contactname varchar(20),
	contacttitle char(2),
	address varchar(20),
	city varchar(30),
	region varchar(30),
	postalcode smallint,
	country varchar(20),
	phone varchar(20),
	fax varchar(20)
);


CREATE TABLE "Order"(
	OrderID SERIAL PRIMARY KEY,
	CustomerID INT,
	EmployeeID SERIAL,
	OrderDate timestamp,
	RequiredDate timestamp,
	ShippedDate timestamp,
	ShipVia varchar(30),
	Freight char(1), --true or false
	ShipName varchar(50),
	ShipAddress varchar(50),
	ShipCity varchar(40),
	ShipRegion varchar(50),
	ShipPostalCode smallint,
	ShipCountry varchar(30),
	FOREIGN KEY (CustomerID) references "Customer"(CustomerID) ON DELETE SET NULL
);

CREATE TABLE "order_detail"(
	orderid int references "Order"(orderid) ON DELETE SET NULL,
	productid serial PRIMARY KEY,
	unitprice money,
	quantity smallint,
	discount money
);


CREATE TABLE "product"(
	productid serial primary key,
	productname varchar(20),
	supplierid int,
	categoryid int,
	quantityperunit int,
	unitprice money,
	unitsonorder smallint,
	reorderlevel char(1), --true or false
	discontinued char(1) --true or false
);



INSERT INTO "Customer"(companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax)
VALUES 
('ABC Company', 'Erik Abc', 'Mr', 'Abcd road 410', 'New Abc', 'A-B-C', 888, 'Abcnia', '1-123-123-1235', '1-123-1235-123');
INSERT INTO "Customer"(companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax)
VALUES 
('ABC Company', 'Erik Abc', 'Mr', 'Abc road 410', 'New Abc', 'A-B-C', 888, 'Abcnia', '1-123-123-1234', '1-123-1234-123');

INSERT INTO "Order"(orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry)
VALUES('2020-03-22', '2020-03-24', '2020-03-24', 'airplane', 'T', 'Erik Abc', 'Abc road 410', 'New Abc', 'A-B-C', 888, 'Abcnia');
INSERT INTO "Order"(orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry)
VALUES('2020-03-20', '2020-03-25', '2020-03-25', 'car', 'T', 'Erik Abc', 'Abcd road 410', 'New Abc', 'A-B-C', 888, 'Abcnia');



INSERT INTO "order_detail"(unitprice, quantity, discount)
VALUES('8.88', 1, '0.00');
INSERT INTO "order_detail"(unitprice, quantity, discount)
VALUES('4.44', 1, '0.00');

INSERT INTO "product"(productname, supplierid, categoryid, quantityperunit, unitprice, unitsonorder, reorderlevel, discontinued)
VALUES('Large Bug spray', 123, 26, 1, '8.88', 1, 'T', 'F');
INSERT INTO "product"(productname, supplierid, categoryid, quantityperunit, unitprice, unitsonorder, reorderlevel, discontinued)
VALUES('Bug spray', 123, 26, 1, '4.44', 1, 'T', 'F');

