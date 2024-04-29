drop database if exists HMBank;
create database HMBank;
use HMBank;

drop table if exists Customers;
drop table if exists Accounts;
drop table if exists Transactions;

create table Customers(
	customer_id int primary key,
    first_name varchar(30),
	last_name varchar(30),
    DOB date,
	email varchar(50),
	phone_number varchar(20),
	address varchar(255)
);
desc Customers;

create table Accounts(
	account_id int primary key,
    customer_id int,
    account_type  varchar(20),
    balance decimal(20,2),
	foreign key(customer_id) references Customers(customer_id)
);
desc Accounts;

create table Transactions(
	transaction_id int primary key,
    account_id int,
    transaction_type varchar(20),
    amount decimal(10,2),
    transaction_date date,
    foreign key(account_id) references Accounts(account_id)
);
desc transactions;

-- 1. Insert at least 10 sample records into each of the following tables. 
use hmbank;
insert into Customers(customer_id,first_name,last_name,DOB,email,phone_number,address)
values
(1, 'John', 'Doe', '1994-03-26','john.doe@gmail.com', '1234567890', '12/7 thilak road'),
(2, 'yashu', 'ganji','1991-06-02', 'yashuganji@gmail.com', '9876543210', '11/5 TK street'),
(3, 'sai', 'sandeep', '2000-1-09','alice.saisandeep@gmail.com', '5551234567', '22/3 mr palli'),
(4, 'triveni', 'kadipakam', '1896-09-24','trivenikadipakam@gmail.com', '9876543210', '3/7 gandhi road'),
(5, 'bob', 'Brown', '2002-09-07','bob.brown@mail.com', '5559876543', '654 Maple St'),
(6, 'niharika','singh','2001-12-30','niharikasingh@gmail.com','9999888877','67 gandhi road'),
(7, 'Shankar','kumar','1999-04-19','shankar@gmail.com','6574655623','45/3 rayachoty'),
(8, 'Kusuma','Anjali','2001-03-31','kusumanjali@gmail.com','1234509876','767 kt road'),
(9, 'prakash','raj','2004-09-06','prakash@gmail,com','9987654321','SKD Nagar'),
(10,'sathya','sri','1970-01-31','sathyasri@gmail.com','8467767667','78/2 Tirupati');

insert into Accounts(account_id,customer_id,account_type,balance)
values
(11,5,'zero_balance',10000.00),
(12 ,1,'current' ,50000.59),
(13 ,7, 'savings',2000.64),
(14,3,'zero_balance' , 20000.90),
(15,8 ,'current',128000.00),
(16, 10 ,'current',224937.00),
(17, 6 ,'savings',34567.50),
(18, 9 ,'savings',23000.49),
(19, 4 ,'zero_balance',100000.70),
(20, 2 ,'savings',59500.30);

insert into Transactions(transaction_id ,account_id,transaction_type,amount,transaction_date)
values
(1001,11,'withdrawal',1000.00,'2024-04-20'),
(1002,12,'deposit',500.00,'2024-04-07'),
(1003,13,'transfer',	2000.00,'2024-04-05'),
(1004,14,'withdrawal',1000.00,'2024-04-09'),
(1005,15,'transfer',300.00,'2024-04-10'),
(1006,16,'deposit',	2500.00,'2024-04-25'),
(1007,16,'withdrawal',5000,'2024-04-03'),
(1008,18,'transfer',1300,'2024-04-23'),
(1009,19,'deposit',12000,'2024-04-07'),
(1010,20,'withdrawal',2000,'2024-04-8');