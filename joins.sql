create table customers(
customer_id int primary key auto_increment,
first_name varchar(50),
last_name varchar(50)
);

insert into customers(first_name,last_name)
values
("Fred","Fish"),
("Larry","Lobster"),
("Bubble","Bass");

select * from customers;

create table transactions(
transaction_id int auto_increment primary key,
amount decimal(5,2),
customer_id int,
foreign key(customer_id) references customers(customer_id) 
# you can see foreign key under table transactions foreign keys like transactions_ibfk_1
);

# If you want to drop foreign key

alter table transactions
drop foreign key transactions_ibfk_1;

# If you want you can give forein key unique name

alter table transactions
add constraint fk_customer_id
foreign key(customer_id) references customers(customer_id);

select * from transactions;

alter table transactions
auto_increment =1000;

insert into transactions(amount,customer_id)
values
(4.99,3),
(2.89,2),
(3.38,3),
(4.99,1);

select * from transactions;

delete from customers where customer_id=3;
# It shows cannot delete or update a parent row: a foreign key constraint fails
#mysql prevents actions that destroy the link between tables unless we delete the foreign key.

insert into transactions(amount,customer_id)
values
(1.00,null);

select * from customers;

insert into customers(first_name,last_name)
values
("Poppy","Puff");

select * from customers;

select * from transactions;

