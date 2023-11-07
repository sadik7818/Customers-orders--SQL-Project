create database Customers_orders_products

create table Customers(CustomerID int primary key, NAme Varchar(max),email varchar(max))
select * from Customers

insert into Customers values   (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com')

CREATE TABLE Orders (OrderID INT PRIMARY KEY,CustomerID INT,ProductName VARCHAR(MAX),OrderDate DATE,Quantity INT)
insert into Orders values(1, 1, 'Product A', '2023-07-01', 5),(2, 2, 'Product B', '2023-07-02', 3),(3, 3, 'Product C', '2023-07-03', 2),(4, 4, 'Product A', '2023-07-04', 1),
(5, 5, 'Product B', '2023-07-05', 4),(6, 6, 'Product C', '2023-07-06', 2),(7, 7, 'Product A', '2023-07-07', 3),(8, 8, 'Product B', '2023-07-08', 2),(9, 9, 'Product C', '2023-07-09', 5),(10, 10, 'Product A', '2023-07-10', 1);
select * from Orders

CREATE TABLE Products (ProductID INT PRIMARY KEY,ProductName VARCHAR(50),Price DECIMAL(10, 2))
insert into Products values (1, 'Product A', 10.99),(2, 'Product B', 8.99),(3, 'Product C', 5.99),(4, 'Product D', 12.99),(5, 'Product E', 7.99),
(6, 'Product F', 6.99),(7, 'Product G', 9.99),(8, 'Product H', 11.99),(9, 'Product I', 14.99),(10, 'Product J', 4.99)
select * from Products

-- Write a query to retrieve all records from the Customers table..
select * from Customers

--Write a query to retrieve the names and email addresses of customers whose names start with 'J'.
select Name,email from Customers where Name like'J%'

--Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders..
select OrderID, ProductName, Quantity from Orders

--Write a query to calculate the total quantity of products ordered.
select Sum(Quantity) 'Total Quantity' from Orders

--write a query to retrieve the names of customers who have placed an order.
select Customers.CustomerID,Customers.NAme,Orders.Quantity
from Customers 
Left Join Orders
on Customers.CustomerID=Orders.CustomerID

--Write a query to retrieve the products with a price greater than $10.00.
select ProductName from Products where Price>10.00

--Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.
select Customers.NAme,(select Orders.OrderDate where Orders.OrderDate>='2023-07-05')'OrderDate'
from Customers 
inner join Orders 
on customers.customerId=Orders.CustomerID
--Write a query to calculate the average price of all products.
select ProductName, Avg(price) from products
group by (ProductName)

--Write a query to retrieve the customer names along with the total quantity of products they have ordered.
select Customers.NAme,Orders.Quantity
from Customers 
Left Join Orders
on Customers.CustomerID=Orders.CustomerID

--Write a query to retrieve the products that have not been ordered.
select Products.ProductName from Products
except
select Orders.ProductName from Orders

--Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.
select  top 5 Customers.NAme,Orders.quantity 
from Customers 
inner join Orders 
on Customers.CustomerID=Orders.CustomerID
Order by quantity desc

--Write a query to calculate the average price of products for each product category.
select ProductName,avg(price)'Average' from Products
group by ProductName

--Write a query to retrieve the customers who have not placed any orders.
Select customerID from Customers
except
select customerID from Orders

--Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M'.
select Name,Orders.OrderID,Orders.ProductName,Orders.Quantity
from Customers
left outer join Orders
on Customers.customerID=Orders.customerID
where Name like 'M%'

--5.	Write a query to calculate the total revenue generated from all orders.
select sum((Products.Price*Orders.Quantity))'Total Revenue'
from Products,Orders
where products.productName=Orders.productName

--Write a query to retrieve the customer names along with the total revenue generated from their orders.
select customers.Name ,Products.Price*Orders.Quantity 'Total Revenue'
from customers
join Orders 
on customers.customerId=Orders.customerID
join Products
on Products.productName=Orders.productName

--Write a query to retrieve the customers who have placed at least one order for each product category.
select Customers.NAme,count(Distinct Orders.ProductName)
from Customers
join Orders on Customers.CustomerID=Orders.CustomerID
join Products on Orders.ProductName=Products.ProductName
group by Customers.NAme, Orders.ProductName
having count(distinct Orders.ProductName)=10
--Write a query to retrieve the customers who have placed orders on consecutive days.
 
--Write a query to retrieve the top 3 products with the highest average 
select top 3 customers.Name ,avg(Products.Price*Orders.Quantity) 'Average'
from customers
join Orders 
on customers.customerId=Orders.customerID
join Products
on Products.productName=Orders.productName
group by NAme
Order by Average desc


--Write a query to retrieve the customers who have placed orders for all products.
select Customers.NAme,count(Products.ProductName)
from Customers
join Orders on Customers.CustomerID=Orders.CustomerID
join Products on Orders.ProductName=Products.ProductName
group by Customers.NAme, Orders.ProductName
having count(distinct Orders.ProductName)=10

--write a query to retrieve the products that have been ordered by all customers.
select orders.productName
from Orders

--Write a query to calculate the total revenue generated from orders placed in each month.
select month(Orders.Orderdate)'Month',sum(Products.Price*Orders.Quantity) 'Total Revenue'
from orders,products
where Orders.OrderID=Products.ProductID
group by month(orders.Orderdate)

--Write a query to retrieve the products that have been ordered by more than 50% of the customers.
select Orders.ProductName,count(Customers.customerID)'TotalCustomers'
from orders,Customers
where (TotalCustomers/2)<

--Write a query to retrieve the customers who have placed orders for all products in a specific category.
select Customers.NAme,count(Products.ProductName)
from Customers
join Orders on Customers.CustomerID=Orders.CustomerID
join Products on Orders.ProductName=Products.ProductName
group by Customers.NAme, Orders.ProductName
having count(distinct Orders.ProductName)=10

--Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders.
select top 5 Customers.Name,sum(Orders.quantity*Products.Price)'Amount'
from customers
join orders
on Customers.CustomerID=Orders.CustomerID
join Products
on Products.productName=Orders.productName
group by NAme
Order by Amount desc

--Write a query to calculate the running total of order quantities for each customer.
select *,(Select Sum(T2.quantity) 
from Orders as T2
where T2.customerID <=T1.customerID
)'Running Total'
from Orders as T1

--Write a query to retrieve the top 3 most recent orders for each customer.
select top 3 customers.Name ,Orders.OrderDate
from Customers
join orders on Customers.CustomerID=Orders.CustomerID
order by OrderDate desc

--	Write a query to calculate the total revenue generated by each customer in the last 30 days.
select sum(Products.Price*Orders.Quantity) 'Total Revenue'
from Products
inner join orders on Products.ProductID=Orders.CustomerID 

--Write a query to retrieve the customers who have placed orders for at least two different product categories.
select Customers.NAme,count(Distinct Orders.ProductName)
from Customers
join Orders on Customers.CustomerID=Orders.CustomerID
group by Customers.NAme, Orders.ProductName
having count(distinct Orders.ProductName)>=2

--	Write a query to calculate the average revenue per order for each customer.
select customers.Name ,avg(Products.Price*Orders.Quantity) 'Average Rvenue'
from customers
join Orders 
on customers.customerId=Orders.customerID
join Products
on Products.productName=Orders.productName
group by NAme

--Write a query to retrieve the products that have been ordered by customers from a specific country.
select Products.productName from Products where Country='USA'

--Write a query to retrieve the customers who have placed orders for every month of a specific year.
with CTE as(
Select Customers.NAme,DATEPART(Month,Orders.Orderdate) ,count(Orders.Quantity)
from Customers
join Orders on Customers.CustomerID=Orders.CustomerID
group by Customers.NAme,DATEPART(Month,Orders.Orderdate))
select * from CTE

