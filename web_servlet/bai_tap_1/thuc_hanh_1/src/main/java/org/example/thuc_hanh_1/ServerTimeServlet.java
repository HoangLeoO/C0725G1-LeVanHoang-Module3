package org.example.thuc_hanh_1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "ServerTimeServlet" , value = "")
public class ServerTimeServlet extends HttpServlet {
    int count = 0;
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("mot request den servlet" + count++);
        super.service(req, resp);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        RequestDispatcher rd = request.getRequestDispatcher("index2.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Date today = new Date();
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        req.setAttribute("today", df.format(today));
        RequestDispatcher rd = req.getRequestDispatcher("index2.jsp");
        rd.forward(req, resp);
    }
}
