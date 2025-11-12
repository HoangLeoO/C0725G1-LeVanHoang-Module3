package org.example.bai_tap;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "bai_tap", value = "/bai_tap")
public class Bai_tap extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("ralculator.jsp");
//       req.getRequestDispatcher("/ralculator.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String p =req.getParameter("p");
        int r = Integer.parseInt(req.getParameter("l"));
        int t = Integer.parseInt(req.getParameter("d"));
        double interest = r*t*100;
        HttpSession session = req.getSession();
        session.setAttribute("p",p);
        session.setAttribute("interest",interest);
        resp.sendRedirect("resurlt.jsp");
        }
}
