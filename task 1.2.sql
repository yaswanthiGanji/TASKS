-- 1)retrieve names and email --
select firstname, lastname, email from Customers;

-- 2)order id and corresponding customer id --
select Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
from Orders, Customers
where Orders.CustomerID = Customers.CustomerID
order by Orders.OrderID;
desc customers;
select* from customers;

-- 3)add values into customers --
insert into Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
values (11, 'kavya', 'thondamaneti', 'kavya@gmail.com', '9999999786','TK street');

-- 4)increase price by 10% --
update Products
set Price = Price * 1.1;
rollback;
select *from products;

-- 5)delete a specific order in orders --
delete from Orders where orderid=7;
select * from Orders;
delete from Orderdetails where orderdetailid=7;
select * from Orderdetails;

desc orders;
-- 6) insert new order into the orders table--
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (12, 11, '2024-04-23', 100.00);
desc orderdetails;
select *from orderdetails;

-- 8) sum of orderdetailsquantity and price from orders,products and orderdetails
-- select Orders.OrderID, 
-- sum(OrderDetails.Quantity * Products.Price)
-- from Orders, OrderDetails, Products
-- group by Orders.OrderID;

desc products;

desc orderdetails;
select OrderId, sum(Products.price * orderdetails.Quantity) from Products INNER JOIN orderdetails  
ON Products.ProductId = OrderDetails.ProductId;

select orderid, products.price * orderDetails.quantity 
from products INNER JOIN OrderDetails 
ON Products.ProductId = OrderDetails.ProductId;

select orderid, Sum(products.price * orderDetails.quantity)
from products INNER JOIN OrderDetails on Products.ProductId = OrderDetails.ProductId
Group By OrderId;

Update Orders Od
INNER JOIN (
select orderid, Sum(products.price * orderDetails.quantity) TotalAmount from products INNER JOIN OrderDetails 
ON Products.ProductId = OrderDetails.ProductId Group By OrderId) AD  ON Od.OrderiD = AD.OrderId
set od.totalAmount = AD.TotalAmount;

select * from Orders;

-- 9) 
delete from OrderDetails
where OrderID IN (select OrderID from Orders where CustomerID = 1);
delete from Orders where CustomerID = 1;
rollback;
select * from orders;

-- 10) insert new gadget into products --
INSERT INTO Products (ProductID, Productname, Description, Price)
VALUES
(12, 'mobile', 'cool', 50000.00);

-----------------------------------
select*from products;

ALTER TABLE orders
add COLUMN Quantity int;

select* from orders;

UPDATE orders SET quantity = 11 WHERE orderdate = '2017-06-24';
-----------------------------------
-- 11) update status of a specific order--

UPDATE orders SET status = 'Shifted' WHERE orderdate = '2023-04-25';

