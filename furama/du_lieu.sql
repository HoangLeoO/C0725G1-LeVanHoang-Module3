use furama;
-- 1.Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thoả mãn các yêu cầu bên dưới.
insert into vi_tri ( ten_vi_tri)
values ('Quản Lý'),('Nhân Viên');

insert into trinh_do (ten_trinh_do)
values ('Trung Cấp'),('Cao Đẳng'),('Đại Học'),('Sau Đại Học');



INSERT INTO bo_phan (ma_bo_phan, ten_bo_phan)
VALUES
    (1, 'Sale-Marketing'),
    (2, N'Hành chính'),
    (3, N'Phục vụ'),
    (4, N'Quản lý');

INSERT INTO nhan_vien (ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
VALUES
    (N'Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', N'295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
    (N'Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', N'22 Yên Bái, Đà Nẵng', 1, 2, 2),
    (N'Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', N'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
    (N'Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', N'77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
    (N'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', N'43 Yên Bái, Đà Nẵng', 2, 1, 1),
    (N'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', N'294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3),
    (N'Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', N'4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
    (N'Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com', N'111 Hùng Vương, Hà Nội', 2, 4, 4),
    (N'Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', N'213 Hàm Nghi, Đà Nẵng', 2, 4, 4),
    (N'Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', N'6 Hoà Khánh, Đồng Nai', 2, 3, 2);



INSERT INTO loai_khach (ten_loai_khach)
VALUES
    ('Diamond'),
    ('Platinium'),
    ('Gold'),
    ('Silver'),
    ('Member');

INSERT INTO kieu_thue (ma_kieu_thue, ten_kieu_thue)
VALUES
    (1, 'year'),
    (2, 'month'),
    (3, 'day'),
    (4, 'hour');


INSERT INTO loai_dich_vu (ma_loai_dich_vu, ten_loai_dich_vu)
VALUES
    (1, 'Villa'),
    (2, 'House'),
    (3, 'Room');


INSERT INTO dich_vu_di_kem (ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai)
VALUES
    (1, 'Karaoke', 10000, N'giờ', N'tiện nghi, hiện đại'),
    (2, N'Thuê xe máy', 10000, N'chiếc', N'hỏng 1 xe'),
    (3, N'Thuê xe đạp', 20000, N'chiếc', N'tốt'),
    (4, N'Buffet buổi sáng', 15000, N'suất', N'đầy đủ đồ ăn, tráng miệng'),
    (5, N'Buffet buổi trưa', 90000, N'suất', N'đầy đủ đồ ăn, tráng miệng'),
    (6, N'Buffet buổi tối', 16000, N'suất', N'đầy đủ đồ ăn, tráng miệng');


INSERT INTO khach_hang (ma_khach_hang, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach)
VALUES
    (1, N'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', N'23 Nguyễn Hoàng, Đà Nẵng', 5),
    (2, N'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', N'K77/22 Thái Phiên, Quảng Trị', 3),
    (3, N'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373121312', 'nghenhan2702@gmail.com', N'K323/12 Ông Ích Khiêm, Vinh', 1),
    (4, N'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', N'K453/12 Lê Lợi, Đà Nẵng', 1),
    (5, N'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', N'224 Lý Thái Tổ, Gia Lai', 4),
    (6, N'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', N'37 Yên Thế, Đà Nẵng', 4),
    (7, N'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', N'K123/45 Lê Lợi, Hồ Chí Minh', 1),
    (8, N'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohoa99@gmail.com', N'55 Nguyễn Văn Linh, Kon Tum', 3),
    (9, N'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', N'24 Lý Thường Kiệt, Quảng Ngãi', 1),
    (10, N'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', N'22 Ngô Quyền, Đà Nẵng', 2);

INSERT INTO dich_vu (ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, ma_kieu_thue, ma_loai_dich_vu)
VALUES
    (1, 'Villa Beach Front', 25000, 10000000, 10, 'vip', N'Có hồ bơi', 500, 4, 3, 1),
    (2, 'House Princess 01', 14000, 5000000, 7, 'vip', N'Có thêm bếp nướng', NULL, 3, 2, 2),
    (3, 'Room Twin 01', 5000, 1000000, 2, 'normal', N'Có tivi', NULL, NULL, 4, 3),
    (4, 'Villa No Beach Front', 22000, 9000000, 8, 'normal', N'Có hồ bơi', 300, 3, 3, 1),
    (5, 'House Princess 02', 10000, 4000000, 5, 'normal', N'Có thêm bếp nướng', NULL, 2, 3, 2),
    (6, 'Room Twin 02', 3000, 900000, 2, 'normal', N'Có tivi', NULL, NULL, 4, 3);

INSERT INTO hop_dong (ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
VALUES
    (1, '2020-12-08', '2020-12-08', 0, 3, 1, 3),
    (2, '2020-07-14', '2020-07-21', 200000, 7, 3, 1),
    (3, '2021-03-15', '2021-03-17', 50000, 3, 4, 2),
    (4, '2021-01-14', '2021-01-18', 100000, 7, 5, 5),
    (5, '2021-07-14', '2021-07-15', 0, 7, 2, 6),
    (6, '2021-06-01', '2021-06-03', 0, 7, 7, 6),
    (7, '2021-09-02', '2021-09-05', 100000, 7, 4, 4),
    (8, '2021-06-17', '2021-06-18', 150000, 3, 4, 1),
    (9, '2020-11-19', '2020-11-19', 0, 3, 4, 3),
    (10, '2021-04-12', '2021-04-14', 0, 10, 3, 5),
    (11, '2021-04-25', '2021-04-25', 0, 2, 2, 1),
    (12, '2021-05-25', '2021-05-27', 0, 7, 10, 1);


INSERT INTO hop_dong_chi_tiet (ma_hop_dong_chi_tiet, so_luong, ma_hop_dong, ma_dich_vu_di_kem)
VALUES
    (1, 5, 2, 4),
    (2, 8, 2, 5),
    (3, 15, 2, 6),
    (4, 1, 3, 1),
    (5, 11, 3, 2),
    (6, 1, 1, 3),
    (7, 2, 1, 2),
    (8, 2, 12, 2);