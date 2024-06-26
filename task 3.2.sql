-- 1.Write a SQL query to retrieve the name, account type and email of all customers.

select customers.first_name,customers.last_name,accounts.account_type,customers.email
from customers
inner join accounts on  accounts.customer_id=customers.customer_id;

-- 2. Write a SQL query to list all transaction corresponding customer
select customers.customer_id,customers.first_name,customers.last_name,accounts.account_id,transactions.transaction_id,
transactions.transaction_type,
transactions.transaction_date
from customers
join accounts on customers.customer_id=accounts.customer_id
join transactions on accounts.account_id=transactions.account_id;

-- 3. Write a SQL query to increase the balance of a specific account by a certain amount.
update accounts set balance= balance+500.00 where account_id=12;

-- 4. Write a SQL query to Combine first and last names of customers as a full_name.
select concat(first_name,' ',last_name) as Name from customers;

-- 5. Write a SQL query to remove accounts with a balance of zero where the account type is savings.
delete from accounts where balance=0 and account_type='savings';

-- 6. Write a SQL query to Find customers living in a specific city
select * from customers where address like '%Tirupati%';

-- 7. Write a SQL query to Get the account balance for a specific account.
select balance from accounts where account_id=11;
-- 8. Write a SQL query to List all current accounts with a balance greater than $1,000
select * from accounts where balance > 1000;

-- 9. Write a SQL query to Retrieve all transactions for a specific account
select * from transactions where account_id=14;

-- 10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.
select account_id,balance*1.2 as Interest_Rate from accounts
where account_type='savings';

-- 11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit
select * from accounts where balance < 50000;

-- 12. Write a SQL query to Find customers not living in a specific city
select concat(first_name,' ',last_name) as Name from customers where address not like '%USA%';