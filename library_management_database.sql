create database library_sql;

drop database library_sql;
create database library_management;

-- To show all the databses
show databases;

use library_management;

create table readers(
    reader_id VARCHAR(6) PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    city VARCHAR(15),
    mobile_num VARCHAR(10),
    occupation VARCHAR(10),
    dob DATE

);
DROP table readers;

INSERT INTO readers VALUES('C00001', 'Ramesh', 'Sharma', 'Roorkee', '9237281928', 'Student', '1976-12-06');
INSERT INTO readers VALUES('C00002', 'Rahul', 'Dua', 'Delhi', '9217251922', 'Developer', '1986-10-16');
INSERT INTO readers VALUES('C00003', 'Pratul', 'Pant', 'Noida', '9237280925', 'Teacher', '1996-02-06');
INSERT INTO readers VALUES('C00004', 'Somesh', 'Joshi', 'Haldwani', '8127329182', 'IT', '1999-12-16');
INSERT INTO readers VALUES('C00005', 'Sourav', 'Kumar', 'Bihar', '8127324788', 'Law', '1986-05-26');
INSERT INTO readers VALUES('C00006', 'Pooja', 'Updahyay', 'Almora', '8456327894', 'Ass. Eng', '1996-05-01');

select * FROM readers;

SELECT* FROM readers
WHERE first_name = 'Rahul';


CREATE TABLE Book(
    book_id VARCHAR(6) PRIMARY KEY,
    book_name VARCHAR(40),
    book_domain VARCHAR(30)
);

INSERT INTO book VALUES('B00001', 'The Desciplined Guy', 'Motivation');
INSERT INTO book VALUES('B00002', 'The Trader', 'Trading');
INSERT INTO book VALUES('B00003', 'Science into Humans', 'Science');
INSERT INTO book VALUES('B00004', 'Pshychology of your mind', 'Business');

SELECT * FROM book;


Create table active_readers(
    account_id VARCHAR(6) PRIMARY KEY,
    reader_id VARCHAR(6),
    book_id VARCHAR(6),
    account_type VARCHAR(10),
    account_status VARCHAR(10),
    FOREIGN KEY(reader_id) REFERENCES readers(reader_id),
    FOREIGN KEY(book_id) REFERENCES book(book_id)
);

INSERT INTO active_readers VALUES('A00001', 'C00001', 'B00002', 'Premium', 'Active');
INSERT INTO active_readers VALUES('A00002', 'C00003', 'B00003', 'Free', 'Active');
INSERT INTO active_readers VALUES('A00003', 'C00002', 'B00001', 'Premium', 'Active');
INSERT INTO active_readers VALUES('A00004', 'C00002', 'B00004', 'Free', 'Expired');

select *
FROM readers
JOIN active_readers
ON active_readers.reader_id = readers.reader_id;

Create table bookissue_details(
    issue_id VARCHAR(6) PRIMARY KEY,
    account_id VARCHAR(6),
    book_id VARCHAR(6),
    book_name VARCHAR(50),
    num_of_books INT(7),

    FOREIGN KEY(account_id) REFERENCES active_readers(account_id),
    FOREIGN KEY(book_id) REFERENCES book(book_id)

);

INSERT INTO bookissue_details VALUES('T00001', 'A00001', 'B00001', 'The Desciplined Guy', 1);

--TO count all the data in the tables

SELECT COUNT(account_id) FROM active_readers where account_type = 'Premium';
