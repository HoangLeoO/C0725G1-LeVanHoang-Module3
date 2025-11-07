-- Bước 1: Tạo cơ sở dữ liệu demo
drop database if exists demo;
CREATE DATABASE IF NOT EXISTS demo;
USE demo;

-- Bước 2: Tạo bảng Products
CREATE TABLE IF NOT EXISTS Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    product_code VARCHAR(50) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    product_price DECIMAL(10,2) NOT NULL,
    product_amount INT NOT NULL,
    product_description TEXT,
    product_status BOOLEAN DEFAULT TRUE
);

-- Chèn dữ liệu mẫu
INSERT INTO Products (product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES
('P001', 'Laptop Dell Inspiron', 18500000, 10, 'Laptop văn phòng hiệu năng ổn định', TRUE),
('P002', 'Chuột Logitech M331', 350000, 50, 'Chuột không dây tiết kiệm pin', TRUE),
('P003', 'Bàn phím cơ Keychron K2', 2200000, 20, 'Bàn phím cơ Bluetooth, switch Brown', TRUE),
('P004', 'Màn hình LG UltraWide 29"', 5500000, 8, 'Màn hình 29 inch tỉ lệ 21:9 cho công việc đa nhiệm', TRUE),
('P005', 'Tai nghe Sony WH-1000XM4', 7200000, 5, 'Tai nghe chống ồn cao cấp', FALSE);


-- Bước 3:

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index idx_product_code on products(product_code);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index idx_name_price on products(product_name,product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where product_code = 'P004';
-- So sánh câu truy vấn trước và sau khi tạo index
drop index  idx_product_code on products;
explain  select * from products where product_code = 'P003';

-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view  view_product as
select product_code,product_name,product_price,product_status from products ;
select * from view_product;
-- Tiến hành sửa đổi view
update view_product set product_status = "0" where product_code = 'P001';
create or replace view view_product as select product_code,product_name,product_price,product_status,product_amount from products ;
-- Tiến hành xoá view

delete from view_product where product_code = 'P001';
drop view view_product;
-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
 DELIMITER //
 create procedure get_all_product()
 begin
 select * from products;
 end //
 DELIMITER
call get_all_product();
-- Tạo store procedure thêm một sản phẩm mới

DELIMITER //
create procedure add_product(in product_code VARCHAR(50) , in product_name  VARCHAR(255), in product_price DECIMAL(10,2)
 ,in product_amount INT ,in product_description TEXT)
 begin
INSERT INTO Products (product_code, product_name, product_price, product_amount, product_description)
VALUES
(product_code, product_name, product_price, product_amount, product_description);
 end //
DELIMITER ;
call demo.add_product('P006', 'Test', 1000000, 200, 'dep trai');
drop procedure add_product;
 
-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
create procedure update_product(in sp_product_id int ,in product_name VARCHAR(255) )
 begin
update products as p set  p.product_name = product_name where p.id = sp_product_id;
 end //
DELIMITER ;
drop procedure update_product;
call update_product(1,'Tai nghe Sony WH-1000XM4');

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
create procedure delete_product(in sp_product_id int )
 begin
delete from  products as p where p.id = sp_product_id;
 end //
DELIMITER ;
call delete_product(1);
