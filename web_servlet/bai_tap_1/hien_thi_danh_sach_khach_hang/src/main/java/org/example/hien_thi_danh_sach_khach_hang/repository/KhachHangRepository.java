package org.example.hien_thi_danh_sach_khach_hang.repository;

import org.example.hien_thi_danh_sach_khach_hang.entity.Khach_Hang;

import java.util.ArrayList;
import java.util.List;

public class KhachHangRepository implements IKhachHangRepository{
    private static List<Khach_Hang> listKhachHang = new ArrayList<>();

    static {
        listKhachHang.add(new Khach_Hang(1, "LeVan", "HCM", "1999-09-09"));
        listKhachHang.add(new Khach_Hang(2, "LeVan2", "HCM2", "1999-09-01"));
    }

    @Override
    public List<Khach_Hang> listAll() {
        return listKhachHang;

    }

}

