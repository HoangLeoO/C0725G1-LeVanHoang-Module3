drop database if exists manager_product;
create database if not exists manager_product;
use manager_product;

create table customers(
c_id int auto_increment primary key ,
c_name varchar(25),
c_age int
);

create table orders(
o_id int auto_increment primary key ,
c_id int ,
o_date date ,
o_total_price int,
foreign key (c_id)references customers(c_id)
);

create table products(
p_id int auto_increment primary key,
p_name varchar(25),
p_price int
);

create table order_details (
o_id int ,
p_id int ,
o_d_qty int ,
primary key (o_id,p_id),
foreign key (o_id)references orders(o_id),
foreign key (p_id)references products(p_id)
);

insert into customers(c_name,c_age) value('Minh Quan',10);
insert into customers(c_name,c_age) value('Ngoc Oanh',20);
insert into customers(c_name,c_age) value('Hong Ha',50);

insert into orders values(1,1,'2006-03-21',null),(2,2,'2006-03-23',null),(3,1,'2006-03-16',null);

insert into products value(1,"May giat",3);
insert into products value(2,"Tu lanh",3);
insert into products value(3,"Dieu hoa",3);
insert into products value(4,"Quat",3);
insert into products value(5,"Dep dien",3);

insert into order_details value(1,1,3);
insert into order_details value(1,3,7);
insert into order_details value(1,4,2);
insert into order_details value(2,1,1);
insert into order_details value(3,1,8);
insert into order_details value(2,5,4);
insert into order_details value(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select * from orders;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.c_name , group_concat(p.p_name) as gio_hang from order_details od 
join orders o on o.o_id = od.o_id
join products p on p.p_id = od.p_id
join customers c on c.c_id = o.c_id
group by c.c_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.c_name , count(o.o_id) as so_luong from customers c 
left join orders o on o.c_id = c.c_id
group by c.c_id
having so_luong = 0 ;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán
-- của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)-- 
select o.o_id ,o.o_date , sum(p.p_price) as total from products p 
join order_details od on od.p_id = p.p_id
join orders o on o.o_id = od.o_id
group by od.o_id;

