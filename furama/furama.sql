drop database if exists furama;
create database if not exists furama;
use furama;

-- 1. Bảng vị trí
CREATE TABLE vi_tri (
    ma_vi_tri INT auto_increment PRIMARY KEY,
    ten_vi_tri VARCHAR(45)
);

-- 2. Bảng trình độ
CREATE TABLE trinh_do (
    ma_trinh_do INT auto_increment PRIMARY KEY,
    ten_trinh_do VARCHAR(45)
);

-- 3. Bảng bộ phận
CREATE TABLE bo_phan (
    ma_bo_phan INT auto_increment PRIMARY KEY,
    ten_bo_phan VARCHAR(45)
);

-- 4. Bảng nhân viên
CREATE TABLE nhan_vien (
    ma_nhan_vien INT auto_increment PRIMARY KEY,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    so_cmnd VARCHAR(45),
    luong DOUBLE,
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT,
    ma_trinh_do INT,
    ma_bo_phan INT,
    FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
    FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
    FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan(ma_bo_phan)
);

-- 5. Bảng loại khách
CREATE TABLE loai_khach (
    ma_loai_khach INT auto_increment PRIMARY KEY,
    ten_loai_khach VARCHAR(45)
);

-- 6. Bảng khách hàng
CREATE TABLE khach_hang (
    ma_khach_hang INT auto_increment PRIMARY KEY,
    ma_loai_khach INT,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    gioi_tinh BIT,
    so_cmnd VARCHAR(45),
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

-- 7. Bảng loại dịch vụ
CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT auto_increment PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45)
);

-- 8. Bảng kiểu thuê
CREATE TABLE kieu_thue (
    ma_kieu_thue INT auto_increment PRIMARY KEY,
    ten_kieu_thue VARCHAR(45)
);

-- 9. Bảng dịch vụ
CREATE TABLE dich_vu (
    ma_dich_vu INT auto_increment PRIMARY KEY,
    ten_dich_vu VARCHAR(45),
    dien_tich INT,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da INT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);

-- 10. Bảng hợp đồng
CREATE TABLE hop_dong (
    ma_hop_dong INT auto_increment PRIMARY KEY,
    ngay_lam_hop_dong DATETIME,
    ngay_ket_thuc DATETIME,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

-- 11. Bảng dịch vụ đi kèm
CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT auto_increment PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(45),
    gia DOUBLE,
    don_vi VARCHAR(10),
    trang_thai VARCHAR(45)
);

-- 12. Bảng hợp đồng chi tiết
CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT auto_increment PRIMARY KEY,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    so_luong INT,
    FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);


