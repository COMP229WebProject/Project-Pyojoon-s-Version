-- sequence for Product_id --
-- drop previous sequence --
drop sequence seq_product_id

-- create new sequence --
create sequence seq_product_id
	start with 60
	increment by 1;


-- sequence for Order_id --
-- drop previous sequence --
drop sequence seq_order_id

-- create new sequence --
create sequence seq_order_id
	start with 20
	increment by 1;


-- sequence for Department_id --
-- drop previous sequence --
drop sequence seq_department_id

-- create new sequence --
create sequence seq_department_id
	start with 5
	incremnet by 1;


-- sequence for Category_id --
-- drop previous sequence --
drop sequence seq_category_id

-- create new sequence --
create sequence seq_category_id
	start with 10
	incremnet by 1;

-----------------------------------------------------

-- index for Customer_info --
-- drop previous index --
drop index idx_customer_info

-- create new index --
create index idx_customer_info
	on Orders(customerName, customerEmail, shippingAddress);


-- index for Product_info --
-- drop previous index --
drop index idx_product_info

-- create new index --
create index idx_product_info
	on Product(productid, name, price);


-- index for department_info --
-- drop previous index --
drop index idx_department_info

-- create new index --
create index idx_department_info
	on Department(departmentid, name);

-----------------------------------------------------

create or replace function ShoppingCartRemoveItem(
	cid in varchar2(30),
	pid in int
	)
AS
begin
	delete from shoppingCart
	where cartid = cid and productid = pid;
end;

create or replace function ShoppingCartAddItem(
	cid varchar2(30),
	pid int,
	attri varchar2(1000)
	)
AS
begin
	if exists(
		select cartid
		from shoppingCart
		where productid = pid and cartid = cid
		)
		update shoppingCart
		set quantity = quantity + 1
		where productid = id and cartid = cid
	else if exists(
		select name
		from Product
		where productid = pid
		)
		insert into shoppingCart (cartid, productid, attributes, quantity, dateadded)
		values (cid, pid, attri, 1, sysdate);
end;