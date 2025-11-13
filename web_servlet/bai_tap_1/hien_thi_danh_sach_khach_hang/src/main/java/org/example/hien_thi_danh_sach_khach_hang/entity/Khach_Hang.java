package org.example.hien_thi_danh_sach_khach_hang.entity;

public class Khach_Hang {
    private int id ;
    private String ten_khach_hang ;
    private String dia_chi ;
    private String ngay_sinh;

    public Khach_Hang() {
    }

    public Khach_Hang(int id, String ten_khach_hang, String dia_chi, String ngay_sinh) {
        this.id = id;
        this.ten_khach_hang = ten_khach_hang;
        this.dia_chi = dia_chi;
        this.ngay_sinh = ngay_sinh;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen_khach_hang() {
        return ten_khach_hang;
    }

    public void setTen_khach_hang(String ten_khach_hang) {
        this.ten_khach_hang = ten_khach_hang;
    }

    public String getDia_chi() {
        return dia_chi;
    }

    public void setDia_chi(String dia_chi) {
        this.dia_chi = dia_chi;
    }

    public String getNgay_sinh() {
        return ngay_sinh;
    }

    public void setNgay_sinh(String ngay_sinh) {
        this.ngay_sinh = ngay_sinh;
    }
}
