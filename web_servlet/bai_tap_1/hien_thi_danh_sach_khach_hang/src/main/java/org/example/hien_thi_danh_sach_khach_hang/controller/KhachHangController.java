package org.example.hien_thi_danh_sach_khach_hang.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.hien_thi_danh_sach_khach_hang.repository.IKhachHangRepository;
import org.example.hien_thi_danh_sach_khach_hang.repository.KhachHangRepository;

import java.io.IOException;

@WebServlet(name = "khachHangController", value = "/khach_hang")
public class KhachHangController extends HttpServlet {

    private  static  final IKhachHangRepository khachHangRepository = new KhachHangRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listKhachHang", khachHangRepository.listAll());
        req.getRequestDispatcher("view/listKhachHang.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
