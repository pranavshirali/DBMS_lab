USE cs104;


CREATE TABLE salesman(salesman_id int, name varchar(50), city varchar(50), commission varchar(50), primary key(salesman_id));

CREATE TABLE customer(cust_id int, cust_name varchar(50), city varchar(50), grade varchar(50) , salesman_id int, primary key(cust_id), foreign key (salesman_id) references salesman(salesman_id) on delete cascade);

CREATE TABLE orders(ord_no int, purchase_amt int, ord_date date, customer_id int, salesman_id int, primary key(ord_no), foreign key (salesman_id) references salesman(salesman_id) on delete cascade,
foreign key (customer_id) references customer(cust_id) on delete cascade);

INSERT INTO salesman (salesman_id, name, salesman_city, commission) VALUES
(1000, 'JOHN', 'BANGALORE', 25),
(2000, 'RAVI', 'BANGALORE', 20),
(3000, 'KUMAR', 'MYSORE', 15),
(4000, "SMITH", 'DELHI', 30),
(5000, 'HARSHA', 'HYDERABAD', 15);

INSERT INTO customer (cust_id, cust_name, cust_city, grade, salesman_id) VALUES
(10, 'PREETHI', 'BANGALORE', 100, 1000),
(11, 'VIVEK', 'MANGALORE', 300, 1000),
(12, 'BHASKAR', 'CHENNAI', 400, 2000),
(13, 'CHETAN', 'BANGALORE', 200, 2000),
(14, 'MAMTHA', 'BANGALORE', 400, 3000);

INSERT INTO orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) VALUES 
(50, 1000, '2023-12-26', 10, 1000),
(51, 3000, '2023-12-26', 11, 2000),
(52, 4000, '2023-12-26', 12, 3000),
(53, 5000, '2023-12-25', 13, 4000),
(54, 9000, '2023-12-25', 14, 5000);

SELECT * FROM customer;
SELECT * FROM orders;
SELECT * FROM salesman;

#ANSWER NO.1
SELECT COUNT(cust_id) AS Customer_Count FROM customer WHERE grade > (SELECT AVG(grade) FROM customer WHERE city = 'BANGALORE'); 

#ANSWER NO.2
SELECT s.salesman_id,name FROM salesman s, customer c WHERE c.salesman_id = s.salesman_id GROUP BY c.salesman_id HAVING COUNT(c.cust_id)>1;

#ANSWER NO.3
SELECT s.salesman_id, name, cust_name, s.city, c.city FROM salesman s, customer c WHERE c.salesman_id = s.salesman_id AND s.city = c.city 
UNION 
SELECT s.salesman_id, name, cust_name, s.city, c.city FROM salesman s, customer c WHERE c.salesman_id = s.salesman_id AND NOT (s.city = c.city);  

#ANSWER NO.4
CREATE VIEW salesman_view AS SELECT o.ord_date, s.salesman_id, s.name, o.purchase_amt FROM orders o, salesman s WHERE s.salesman_id = o.salesman_id AND 
o.purchase_amt = (SELECT MAX(purchase_amt) FROM orders c WHERE c.ord_date = o.ord_date); 
SELECT * FROM salesman_view;

#ANSWER NO.5
DELETE FROM salesman WHERE salesman_id > 1000;



