package org.example.hien_thi_danh_sach_khach_hang.repository;

import org.example.hien_thi_danh_sach_khach_hang.entity.Khach_Hang;

import java.util.List;

public interface IKhachHangRepository {
    List<Khach_Hang> listAll();
}
