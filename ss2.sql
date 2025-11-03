-- bai tap 1 --

drop database if exists quan_ly_vat_tu;
create database if not exists quan_ly_vat_tu;

use quan_ly_vat_tu;

create table phieu_xuats (
so_px int ,
ngay_xuat date
);

create table vat_tus(
ma_vat_tu int ,
ten_vat_tu varchar(250)
);

create table phieu_xuat_vat_tu (
so_px int ,
ma_vat_tu int ,
dg_xuat varchar(250),
sl_xuat int
);

create table phieu_nhaps(
so_pn int ,
ngay_nhap date 
);

create table phieu_nhap_vat_tu (
so_pn int ,
ma_vat_tu int ,
dg_nhap varchar(250),
sl_nhap int
);

create table don_dhs(
so_dh int ,
ngay_dh date,
ma_ncc int
);

create table don_dh_vat_tu(
so_dh int ,
ma_vat_tu int,
ma_ncc int
);

create table nha_ccs (
ma_ncc int ,
ten_ncc varchar(250),
dia_chi varchar(250),
id_sdt int 
);

create table sdts(
id_sdt int ,
sdt varchar(250)
);

alter table phieu_xuats add primary key(so_px);
alter table vat_tus add primary key(ma_vat_tu);
alter table  phieu_nhaps add primary key(so_pn);
alter table don_dhs  add primary key(so_dh);
alter table nha_ccs add primary key(ma_ncc);
alter table sdts add primary key(id_sdt);

alter table phieu_xuat_vat_tu add constraint fk_phieu_xuat_vat_tu_phieu_xuat foreign key(so_px) references phieu_xuats(so_px) ;
alter table phieu_xuat_vat_tu add constraint fk_phieu_xuat_vat_tu_vat_tu foreign key(ma_vat_tu) references vat_tus(ma_vat_tu) ;
alter table phieu_nhap_vat_tu add constraint fk_phieu_nhap_vat_tu_phieu_nhap foreign key(so_pn) references phieu_nhaps(so_pn) ;
alter table phieu_nhap_vat_tu add constraint fk_phieu_nhap_vat_tu_vat_tu foreign key(ma_vat_tu) references vat_tus(ma_vat_tu) ;
alter table don_dh_vat_tu add constraint fk_don_dh_vat_tu_phieu_xuat foreign key(so_dh) references don_dhs(so_dh) ;
alter table don_dh_vat_tu add constraint fk_don_dh_vat_tu_vat_tu foreign key(ma_vat_tu) references vat_tus(ma_vat_tu) ;

alter table don_dhs add constraint fk_don_dh_nha_cc foreign key(ma_ncc) references nha_ccs(ma_ncc) ;
alter table nha_ccs add constraint fk_nha_cc_sdt foreign key(id_sdt) references sdts(id_sdt) ;



-- bai tap 2 --

create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;

create table if not exists customers (
c_id int ,
c_name varchar(250),
c_age int
);

create table if not exists `orders` (
o_id int ,
c_id int ,
o_date date,
o_total_price float
);

create table if not exists products (
p_id int ,
p_name varchar(250),
p_price float
);

create table if not exists order_details (
o_id int ,
p_id int ,
od_qty float
);

alter table customers add primary key(c_id);
alter table `orders` add primary key(o_id);
alter table products add primary key(p_id);
alter table order_details add primary key(o_id,p_id);

alter table `orders` add constraint fk_orders_customer foreign key(c_id) references customers(c_id) ;
alter table order_details add constraint fk_order_details_orders foreign key(o_id) references orders(o_id) ;
alter table order_details add constraint fk_order_details_products foreign key(p_id) references products(p_id) ;



