-- 2 Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

select *
from nhan_vien
where (ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%')
  and char_length(ho_ten) <= 15;

-- 3 Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.-- 
SELECT ma_khach_hang, ho_ten
FROM khach_hang
WHERE (YEAR(CURDATE()) - YEAR(ngay_sinh)) BETWEEN 18 AND 50
  AND (dia_chi LIKE '%Đà Nẵng%' OR dia_chi LIKE '%Quảng Trị%');

select *, timestampdiff(Year, ngay_sinh, CURDATE()) as tuoi
from khach_hang
where timestampdiff(Year, ngay_sinh, CURDATE()) between 18 and 50
  and dia_chi in (dia_chi like '% Đà Nẵng %' or dia_chi like '% Quảng Trị %');

-- 4 Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần
-- theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond” 
select hd.ma_khach_hang, count(hd.ma_hop_dong) as sl
from hop_dong hd
         join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
         join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = 'Diamond'
group by hd.ma_khach_hang;

select hd.ma_khach_hang, count(hd.ma_hop_dong) as sl
from hop_dong hd
where hd.ma_khach_hang in (select ma_khach_hang
                           from khach_hang kh
                                    join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
                           where lk.ten_loai_khach = 'Diamond')
group by hd.ma_khach_hang;

-- 5 Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).


select kh.ma_khach_hang,
       kh.ho_ten,
       lk.ten_loai_khach,
       hd.ma_hop_dong,
       dv.ten_dich_vu,
       hd.ngay_lam_hop_dong,
       hd.ngay_ket_thuc,
       sum((dv.chi_phi_thue + IFNULL(hdct.so_luong, 0) * IFNULL(dvdk.gia, 0))) AS tong_tien
from khach_hang kh
         left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
         left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
         left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
         left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
         left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong,
         hd.ngay_ket_thuc
order by kh.ma_khach_hang, hd.ma_hop_dong;

--  6 Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
--  chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from (dich_vu dv
    join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
    left join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
    and (year(hd.ngay_lam_hop_dong) = (2021)) and (month(hd.ngay_lam_hop_dong) in (01, 02, 03)))
where hd.ma_hop_dong is null;
--  7 Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
--  đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
         join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
         join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
    and (year(hd.ngay_lam_hop_dong) = (2020))
where dv.ma_dich_vu in
      (select dv.ma_dich_vu
       from dich_vu dv
                join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
                left join hop_dong hd on (hd.ma_dich_vu = dv.ma_dich_vu
           and year(hd.ngay_lam_hop_dong) = (2021))
       where hd.ma_hop_dong is null)
group by dv.ma_dich_vu
;

-- 8 Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select distinct ho_ten
from khach_hang;
select ho_ten
from khach_hang
group by ho_ten;
select ho_ten
from (select ho_ten from khach_hang group by ho_ten) as kh;

-- 9 Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hd.ngay_lam_hop_dong), count(month(hd.ngay_lam_hop_dong)) as thang
from khach_hang kh
         join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang and year(hd.ngay_lam_hop_dong) = 2021
group by month(hd.ngay_lam_hop_dong);

-- 10 Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, coalesce(sum(hdct.so_luong), 0)
from hop_dong hd
         left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
group by hd.ma_hop_dong;

-- 11 Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.*, kh.ma_khach_hang, kh.ho_ten, kh.dia_chi
from khach_hang kh
         inner join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
         inner join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
         inner join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
         inner join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where (lk.ten_loai_khach = 'Diamond')
  and (kh.dia_chi like '% Vinh' or kh.dia_chi like '% Quảng Ngãi');

--  12 Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
--  (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
--  tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong,
       nv.ho_ten,
       kh.ho_ten,
       kh.so_dien_thoai,
       dv.ten_dich_vu,
       coalesce(sum(hdct.so_luong), 0) as so_luong_dich_vu_di_kem,
       hd.tien_dat_coc,
       hd.ngay_lam_hop_dong
from hop_dong hd
         left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
         left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
         join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
         join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
    and year(hd.ngay_lam_hop_dong) = 2020 and month(hd.ngay_lam_hop_dong) in (10, 11, 12)
where hd.ma_hop_dong not in (select hd.ma_hop_dong
                             from hop_dong hd
                                      left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
                                      left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
                                      join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
                                      join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
                                 and year(hd.ngay_lam_hop_dong) = 2021 and
                                                         month(hd.ngay_lam_hop_dong) in (1, 2, 3, 4, 5, 6)
                             group by hd.ma_hop_dong)
group by hd.ma_hop_dong;

-- 13 Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_su_dung
from dich_vu_di_kem dvdk
         join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ten_dich_vu_di_kem
having so_luong_su_dung = (select sum(hdct.so_luong) as so_luong_su_dung
                           from dich_vu_di_kem dvdk
                                    join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
                           group by dvdk.ten_dich_vu_di_kem
                           order by so_luong_su_dung desc
                           limit 0,1)
;

-- 14 Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hd.ma_hop_dong, ldv.ten_loai_dich_vu, bang_tam.ten_dich_vu_di_kem, bang_tam.so_lan_su_dung
from (select dvdk.ten_dich_vu_di_kem       as ten_dich_vu_di_kem,
             dvdk.ma_dich_vu_di_kem        as ma_dich_vu_di_kem,
             count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
      from hop_dong_chi_tiet hdct
               join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
      group by dvdk.ten_dich_vu_di_kem, dvdk.ma_dich_vu_di_kem
      having count(hdct.ma_dich_vu_di_kem) = 1) as bang_tam
         join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = bang_tam.ma_dich_vu_di_kem
         join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
         join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
         join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
;


-- 15 Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv
         join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
         join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
         join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
    and year(hd.ngay_lam_hop_dong) in (2020, 2021)
group by nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
having count(hd.ma_hop_dong) <= 3;
;


-- 16 Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET SQL_SAFE_UPDATES = 0;
delete nhan_vien
from nhan_vien
where ma_nhan_vien in
      (select ma_nhan_vien
       from (select nv.ma_nhan_vien
             from nhan_vien nv
                      left join hop_dong hd
                                on hd.ma_nhan_vien = nv.ma_nhan_vien and year(hd.ngay_lam_hop_dong) in (2019, 2021)
             where hd.ma_hop_dong is null) as temp);
SET SQL_SAFE_UPDATES = 1;

-- 17 Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinium lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
update khach_hang kh
set kh.ma_loai_khach = 1
where kh.ma_khach_hang in (select ma_khach_hang
                           from (select kh.ma_khach_hang
                                 from khach_hang kh
                                          join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
                                          join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
                                          join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
                                          join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
                                          join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
                                          join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu and
                                                                   year(hd.ngay_lam_hop_dong) = '2021'
                                 where lk.ten_loai_khach = 'Platinium'
                                 group by kh.ho_ten, lk.ten_loai_khach, kh.ma_khach_hang
                                 having sum((dv.chi_phi_thue + IFNULL(hdct.so_luong, 0) * IFNULL(dvdk.gia, 0))) >
                                        10000000) as temp)
;

-- 18 Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
SET SQL_SAFE_UPDATES = 0;
delete khach_hang
from khach_hang
where khach_hang.ma_khach_hang in (select temp.ma_khach_hang
                                   from (select kh.ma_khach_hang
                                         from khach_hang kh
                                                  join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
                                         where year(hd.ngay_lam_hop_dong) < 2021)
                                            as temp);
SET SQL_SAFE_UPDATES = 1;


-- 19 Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
SET SQL_SAFE_UPDATES = 0;
update dich_vu_di_kem dvdk
set dvdk.gia = (dvdk.gia * 2)
where dvdk.ma_dich_vu_di_kem in
      (select temp.ma_dich_vu_di_kem
       from (select dvdk.ma_dich_vu_di_kem as ma_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_su_dung
             from dich_vu_di_kem dvdk
                      join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
                      right join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
                 and year(hd.ngay_lam_hop_dong) = 2020
             group by dvdk.ma_dich_vu_di_kem
             having so_luong_su_dung > 10) as temp);
SET SQL_SAFE_UPDATES = 1;

-- 20 Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang
union all
select ma_nhan_vien, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien;

-- 21 Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và
--  đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
create view view_nhan_vien_yen_bai as
select nv.*
from nhan_vien nv
         join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien and hd.ngay_lam_hop_dong = '2021-04-25'
where nv.dia_chi like '%Yên Bái%';
-- 22 Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
UPDATE nhan_vien v
SET dia_chi = 'Liên Chiểu'
WHERE v.ma_nhan_vien IN (SELECT temp.ma_nhan_vien
                         FROM (SELECT ma_nhan_vien
                               FROM view_nhan_vien_yen_bai) AS temp);

--  23 Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin
--  của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

DELIMITER //
create procedure sp_xoa_khach_hang(in id int)
begin
    delete khach_hang from khach_hang where ma_khach_hang = id;
end //
DELIMITER ;
call sp_xoa_khach_hang(1);

-- 24 Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phảithực hiện kiểm
-- tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
select *
from hop_dong;
select *
from khach_hang;
DELIMITER //
create procedure sp_them_moi_hop_dong(in sp_tien_dat_coc double, in sp_ma_nhan_vien int, in sp_ma_khach_hang int,
                                      in sp_ma_dich_vu int)

begin
    declare id_ma_nhan_vien int;
    declare id_ma_khach_hang int;
    declare id_ma_dich_vu int;

    select ma_nhan_vien into id_ma_nhan_vien from nhan_vien where ma_nhan_vien = sp_ma_nhan_vien;
    select ma_khach_hang into id_ma_khach_hang from khach_hang where ma_khach_hang = sp_ma_khach_hang;
    select ma_dich_vu into id_ma_dich_vu from dich_vu where ma_dich_vu = sp_ma_dich_vu;

    if id_ma_nhan_vien is null
    then
        select 'mã nhân viên không tồn tại!' as thong_bao;
    elseif id_ma_khach_hang is null
    then
        select 'mã khach hang không tồn tại!' as thong_bao;
    elseif id_ma_dich_vu is null
    then
        select 'mã dich vu không tồn tại!' as thong_bao;
    else
        insert into hop_dong(ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
        VALUES (now(), now(), sp_tien_dat_coc, sp_ma_nhan_vien, sp_ma_khach_hang, sp_ma_dich_vu);
    end if;
end //
DELIMITER ;
call sp_them_moi_hop_dong(-1000, 2, 2, 6);
drop procedure sp_them_moi_hop_dong;

# 25 Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
# Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
create table log_bang_ghi
(
    id        int auto_increment primary key KEY,
    noi_dung  varchar(255),
    thoi_gian datetime
);
DELIMITER //
create trigger tr_xoa_hop_dong
    after delete
    on hop_dong
    for each row
BEGIN
    declare cnt int;

    select count(*) into cnt from hop_dong;

    insert into log_bang_ghi (noi_dung, thoi_gian)
    values (concat('Số lượng bản ghi còn lại: ', cnt), now());

end;
//
DELIMITER ;

# 26 Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng,
# cần kiểm tra xem thời gian cập nhật có phù hợp hay không,
# với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày.
# Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì
# in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
# Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
delimiter //
create trigger tr_cap_nhat_hop_dong
    before update
    on hop_dong
    for each row
begin
    if NEW.ngay_ket_thuc - NEW.ngay_lam_hop_dong < 2 then
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Lỗi: Hợp đồng phải có thời gian tối thiểu 2 ngày!';
    end if;
end;
//
delimiter ;
select *
from hop_dong;
update hop_dong
set ngay_ket_thuc = '2021-09-01'
where ma_hop_dong = 7;

# 27 Tạo Function thực hiện yêu cầu sau:
# Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
# Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm
# hợp đồng đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng
# thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng).
# Mã của khách hàng được truyền vào như là 1 tham số của function này.


delimiter //

create function func_tinh_thoi_gian_hop_dong(f_ma_khach_hang int)
    returns int
    deterministic
begin
    declare cnt int;
    select max(max)
    into cnt
    from (select (hd.ngay_ket_thuc - hd.ngay_lam_hop_dong) as max
          from hop_dong hd
                   join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
          where kh.ma_khach_hang = f_ma_khach_hang
          group by hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc
          having max(hd.ngay_ket_thuc - hd.ngay_lam_hop_dong))
             as temp;
    return cnt;
end;
// delimiter ;

select func_tinh_thoi_gian_hop_dong(3);
delimiter //
create function func_dem_dich_vu()
    returns int
    deterministic no sql
begin
    declare dem int;
    select sum(hhddc.tong)
    into dem
    from (select count(dv.ma_dich_vu) as tong
          from hop_dong_chi_tiet hdct
                   join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
                   join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
                   join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
          group by dv.ma_dich_vu
          having sum((dv.chi_phi_thue + IFNULL(hdct.so_luong, 0) * IFNULL(dvdk.gia, 0))) > 2000000) as hhddc;
    return dem;
end;
//
delimiter ;
drop function func_dem_dich_vu;

select func_dem_dich_vu();

# 28 Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019
# để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu) và xóa những hop_dong sử dụng dịch vụ liên quan (tức
# là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác.

select dv.ma_dich_vu , hd.ma_hop_dong , hd.ngay_lam_hop_dong , ldv.ma_loai_dich_vu  from dich_vu dv
    left join  loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
    left join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where ldv.ten_loai_dich_vu = 'Room';


delimiter //

// delimiter ;

