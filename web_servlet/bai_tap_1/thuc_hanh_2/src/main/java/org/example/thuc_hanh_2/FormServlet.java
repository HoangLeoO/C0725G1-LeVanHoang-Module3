package org.example.thuc_hanh_2;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/form-servlet")
public class FormServlet extends HttpServlet {

    // Khi truy cập GET: hiển thị form nhập liệu
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("form.jsp").forward(request, response);
    }

    // Khi submit POST: xử lý dữ liệu, rồi redirect
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");

        // Xử lý logic — ở đây ta tạo thời gian hiện tại
        String time = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy").format(new Date());

        // Lưu dữ liệu vào session (vì redirect sẽ tạo request mới)
        HttpSession session = request.getSession();
        session.setAttribute("greeting", "Xin chào " + name + "!");
        session.setAttribute("time", time);

        // Redirect sang trang kết quả (tránh refresh POST)
        response.sendRedirect("result.jsp");
//        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
