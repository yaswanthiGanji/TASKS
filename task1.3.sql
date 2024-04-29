-- 1) customers have not placed any orders
select firstname,lastname from customers where customerid <> all (select customerid from orders);
select firstname, lastname,customerid from Customers where customerid NOT IN (select distinct customerid FROM Orders);

-- 2) total no. of available products
select * from products;
select count(*) as totalproducts from products;

-- 3) calculating total revenue by techshop(tv taken)
select (select sum(o.quantity * p.price) FROM Orders o JOIN Products p 
ON o.orderid = p.productid WHERE p.productname = 'tv') AS totalrevenue;

-- 4) avg quantity ordered for quantity
select avg(quantity) from orders;
select * from orders;

-- 5) calculating total revenue by spedcific person
select (select sum(o.quantity * p.price) FROM Orders o JOIN Products p 
ON o.orderid = p.productid WHERE p.productname = 'tv') AS totalrevenueoftv;
select sum(price) as totalrevenueofphn from products where productname='phn';

-- 6) most order placed names
select* from orders;
select* from products;
select* from customers;
select count(*) from orders; -- no. of orders
select c.firstname,count(orderid) from customers c join orders o on c.customerid=o.customerid
group by c.customerid;

-- 7) highest money spent product name
select max(price) from products;
SELECT productname, price FROM products
WHERE price = (SELECT Max(price) FROM products);

-- 8) total revenue highest spent price
SELECT productname, price FROM products as totalrevenue
WHERE price = (SELECT Max(price) FROM products);

-- 10) total no. of orders with name 
select c.firstname,count(orderid) from customers c join orders o on c.customerid=o.customerid
group by c.customerid;