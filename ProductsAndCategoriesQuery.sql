DROP TABLE IF EXISTS ProductCategory;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;

CREATE TABLE Categories (
	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(30) UNIQUE);

CREATE TABLE Products (
	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(30) UNIQUE);

CREATE TABLE ProductCategory(
	Pr_id INT,
	Cat_id INT,
	FOREIGN KEY (Pr_id) REFERENCES Products(Id),
	FOREIGN KEY (Cat_id) REFERENCES Categories(Id));

CREATE UNIQUE INDEX PrCatIndex ON ProductCategory(Pr_id, Cat_id);

INSERT INTO Categories (Name) VALUES ('Electrical appliances');  /* 1 */
INSERT INTO Categories (Name) VALUES ('Clothes');				 /* 2 */
INSERT INTO Categories (Name) VALUES ('Food');					 /* 3 */
INSERT INTO Categories (Name) VALUES ('Phones');				 /* 4 */

INSERT INTO Products (Name) VALUES ('IPhone');		/* 1 */
INSERT INTO Products (Name) VALUES ('Galaxy S7');	/* 2 */
INSERT INTO Products (Name) VALUES ('Jacket');		/* 3 */
INSERT INTO Products (Name) VALUES ('Hat');			/* 4 */
INSERT INTO Products (Name) VALUES ('Apple');		/* 5 */
INSERT INTO Products (Name) VALUES ('Banana');		/* 6 */
INSERT INTO Products (Name) VALUES ('Milk');		/* 7 */
INSERT INTO Products (Name) VALUES ('Hammer');		/* 8 */
INSERT INTO Products (Name) VALUES ('Cup');			/* 9 */
INSERT INTO Products (Name) VALUES ('Door');		/* 10 */
INSERT INTO Products (Name) VALUES ('Computer');	/* 11 */

INSERT INTO ProductCategory (Pr_id, Cat_id) VALUES (1, 1);
INSERT INTO ProductCategory (Pr_id, Cat_id) VALUES (2, 1);
INSERT INTO ProductCategory (Pr_id, Cat_id) VALUES (3, 2);
INSERT INTO ProductCategory (Pr_id, Cat_id) VALUES (4, 2);
INSERT INTO ProductCategory (Pr_id, Cat_id) VALUES (5, 3);
INSERT INTO ProductCategory (Pr_id, Cat_id) VALUES (6, 3);
INSERT INTO ProductCategory (Pr_id, Cat_id) VALUES (7, 3);
INSERT INTO ProductCategory (Pr_id, Cat_id) VALUES (11, 1);
INSERT INTO ProductCategory (Pr_id, Cat_id) VALUES (1, 4);
INSERT INTO ProductCategory (Pr_id, Cat_id) VALUES (2, 4);

SELECT prs.Name Product_name, cs.Name Category_name FROM (Products prs LEFT JOIN ProductCategory pc ON prs.Id = pc.Pr_id) LEFT JOIN Categories cs ON pc.Cat_id = cs.Id