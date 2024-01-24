CREATE DATABASE LAB1CS104;
use LAB1CS104;
CREATE TABLE publisher(name VARCHAR(15), phone bigint, address VARCHAR(25), PRIMARY KEY(NAME));

CREATE TABLE book(book_id int, title varchar(25), publish_date varchar(20), publisher_name varchar(25), primary key(book_id), foreign key(publisher_name) references publisher(name));


CREATE TABLE bookauthor(book_id int, author_name varchar(25), FOREIGN KEY(book_id) REFERENCES book(book_id)  ON DELETE  CASCADE);


CREATE TABLE library_programme(branch_id int, branch_name VARCHAR(15), address VARCHAR(15), PRIMARY KEY(branch_id));


CREATE TABLE book_copies(book_id int, branch_id int, no_of_copies int,
PRIMARY KEY(book_id,branch_id),
FOREIGN KEY(book_id) REFERENCES book(book_id) ON DELETE  CASCADE,
FOREIGN KEY(branch_id) REFERENCES library_programme(branch_id) ON DELETE CASCADE);


CREATE TABLE book_lending(book_id int, branch_id int, card_no int, DATE_OUT DATE, DUE_DATE DATE,
 PRIMARY KEY (book_id, branch_id, card_no),
 FOREIGN KEY (book_id) REFERENCES  book(book_id) ON   DELETE CASCADE,
 FOREIGN KEY (branch_id) REFERENCES library_programme(branch_id) ON DELETE CASCADE);
 
 
INSERT INTO publisher(name, phone, address) VALUES
('MCGRAW-HILL', 997984654, 'BLR'),
('PEARSON', 32465465, 'ND'),
('RANDOM HOUSE', 998789764, 'HYD'),
('HACETTE LIVER', 9879797798, 'CHI'),
('GRUPO PLANETA', 9797654654, 'BLR');

INSERT INTO book(book_id, title, publish_date, publisher_name) VALUES
(1, 'DBMS', 'JAN-2017', 'MCGRAW-HILL'),
(2, 'ADBMS', 'JAN-2016', 'MCGRAW-HILL'),
(3, 'CN', 'SEP-2016', 'PEARSON'), 
(4, 'CG', 'SEP-2015', 'GRUPO PLANETA'),
(5, 'DS', 'MAY-2016', 'PEARSON');

INSERT INTO bookauthor(book_id, author_name) VALUES
(1, 'NAVATHE'),
(2, 'NAVATHE'),
(3, 'TANENBAUM'),
(4, 'EDWARD ANGEL'),
(5, 'GALVIN');

INSERT INTO library_programme(branch_id, branch_name, address) VALUES 
(10,'RR NAGAR','BANGALORE'),
(11,'RNSIT','BANGALORE'),
(12,'RAJAJI NAGAR', 'BANGALORE'),
(13,'NITTE','MANGALORE'),
(14,'MANIPAL','UDUPI');

INSERT INTO book_copies(book_id, branch_id, no_of_copies) VALUES 
(1, 10, 10),
(1, 11, 5),
(2, 12, 2),
(2, 13, 5),
(3, 14, 7),
(5, 10, 1),
(4, 11, 3);

INSERT INTO book_lending(book_id, branch_id, card_no, DATE_OUT, DUE_DATE) VALUES 
(1, 10, 101, '01-JAN-17', '01-JUN-17'),
(3, 14, 101, '11-JAN-17', '11-MAR-17'),
(2, 13, 101, '21-FEB-17', '21-APR-17'),
(4, 11, 101, '15-MAR-17', '15-JUL-17'),
(1, 11, 104, '12-APR-17', '12-MAY-17'); 



